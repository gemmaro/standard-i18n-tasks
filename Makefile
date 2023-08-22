include common.mk

all: ${README_FILES} ${PATCH}
.PHONY: all

define readme-file
$$(value README_$1): $$(value PO_$1) ${README_en}
	poetry run			\
		po2md			\
			-i $$<		\
			-t ${README_en}	\
			-o $$@

endef

$(foreach lang,${TARGET_LANGS},$(eval $(call readme-file,${lang})))

${PATCH}: ${README_en}
	git -C ${REPO_DIR} diff -- $< > ${CURDIR}/$@

define po-file
$$(value PO_$1): ${POT_ENGLISH}
	poetry run				\
		pot2po				\
			-t $$(value PO_$1)	\
			$$<			\
			$$(value PO_$1)

endef

$(foreach lang,${TARGET_LANGS},$(eval $(call po-file,${lang})))

${POT_ENGLISH}: ${README_en}
	poetry run md2po $< $@

help:
	@echo readme langs: ${LANGS}
	@echo PO files: ${PO_FILES}
.PHONY: help
