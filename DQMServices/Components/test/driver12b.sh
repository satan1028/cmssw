#!/bin/bash

eval `scramv1 r -sh`

tnum=12
DQMSEQUENCE=HARVESTING:dqmHarvesting
step=b

cmsDriver.py test_${tnum}_${step}_1 -s ${DQMSEQUENCE} --scenario HeavyIons --conditions=auto:com10 --data --filetype DQM --filein file:test_${tnum}_a_1_RAW2DIGI_RECO_DQM.root --no_exec --python_filename=test_${tnum}_${step}_1.py

cmsRun -e test_${tnum}_${step}_1.py >& q12.1.log 

if [ $? -ne 0 ]; then
  return 1
fi

mv FrameworkJobReport{,_${tnum}_${step}_1}.xml

