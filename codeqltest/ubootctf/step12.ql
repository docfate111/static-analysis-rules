// Question 1.2: Find the expressions that resulted in these macro invocations
import cpp

from Macro m
where m.getName().regexpMatch("ntoh.*")
select m.getAnInvocation().getExpr()