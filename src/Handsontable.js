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
exports.isNull      = function (val) { return val === null; };

//

exports.alterImpl = effize("alter");
exports.clear = effize("clear");
exports.colOffset = effize("colOffset");
exports.colToProp = effize("colToProp");
exports.countCols = effize("countCols");
exports.countEmptyCols = effize("countEmptyCols");
exports.countEmptyRows = effize("countEmptyRows");
exports.countRenderedCols = effize("countRenderedCols");
exports.countRenderedRows = effize("countRenderedRows");
exports.countRows = effize("countRows");
exports.countVisibleCols = effize("countVisibleCols");
exports.countVisibleRows = effize("countVisibleRows");
exports.deselectCell = effize("deselectCell");
exports.destroy = effize("destroy");
exports.destroyEditor = effize("destroyEditor");
exports.getActiveEditor = effize("getActiveEditor");
exports.getCellImpl = effize("getCell");
exports.getCellEditor = effize("getCellEditor");
exports.getCellMeta = effize("getCellMeta");
exports.getCellRenderer = effize("getCellRenderer");
exports.getCellValidator = effize("getCellValidator");


exports.getData = effize("getData");
exports.updateSettingsImpl = effize("updateSettings");
