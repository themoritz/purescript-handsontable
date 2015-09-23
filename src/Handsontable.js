"use strict";

// module Handsontable

exports.handsontableImpl = function(id, options) {
  return function() {
    return new Handsontable(document.getElementById(id), options);
  };
};

exports.handsontableNodeImpl = function(node, options) {
  return function() {
    return new Handsontable(node, options);
  };
};

//

function effize(method) {
  return function() {
    var me = arguments[arguments.length - 1],
      args = Array.prototype.slice.call(arguments, 0, -1);
    return function() {
      return me[method].apply(me, args);
    };
  };
}

exports.fromNothing = function() { return null; };
exports.fromJust    = function(x) { return x; };

//

exports.alterImpl = effize("alter");
exports.getData = effize("getData");
exports.updateSettingsImpl = effize("updateSettings");
