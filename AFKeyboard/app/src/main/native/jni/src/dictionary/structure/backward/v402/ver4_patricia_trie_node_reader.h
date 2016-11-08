/*
 * Copyright (C) 2013, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * !!!!! DO NOT EDIT THIS FILE !!!!!
 *
 * This file was generated from
 *   dictionary/structure/v4/ver4_patricia_trie_node_reader.h
 */

#ifndef LATINIME_BACKWARD_V402_VER4_PATRICIA_TRIE_NODE_READER_H
#define LATINIME_BACKWARD_V402_VER4_PATRICIA_TRIE_NODE_READER_H

#include "defines.h"
#include "dictionary/structure/pt_common/pt_node_params.h"
#include "dictionary/structure/pt_common/pt_node_reader.h"

namespace latinime {
namespace backward {
namespace v402 {

} // namespace v402
} // namespace backward
class BufferWithExtendableBuffer;
namespace backward {
namespace v402 {
} // namespace v402
} // namespace backward
class HeaderPolicy;
namespace backward {
namespace v402 {
class ProbabilityDictContent;

/*
 * This class is used for helping to read nodes of ver4 patricia trie. This class handles moved
 * node and reads node attributes including probability form probabilityBuffer.
 */
class Ver4PatriciaTrieNodeReader : public PtNodeReader {
 public:
    Ver4PatriciaTrieNodeReader(const BufferWithExtendableBuffer *const buffer,
            const ProbabilityDictContent *const probabilityDictContent,
            const HeaderPolicy *const headerPolicy)
            : mBuffer(buffer), mProbabilityDictContent(probabilityDictContent),
              mHeaderPolicy(headerPolicy) {}

    ~Ver4PatriciaTrieNodeReader() {}

    virtual const PtNodeParams fetchPtNodeParamsInBufferFromPtNodePos(const int ptNodePos) const {
        return fetchPtNodeInfoFromBufferAndProcessMovedPtNode(ptNodePos,
                NOT_A_DICT_POS /* siblingNodePos */);
    }

 private:
    DISALLOW_COPY_AND_ASSIGN(Ver4PatriciaTrieNodeReader);

    const BufferWithExtendableBuffer *const mBuffer;
    const ProbabilityDictContent *const mProbabilityDictContent;
    const HeaderPolicy *const mHeaderPolicy;

    const PtNodeParams fetchPtNodeInfoFromBufferAndProcessMovedPtNode(const int ptNodePos,
            const int siblingNodePos) const;
};
} // namespace v402
} // namespace backward
} // namespace latinime
#endif /* LATINIME_BACKWARD_V402_VER4_PATRICIA_TRIE_NODE_READER_H */