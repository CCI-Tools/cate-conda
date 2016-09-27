# ect-conda

Conda recipe and Anaconda installer for the ECT contained in https://github.com/CCI-Tools/ect-core

## Conda package

### Building the ECT Conda package

Install `conda-build` in your root Miniconda:

    source activate
    conda install conda-build
    
Clone this repo:
    
    git clone https://github.com/CCI-Tools/ect-conda.git
    
Build Conda package `ect` (see `recipe/meta.yaml`):
    
    cd ect-conda
    conda build -c defaults -c conda-forge recipe
     
The `-c` (or `--channel`) option adds extra Anaconda *channels* to search for package 
dependencies. We must add `defaults` to search for Anaconda default packagers first, then
for packages from `conda-forge`. which hosts the `cartopy`and `basemap` versions required by ECT.

### Testing the ECT Conda package

To test the new Conda package `ect` in a test environment `ect-test`, type
     
    conda create -n ect-test python=3
    source activate ect-test
    conda install --use-local ect
    ...
    ect --help

### Remaining problems & TODOs

* Must upload the package to a public Anaconda channel

## Anaconda installer

### Building the installer

*Warning: there is still an absolute (Windows!) path in `installer/construct.yaml` which will remain
until we have uploaded the ECT Conda package to a public repository.*

Install `constructor` in your root Miniconda:

    source activate
    conda install constructor

Clone this repo:

    git clone https://github.com/CCI-Tools/ect-conda.git

Build Anaconda installer `ect` (see `installer/construct.yaml`):

    cd ect-conda
    constructor installer

### Remaining problems & TODOs

* For the ECT CLI, we'd like to have desktop icons for Windows, Mac OS and at least Ubuntu.
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
* Check: https://github.com/conda/conda-launch  

## More information

* [Building packages](http://conda.pydata.org/docs/building/build.html) in Conda docs
* [conda build](http://conda.pydata.org/docs/commands/build/conda-build.html)