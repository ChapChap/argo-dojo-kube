.PHONY: helm-deps
helm-deps:
	@find . -type f -name Chart.yaml -path "*/helm/*" | while read chart; do \
		dir=$$(dirname $$chart); \
		echo "Updating dependencies in $$dir"; \
		helm dep build $$dir; \
		helm dep up $$dir; \
	done
