#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

from glob import glob
import os
import sys

from setuptools import setup, Extension
from Cython.Build  import cythonize

if sys.argv[-1] == 'setup.py':
    print('To install, run \'python setup.py install\'')

if sys.version_info[:2] < (2, 7):
    print(
        'networkx-lemon requires Python version 2.7 or later' +
        ' ({}.{} detected).'.format(*sys.version_info[:2]))
    sys.exit(-1)

libraries = [
    ('lemon', {'sources': glob('src/lemon/base.cc'),
               'depends': glob('src/lemon/*.h') +
                          glob('src/lemon/concepts/*.h') +
                          glob('src/lemon/bits/*.h'),
               'include_dirs': ['src']})]


if __name__ == "__main__":

    setup(
        name               = 'networkx-lemon',
        version            = '1.0',
        maintainer         = 'NetworkX Developers',
        maintainer_email   = 'networkx-discuss@googlegroups.com',
        description        = 'NetworkX Addon to interface with LEMON graph library',
        packages           = ['nxlemon'],
        libraries          = libraries,
        test_suite         = 'nose.collector',
        tests_require      = ['nose>=0.10.1']
    )
