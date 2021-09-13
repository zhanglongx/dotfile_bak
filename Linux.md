# Linux

## Centos

### Add user

[How To Create a Sudo User on CentOS [Quickstart]](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-centos-quickstart)

```bash
	# adduser <username>
	# passwd <username>
	# usermod -aG wheel <username>

	For testing propose only
	# sudo ls -l
```

### Chang passwd

To avoid errors: 'BAD PASSWORD: The password is shorter than 8 characters'. Use the following

```bash
	# sudo passwd --stdin <username>
```

### ssh-copy-id

```bash
	$ ssh-copy-id <username>@<host>
```

### .bashrc

```bash
	$ vim ~/.bashrc
```

add below

```
	set -o vi
```

### sshd_config

```bash
	$ sudo vim /etc/ssh/sshd_config
```

add below

```
	ClientAliveInterval 30
	ClientAliveCountMax 6
```

### .inputrc

```bash
	$ vim ~/.inputrc
```

```
	set editing-mode vi
	$if mode=vi
	  
	set keymap vi-command
	# these are for vi-command mode
	Control-l: clear-screen

	set keymap vi-insert
	# these are for vi-insert mode
	Control-l: clear-screen
	$endif
```

if bash >= 4.3 and readline >= 6.3, try use below .inputrc.

To view the readline version, using below method [from stackflow](https://superuser.com/questions/1169740/how-do-i-determine-what-version-of-readline-bash-is-using):

```bash
	$ gdb bash
	(gdb) print /x (int) rl_readline_version
	$1 = 0x700
```

```
	set editing-mode vi
	$if mode=vi

	set keymap vi-commandgg
	# these are for vi-command mode
	Control-l: clear-screen

	set keymap vi-insert
	# these are for vi-insert mode
	Control-l: clear-screen
	Control-k: clear-screen

	set show-mode-in-prompt on

	set vi-ins-mode-string "+"
	set vi-cmd-mode-string ":"

	$endif
```

### dotfile

```bash
	$ scp .vimrc <username>@<host>:/home/<username>/.
	$ scp .gitconfig <username>@<host>:/home/<username>/.
```

## OS

1. if computer is used in rd, /etc/apt/sources.list: (support ubuntu 16.04 18.04)

	`http://192.165.153.66/mirror/mirrors.163.com/ubuntu/`

2. install packages:

	`sudo apt install -y openssh-server vim`

3. /etc/ssh/sshd_config:

		ClientAliveInterval 30

		ClientAliveCountMax 6

4. ~/ssh/authorized_keys:

	`ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJeSq1iTJFVYZN2nrp4fZNcDoBROEG/CQ7WNZ9YMzjOH7yD4dsVdCWwC8gb2jSW3dysZOIonD2tFVF0P+lS1UBJZzwrvE9rALPp9eA2/Chx5DjBlVFlmzLw8jfIHCoEZO0mNzg8XGOZXl2TNxLl8wfuwvRqVTCgMvSq4iac4HkMRzy5uIVc1EFpbyxafSea1Jj4yuNge6buEwx1AYwiPAbi1MUGKrn4/RT0xDU/ZCttB85xysm8er6ji3+3ujHU+aqqtcjYu1vIL3sTh0tQ0w2lZ1beTcRusCDhBVfNR4Xe+VScHf73lYM50c8ToCc6sh2oY4qkRMxJRMVSYpNk8Iz zhlx@zhlx-i7-7700`

5. (Not Recommend)if computer is a vm, /etc/fstab:

	`vmhgfs-fuse	/mnt/hgfs	fuse	defaults,allow_other	0	0`
