-------------------------------------------------------------
-------------Debug.lua-----------2016年02月27日--------------
--由 9CCNMOD组 破天者-孤狼 编写
--这个文件包含用于FX MOD中为了方便调试而设置的一些变量和函数
--各脚本都可以通过在文件开头加入 dofilepath("data:scripts/debug.lua")来引用该文件
--而后即可通过判断FX_debug的值来判断当前是否为调试模式,从而确定是否执行一些诸如合法性检验的代码
--同时也可以通过dout(sString)函数来输出调试信息，通过derr(sString)函数来输出错误信息
-------------------------------------------------------------
-------------------------------------------------------------

--debug模式等级设置，0表示不输出任何dout和derr，1表示会输出所有derr但不输出dout，2表示会输出所有dout和derr
--在正式发布的版本中建议设置为1
FX_debug = 1
-------------------------------------------------------------

if (FX_debug) then
	if (FX_debug>1) then
		dout = function(sString)
			_ALERT("FX Debug Information: "..sString)
		end
	else
		dout = function(sString)
		end
	end
	if (FX_debug>0) then
		derr=function(sString)
			_ALERT("!FX MOD Error!: "..sString)
		end
	else
		derr=function(sString)
		end
	end
else
	dout=function(sString)
	end
	derr=function(sString)
	end
end