checkstyle:
	cd plugins; ./gradlew checkstyle

test:
	cd plugins; ./gradlew :traffic:test
	cd plugins; ./gradlew :locationlayer:test

build-release:
	cd plugins; ./gradlew :traffic:assembleRelease
	cd plugins; ./gradlew :locationlayer:assembleRelease

javadoc:
	# Android modules
	# Output is ./mapbox/*/build/docs/javadoc/release
	cd plugins; ./gradlew :traffic:javadocrelease
	cd plugins; ./gradlew :locationlayer:javadocrelease

publish:
	cd plugins; export IS_LOCAL_DEVELOPMENT=false; ./gradlew :traffic:uploadArchives
	cd plugins; export IS_LOCAL_DEVELOPMENT=false; ./gradlew :locationlayer:uploadArchives

publish-local:
	# This publishes to ~/.m2/repository/com/mapbox/mapboxsdk
	cd plugins; export IS_LOCAL_DEVELOPMENT=true; ./gradlew :traffic:uploadArchives
	cd plugins; export IS_LOCAL_DEVELOPMENT=true; ./gradlew :locationlayer:uploadArchives
