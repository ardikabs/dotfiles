# ssh configuration

## GPG integration
If you are replacing ssh-agent with gpg-agent. You must be used the follow ssh config. So that the terminalTTY aware of the gpg prompt
```bash
Match host * exec "gpg-connect-agent UPDATESTARTUPTTY /bye"
    ForwardAgent yes

    # Following to work with gpg-agent
    # we need to avoid to break the common ssh-agent key based
    # So, if we keep add keys to agent, common ssh-rsa key fingerprint would be added to ~/.gnupg/sshcontrol
    # then, you don't need to add keys to agent any more while working with gpg-agent
    # AddKeysToAgent yes
```
## Automatically switch ssh config based on user-defined condition
Use case: Automatically switch ssh-config based on user network. With utilizing `Match` keyword in ssh-config, as follow:
```bash
# Example 1:
Match host web exec "hostname -I | grep -qF 10.10.11."
    ForwardAgent yes
    ProxyCommand ssh -p 110 -q relay.example.com nc %h %p

Host web
    HostName web.example.com
    Port 1111

# Example 2:
Match host server !exec "ping -c1 -W1 server.example.com"
   ProxyJump gateway.example.com
Host server
   Hostname server.example.com
```
### References
* [Automatically switch ssh config based on local subnet](https://stackoverflow.com/questions/40746463/how-to-automatically-switch-ssh-config-based-on-local-subnet)
* [ssh-match](https://mike.place/2017/ssh-match/)

## Common configuration
```bash
Host *
    Protocol 2
    LogLevel INFO
    Compression yes
    ServerAliveInterval 60s
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    PreferredAuthentications publickey

Host gitlab.com github.com source.golabs.io
    StrictHostKeyChecking yes
    UserKnownHostsFile ~/.ssh/known_hosts

Host 10.*
    User ec2-user
    Port 22
    PreferredAuthentications password

Host 10.10.*
    User ec2-user
    Port 22

Host 10.10.10.*
    User root
    Port 4222
    IdentityFile ~/.ssh/id_rsa
    IdentitiesOnly yes

Host jumper-sample
    HostName 172.18.1.10
    User jumper-user
    Port 4222

Host protected-host
    HostName 172.18.2.10
    User root
    Port 4222
    ProxyCommand ssh -q -W %h:%p jumper-sample

Host 172.18.2.*
    User root
    Port 4222
    ProxyCommand ssh -q -W %h:%p jumper-sample
    #ProxyJump jumper-sample
```