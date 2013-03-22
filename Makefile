mainstuff: js presentation.html Figs/manyboxplots.png Figs/manyboxplots_oldschool.png

js: JS/plotframe.js JS/scatterplot.js JS/density.js JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/pheno.js JS/lod_onetime.js JS/lod_alltimes.js

JS/plotframe.js: Coffee/plotframe.coffee
	coffee -bco JS coffee/plotframe.coffee

JS/scatterplot.js: Coffee/scatterplot.coffee
	coffee -co JS coffee/scatterplot.coffee

JS/density.js: Coffee/density.coffee
	coffee -co JS coffee/density.coffee

JS/manyboxplots.js: Coffee/manyboxplots.coffee
	coffee -co JS coffee/manyboxplots.coffee

JS/lod_and_effect.js: Coffee/lod_and_effect.coffee
	coffee -co JS coffee/lod_and_effect.coffee

JS/cistrans.js: Coffee/cistrans.coffee
	coffee -co JS coffee/cistrans.coffee

JS/pheno.js: Coffee/pheno.coffee
	coffee -co JS Coffee/pheno.coffee

JS/lod_onetime.js: Coffee/lod_onetime.coffee
	coffee -co JS Coffee/lod_onetime.coffee

JS/lod_alltimes.js: Coffee/lod_alltimes.coffee
	coffee -co JS Coffee/lod_alltimes.coffee

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

webhtml:
	scp *.html broman-7:public_html/presentations/InteractiveGraphs3/

webcss:
	scp CSS/*.css broman-7:public_html/presentations/InteractiveGraphs3/CSS/

webcode:
	scp JS/*.js broman-7:public_html/presentations/InteractiveGraphs3/JS/
	scp Coffee/*.coffee broman-7:public_html/presentations/InteractiveGraphs3/Coffee/

webdata:
	scp Data/*.json broman-7:public_html/presentations/InteractiveGraphs3/Data/

webfig:
	scp Figs/*.json broman-7:public_html/presentations/InteractiveGraphs3/Figs/

webex:
	scp Examples/*.html broman-7:public_html/presentations/InteractiveGraphs3/Examples/

web: webhtml webcss webcode webex webdata webfig

all: js web presentation.html
