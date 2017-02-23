<img alt="Cate: ESA CCI Toolbox" align="right" src="https://raw.githubusercontent.com/CCI-Tools/cate-core/master/doc/source/_static/logo/cci-toolbox-logo-latex.jpg" />

[![Build Status](https://travis-ci.org/CCI-Tools/cate-conda.svg?branch=master)](https://travis-ci.org/CCI-Tools/cate-conda)

# cate-conda

This repository provides scripts used to build and deploy various 
[cate](https://github.com/CCI-Tools/cate-core) packages 
for the [Anaconda](https://www.continuum.io/) and
[Miniconda](https://conda.io/miniconda.html) Python distributions 
and how to build a stand-alone installer.

## Conda package

### Building the Cate Conda package

Install `conda-build` in your **root** Miniconda:

    $ source activate
    $ conda install conda-build
    
Clone this repo:
    
    $ git clone https://github.com/CCI-Tools/cate-conda.git
    
Build a Conda package `cate-<recipe>` (see `recipes/<recipe>/meta.yaml`):
    
    $ cd cate-conda
    $ conda build -c conda-forge -c defaults recipes/<recipe>
     
The `-c` (or `--channel`) option adds extra Anaconda *channels* to search for package 
dependencies. We must add `defaults` to search for Anaconda default packagers first, then
for packages from `conda-forge`, which hosts the `cartopy` versions required by Cate.

### Testing the Conda package

To test the new Conda package `cate` in a test environment `cate-test`, type
     
    $ conda create -n cate-test python=3
    $ source activate cate-test
    $ conda install -c conda-forge --use-local cate
    ...
    $ cate --help

### Deploying the Conda package

Just run the package build step with `--user <channel>`:

    $ conda build --user ccitools -c conda-forge -c defaults recipes/<recipe>

## Anaconda installer

### Building a Conda stand-alone installer

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

#### Windows Options

* `/InstallationType=[JustMe|AllUsers]`, default: JustMe
* `/AddToPath=[0|1]`, default: 1
* `/RegisterPython=[0|1]`, make this the system’s default Python, default: 0 (Just me), 1 (All users)
* `/S`, run in silent mode
* `/D=<installation absolute path>`

Example:

    > cate-0.7.0a4-Windows-x86_64.exe /S /InstallationType=JustMe /AddToPath=0 /RegisterPython=0 /D=C:\Users\Dave\cate-0.7.0a4

#### Unix and Darwin

* `-b`, batch mode, no PATH modifications to ~/.bashrc
* `-p`, installation prefix/path
* `-f`, force installation even if prefix -p already exists

Example:

    $ ./cate-0.7.0a4-Linux-x86_64.sh -b -f -p /home/dave/cate-0.7.0a4

### Remaining problems & TODOs

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

