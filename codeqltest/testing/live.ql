/** @kind path-problem */
import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class StringCopyCall extends FunctionCall {
	StringCopyCall() {
		this.getTarget().getName().regexpMatch(".*strl(cpy|cat)")
	}

	Expr getSizeArgument() {
		this.getArgument(2) = result
	}
}

class Config extends TaintTracking::Configuration {
	Config() { this = "doesn't matter" }

	// source is the return value
	override predicate isSource(DataFlow::Node source) {
		source.asExpr() instanceof StringCopyCall
	}

	override predicate isSink(DataFlow::Node sink) {
		sink.asExpr() = any(StringCopyCall c).getSizeArgument()
	}
}
// crosses function boundaries
from DataFlow::PathNode source, DataFlow::PathNode sink, Config config
where config.hasFlowPath(source, sink)
select sink, source, sink, "Return value of string copying call reached 3rd argument"

