
# Why Use a Virtual Environment?
In this exercise, we'll walk through how to set up a virtual environment. But first, let's talk about why they are useful.



## Try it!

To see why virtual environments are useful, let's have a look at what version of Python is installed in this workspace. In the terminal on the right, run:

```
which python
```

You should get a result like this:

```
/opt/conda/bin/python
```

Let's also check what version it is:

```
python --version
```

You should get some output like this:

```
Python 3.6.3
```

It looks like the default Python here is a [conda](https://docs.conda.io/en/latest/) installation of Python, version 3.6.3.

> **Note:** Your version numbers might be different, if updates have been run since we wrote this! This only further illustrates how confusing things can get and why virtual environments are such a useful tool.

But is this the only version of Python installed on this machine? Try repeating the above commands, but with `python2`:

```
which Python2
```

You should see that there's another version of Python installed in a different directory:

```
/usr/bin/python2
```

If we check the version, we can see it is Python `2.7.12`.

And we can repeat the above with `python3.5`…

```
which python3.5
python3.5 --version
```

…and we'll see there is a *third* installation of Python, which is using yet another version!

What is more, each of these versions may have different packages and dependencies. For example, give this command a try:

```bash
python -m pip --version
```

The `-m` command-line option searches the system path for the named module (in this case, `python`) and checks which version of `pip` is installed with that particular module. When we ran this, we got:

```
pip 18.1 from /opt/conda/lib/python3.6/site-packages/pip (python 3.6)
```

So it seems like we have `pip 18.1`. Let's now try the command again, but with one of the other Python versions:

```
python3.5 -m pip --version
```

When we ran this, our results were a *much older* version of pip:

```
pip 8.1.1 from /usr/lib/python3/dist-packages (python 3.5)
```

And if we try this with the third installation of Python…

```
python2 -m pip --version
```

…we get a "no module found" error:

```
/usr/bin/python2: No module named pip
```

Just with our basic Python installation and a single module, pip, we can already see the potential for a lot of confusion and conflicts. We have multiple installations, and with each installation we have a different version, different packages, different dependencies that have been installed, and so on.

Fortunately, we can resolve all of this confusion by using a *virtual environment*. Let's set one up now.

<!--
%%ulab_page_divider
--><hr/>

# Creating a Virtual Environment

The process for creating a virtual environment is slightly different depending on your machine. We'll show you two methods. The first works with a *conda* installation of Python, which is what we have in this Udacity workspace. After that, we'll show you how to do it in the Azure Cloud Shell.

## Try it!

Try these steps for yourself in the terminal on the right:

### 1. Install the `virtualenv` command-line tool


```bash
pip install virtualenv
```

### 2. Create a virtual environment

To create the virtual environment, we simply run the `virtualenv` tool and give it the path we want to have for the environment. I like to call the environment the same as my repo. In this case, my repo is called `azure-devops`, so that's what I'll name the environment:

```bash
virtualenv ~/.azure-devops
```

The `~/.` part of the path is simply specifying that the environment should be created in the root `~` directory and that it should be hidden `.`

### 3. Source the virtual environment

To use the environment we just created, we simply have to enter `source` followed by the path to the directory, along with `bin/activate` at the end. Like this:

```bash
source ~/.azure-devops/bin/activate
```

We are now using the environment we created! This means we will be using the specific installation and version of Python that we have in *this* environment. We can check that by running:

```bash
which python
```

And we should see that it is within our virtual environment directory:

```bash
/root/.azure-devops/bin/python
```

### 4. Deactivate the virtual environment

To get out of the virtual environment, we can simply enter `deactivate`:

```bash
deactivate
```

Now check again to see which Python is being used:

```bash
which python
```

You should see that you have deactivated the virtual environment and are back to the default conda install of Python:

```bash
/opt/conda/bin/python
```

<!--
%%ulab_page_divider
--><hr/>

# Creating a Virtual Environment Using Python's `venv` Module

In this next video, we'll look at another way we can create virtual environments, which uses Python's `venv` module. This method won't work here in the Udacity workspace, but you can use it in the Azure Cloud Shell. 

>**Note:** Even if you aren't able to try this in the Cloud Shell right now, you should still watch the video—it's good to see how the `venv` module is used, plus the video also provides a summary of the key ideas we've gone over in this exercise.




To recap, we've seen two ways to create virtual environments:
1. Using the `virtualenv` tool (as in `virtualenv ~/.azure-devops`)
2. Using Python's `venv` module (as in `python3 -m venv ~/.azure-devops`)

Only the first one works here in this workspace, but both of these will work in Azure Cloud Shell.

Depending on your Python installation and operating system, the process for creating a virtual environment can very slightly. You can find detailed instructions for different scenarios in the documentation for the `virtualenv` tool and the `venv` module:
* [virtualenv docs](https://pypi.org/project/virtualenv/)
* [venv docs](https://docs.python.org/3/library/venv.html)
