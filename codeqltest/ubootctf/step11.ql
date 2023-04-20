// Question 1.1: Find all the calls to ntohl, ntohll, and ntohs.
import cpp

/*from MacroAccess f
where f.getMacroName().regexpMatch("ntoh.*")
select f*/

import cpp

from Macro m
where m.getName().regexpMatch("ntoh.*")
select m.getAnInvocation().getExpr()