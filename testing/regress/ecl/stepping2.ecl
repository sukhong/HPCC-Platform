/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

//version multiPart=false
//version multiPart=true

import ^ as root;
multiPart := #IFDEFINED(root.multiPart, false);

//--- end of version configuration ---

//nothor
//Stepped Thor support

import $.Setup;
import $.Setup.TS;
wordIndex := Setup.Files(multiPart, false).getWordIndex();

OUTPUT(SORTED(STEPPED(WordIndex(keyed(kind = TS.kindType.TextEntry and word in ['boy', 'sheep'])), doc, segment, wpos), doc, segment, wpos, assert)) : independent;
OUTPUT(SORTED(STEPPED(WordIndex(keyed(kind = TS.kindType.TextEntry and word in ['b%%%', 'sheep'])), doc, segment, wpos), doc, segment, wpos, assert)) : independent;

