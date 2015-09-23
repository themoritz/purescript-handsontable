"use strict";

// module Handsontable.Options

exports.autoColumnSizeTrue = function() {
  return true;
};
exports.autoColumnSizeFalse = function() {
  return false;
};
exports.autoColumnSizeAbsolute = function(x) {
  return function() {
    return {syncLimit: x};
  };
};
exports.autoColumnSizePercentage = function(p) {
  return function() {
    return {syncLimit: p.toString()+"%"};
  };
};
