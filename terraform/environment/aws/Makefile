ACCT := 808768689561

setup-remote-state:
	$(MAKE) -C $(ACCT) setup-remote-state

setup:
	$(MAKE) -C $(ACCT) setup

clean:
	$(MAKE) -C $(ACCT) clean

plan:
	$(MAKE) -C $(ACCT) plan

apply:
	$(MAKE) -C $(ACCT) apply ARGS=$(ARGS)

destroy:
	$(MAKE) -C $(ACCT) destroy

destroy-all: destroy
	$(MAKE) -C $(ACCT) destroy-all

docs:
	$(MAKE) -C $(ACCT) docs
