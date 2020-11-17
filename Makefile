.PHONY: build-and-run run stop deploy build remove-file-if-exist download-zip download-install-script
.COMMUNITY_VERSION_ZIP = "https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v2.2.1/ant-media-server-2.2.1-community-2.2.1-20201029_0748.1.zip"
.INSTALLING_TARGET_DIRECTORY="${PWD}/community/app"
.COMMUNITY_LOCAL_ZIP = "${.INSTALLING_TARGET_DIRECTORY}/antMediaServerCommunity.zip"

.INSTALLING_SCRIPT="https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh"
.INSTALLING_SCRIPT_LOCAL_TARGET="${.INSTALLING_TARGET_DIRECTORY}/install_ant-media-server.sh"
.COMMUNITY_NEW_VERSION = 2.2.1

export VERSION=${.COMMUNITY_NEW_VERSION}

define remove_file
    @rm -f ${1}
endef

build-and-run: build run

run:
	docker-compose -f community/docker-compose.yml up -d

stop:
	docker-compose -f community/docker-compose.yml down

deploy: build
	docker-compose -f community/docker-compose.yml push

build: download-zip download-install-script
	docker-compose -f community/docker-compose.yml build

download-zip:
	$(call remove_file, ${.COMMUNITY_LOCAL_ZIP})
	wget ${.COMMUNITY_VERSION_ZIP} -O ${.COMMUNITY_LOCAL_ZIP}

download-install-script:
	$(call remove_file, ${.INSTALLING_SCRIPT_LOCAL_TARGET})
	wget ${.INSTALLING_SCRIPT} -O ${.INSTALLING_SCRIPT_LOCAL_TARGET}
	chmod 755 ${.INSTALLING_SCRIPT_LOCAL_TARGET}