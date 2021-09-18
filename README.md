# CHEF-tut
## It is a congifuration management automations tool. 
### Chef is written in Ruby and Erlang.

## Features of Chef
- Chef uses popular Ruby language to create a domain-specific language.
- Chef does not make assumptions on the current status of a node. It uses its mechanisms to get the current status of machine.
- Chef is ideal for deploying and managing the cloud server, storage, and software.

## CHEF Architecture
Chef works on a three-tier client server model
1. Chef Workstation
2. Chef Server
3. Chef Nodes (contain ohai)
   
## Cookbooks
- It is a directory where all cookbook are stored.
- Directory name should be ***cookbooks***
- To create cookbook inside cookbooks don't create directly, use chef command to generate cookbook.
  
## Command for generating cookbook
```bash
chef generate cookbook <cookbookname>
```
   
## Recipe
Recipe is the file where all ruby code is written.Never create file manual or with touch or any other command. Use chef command to create recipe file.

**create recipe being in cookbook directory**

```bash
chef generate recipe <recipename>
```

### **we cann't wright code directly in recipe file. we have to right code being in cookbooks directory.** 
> Ex- vi democookbook/recipes/demorecipe.rb

### Command for syntax check
```bash
    chef exec ruby -c <democookbook/recipes/demorecipe.rb>
```

## Convergence
> We run chef-client to apply recipe to bring node into desired state. 
### convergence command 
```bash
    chef-client -zr "recipe[<cookbookname>::<recipename>"
```

## Runlist
> TO run the recipes in a sequence order that use  mention in a run list.
> With this process , we can run multiple recipes, but the condition is *** there must be only one Recipe from one cookbook ***.
###  runlist command
```bash
    chef-client -zr "recipe[<cookbook1>::<recipename>],recipe[<cookbook2>::<recipename>]"
```
To run multiply recipe of same cookbook:
    - we need to import all the necessary recipes inside default.rb recipe.
    - imported recipes should be of same cookbook.

 include_recipe "<cookbookname>::<recipename>"

## Chef-server (2-Architecture)
Firstly need to make account in [manage chef io](https://manage.chef.io/login)
Then download chef starter kit and extract directory(chef repo).
*** Alway work indise chef-repo ***

### Bootstrap 
Attaching a node to chef server is called bootstraping 


### To check whether workstation is connect to server - knife is use to talk with server and node
```bash
    knife ssl check
```

###  for uploading cookbook in chef server
```bash
    knife cookbook upload <cookbookName>
```

### to check all the cookbook in the server
```bash
    knife cookbook list
```

### connect server to node
```bash
    knife bootstrap <PrivateIpaddressOfNode> --ssh-user <user> --sudo -i <nodeKey> -N <NameOfNodeYouWantToCall>
```
### To check all the node connectd to server
```bash
    knife node list 
```

### define desire recipe for nodes
Here ,we set recipe for each node or more node depending upto needs.Only that recipe will be run in set node.If there is any changes/updates in setted recipe then node will take that changes and run recipe.But other than this recipe if any other recipes are updated/changed there will be no action performed by set node.
```bash
    knife node run_list set <NameOfNodeWeGaveNAmeToNode>  "recipe[<cookbookName>::<recipeNAme>]"
```

### To check which node as set which recipe
```bash
    knife node show <NameOfNodeWeGaveNAmeToNode>
```

After completing all the step above ** chef Architecture is partially automated ** to run recipe in node.We need run command 
```bash 
chef-client
```
in node.


#### For automation we need to configure node 
> Go to node and configure /etc/crontab 
```console
    vi /etc/crontab
```
After running this CMD new console will open.Just write
```console
* * * * * <userName> chef-client
```
Here, each star have it's own meaning.Inside crontab there is explaned meaning of each *
* defines the pulling period of chef-client

Now as we have configured node.Now there is no need to manual run chef-client in node.As we update/change in cookbook recipe node will pull that recipe and run in node.

*** Yet there is no Complete automation ***
### we need to specify run_list for each recipe to each node that is tidious
If new recipe is created then again we need to run_list for recipe for each desired node.
To solve this problem roles comes into the picture.
Concept is attach role as run_list after any recipe you need to attach just put inside role,That's it.