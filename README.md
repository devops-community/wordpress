# Wordpress

Build and deploy a simple Wordpress blog on [devo.ps](http://devo.ps).

## Install

Simply use the link below:

[![Fork on devo.ps](https://app.devo.ps/assets/images/fork.png)](https://app.devo.ps/#/fork?git_url=https://github.com/devops-community/wordpress)

Once you've forked the repository, open it in devo.ps and you will be prompted for a few settings, including the Git URL for the code of your application.

To deploy your app, you will need to navigate to the tasks page of the repo and run the task manually (click on "play" icon, right of the "Install Wordpress blog" task).

## What's in the box?

This setup contains one server (`nodes/wordpress.yml`) with **Nginx**, **PHP** and **MySQL 5.5** (with a "wordpress" user and a "wordpress" database)

We have included as well a task (`tasks/install-wordpress.yml`) that:

1. Run an install script (`scripts/install_wordpress.sh`) that will:
  1. Fetch the latest Wordpress package from wordpress.org
  1. Unpack the Wordpress package
  1. Write the configuration file (to connect it to MySQL)

The current repo provides a very simple setup. Hack at will!

## Questions?

If you have any question, come ask us on the [devo.ps chat](https://www.hipchat.com/gyHEHtsXZ) or shoot us an email at [help@devo.ps](mailto:help@devo.ps) (though, you should really just [ask us in the chat](https://www.hipchat.com/gyHEHtsXZ)).

# Reference

- [Nodes in devo.ps](http://docs.devo.ps/manual/nodes)
- [Tasks in devo.ps](http://docs.devo.ps/manual/tasks)

