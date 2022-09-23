INPUT_IMG   =/YOUR-DIR
INPUT_TRUTH =/YOUR-DIR
INPUT_RESULT=/YOUR-DIR
mAP:
	python main.py -na -np
mAP_vis:
	python main.py
referesh:
	rm -rf input
	mkdir input
	mkdir input/detection-results
	mkdir input/ground-truth
	mkdir input/images-optional
mv_results:
	rm -rf input/detection-results
	mkdir input/detection-results
	find $(INPUT_RESULT) -type f | xargs -i mv {} input/detection-results/.
cp_IMGandTRUTH:
	rm -rf input/ground-truth
	rm -rf input/images-optional
	mkdir input/ground-truth
	mkdir input/images-optional
	find $(INPUT_TRUTH) -type f | xargs -i cp {} input/ground-truth/.
	find $(INPUT_IMG) -type f | xargs -i cp {} input/images-optional/.
