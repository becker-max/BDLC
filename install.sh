ssh root@cl-hpelb1-50-gw-01-lx-ub16 'sudo apt-get install python3-pip; sudo pip3 install pandas; sudo apt-get install jq'

scp -r sbb/ bd01@cl-hpelb1-50-gw-01-lx-ub16:~/repos

ssh bd01@cl-hpelb1-50-gw-01-lx-ub16 'cd repos; cd sbb; bash ./deploySBB.sh'
