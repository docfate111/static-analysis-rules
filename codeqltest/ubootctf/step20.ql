/**
* @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph


class NtohsMacroInvocation extends Expr {
    NtohsMacroInvocation() { exists(Macro m | m.getName() = "ntohs" or m.getName() = "ntohll" or m.getName() = "ntohl" | this = m.getAnInvocation().getExpr()) }
  }

// class Config extends TaintTracking::Configuration {
//   Config() { this = "NetworkToMemFuncLength" }

//   override predicate isSource(DataFlow::Node source) {
//       // 2.1 Todo
//   }
//   override predicate isSink(DataFlow::Node sink) {
//      // 2.1Todo
//   }
// }

// from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
// where cfg.hasFlowPath(source, sink)
// select sink, source, sink, "ntoh flows to memcpy"