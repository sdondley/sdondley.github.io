---
date: '2020-07-22 10:46:34'
title: 'Source code for markdown_to_note'
---
**Note, this script is in a state of flux and may not be up-to-date and may
contain bugs. It also has hard-coded paths and was written to be a quick and
dirty for my own use. You're on your own with it.**

{% highlight perl linenos %}

#!/usr/bin/env perl
use strict;
use warnings;
use File::Slurp qw(read_file write_file);
use File::Basename;
use File::Spec;
use YAML::Tiny;
use POSIX 'strftime';
use Log::Log4perl::Shortcuts qw(:all);
use Time::Piece;
use URI::URL;
use Time::Seconds;

# This is a "glue" script used to convert a markdown file written by vimwiki
# into a markdown file more appropriate for use in a Jekyll static website
# generator.

# The path to this glue script must be set in vim configuration file so it can
# be called by the vimwiki plugin.

# get args passed from wimwiki plugin
my ($force, $syntax, $ext, $output_dir, $input_file, $css_file,
    $template_path, $template_default, $template_ext, $root_path, $custom_args) = @ARGV;

# Set vars for later processing
my $force_new_header            = 0;
my ($file_name, $dirs, $suffix) = fileparse($input_file, '.md');
my $output_file                 = File::Spec->catfile($output_dir, $file_name . '.md');
my $new_file                    = !-e $output_file;
my $is_diary                    = $file_name =~ m|^\d{4}-\d{2}-\d{2}|;
my $input_text                  = read_file($input_file);
my $output_text                 = $new_file ? '' : read_file($output_file);
my $has_header                  = $new_file ? 0 : $output_text =~ m|^---\n|m;
my $curr_time                   = strftime ("%F %T", localtime time);
my %headers                     = ();
%headers                        = extract_headers() if $has_header;
my $header_day                  = '';
my $update_day                  = '';
my $curr_day                    = '';
$header_day                     = get_day($headers{date}) if $headers{date}; # returns \d\d\d\d-\d\d-\d\d
$update_day                     = get_day($headers{update}) if $headers{update}; # returns \d\d\d\d-\d\d-\d\d
$curr_day                       = get_day($curr_time);
$headers{title}                 = extract_title();

# fix up links in input text to make them Jekyll-friendly
process_links();

# remove headings with nothing under them
$input_text =~ s/^###*\s+[^\n]+\s+(?=^##)//gsm;

# escape text that will confuse jekyll processor
$input_text =~ s/^((.*?)\S+(.*?)){&percnt;/$1\{&percnt;/mg;

#r
my $out = `rsync -a '/Users/stevedondley/vimwiki/webnotes/files/' '/Users/stevedondley/git_repos/sdondley.github.io/images/note_images'`;

$headers{updated_logo} = 0;
my $curr_t = Time::Piece->strptime($curr_time, '%Y-%m-%d %H:%M:%S');
if ($headers{updated}) {
  my $update_t = Time::Piece->strptime($headers{updated}, '%Y-%m-%d %H:%M:%S');
  my $seconds = $curr_t->epoch - $update_t->epoch;
  if ($seconds < (48 * 3600)) {
    $headers{updated_logo} = '1';
  }
}

$headers{new} = 0;
if (!exists $headers{date}) {
  $headers{new} = '1';
  $headers{updated_logo} = '0';
} else {
  my $post_t = Time::Piece->strptime($headers{date}, '%Y-%m-%d %H:%M:%S');
  my $seconds = $curr_t->epoch - $post_t->epoch;
  if ($seconds < (48 * 3600)) {
    $headers{new} = '1';
    $headers{updated_logo} = '0';
  }
}

if ($headers{title} =~ /Keep/) {
  logd $headers{new};
}

if (!$new_file && !$force_new_header) {
  if ($custom_args ne 'no_update') {
    if ($update_day && $update_day ne $curr_day) {
      $headers{updated} = $curr_time;
    } elsif ($header_day && $header_day ne $curr_day) {
      $headers{updated} = $curr_time;
    }
  }
  $headers{date} = $curr_time if ! $headers{date};
} else {
  $headers{date} = $curr_time;
}

my $header_text = YAML::Tiny->new( \%headers )->write_string;
$header_text .= "---\n";

$input_text =~ s/^\s+//g;  # get rid of any leading whitespace
#my $backlinks = ''; #generate_backlinks();
my $backlinks = generate_backlinks();
my $new_output_text = $header_text . $input_text . $backlinks;
write_file($output_file, $new_output_text);

#TODO: regex's should be documented with X
sub process_links {

  my @links = $input_text =~ m|(\[[^]]+]\([^)]+\))|g;
  my @wiki_links = ();
  my $has_fenced_code = $input_text =~ /^```|^{&percnt;\s*highlight/m;
  logd $has_fenced_code;
  foreach my $l (@links) {
    if ($has_fenced_code) {
      next if $input_text =~ m|^```\S(.*?)\Q$l\E(.*?)^```|ms;
      next if $input_text =~ m|^{&percnt;\s*highlight\s(.*?)\Q$l\E(.*?)^{&percnt;|ms;
    }
    my ($url) = $l =~ m|]\(([^)]+)|;

    # handle links to files
    if ($url =~ /^file:/) {
      my $orig_l = $l;
      $l =~ s|\[file:///Users/stevedondley/vimwiki/webnotes/files/(.*)]\((.*?)\)|<div style="margin-top: 1em;"><a href="/images/note_images/$1"><img style="width: 100%; height: 100%" src="/images/note_images/$1" /></a></div>|;
      $input_text =~ s|\Q$orig_l\E|$l|;
      next;
    }

    # handle local wiki links
    if ($url !~ /^http/) {
      $url =~ s/ /-/g;
      $url = '/' . $url;
      push @wiki_links, $url;
      my $orig_l = $l;
      $l =~ s|]\((.*)$|]($url)|;
      $input_text =~ s|\Q$orig_l\E|$l|;
      next;
    }

    # process twitter links
    if ($url =~ m|^https://twitter.com|) {
      my ($twitter_url, $twitter_user) = $l =~ m|\[[^]]+]\((https://twitter.com/(.*?)/status/\d+\))|;
      my ($full_name, $tweet) = $l =~ m|\[(.*) on Twitter: "(.*)"|;
      my $output =  '<blockquote class="twitter-tweet"><p lang="en" dir="ltr">';
      $output .= "$tweet</p>&mdash; $full_name (\@$twitter_user)";
      $output .= "<a href=\"$twitter_url?ref_src=twsrc%5#tfw\">Link</a></blockquote>";
      $output .= '<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>';
      $input_text =~ s/\Q$l\E/$output/;
      next;
    }

    # process youtube links
    if ($url =~ m|^https://www.youtube.com|) {
      my ($video_id) = $l =~ m|\(https://www.youtube.com/watch\?v=([^&]+)&.*\)|;
      my $output = qq(<iframe width="560" style="margin-left: 2.0em" height="315" src="https://www.youtube.com/embed/$video_id" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>);
      $input_text =~ s/\Q$l\E/$output/;
      next;
    }
  }

  # remove paths from markdown url descriptions to shorten them
  $input_text =~ s|(\[https*://[^/]+)[^\]]+(.*)|$1$2|g;

  # make "naked" hyperlinks clickable
  my @matches = $input_text =~ m|(\s(https*://(.*?))\s)|g;
  while (@matches) {
    my $match_with_ws = shift @matches;
    my $url = shift @matches;
    shift @matches;
    my $shortened_url = $url;
    next if $shortened_url =~ m|https://t.co|;
    $shortened_url =~ s|(https*://[^/]+).*|$1|;
    my $url_markdown = '[' . $shortened_url . ']' . '(' . $url . ')';
    my $match_with_ws_orig = $match_with_ws;
    $match_with_ws =~ s/$url/$url_markdown/;
    $input_text =~ s/$match_with_ws_orig/$match_with_ws/;
  }

  if (!$new_file) {
    # get text of existing file
    my $existing_file_text = $output_text;

    # chop off other notes linking here
    $existing_file_text =~ s/^---\n#### Other(.*)//ms;

    # find all local wiki_links in existing file

    my @links = $existing_file_text =~ m|(\[[^\]]+]\([^\)]+\))|g;
    my @urls;
    my $existing_has_fenced_code = $existing_file_text =~ /^```|^{&percnt;\s*highlight/m;
    foreach my $l (@links) {
      if ($existing_has_fenced_code) {
        next if $input_text =~ m|^```\S(.*?)\Q$l\E(.*?)^```|ms;
        next if $input_text =~ m|^{&percnt;\s*highlight\s(.*?)\Q$l\E(.*?)^{&percnt;|ms;
      }
      $l =~ m|\[[^\]]+]\((.*)\)|;
      push @urls, $1;
    }
    my @existing_wiki_links = ();
    @existing_wiki_links = grep { !/^http/ } @urls;

    ## compare to existing wiki_links
    # see which links are new
    my @new_links;
    foreach my $cwl (@wiki_links) {
      my $already_exists = grep { $cwl eq $_ } @existing_wiki_links;
      push (@new_links, $cwl) if !$already_exists;
    }

    # see which links have been removed
    my @removed_links;
    foreach my $ewl (@existing_wiki_links) {
      my $exists = grep { $ewl eq $_ } @wiki_links;
      push (@removed_links, $ewl) if !$exists;
    }

    # modify target files as appropriate
    # add link
    foreach my $nl (@new_links) {
      my $file = $nl;
      $file =~ s/^\///;
      $file =~ s/-/ /g;
      $file = $file . '.md';
      my $linked_file = File::Spec->catfile($output_dir, $file);
      if (!-e $linked_file) {
        `touch $linked_file`;
      }
      my $other_file_txt = read_file($linked_file);
      my ($backlinks_text) = $other_file_txt =~ m|^---\n#### Other[^\n]+\n(.*)|ms;
      my ($the_file_name) = fileparse($input_file, '.md');
      $the_file_name =~ s/ /-/g;
      if (!$backlinks_text) {
        $other_file_txt .= "\n\n---\n#### Other notes linking here:\n";
        my $url_link = $file_name;
        $other_file_txt .= "\n\n[$headers{title}](/$the_file_name)";
        write_file($linked_file, $other_file_txt);
      } elsif ($backlinks_text !~ m|\(/$the_file_name\)|) {
        $other_file_txt .= "\n\n[$headers{title}](/$the_file_name)";
        write_file($linked_file, $other_file_txt);
      }
    }

    # remove links from target files
    foreach my $rl (@removed_links) {
      my $file = $rl;
      $file =~ s/^\///;
      $file =~ s/-/ /;
      $file = $file . '.md';
      my ($the_file_name) = fileparse($input_file, '.md');
      $the_file_name =~ s/ /-/g;
      $the_file_name = '/' . $the_file_name;
      my $linked_file = File::Spec->catfile($output_dir, $file);
      my $other_file_txt = read_file($linked_file);
      my ($backlinks_text) = $other_file_txt =~ m|(^---\n#### Other[^\n]+\n(.*))|ms;
      $backlinks_text =~ s|^\[[^\]]+\]\($the_file_name\)(.*?)\n*||sm;
      $other_file_txt =~ s/^---\n#### Other(.*)//ms;
      $backlinks_text =~ s/\n*$//;
      $other_file_txt .= $backlinks_text;
      write_file($linked_file, $other_file_txt);
    }
  }

  return;
}

sub generate_backlinks {
  my $backlinks_text;
  opendir(my $dh, $dirs) || die "Can't opendir $output_dir: $!";
  my @files = grep { -f "$dirs/$_" } readdir($dh);
  closedir $dh;
  my $links_text = '';
  foreach my $f (@files) {
    my $bn = basename $f, '.md';
    my $content = read_file("$dirs/$f");
    if ( $content =~ /\($file_name\)/ ) {
      my $bn_orig = $bn;
      $bn =~ s/ /-/g;

      my $title;
      my $linked_from_diary = 0;
      if ($bn =~ /^(\d{4}-\d{2}-\d{2})/) {
        $linked_from_diary = 1;
        $title = "Diary entry for $1";
      } else {
        $content =~ /^# (.*?)\n/s;
        $title = $1;
        if ($bn eq 'index') {
          $bn .= '/';
        }
      }

      $links_text .= "\n[" . $title . '](/' . $bn . ')' . "\n" if $title;
    }
  }
  if ($links_text) {
    $links_text = "\n---\n#### Other notes linking here:\n" . $links_text;
  }
  return $links_text;
}

sub extract_title {
  $input_text =~ /^# (.*)/;
  my $title = $1 || '';
  if ($title) {
    $input_text =~ s/^# $1//;
  }

  return "Diary entry for $file_name" if $is_diary;
  return $title;
}

sub extract_headers {
  my %headers;
  $output_text =~ m|^---\n(.*?)^---\n|ms;
  return () if !$1;

  my $yaml      = YAML::Tiny->read_string($1);
  my $config    = $yaml->[0];
  foreach my $k ( keys %$config ) {
    $headers{$k} = $config->{$k};
  }
  return %headers;
}

sub get_day {
  my $date = shift;
  $date =~ /(^\d{4}-\d{2}-\d{2})/;
  return $1;
}
{% endhighlight %}

---
### Other notes linking here:

[markdown_to_note perl script](/markdown_to_note)
