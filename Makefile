# Makefile

# Переменные для параметров командной строки
BASE_IMAGE ?= ubuntu
BASE_IMAGE_VERSION ?= 22.04
TARGET ?= default
WORK ?=.

# Цель для сборки Docker образа
.PHONY: build
build:
	@case "$(TARGET)" in \
		option1) \
			echo "Running build for option1"; \
			;; \
		option2) \
			echo "Running build for option2"; \
			;; \
		*) \
			echo "Running default build"; \
			 \
			;; \
	esac
	docker run -it -v $(WORK):/work -v $(WORK)/glibc-build:/glibc-build $(BASE_IMAGE):$(BASE_IMAGE_VERSION) bash;

.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)