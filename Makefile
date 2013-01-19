all: graphviz
clean:
	rm -rvf graphviz*
graphviz: 
	mkdir -p graphviz;
	cd graphviz-2.30.0 && ./configure --prefix=`pwd`/../graphviz --with-ortho=yes && make && make install
    #@ if [ $? -neq 0 ];then tput setfg 4 && echo -n "ERROR:" && tput sgr0 && echo " installing graphviz"; else tput setf 2 && echo -n "SUCCES:" && tput sgr0 && echo " graphviz installed under $HOME/graphviz"; fi
graphviz-2.30.0: graphviz-2.30.0.tar.gz
	tar xzf graphviz-2.30.0.tar.gz
graphviz-2.30.0.tar.gz: graphviz-2.30.0.tar.gz.md5
	rm -rf $@ $@.?
	wget http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.30.0.tar.gz 	
	md5sum -c graphviz-2.30.0.tar.gz.md5
	@touch graphviz-2.30.0.tar.gz graphviz-2.30.0.tar.gz.md5
graphviz-2.30.0.tar.gz.md5:
	wget http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.30.0.tar.gz.md5