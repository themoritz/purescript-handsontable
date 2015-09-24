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

//

exports.alterImpl = effize("alter");
exports.clear = effize("clear");
exports.colOffset = effize("colOffset");
exports.colToPropImpl = effize("colToProp");
exports.countCols = effize("countCols");
exports.countEmptyColsImpl = effize("countEmptyCols");
exports.countEmptyRowsImpl = effize("countEmptyRows");
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
exports.getCellMetaImpl = effize("getCellMeta");
exports.getCellRenderer = effize("getCellRenderer");
exports.getCellValidator = effize("getCellValidator");
exports.getColHeaderImpl = effize("getColHeader");
exports.getColWidthImpl = effize("getColWidth");
exports.getCopyableDataImpl = effize("getCopyableData");
exports.getDataAllImpl = effize("getData");
exports.getDataSubImpl = effize("getData");
exports.getDataAtCellImpl = effize("getDataAtCell");
exports.getDataAtColImpl = effize("getDataAtCol");
exports.getDataAtPropImpl = effize("getDataAtProp");
exports.getDataAtRowImpl = effize("getDataAtRow");
exports.getDataAtRowProp = effize("getDataAtRowProp");
exports.getPlugin = effize("getPlugin");
exports.getRowHeaderImpl = effize("getRowHeader");
exports.getRowHeightImpl = effize("getRowHeight");
exports.getSchema = effize("getSchema");
exports.getSelectedImpl = effize("getSelected");
exports.getSelectedRangeImpl = effize("getSelectedRange");
exports.getSettings = effize("getSettings");
exports.getSourceDataAtColImpl = effize("getSourceDataAtCol");
exports.getSourceDataAtRowImpl = effize("getSourceDataAtRow");
exports.getValueImpl = effize("getValue");
exports.hasColHeaders = effize("hasColHeaders");
exports.hasRowHeaders = effize("hasRowHeaders");
exports.isEmptyColImpl = effize("isEmptyCol");
exports.isEmptyRowImpl = effize("isEmptyRow");
exports.isListening = effize("isListening");
exports.listen = effize("listen");
exports.loadDataImpl = effize("loadData");
exports.populateFromArrayImpl = effize("populateFromArray");
exports.propToColImpl = effize("propToCol");
exports.removeCellMetaImpl = effize("removeCellMeta");
exports.removeHookImpl = effize("removeHook");
exports.render = effize("render");
exports.rowOffset = effize("rowOffset");
exports.runHooksImpl = effize("runHooks");
exports.selectCellImpl = effize("selectCell");
exports.selectCellByPropImpl = effize("selectCellByProp");
exports.setCellMetaImpl = effize("setCellMeta");
exports.setCellMetaObjectImpl = effize("setCellMetaObject");
exports.setDataAtCellImpl = effize("setDataAtCell");
exports.setDataAtRowPropImpl = effize("setDataAtRowProp");
exports.spliceColImpl = effize("spliceCol");
exports.spliceRowImpl = effize("spliceRow");
exports.translateColIndexImpl = effize("translateColIndex");
exports.translateRowIndexImpl = effize("translateRowIndex");
exports.unlisten = effize("unlisten");
exports.updateSettingsImpl = effize("updateSettings");

exports.validateCellsImpl = function(callback, self) {
  return function() {
    return self.validateCells(function(res) {
      return callback(res)();
    });
  };
};
