.PHONY: help build-dev push-dev deploy-dev ecr-login

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-dev: ## Build development environment
	$(eval GIT_REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker build -f Dockerfile --build-arg GIT_COMMIT_SHA1=$(GIT_REV) -t pehapkari:latest .
	docker tag pehapkari:latest $(AWS_ACCOUNT_ID).dkr.ecr.eu-west-1.amazonaws.com/pehapkari:latest
	docker tag pehapkari:latest $(AWS_ACCOUNT_ID).dkr.ecr.eu-west-1.amazonaws.com/pehapkari:$(GIT_REV)

push-dev: ecr-login
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.eu-west-1.amazonaws.com/pehapkari:latest
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.eu-west-1.amazonaws.com/pehapkari:$(GIT_REV)

deploy-dev: build-dev push-dev
	echo 1

ecr-login:
	$$(aws ecr get-login --region eu-west-1 --no-include-email)
