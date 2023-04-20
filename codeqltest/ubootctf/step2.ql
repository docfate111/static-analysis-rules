/**
* @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class VulnExpr extends Expr {
  VulnExpr() {
    exists(Macro m | m.getName().regexpMatch("ntoh.*"))
  }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
      source.asExpr() instanceof VulnExpr
  }
  override predicate isSink(DataFlow::Node sink) {
     exists(FunctionCall f | 
    f.getTarget().getName() = "memcpy" and sink.asExpr() = f.getArgument(2))
    // if marco expr is put into 3rd arg for a function
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "ntoh flows to memcpy"