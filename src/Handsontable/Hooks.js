"use strict";

// module Handsontable.Hooks

exports.addHookImpl = function(key, fn, self) {
  return function() {
    return self.addHook(key, function(e1, e2, e3, e4, e5, e6) {
      fn(e1)(e2)(e3)(e4)(e5)(e6)();
    });
  };
};
