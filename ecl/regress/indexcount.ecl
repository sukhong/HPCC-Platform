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

#option ('optimizeIndexSource',true);

mainRecord :=
        RECORD
string20            forename;
string20            surname;
integer8            sequence;
unsigned8           filepos{virtual(fileposition)};
        END;

mainTable := dataset('~keyed.d00',mainRecord,THOR);

nameKey := INDEX(mainTable, { mainTable }, 'name.idx');

output(count(nameKey) > 99);

output(count(choosen(nameKey, 100)) > 99);

output(max(choosen(nameKey, 101), surname));
output(table(choosen(nameKey(forename != ''), 102), { count(group) }));
output(table(choosen(nameKey(forename != ''), 103), { max(group, forename) }));
