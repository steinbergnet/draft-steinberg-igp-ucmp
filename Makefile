OPEN=$(word 1, $(wildcard /usr/bin/xdg-open /usr/bin/open /bin/echo))
#SOURCES?=${wildcard *.mkd}
SOURCES=draft-steinberg-igp-ucmp.mkd
DRAFTS=${SOURCES:.mkd=.txt}
HTML=${SOURCES:.mkd=.html}
XML=${SOURCES:.mkd=.xml}

all:    xml txt html
txt:    $(DRAFTS)
html:   $(HTML)
xml:    $(XML)

clean:
	rm $(DRAFTS) $(HTML) $(XML)

%.xml:  %.mkd
	kramdown-rfc2629 $< >$@.new
	mv $@.new $@

%.html: %.xml
	xml2rfc --html $<
	#$(OPEN) $@

%.txt:  %.xml
	xml2rfc  $< $@
