init:
	bundle install

serve:
	jekyll serve --watch --drafts

deploy:
	git push origin master
