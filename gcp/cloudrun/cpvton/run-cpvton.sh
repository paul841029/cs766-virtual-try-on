#!/usr/bin/env bash
set -ex

# step3. generate warp cloth & mask using GMM
python3 test.py --name gmm_traintest_new \
                --stage GMM --workers 0 --datamode test \
                --data_list custom_pairs.txt \
                --checkpoint checkpoints/gmm_train_new/gmm_final.pth

# step4. generate final try-on image using TOM
python3 test.py --name tom_test_new --stage TOM --workers 0 \
                --datamode test --data_list custom_pairs.txt \
                --checkpoint checkpoints/tom_train_new/tom_final.pth

