mainstuff: js presentation.html Figs/manyboxplots.png Figs/manyboxplots_oldschool.png

js: JS/plotframe.js JS/scatterplot.js JS/density.js JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/pheno.js JS/lod_onetime.js JS/lod_alltimes.js

JS/plotframe.js: Coffee/plotframe.coffee
	coffee -bco js coffee

JS/scatterplot.js: Coffee/scatterplot.coffee
	coffee -bco js coffee

JS/density.js: Coffee/density.coffee
	coffee -bco js coffee

JS/manyboxplots.js: Coffee/manyboxplots.coffee
	coffee -bco js coffee

JS/lod_and_effect.js: Coffee/lod_and_effect.coffee
	coffee -bco js coffee

JS/cistrans.js: Coffee/cistrans.coffee
	coffee -bco js coffee

JS/pheno.js: Coffee/pheno.coffee
	coffee -bco JS Coffee

JS/lod_onetime.js: Coffee/lod_onetime.coffee
	coffee -bco JS Coffee

JS/lod_alltimes.js: Coffee/lod_alltimes.coffee
	coffee -bco JS Coffee

R/spal.RData: R/prep_rep1_data.R RawData/rep1_rev.csv
	cd R;R CMD BATCH prep_rep1_data.R

R/out.RData: R/prep_rep1_data.R RawData/rep1_rev.csv
	cd R;R CMD BATCH prep_rep1_data.R

Data/spalding_pheno.json: R/spal.RData R/phe2json.R
	cd R;R CMD BATCH phe2json.R

Data/spalding_onetime.json: R/spal.RData R/out.RData R/grab_lod_one_time.R
	cd R;R CMD BATCH grab_lod_one_time.R

Figs/manyboxplots.png: R/hypo_boxplot.R
	cd R;R CMD BATCH hypo_boxplot.R

Figs/manyboxplots_oldschool.png: R/hypo_boxplot_oldschool.R
	cd R;R CMD BATCH hypo_boxplot_oldschool.R

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

webmain:
	scp index.html presentation.html broman-6:public_html/presentations/InteractiveGraphs/

webcss:
	scp css/*.css broman-6:public_html/presentations/InteractiveGraphs/css/

webcode:
	scp JS/*.js broman-6:public_html/presentations/InteractiveGraphs/JS/
	scp Coffee/*.coffee broman-6:public_html/presentations/InteractiveGraphs/Coffee/

webdata:
	scp data/*.json broman-6:public_html/presentations/InteractiveGraphs/data/

webex:
	scp examples/*.png broman-6:public_html/presentations/InteractiveGraphs/examples/
	scp examples/*.html broman-6:public_html/presentations/InteractiveGraphs/examples/

web: webmain webcss webcode webex webdata

all: js web presentation.html
