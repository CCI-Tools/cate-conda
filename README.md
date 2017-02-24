<img alt="Cate: ESA CCI Toolbox" align="right" src="https://raw.githubusercontent.com/CCI-Tools/cate-core/master/doc/source/_static/logo/cci-toolbox-logo-latex.jpg" />

[![Build Status](https://travis-ci.org/CCI-Tools/cate-conda.svg?branch=master)](https://travis-ci.org/CCI-Tools/cate-conda)
[![Build status](https://ci.appveyor.com/api/projects/status/to0dhvj3vqg08lwg/branch/master?svg=true)](https://ci.appveyor.com/project/forman/cate-conda/branch/master)

# cate-conda

This repository provides scripts used to build and deploy various 
[Cate](https://github.com/CCI-Tools/cate-core) packages 
for the [Anaconda](https://www.continuum.io/) and
[Miniconda](https://conda.io/miniconda.html) Python distributions.
 
See also the [cate-installer](https://github.com/CCI-Tools/cate-installer) repo 
which is used to build a stand-alone installer for Cate.

## Available Cate Conda packages

* `cate` - the default, complete Cate distribution for Python
* `cate-cli` - same as `cate` but creates start menu / desktop shortcuts for the Cate command-line interface (CLI) 
   during installation using `conda install`
* `cate-lib` - expects all dependent libraries to be provided by a target environment, i.e. as peer dependencies
* `cate-util` - just the `cate.util` Python package with optional dependencies
 
## Building Cate Conda packages

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

## Testing the Conda package

To test the new Conda package `cate` in a test environment `cate-test`, type
     
    $ conda create -n cate-test python=3
    $ source activate cate-test
    $ conda install -c conda-forge --use-local cate
    ...
    $ cate --help

## Deploying the Conda package

Just run the package build step with `--user <channel>`:

    $ conda build --user ccitools -c conda-forge -c defaults recipes/<recipe>
