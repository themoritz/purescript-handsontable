"use strict";

// module Handsontable.Hooks

exports.addHookImpl = function(key, fn, self) {
  return function() {
    return self.addHook(key, function(e1, e2, e3, e4, e5, e6) {
      fn(e1)(e2)(e3)(e4)(e5)(e6)();
    });
  };
};

exports.onAfterChangeImpl = function(fn, self) {
  return function() {
    return self.addHook("afterChange", function(changes, source) {
      if (changes != null) {
        var changeObjs = changes.map(function(change) {
          return {
            row: change[0],
            col: change[1],
            value: change[3]
          };
        });
        fn(changeObjs)(source)();
      }
    });
  };
};
