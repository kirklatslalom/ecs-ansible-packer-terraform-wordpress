setup:
	$(MAKE) -C vpc setup
	$(MAKE) -C wordpress setup

clean:
	$(MAKE) -C wordpress clean
	$(MAKE) -C vpc clean

plan:
	$(MAKE) -C vpc plan
	$(MAKE) -C wordpress plan

apply:
	$(MAKE) -C vpc apply ARGS=$(ARGS)
	$(MAKE) -C wordpress apply ARGS=$(ARGS)

destroy:
	$(MAKE) -C wordpress destroy
	$(MAKE) -C vpc destroy

docs:
	$(MAKE) -C wordpress docs
	$(MAKE) -C vpc docs
