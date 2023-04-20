// Question 1.0: Find all the calls to memcpy.
import cpp

from FunctionCall f
where f.getTarget().getName() = "memcpy"
select f