local stringUtils = require('Libs.LuaCore.Utils.StringUtils')

local lu = require('luaunit')

TestStringUtils = {}

function TestStringUtils:testCapitalizeString()
  local result = stringUtils.capitalizeString("bear in a chair.")
  
  lu.assertIsString(result)
  lu.assertEquals(result, "Bear in a chair.")
  
  result = stringUtils.capitalizeString("BEAR")
  
  lu.assertEquals(result, "BEAR")
  
  result = stringUtils.capitalizeString("8ear")
  lu.assertIsString(result)
  lu.assertEquals(result, "8ear")
end

function TestStringUtils:testGenerateUUID()
  local uuid1 = stringUtils.generateUUID()
  local uuid2 = stringUtils.generateUUID()
  
  lu.assertNotEquals(uuid1, uuid2)
  lu.assertIsString(uuid1)
  lu.assertEquals(#uuid1, 36)
end

function TestStringUtils:testSplit()
  local a,b = stringUtils.split("bear.chair", ".")
  
  lu.assertEquals(a, "bear")
  lu.assertEquals(b, "chair")
  
  local a,b,c = stringUtils.split("-bear-chair", "-")
  
  lu.assertEquals(a, "")
  lu.assertEquals(b, "bear")
  lu.assertEquals(c, "chair")
  
  a,b = stringUtils.split(".", ".")
  
  lu.assertEquals(a, "")
  lu.assertEquals(b, "")
  
  a,b,c = stringUtils.split("bear.chair.", ".")
  
  lu.assertEquals(a, "bear")
  lu.assertEquals(b, "chair")  
  lu.assertEquals(c, "")
end

lu.LuaUnit.verbosity = lu.VERBOSITY_VERBOSE
lu.LuaUnit.run('TestStringUtils')