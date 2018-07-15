JSDIR=assets/js
CSSDIR=assets/css
IMGDIR=images/

all: index.html $(CSSDIR)/main.min.css $(JSDIR)/main.min.js

index.html: index.fat.html
	html-minifier --html5 --collapse-whitespace --conservative-collapse --remove-comments -o $@ $<

$(CSSDIR)/main.min.css: $(CSSDIR)/main.css $(CSSDIR)/font-awesome.min.css
	cleancss -o $@ $^

$(JSDIR)/main.min.js: $(JSDIR)/skel.min.js $(JSDIR)/util.js $(JSDIR)/main.js
	uglifyjs $^ --compress --mangle --source-map "root='/',url='/$@.map',filename='$@.map'" --output $@

clean:
	rm -rf index.html $(CSSDIR)/main.min.css $(JSDIR)/main.min.js $(JSDIR)/main.min.js.map
