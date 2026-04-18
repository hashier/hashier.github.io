HUGO_FLAGS = --printPathWarnings --printI18nWarnings

.PHONY: serve build clean

serve:
	cd homepage && hugo server -M $(HUGO_FLAGS)

build:
	cd homepage && hugo --minify $(HUGO_FLAGS)

clean:
	rm -rf homepage/public
