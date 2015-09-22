"use strict";

// module Handsontable.Hooks

exports.addHookImpl = function(eventName, fn, self) {
  return function() {
    return self.addHook(eventName, function(e1, e2, e3, e4, e5, e6) {
      fn(e1)(e2)(e3)(e4)(e5)(e6)();
    });
  };
};
