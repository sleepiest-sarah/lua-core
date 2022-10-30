local tableUtils = require('Libs.LuaCore.Utils.TableUtils')

local lu = require('luaunit')

TestTableUtils = {}

function TestTableUtils:testLength()
  local res = tableUtils.length({'a', 'b', 'c'})
  
  lu.assertEquals(res, 3)
  
  res = tableUtils.length({a = 'a', b = 'b', c = 'c'})
  
  lu.assertEquals(res, 3)
  
  res = tableUtils.length({})
  
  lu.assertEquals(res, 0)
end

function TestTableUtils:testAddTables()
  local res = tableUtils.addTables({a = 5, b = 10}, {a = 10, b = 20, c = 1})
  
  lu.assertEquals(res, {a = 15, b = 30, c = 1})
end

function TestTableUtils:testPrintTableList()
  tableUtils.printTable({{"bear", {a = "b", b = "a"}}, {"chair"}})
end

function TestTableUtils:testAddKeysLeft()
  local a = {a = 5, b = 10}
  local res = tableUtils.addKeysLeft(a, {a = 0, b = 0, c = 1})
  
  lu.assertIs(a, res)
  lu.assertEquals(res.a, 5)
  lu.assertEquals(res.c, 1)
  
  a = {a = 5, b = 10}
  res = tableUtils.addKeysLeft(a, {a = 0, b = 0, c = {d = 15, e = 10, f = {}}})
  
  lu.assertIs(a, res)
  lu.assertEquals(res.a, 5)
  lu.assertIsTable(res.c)
  lu.assertEquals(res.c.d, 15)
  lu.assertIsTable(res.c.f)
end
  
lu.LuaUnit.verbosity = lu.VERBOSITY_VERBOSE
lu.LuaUnit.run('TestTableUtils')