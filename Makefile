#
# This file is part of the semweb vim bundle for working with RDF knowledge bases
#
# Author:    Sebastian Tramp <http://sebastian.tramp.name>
# Homepage:  http://github.com/seebi/semweb.vim
# Copyright: Copyright (C) 2011 Sebastian Tramp
# License:   http://opensource.org/licenses/gpl-3.0.html

default:
	@echo "targets:"
	@echo "	pull - updates syntax files"

pull: pull-n3 pull-sparql

pull-sparql:
	git pull git://github.com/vim-scripts/sparql.vim.git master

pull-n3:
	git pull git://github.com/vim-scripts/n3.vim.git master
