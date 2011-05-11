
default:
	@echo "targets:"
	@echo "	pull - updates syntax files"

pull: pull-n3 pull-sparql

pull-sparql:
	git pull git://github.com/vim-scripts/sparql.vim.git master

pull-n3:
	git pull git://github.com/vim-scripts/n3.vim.git master
