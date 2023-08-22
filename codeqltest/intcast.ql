import cpp

from FunctionCall fc // Select all Function Calls
where fc.getExpectedReturnType().getUnderlyingType().toString() = "unsigned int"
and fc.getImplicitlyConverted().getActualType().toString() = "int"  
select fc.getLocation(),  fc.getImplicitlyConverted().getActualType(), fc.getExpectedReturnType().getUnderlyingType()
