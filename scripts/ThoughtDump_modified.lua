 -- ThoughtDump v1.3.0
   -- Updated: 12/23/10
   -- *****************
   -- Created by Thought (http://hw2.tproc.org)
   -- Updated by Mikali (http://isometricland.net/homeworld/homeworld.php)
   
   -- DESCRIPTION
   -- ***********
   -- Parses the globals table and prints its contents to "HW2.log".
   -- Can also be used to parse (i.e., pretty-print) generic tables in some cases.
   
   -- Note: functions & variables must actually be declared in order to be parsed. 
   -- Otherwise, they are ignored.
   -- Note: if parsing a table other than the globals table, the printed table
   -- values may be in a different order than was originally written. Values with 
   -- numerical indices are moved to the "top" of the table, followed by values 
   -- with string indices, followed by tables. Functions appear in different 
   -- locations, depending on whether they are indexed using a number or a string.
   -- Note: despite the fact that nil values cannot be stored in tables, they are 
   -- still handled.
   -- Note: even though functions may be referenced within tables, a function will 
   -- only be parsed correctly if it is indexed using a string that is the same as
   -- the name of the function.
--由9CCN MOD组破天者-孤狼进行修改，以用于RPG模式存档使用。 
   function __TDParse_MOD(name, value, level, verbose)
       if ((name == "__TDParse_MOD") or (name == "__TDSortHash_MOD") or (name == "__TDMakeDump")) then
           return
       end
       local Element = nil
       local ValType = type(value)
       local NamType = type(name)
       local PreLevel = ""
       for i = 1, level do
           PreLevel = PreLevel .. "    "
       end
       local ComLevel = ""
       if (level ~= 0) then
           ComLevel = ","
       end
       if ((ValType == "function") or (ValType == "userdata")) then
           if (NamType == "string") then
               Element = PreLevel .. name .. " = " .. name .. ComLevel
           else
               Element = PreLevel .. "[" .. name .. "] = " .. name .. ComLevel
           end
       elseif (ValType == "string") then
           if (NamType == "string") then
               Element = PreLevel .. name .. " = " .. gsub(format("%q", value),"\n","n") .. ComLevel
           else
               Element = PreLevel .. "[" .. name .. "] = " .. gsub(format("%q", value),"\n","n") .. ComLevel
           end
       elseif (ValType == "number") then
           if (NamType == "string") then
               Element = PreLevel .. name .. " = " .. value .. ComLevel
           else
               Element = PreLevel .. "[" .. name .. "] = " .. value .. ComLevel
           end
       elseif (ValType == "table") then
           if (NamType == "string") then
               Element = PreLevel .. name .. " ="
           else
               Element = PreLevel .. "[" .. name .. "] ="
           end
       elseif (ValType == "nil") then
           if (NamType == "string") then
               Element = PreLevel .. name .. " = nil" .. ComLevel
           else
               Element = PreLevel .. "[" .. name .. "] = nil" .. ComLevel
           end
       else
           Element = PreLevel .. "-- unknown object type " .. ValType .. " for object " .. name
       end
       if (verbose == 1) then
           Element = Element -- .. "    -- " .. ValType .. ", tag: " .. tag(value)
       end
       __DumpContent = __DumpContent .. (Element) .. "\n"
       if (type(value) == "table") then
           __DumpContent = __DumpContent .. (PreLevel .. "{") .. "\n"
           __TDSortHash_MOD(__TDParse_MOD, value, level + 1, verbose)
           __DumpContent = __DumpContent .. (PreLevel .. "}" .. ComLevel) .. "\n"
       end
   end
   
   function __TDSortHash_MOD(func, tabl, a, b)
       local typesarray = {}
       local typescount = {}
       local keycount = 1
       local keyarray = {}
       for i, iCount in tabl do
           local thistype = type(iCount)
           if not (typesarray[thistype]) then
               typescount[thistype] = 0
               typesarray[thistype] = {}
           end
           typescount[thistype] = typescount[thistype] + 1
           typesarray[thistype][typescount[thistype]] = i
       end
       sort(typesarray)
       for i, iCount in typesarray do
           sort(iCount)
           for j, jCount in iCount do
               keyarray[keycount] = tostring(jCount)
               keycount = keycount + 1
           end
       end
       for i, iCount in keyarray do
           if (tonumber(iCount)) then
               iCount = tonumber(iCount)
               func(iCount, tabl[iCount], a, b)
           else
               func(iCount, tabl[iCount], a, b)
           end
       end
   end
   
   function GetTableDump(tablename)
   	--返回值：Dump内容的字符串
   	__DumpContent=""
   	__TDSortHash_MOD(__TDParse_MOD, tablename, 1, 1)
   	return __DumpContent
   end