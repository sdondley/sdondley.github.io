---
date: '2020-10-02 16:13:32'
title: 'Amazon Web Services'
updated: '2020-10-03 04:43:49'
---
## notes
template id for debian template: lt-09e730fd0e1a9da54

## command line
* How do you create as new instance from the command line from an instance
  template?
  * [Launching an instance from a launch template - Amazon Elastic Compute
    Cloud](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
    * toward bottom of page, search for "Launching an instance from a launch template"
    * Go to the AWS CLI tab
      * follow instructions and examples there
      * launch debian template:
        * aws ec2 run-instances --launch-template LaunchTemplateId=lt-09e730fd0e1a9da54,Version=1
* How do you get a list of instances from EC2?
  * aws ec2 describe-instances
    * returns json


## Perl api (paws distribution)
  * [Paws - A Perl SDK for AWS (Amazon Web Services) APIs - metacpan.org](https://metacpan.org/pod/Paws)
* Sample code:

```
my $obj = Paws->service('EC2',
  region => 'us-east-1',
);
```

  * Allocate a new ip address:
    `my $res = $obj->AllocateAddress;`

---
### Other notes linking here:

[Automation](/Automation)
