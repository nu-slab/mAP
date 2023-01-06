MAKEFILE_SETTINGS_JSON = makefile_settings.json
# requirement "jq" command
INPUT_IMG    := $(shell cat $(MAKEFILE_SETTINGS_JSON) | jq '.INPUT_IMG'   )
INPUT_TRUTH  := $(shell cat $(MAKEFILE_SETTINGS_JSON) | jq '.INPUT_TRUTH' )
INPUT_RESULT := $(shell cat $(MAKEFILE_SETTINGS_JSON) | jq '.INPUT_RESULT')

mAP:refresh cp_results cp_IMGandTRUTH
	python3 main.py -na -np
mAP_vis:
	python3 main.py
refresh:
	rm -rf input
	mkdir input
	mkdir input/detection-results
	mkdir input/ground-truth
	mkdir input/images-optional
cp_results:
	rm -rf input/detection-results
	mkdir input/detection-results
	find $(INPUT_RESULT) -type f | xargs -i cp {} input/detection-results/.
cp_IMGandTRUTH:
	rm -rf input/ground-truth
	rm -rf input/images-optional
	mkdir input/ground-truth
	mkdir input/images-optional
	find $(INPUT_TRUTH) -type f | xargs -i cp {} input/ground-truth/.
	find $(INPUT_IMG) -type f | xargs -i cp {} input/images-optional/.
