init:
	bundle install

serve:
	jekyll serve --watch --drafts

deploy:
	jekyll build && git push origin master
