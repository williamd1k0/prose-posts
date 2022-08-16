---
title: Makefile
description: Makefile I use to upload posts.
date: 2022-08-03
tags: [en, make, tools, scripts]
---

# Makefile

```make
f ?= ./*.md
key := ~/.ssh/id_ed25519 # Your key here
POST_CMD = scp -i ${key} ${f} prose.sh:

post:
	$(POST_CMD)

ifneq "${f}" "./*.md" # Prevents deleting all posts at once
delete:
	cat /dev/null | tee ${f}
	$(POST_CMD)
endif

.PHONY: post delete
```

# Usage

To (re)upload all posts:

```sh
make
```

To (re)upload specific posts:
```sh
make f+=post01.md f+=post02.md
```

To delete specific posts:
```sh
make delete f+=post01.md f+=post02.md
```

***
GitHub comments: https://github.com/williamd1k0/prose-posts/issues/3