POT_ENGLISH	:= en.pot
REPO_DIR	:= ${CURDIR}/standard
DOCS_DIR	:= ${REPO_DIR}/docs
LANGS		:= $(patsubst ${DOCS_DIR}/README-%.md,%,$(wildcard ${DOCS_DIR}/README-*.md))
TARGET_LANGS	:= $(filter-out en,${LANGS})
PATCH		:= patch.diff

define readme-file
README_$1 := ${DOCS_DIR}/README-$1.md

endef

$(foreach lang,${LANGS},$(eval $(call readme-file,${lang})))

README_FILES := $(foreach lang,${TARGET_LANGS},$(value README_${lang}))

define po-file
PO_$1 := $1.po

endef

$(foreach lang,${TARGET_LANGS},$(eval $(call po-file,${lang})))

PO_FILES := $(foreach lang,${TARGET_LANGS},$(value PO_${lang}))
