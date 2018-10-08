## default release name
RELEASE?=staging

############# clean part #############

## remove mix deps
clean-mix-deps:
	rm -rf deps
	rm -rf apps/*/deps

## remove node modules
clean-node-mods:
	rm -rf assets/node_modules
	rm -rf apps/*/assets/node_modules

## remove releases directory
clean-build:
	rm -rf _build

## remove static
clean-static:
	rm -rf priv/static
	rm -rf apps/*/priv/static

## clean development release
clean-compiled:
	MIX_ENV=dev mix clean --only=dev

## soft clean, remove web and compiled files
clean: clean-static clean-compiled

## remove all built results
clean-all: clean-static clean-compiled clean-build clean-node-mods clean-mix-deps

############# development part #############

## compile application
getdeps:
	MIX_ENV=$(RELEASE) mix deps.get

## compile application
compile: getdeps
	MIX_ENV=$(RELEASE) mix compile

## build development release
build: RELEASE=dev
build: clean-all compile

## build and start development server
server: RELEASE=dev
server: compile
	MIX_ENV=$(RELEASE) mix phx.server

## build and start development server with shell
shell: RELEASE=dev
shell: compile
	MIX_ENV=$(RELEASE) iex -S mix phx.server

## build and start dialyzer
dialyzer: RELEASE=test
dialyzer: compile
	MIX_ENV=$(RELEASE) mix dialyzer --halt-exit-status

## run dialyzer and start tests (test release)
test: RELEASE=test
test: dialyzer
	MIX_ENV=$(RELEASE) mix test --raise

############# docker test part #############

staging_build:
	docker build -t demo_project .