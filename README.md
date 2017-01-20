# cate-conda

Conda recipe and Anaconda installer for Cate contained in https://github.com/CCI-Tools/cate-core

## Conda package

### Building the Cate Conda package

Install `conda-build` in your root Miniconda:

    source activate
    conda install conda-build
    
Clone this repo:
    
    git clone https://github.com/CCI-Tools/cate-conda.git
    
Build Conda package `cate` (see `recipe/meta.yaml`):
    
    cd cate-conda
    conda build -c defaults -c conda-forge recipe
     
The `-c` (or `--channel`) option adds extra Anaconda *channels* to search for package 
dependencies. We must add `defaults` to search for Anaconda default packagers first, then
for packages from `conda-forge`. which hosts the `cartopy`and `basemap` versions required by Cate.

### Testing the Cate Conda package

To test the new Conda package `cate` in a test environment `cate-test`, type
     
    conda create -n cate-test python=3
    source activate cate-test
    conda install -c defaults -c conda-forge --use-local cate
    ...
    cate --help

### Remaining problems & TODOs

* Must upload the package to a public Anaconda channel

## Anaconda installer

### Building the installer

*Warning: there is still an absolute (Windows!) path in `installer/construct.yaml` which will remain
until we have uploaded the Cate Conda package to a public repository.*

Install `constructor` in your root Miniconda:

    source activate
    conda install constructor
    
**At least version 1.5.2 is required**.

Clone this repo:

    git clone https://github.com/CCI-Tools/cate-conda.git

Build Anaconda installer `cate` (see `installer/construct.yaml`):

    cd cate-conda
    constructor installer

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
* Check: https://github.com/conda/conda-launch  

## More information

* [Building packages](http://conda.pydata.org/docs/building/build.html) in Conda docs
* [conda build](http://conda.pydata.org/docs/commands/build/conda-build.html)
* [construct.yml](https://github.com/conda/constructor/blob/master/CONSTRUCT.md)
* [PEP 440 -- Version Identification and Dependency Specification](https://www.python.org/dev/peps/pep-0440/)