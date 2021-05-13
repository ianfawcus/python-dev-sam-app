
install:
	python -m pip install --upgrade pip ;\
  pip install -r tests/test_requirements.txt

build:
	sam build

local-lambda-start:
	(sam local start-lambda) &> sam-local-lambda.log & \
	./cicd/wait-for-sam-local-lambda.sh

local-lambda-stop:
	./cicd/kill-sam-local-lambda.sh

test-unit:
	pytest tests/unit/

test-integration:
	pytest tests/integration/ ;\

test:
	pytest tests/ ;\

full: build install local-lambda-start
	pytest tests/ ;\
	./cicd/kill-sam-local-lambda.sh

