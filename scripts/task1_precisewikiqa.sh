# Copyright (c) Meta Platforms, Inc. and affiliates.

# All rights reserved.

# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

set -a            # auto-export all sourced vars
source ../../.env
set +a


MODELS=(
    "Qwen/Qwen3-0.6B"
)

MODE=dynamic
for MODEL in "${MODELS[@]}"
do
    python -m tasks.shortform.precise_wikiqa \
        --do_generate_prompt \
        --do_inference \
        --do_eval \
        --model $MODEL\
        --wiki_src goodwiki\
        --mode $MODE \
        --inference_method openai \
        --N 1
done
