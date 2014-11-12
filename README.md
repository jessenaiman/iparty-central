#Welcome to the new liberalonline source code

##PREREQUISITES

- ruby 2.1 (http://rvm.io/rvm/install)
- mongodb (http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat-centos-or-fedora-linux/)

##LOCAL DEVELOPMENT

- create a fork of this repository (look for the help link in the top ri

```git
git clone [your-fork-url]
git remote add upstream https://github.com/webadminontario/liberalonline.git
cd liberalonline
bundle' [installs all the ruby gem dependencies]
```

- configure secret or environmental variables. These are located in the config folder and contain keys to facebook and email authentication keys. The application will fail if you do not provide these values.
- refer to the development box configuration if you are in doubt. Should you still be stuck please contact me for further assistance.

###PUSHING NEW CHANGES

```git
[First check in all your changes. This is essentially like saving your game progress on your own device]
git add --all
git commit -m '[put a meaningful short msg here]'
git push origin master
[Your code is not online and resides within the fork you created]
[Now you need to pull any changes that have been made on the live box into your local copy]
git fetch upstream
git merge upstream/master
```

[You may see merge conflicts, and if you do you need to open those files and delete the code that does not match the most recent changes. This should not happen often, and with practice, it will become preventable]

At this point your local copy has all the changes you have made plus any that have gone on since you started on your own task.

Check if the site runs properly on your box, and if it does commit your merged code:

```git
git add --all
git commit -m '[something about synching]'
git push origin master
```

##NITROUS DEV BOX

This preconfigured box is intended for developers to use once their local code is error free and has been merged.

The intention is not to use this for your own personal development space. This is a shared space for code that is nearly ready for production. Please do not break the box and leave. Should your code fail to merge you must roll it back...and then add documentation in this file about how that process occurs.

It's easier to just fix your changes than rollback...just saying

###BEFORE PULLING YOUR CHANGES YOU NEED TO MERGE YOUR CODE LOCALLY UNLESS YOU ENJOY BAD THINGS
  
The nitrous box is set to the webadmin github repositories and should have a remote link to your github fork

```git
git remote add upstream ['your-fork-url']
```

That step only needs to be done the first time you connect.

Now you pull your code and merge. This is the same process you did locally, but with a few name changes.

```git
git fetch [jesse]
git merge [jesse]/master
```

Now run the code and get people to do some quality control.

If everything looks good commit your code and get ready to go live

```git
git add --all
git commit -m '[Jesse merged some code]'
git push origin master
```


PRODUCTION BOX

When the nitrous dev box passes the Phil approval test we run this on the liberalonline corresponding repository.

```git
git fetch upstream
git merge upstream/master
```
