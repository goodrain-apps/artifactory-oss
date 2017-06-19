build:
	@docker build -t goodrainapps/artifactory-oss .

release: build
	@docker build -t goodrainapps/artifactory-oss:$(shell cat VERSION) .
