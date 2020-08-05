ci: format freeze

format:
	@find . -name "*.dhall" -exec dhall format --inplace {} \;

freeze:
	@dhall freeze --all --inplace package.dhall
	@dhall freeze --all --inplace schemas.dhall

update-doc: freeze
	@dhall-docs --input . --package-name dhall-software-factory --output-link result --ascii

publish: update-doc
	@rsync --delete -r result/ docs/
	@find docs/ -type d -exec chmod 0755 {} +
	@find docs/ -type f -exec chmod 0644 {} +
	@rsync --delete -avi ./docs/ pagesuser@www.softwarefactory-project.io:/var/www/pages/docs.softwarefactory-project.io/dhall-software-factory/
