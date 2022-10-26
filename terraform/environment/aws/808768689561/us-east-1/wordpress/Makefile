# Terraform Taxonomy
APP     := wordpress
ACCOUNT := 808768689561
ENV     := prod
REGION  := us-east-1
BUCKET  := tfstate-bucket-$(ACCOUNT)

# Backend info
PROFILE := 808768689561
STATE_FILE=$(APP)/$(ENV)/$(REGION)/infrastructure.tfstate

all: setup

clean:
	rm -fr ./.terraform *tfstate

setup:
	terraform init \
		-backend-config="profile=$(PROFILE)" \
		-backend-config="region=us-west-1" \
		-backend-config="acl=bucket-owner-full-control" \
		-backend-config="bucket=$(BUCKET)" \
		-backend-config="key=state/$(STATE_FILE)" && \
	terraform state pull

pull: setup
	terraform get -update && \
	terraform state pull

validate: pull
	terraform validate \
		-var "env=$(ENV)" \
		-var "app=$(APP)" \
		-var "account=$(ACCOUNT)" \
		-var "region=$(REGION)" \
		-var "profile=$(PROFILE)"

plan: pull
	terraform plan \
		-var "env=$(ENV)" \
		-var "app=$(APP)" \
		-var "account=$(ACCOUNT)" \
		-var "region=$(REGION)" \
		-var "profile=$(PROFILE)"

apply: pull
	terraform apply \
		-auto-approve \
		-var "env=$(ENV)" \
		-var "app=$(APP)" \
		-var "account=$(ACCOUNT)" \
		-var "region=$(REGION)" \
		-var "profile=$(PROFILE)"

destroy: pull
	terraform destroy \
		-var "env=$(ENV)" \
		-var "app=$(APP)" \
		-var "account=$(ACCOUNT)" \
		-var "region=$(REGION)" \
		-var "profile=$(PROFILE)"

docs:
	terraform-docs -c ../../../../.terraform-docs.yml markdown . > README.md
