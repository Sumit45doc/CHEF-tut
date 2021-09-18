name "devops"
description "this is demo role"
run_list "recipe[testcb::runlist1]","recipe[test-attribute::runlist2]","recipe[testcb::test]"