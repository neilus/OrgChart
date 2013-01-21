all: jati.svg jati.eps
toolchain: lemon graphviz raphael.js gviz-api.js d3 phpdocx_free
	mkdir -p svg vml eps png
clean-toolchain:
	rm -rf lemon* ## clearing lemon stuffz
	rm -rf graphviz* ## clearing graphfiz stuffz
	rm -rf raphael.js gviz-api.js d3
clean:
	rm -rf svg/* vml/* png/*

svg/%.svg: dot/%.dot
	./graphviz/bin/dot -Gsplines=ortho -Gconcentrate=yes -Tsvg   -o $@ dot/${notdir $(patsubst %.svg, %.dot, $@) }
vml/%.vml: dot/%.dot
	./graphviz/bin/dot -Gsplines=ortho -Gconcentrate=yes -Tvml   -o $@ dot/${notdir $(patsubst %.vml, %.dot, $@) }
png/%.png: dot/%.dot
	./graphviz/bin/dot -Gsplines=ortho -Gconcentrate=yes -Tpng   -o $@ dot/${notdir $(patsubst %.png, %.dot, $@) }
eps/%.eps: dot/%.dot
	./graphviz/bin/dot -Gsplines=ortho -Gconcentrate=yes -Teps   -o $@ dot/${notdir $(patsubst %.eps, %.dot, $@) }

### raphael stuff (SVG manipulation library)
raphael.js:
	wget http://github.com/DmitryBaranovskiy/raphael/raw/master/raphael.js
### Google Visualization API class definitions for intellisense
gviz-api.js:
	wget http://www.google.com/uds/modules/gviz/gviz-api.js
jquery:
	wget http://www.basicprimitives.com/index.php?option=com_phocadownload&view=file&id=1:primitiveszip&Itemid=21&lang=en

d3:
	git clone git://github.com/mbostock/d3.git
	cd d3 && npm install && npm test
#### php docx stuff
phpdocx_free:phpdocx_free.tar.gz
	tar xvzf phpdocx_free.tar.gz

#### graphviz stuff
graphviz: graphviz-2.30.0
	mkdir -p graphviz;
	cd graphviz-2.30.0 && ./configure --prefix=`pwd`/../graphviz --with-ortho=yes && make && make install || rmdir graphviz && make graphviz
graphviz-2.30.0: graphviz-2.30.0.tar.gz
	tar xzf graphviz-2.30.0.tar.gz
graphviz-2.30.0.tar.gz: graphviz-2.30.0.tar.gz.md5
	rm -rf $@ $@.?
	wget http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.30.0.tar.gz
	md5sum -c graphviz-2.30.0.tar.gz.md5
	@touch graphviz-2.30.0.tar.gz graphviz-2.30.0.tar.gz.md5
graphviz-2.30.0.tar.gz.md5:
	wget http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.30.0.tar.gz.md5

### lemon stuff
lemon-1.2.tar.gz:
	-@tput setf 6
	@echo "Letoltom a lemont ide lokalis installalasra"
	-@tput sgr0
	wget http://lemon.cs.elte.hu/pub/sources/lemon-1.2.tar.gz
lemon-1.2: lemon-1.2.tar.gz
	-@tput setf 6
	@echo "Kicsomagolom ide a lemont"
	-@tput sgr0
	tar xzf lemon-1.2.tar.gz
lemon: lemon-1.2
	-@tput setf 6
	@echo "Most installalok lokalisan egy lemon-t"
	-@tput sgr0
	@echo -n "ide rakom a lemon backupjat"
	-@tput setf
	@echo `(uname -a|grep -i linux >/dev/null && echo linux) || (uname -a|grep -i cygwin >/dev/null && echo cygwin)|| (uname -a|grep -i MINGW32 >/dev/null && echo windows-mingw) `
	-@tput sgr0
	./install-lemon.sh "-`(uname -a|grep -i linux >/dev/null && echo linux) || (uname -a|grep -i cygwin >/dev/null && echo cygwin)|| (uname -a|grep -i MINGW32 >/dev/null && echo windows-mingw) `"
lemonpath:
	-@tput setf 4
	@echo "Ha nincs LEMON konfiguralva, add ki a make lemon parancsot, mely beallitja a lemonpath-ot is a forditonak!!!"
	-@tput sgr0
hello_lemon: lemonpath hello_lemon.cc
	g++ -o hello_lemon hello_lemon.cc  `cat lemonpath`
