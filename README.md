# R10K Control Repo

This repository is a template control-repo that can be used with r10k or Puppet Enterprise Code Manager.

The major points are:

    An environment.conf that correctly implements:
        A site directory for roles, profiles, and any custom modules for your organization.
        A config_version script.
    Provided config_version scripts to output the commit of code that your agent just applied.
    Basic example of roles/profiles code.
    Example hieradata directory with pre-created common.yaml and nodes directory.
        These match the default hierarchy that ships with PE.

Read [complete README](https://github.com/puppetlabs/control-repo/README.md) on the original this is forked from.

# My Notes

This project isn't cloned into your puppet server. Rather you just need to create a new folder and file on a system already running Puppet Server.

On my setup I created the folder `/etc/puppetlabs/r10k` and in that folder I have `r10k.yaml`:

    :sources:
      :kirkins:
        remote: 'git@github.com:kirkins/control-repo.git'
        basedir: '/etc/puppetlabs/code/environments'
        private_key: '/root/.ssh/id_rsa'

Once this file is in place first ensure you an ssh key from your puppet server registered with your git service. Even public repos like this one require authentication via private key. Once you've ensure this you can run `r10k deploy environment`.

If it has a problem recognizing the key run your equivilent to the following manually and accept yes when asked if you trust the connection.

    git clone --mirror git@github.com:kirkins/control-repo.git /var/cache/r10k/git@github.com-kirkins-control-repo.git

After that you should have no problem running `r10k deploy enviornment`.

When this command is run the `/etc/puppetlabs/code/enviornment` folder is populated. Each branch on the control repo becomes a folder and corisponds with a single configuration state.

It will then be up to your ENC (external node classifier) to determine which nodes get which configurations applied to them.

I've also created a [control-repo-globas repo](https://github.com/kirkins/control-repo-globals) to go along with this. It can be used to contain modules, files, and configurations you want to be present across all your control-repo branches.
