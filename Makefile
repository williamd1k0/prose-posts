f ?= ./*.md
key := .prose.key # Your key here
POST_CMD = scp -i ${key} ${f} prose.sh:

post:
	$(POST_CMD)

ifneq "${f}" "./*.md" # Prevents deleting all posts at once
delete:
	cat /dev/null | tee ${f}
	$(POST_CMD)
endif

.PHONY: post delete
