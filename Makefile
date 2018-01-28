SOURCE = ${HOME}/.dotfiles/shell

clean:
	rm -f ${HOME}/.editrc
	rm -f ${HOME}/.hushlogin
	rm -f ${HOME}/.inputrc
	rm -f ${HOME}/.logout
	rm -f ${HOME}/.my.cnf
	rm -f ${HOME}/.profile
	rm -f ${HOME}/.shell

install:
	ln -snf ${SOURCE} ${HOME}/.shell
	ln -snf ${SOURCE}/editrc ${HOME}/.editrc
	ln -snf ${SOURCE}/inputrc ${HOME}/.inputrc
	ln -snf ${SOURCE}/logout ${HOME}/.logout
	ln -snf ${SOURCE}/my.cnf ${HOME}/.my.cnf
	ln -snf ${SOURCE}/profile ${HOME}/.profile
	touch ${HOME}/.hushlogin
