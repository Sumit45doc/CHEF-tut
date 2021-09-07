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

