.remote-state-created:
	$(MAKE) -C remote-state-local setup
	$(MAKE) -C remote-state-local apply
	$(MAKE) -C remote-state clean
	cp remote-state-local/terraform.tfstate* remote-state/
	$(MAKE) -C remote-state setup
	$(MAKE) -C remote-state apply
	touch .remote-state-created

setup: .remote-state-created
	$(MAKE) -C us-east-1 setup

clean:
	$(MAKE) -C us-east-1 clean

plan:
	$(MAKE) -C us-east-1 plan

apply:
	$(MAKE) -C us-east-1 apply ARGS=$(ARGS)

destroy:
	$(MAKE) -C us-east-1 destroy

destroy-all: destroy
	$(MAKE) -C remote-state-local refresh
	$(MAKE) -C remote-state-local destroy
	rm -fr .remote-state-created

docs:
	$(MAKE) -C remote-state-local docs
	$(MAKE) -C remote-state docs
	$(MAKE) -C us-east-1 docs
