
<div id="top"></div>

<div align="center">

<img src="https://svg-rewriter.sachinraja.workers.dev/?url=https%3A%2F%2Fcdn.jsdelivr.net%2Fnpm%2F%40mdi%2Fsvg%406.7.96%2Fsvg%2Ftoolbox.svg&fill=%23334155&width=200px&height=200px" style="width:200px;"/>

<h3 align="center">Scripts and Tools</h3>

<p align="center">
This is a very simple BASH based puppet-esque installer for your personal programs, environments, scripts, etc...
</p>    
</div>

##  2. <a name='AboutTheProject'></a>About The Project

This project was built to ease the installation of software on my mac. However, having some experience with Puppet, I built it to be modular and usable on any system.

You can use it to setup you dotfiles, scripts, programs and software, configs, etc... 

It's also multi-system. So you can create a separate profile for each of your machines (based on their name) to install different things.

<p align="right">(<a href="#top">back to top</a>)</p>


###  2.1. <a name='BuiltWith'></a>Built With

This project was built with the following frameworks, technologies and software.

- [BASH](https://www.gnu.org/software/bash/)

<p align="right">(<a href="#top">back to top</a>)</p>


###  2.2. <a name='Installation'></a>Installation

These are the steps to get up and running.

1. Clone the repo in home directory.
    ```sh
    git clone https://github.com/IORoot/motd ~
    ```

<p align="right">(<a href="#top">back to top</a>)</p>


##  3. <a name='Usage'></a>Usage

1. Run the install script.
    ```sh
    ~/scripts__tools/install
    ```

This will use the `default` profile if no others have been created to match your machine name.


##  4. <a name='Customising'></a> Customising


### Profiles Folder

Within the `/profiles` folder there is a simple file with the name of your host. To create a new one, simply type `hostname` on your commandline and create a new file with that name.

Each profile lists all of the things you wish to install.

Example:

    ```
    install "homebrew"
    install "ohmyzsh"
    install "powerlevel10k"
    install "zshrc"
    install "aliases"
    install "env_vars"
    install "paths"
    install "hb-jq"
    install "scripts"
    install "fonts"
    ```

Each one of these runs a script called `install_$SCRIPT.sh` in the `/installers` folder

### Installers Folder

The installer will detect which architecture and operating system you are using from:
- MacOS
- Ubuntu
- CentOS

It will then run the corresponding install scripts from that installer folder `/installers/macos`

### Scripts Folder

The `/scripts` folder is where all of the extra files to reference and use during installation.

### Install Scripts

Each install script `/installers/$OS/install_$SCRIPT.sh` will run if it is referenced in the profile.

When writing a new script, add a few things:

1. A check for a file/path/folder/link to see if it's already run.

```
if [ -L ~/.paths ]; then
    ...
else
    ...
fi
```

2. The 'Already Installed' message

```
if [ -L ~/.paths ]; then
    printf "Already Installed\n"
else
    ...
fi
```

3. The 'Done' message.

```
if [ -L ~/.paths ]; then
    printf "Already Installed\n"
else
    printf "DONE\n"
fi
```


<p align="right">(<a href="#top">back to top</a>)</p>


##  6. <a name='Contributing'></a>Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue.
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



##  7. <a name='License'></a>License

Distributed under the MIT License.

MIT License

Copyright (c) 2022 Andy Pearson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<p align="right">(<a href="#top">back to top</a>)</p>



##  8. <a name='Contact'></a>Contact

Author Link: [https://github.com/IORoot](https://github.com/IORoot)

<p align="right">(<a href="#top">back to top</a>)</p>

##  9. <a name='Changelog'></a>Changelog

v1.0.0 - First version.
