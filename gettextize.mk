include common.mk

all: ${PO_FILES}
.PHONY: all

define gettextize
$$(value PO_$1): $$(value README_$1) ${README_en}
	po4a-gettextize		\
		-f text		\
		-o markdown	\
		-m ${README_en}	\
		-l $$<		\
		-p $$@

endef

$(foreach lang,${TARGET_LANGS},$(eval $(call gettextize,${lang})))
