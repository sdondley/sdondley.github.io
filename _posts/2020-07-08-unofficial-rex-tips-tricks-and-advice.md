---
title: Unofficial Rex Tips, Tricks, and Advice
description: "Helpful guidance for Rex"
date: 2020-04-16
updated: 2020-07-08
course: rex
---
**This post is about the [Rex framework](https://www.rexify.org), a suite of
modules written in Perl, for automating the remote control of one or more computers.**

Rex is a great time saver. Unfortunately, its documentation is rather
disjointed and a bit cryptic. This post tries to flatten the learning curve a
bit by offering some big picture ideas and fine-grained recipes to get you
productively using the Rex framework faster than you would otherwise.
<!-- more -->

## Tip #1: Learn Rex's typical use case
Rex is an open-ended framework and it's documentation doesn't spell things out,
so it can be a little confusing to know what it's typical use case is. The most
typical, easiest use case is to have one Rexfile in a single directory and all
tasks split out and grouped into modules to make them maintainable. So let's
spell out how to accomplish this:

1. You should have one dedicated directory on your hard drive for your rex tasks. Example: `~/rex`
2. Inside this directory, you will have a file named `Rexfile`.
3. While it's possible to throw all your tasks into this one Rexfile, don't do
   it. It'll probably be a huge maintenance headache as it grows in size.
4. Instead, create modules in your rex directory for holding your tasks. Each
   module should have a collection of related tasks. For example, you might have
   a module in this directory called `Local::Network::Configuration` for
   containing tasks related to managing your local network. You might have another
   directory called `Web::Servers::Mail` for administering mail servers, etc.,
   etc., so on and so forth.
5. Create a module with the following command: `rexify Your::Module::Name
   --create-module`. If your Rexfile already exists, your modules will be placed
   inside a `lib` directory. If the Rexfile hasn't been created yet, your
   modules will be placed directly into the current directory.
6. Repeat step 5 for each of your modules.
7. Edit/create your Rexfile. For each module you added and want to access with
   the rex command, place `require Your::Module::Name;` at the top. Also be sure
   you have `use Rex` along with any `-feature` import argument [per the
   documenation.](https://www.rexify.org/docs/guides/feature_flags.html)
8. Add your tasks to the `__module__.pm` automatically generated for you inside
   the last directory of each module. You can safely delete the meta.yml file.
   It's not needed with newer versions of Rex.
9. Now, `rex <command>` can access any task from inside each of the module
   directories you just created.
10. By default, you must prefix all tasks with the module name like so: `rex
    Your:Module:name:task_name` Note the single colon, not a double colon, between
    each of the path segments. Note also that when tasks are called by another
    task, they must also used this notation to fully qualify the task name.
11. You don't have to prefix task names if you are careful
    about avoiding namespace clashes by ensuring your tasks have unique names
    across all your different `__module__.pm` files containing your tasks. To
    pull this off, simply remove the `package Your::Module::Name;` line form the
    `__module__.pm` file from each of your modules you'd prefer to not prefix
    them with a module name. **NOTE: This is an unsupported hack. Use it at your
    own peril.**

## Tip #2: Set up tab completions

Tab completion allows you to quickly type in task names, group names, file
names, host names, and environment names from the command line. You simply type
in the first few letters of the name, hit the <TAB> key and bash will do it's
best to finish typing in the rest of the name for you, or as much as it can
until you type in another letter or two and hit <TAB> again.

Tab completion for rex kicks in when you type in the `rex` command at the
command line and hit the <TAB> key. bash will then look for a Rexfile or rex
yaml file in the current directory to compile a list of potential completions.
The completion feature also determines where in the rex command you are to help
determine which name you intend to type. For example, if you just typed in the
`-G` option, followed by a couple of letters, and then hit <TAB>, rex's bash
completion script will provide bash with list of possible groups based on the
letters you typed.

### Setting up tab completion

Follow these steps to get rex's tab completion feature working on your command line:

1. Download or copy and paste the appropriate [Rex tab completion
   script](https://metacpan.org/release/Rex/source/share). Place the script into
   your desired location, usually in your home directory.
2. Source the script with by running `source
   /path/to/script/rex-tab-completion.bash` on the command line.
3. If desired, add the command in step 3 to your `.bashrc` file so it will be
   available every time you log into your shell.
4. If you add more commands and entities to your Rexfile, type `exec bash` on
   the command line to update your completions. Note that you must have
   completed step 3 for this to work.

## Tip #3: Run rex from any directory on your local machine
Typically, you have to go to the `~/rex` directory (or to whatever directory
contains a Rexfile) to issue Rex commands. Alternatively, with a little bit of
bash magic, you can run your rex tasks from anywhere on the machine and even
keep your bash completion. This works best when you have all your rex modules
and Rexfile in a single directory as described in Tip #1.

Here's how to set it up:

1. First, add following function into the appropriate bash script for your system (usually .bashrc or .bash_profile) so that the function loads when you log into bash:
    ```bash
    r () {
      builtin cd $HOME/rex     # set this to the path where you store your Rexfile
      rex $@
      builtin cd $OLDPWD
    }
    ```
    This function temporarily switches you to where your Rexfile is located, runs the rex command, and then hops back to the directory where you started. That's it! Now you can just type in `r <command>` from anywhere on your machine. Don't forget to resource your bash configuration to get it working.
1. If you set up bash completion in Tip #2, you'll need to modify the completion script added in Tip #2, step 1. Carefully modify the script according to the comments, denoted with `###`, below:
    ```bash
    _rex()
    {
    ...
        if [[ -z $_rex_yaml ]]; then
            ### on the following line, change 'Rexfile' to your full Rexfile path
            _rex_yaml=$(rex -f $HOME/rex/Rexfile -Ty 2>/dev/null)
        fi
    ...
                if [ -f $HOME/rex/Rexfile ]; then    ### change 'Rexfile' to your full Rexfile path
    ...
                fi
                ;;
            -E)
                if [ -f $HOME/rex/Rexfile ]; then    #### change 'Rexfile' to your full Rexfile path
    ...
                fi
                ;;
            -G)
                if [ -f $HOME/rex/Rexfile ]; then    ### change 'Rexfile' to your full Rexfile path
    ...
                fi
                ;;

            *)
                if [ -f $HOME/rex/Rexfile ]; then    ### change 'Rexfile' to your full Rexfile path
    ...
    complete -F _rex rex

    ### Add this line
    complete -F _rex r

    ...
    ```
1. Now save your file and open up a new bash process and you should now be able to do `r <partial_command><tab>` and perform rex bash completions from anywhere on your machine.

## Tip #4: Use Rex::Dondley::ProcessTaskArgs to process arguments passed to your tasks

The way arguments are passed into Rex tasks is a little...weird. Command line
argument with names, those preceded with a double dashed label (e.g.
`--arg_name=value`), are passed to tasks with a hash reference. Unnamed
arguments get passed in via an array reference. So the special variable for the
argument array, `@_`, will look something like this:

`({ --arg1=value1 --arg2=value2 }, [ arg3, arg4 ])`.

The Rex::Dondley::ProcessTaskArgs was created by yours truly to make processing these arguments a little less painful. You can easily set which arguments are required and set defaults for any arguments that aren't passed in. Appropriate errors are set if the passed arguments don't meet your criteria. You can think of this module as a specialized version of the Params::Validate perl module.

See the documentation for
[Rex::Dondley::ProcessTaskArgs](https://metacpan.org/pod/Rex::Dondley::ProcessTaskArgs)
for more details.

## Tip #5: Document arguments to your tasks using the `desc` function

As most developers can bear witness, undocumented code is useless code even
you wrote it yourself. Unless you are blessed with mental superpowers, there's
simply no way you are going to remember the commands you wrote years, months,
days, or even hours ago (and speaking for myself, minutes). So here's a quick
hack to painlessly document your task arguments and make them easily accessible
right from the command line.

1. Before each task, write a simple `desc` of the task followed by the argument it takes:
`desc 'this task does X | --domain=some.domain.com [ --quiet ]';`
2. Place optional arguments in square brackets
3. For arguments that take values, provide a sample argument
4. Notice the "pipe" character to help provide visual separation from the description

## Tip #6: Use the CMDB to load information about your servers

Rex can already probe a remote server and get details about its hardware. But
there are times when you would like to store other bits of information about
your servers in command server
