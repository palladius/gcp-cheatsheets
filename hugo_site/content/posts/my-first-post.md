---
title: "My First Post with hugo"
date: 2022-02-02T07:24:04+01:00
draft: true
---

Ciao da Riccardo.

This is under `content/posts/my-first-post.md`. 
Pretty sweet so far.

Code repo: https://github.com/palladius/gcp-cheatsheets

# Run

    hugo server -D

It runs on port 1313

# Install

	git submodule add https://github.com/google/docsy.git themes/docsy-submodule/
	#echo 'theme = "docsy"' >> config.toml
	git submodule update --init --recursive