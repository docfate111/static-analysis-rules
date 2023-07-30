import cpp

from FunctionCall fc // Select all Function Calls
where fc.getTarget().getName() = "malloc"
and fc.getArgument(0).getValue() = "16"
select fc, fc.getLocation(), fc.getActualType().(PointerType).getBaseType().(Struct).toString()
