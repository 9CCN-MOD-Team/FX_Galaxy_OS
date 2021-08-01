 -- ThoughtDump v1.3.0
   -- Updated: 12/23/10
   -- *****************
   -- Created by Thought (http://hw2.tproc.org)
   -- Updated by Mikali (http://isometricland.net/homeworld/homeworld.php)
   
   -- DESCRIPTION
   -- ***********
   -- Parses the globals table and _ALERTs its contents to "HW2.log".
   -- Can also be used to parse (i.e., pretty-_ALERT) generic tables in some cases.
   
   -- Note: functions & variables must actually be declared in order to be parsed. 
   -- Otherwise, they are ignored.
   -- Note: if parsing a table other than the globals table, the _ALERTed table
   -- values may be in a different order than was originally written. Values with 
   -- numerical indices are moved to the "top" of the table, followed by values 
   -- with string indices, followed by tables. Functions appear in different 
   -- locations, depending on whether they are indexed using a number or a string.
   -- Note: despite the fact that nil values cannot be stored in tables, they are 
   -- still handled.
   -- Note: even though functions may be referenced within tables, a function will 
   -- only be parsed correctly if it is indexed using a string that is the same as
   -- the name of the function.
   
   function __TDParse(name, value, level, verbose)
       if ((name == "__TDParse") or (name == "__TDSortHash") or (name == "__TDMakeDump") or (name == "LW_RandomNumbers")) then
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
               Element = PreLevel .. name .. " = \"" .. value .. "\"" .. ComLevel
           else
               Element = PreLevel .. "[" .. name .. "] = \"" .. value .. "\"" .. ComLevel
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
           Element = Element .. "    -- " .. ValType .. ", tag: " .. tag(value)
       end
       _ALERT(Element)
       if (type(value) == "table") then
           _ALERT(PreLevel .. "{")
           __TDSortHash(__TDParse, value, level + 1, verbose)
           _ALERT(PreLevel .. "}" .. ComLevel)
       end
   end
   
   function __TDSortHash(func, tabl, a, b)
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
           typesarray[thistype][typescount[thistype]] = tostring(i)
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
   
   function __TDMakeDump()
       _ALERT("globals =")
       _ALERT("{")
       __TDSortHash(__TDParse, globals(), 1, 1)
       _ALERT("}\n")
   end
   
   __TDMakeDump()