.DEFAULT_GOAL := help

################################################################################
#                                Build and Run                                 #
################################################################################
.PHONY: watch
watch: ## Run just the server and live reload on file changes
	@cargo watch -c -x 'run'

.PHONY: up
up: ## Stand up all components of app
	@docker-compose up -d

.PHONY: down
down: ## Stop and remove all app containers
	@docker-compose down

################################################################################
#                                   Testing                                    #
################################################################################
.PHONY: test
test: ## Run test curls
	@curl http://127.0.0.1:8080; echo
	@curl http://127.0.0.1:8080/feeds/id | jq
	@curl http://127.0.0.1:8080/groups/id | jq
	@curl http://127.0.0.1:8080/sources/id | jq
	@curl http://127.0.0.1:8080/users/id | jq

################################################################################
#                                     Help                                     #
################################################################################
help:  ## Display this help
	@awk 'BEGIN { \
			FS = ":.*##"; \
			printf "\nUsage:\n  make \033[36m\033[0m\n"; \
		  } \
		  /^[a-zA-Z_%-]+:.*?##/ { \
			message=$$2; \
			if (length($$2) > 45) { \
				message=""; \
				linenum=0; \
				cmd="printf \047%s\n\047 \""$$2"\" | fold -sw 45" ; \
				while ( (cmd | getline line) > 0) { \
					if (linenum == 0) \
						message=line; \
					else \
						message=sprintf("%s\n%-39s%s", message, "", line); \
					linenum++; \
				} \
			} \
			var=sprintf("  \033[36m%-35s\033[0m %s\n", $$1, message); \
			print var; \
		  } \
		  /^#  +/ { \
			gsub(/#/,""); \
			gsub(/^[ \t]+|[ \t]+$$/, ""); \
			printf "\n\033[1m%s\033[0m\n", $$1; \
		  }' $(MAKEFILE_LIST)

