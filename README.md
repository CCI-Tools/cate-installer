<img alt="Cate: ESA CCI Toolbox" align="right" src="https://raw.githubusercontent.com/CCI-Tools/cate-core/master/doc/source/_static/logo/cci-toolbox-logo-latex.jpg" />

[![Build Status](https://travis-ci.org/CCI-Tools/cate-installer.svg?branch=master)](https://travis-ci.org/CCI-Tools/cate-installer)

# cate-installer

This repository provides scripts used to build and deploy (TODO!)
a stand-alone installer which includes both a
[Miniconda](https://conda.io/miniconda.html) Python, 
[Cate](https://github.com/CCI-Tools/cate-core), and all Cate dependencies. 
 
See also the [cate-conda](https://github.com/CCI-Tools/cate-conda) repo 
which is used to build various Conda packages for Cate.


## Building a Conda stand-alone installer

Install `constructor` (version >= 1.5.2) in your root Miniconda:

    $ source activate
    $ conda install constructor

Clone this repo if not already done:

    git clone https://github.com/CCI-Tools/cate-core.git

Build Anaconda installer `cate` (see `installer/construct.yaml`):

    $ cd cate-core
    $ constructor installer

*Warning: there is still an absolute (Windows) path in `installer/construct.yaml` which will remain
until we have uploaded the Cate Conda package to a public repository.*

The generated installer will have the same options as the default
[Conda installation](https://conda.io/docs/installation.html) in 
[silent mode](https://conda.io/docs/help/silent.html), namely:

### Windows installer options

* `/InstallationType=[JustMe|AllUsers]`, default: JustMe
* `/AddToPath=[0|1]`, default: 1
* `/RegisterPython=[0|1]`, make this the system’s default Python, default: 0 (Just me), 1 (All users)
* `/S`, run in silent mode
* `/D=<installation absolute path>`

Example:

    > cate-0.7.0a4-Windows-x86_64.exe /S /InstallationType=JustMe /AddToPath=0 /RegisterPython=0 /D=C:\Users\Dave\cate-0.7.0a4

### Linux and Darwin installer options

* `-b`, batch mode, no PATH modifications to ~/.bashrc
* `-p`, installation prefix/path
* `-f`, force installation even if prefix -p already exists

Example:

    $ ./cate-0.7.0a4-Linux-x86_64.sh -b -f -p /home/dave/cate-0.7.0a4

## Remaining issues and TODOs

* For the Cate CLI, we'd like to have desktop icons for Windows, Mac OS and at least Ubuntu.
  Currently, we can only have a Windows menu group (which is ok for time being).
  See https://github.com/conda/constructor/issues/38
* On Windows, `constructor` will install anything it finds in a package's `Menu` entry.
  Therefore users currently find also entries for Jupyter Notebook and the IPython QT Console, 
  which is annoying.
* We would actually like to create an installer, where Miniconda is just a sub-tree. 
  This is required because later we'll have to add an Electron GUI with HTML/JS sources:
```
    <install-dir>/
        bin/
        docs/
        notebooks/
        gui/
        python/
        ...
```
* Check out https://github.com/conda/conda-launch for later integration with Jupyter 

## More information

* [Building packages](http://conda.pydata.org/docs/building/build.html) in Conda docs
* [conda build](http://conda.pydata.org/docs/commands/build/conda-build.html)
* [construct.yml](https://github.com/conda/constructor/blob/master/CONSTRUCT.md)
* [PEP 440 -- Version Identification and Dependency Specification](https://www.python.org/dev/peps/pep-0440/)


