dofilepath("locale:scripts/LW_getcharwidth.lua")

function LW_SplitStrToLines_TrimCRLF(text)
	while strsub(text, -1) == "\r" or strsub(text, -1) == "\n" do
		text = strsub(text, 1, -2) -- remove the "\r" & "\n" at line ending
	end
	if strlen(text) == 0 then
		text = " " -- zero length textbox will not be shown, so make sure it has at least 1 char
	end
	return text
end

function LW_SplitStrToLines_InsertLine(tbl, text, length)
	cur_line = strsub(text, 1, length)
	text = strsub(text, length + 1)
	cur_line = LW_SplitStrToLines_TrimCRLF(cur_line)
	cur_line, text = LW_SplitStrToLines_ProcessPunctuation(cur_line, text)
	tinsert(tbl, cur_line)
	return text -- return remaining text
end

function LW_SplitStrToLines_IsBeginWithOneOf(text, char_tbl)
	-- return the matched char length
	for i, v in char_tbl do
		if strsub(text, 1, strlen(v)) == v then
			return strlen(v)
		end
	end
	return 0
end

function LW_SplitStrToLines_IsEndWithOneOf(text, char_tbl)
	-- return the matched char length
	for i, v in char_tbl do
		if strsub(text, -strlen(v)) == v then
			return strlen(v)
		end
	end
	return 0
end

function LW_SplitStrToLines_ProcessPunctuation(cur_line, next_line)
	local not_at_beginning, not_at_end, not_split = LW_GetPunctuationRules()
	
	local has_not_at_beginning_char = LW_SplitStrToLines_IsBeginWithOneOf(next_line, not_at_beginning)
	while has_not_at_beginning_char ~= 0 do
		cur_line = cur_line..strsub(next_line, 1, has_not_at_beginning_char)
		next_line = strsub(next_line, has_not_at_beginning_char + 1)
		has_not_at_beginning_char = LW_SplitStrToLines_IsBeginWithOneOf(next_line, not_at_beginning)
	end
	local has_not_at_end_char = LW_SplitStrToLines_IsEndWithOneOf(cur_line, not_at_end)
	while has_not_at_end_char ~= 0 do
		next_line = strsub(cur_line, -has_not_at_end_char)..next_line
		cur_line = strsub(cur_line, 1, -has_not_at_end_char - 1)
		has_not_at_end_char = LW_SplitStrToLines_IsEndWithOneOf(cur_line, not_at_end)
	end 
	local has_not_split_char = LW_SplitStrToLines_IsEndWithOneOf(cur_line, not_split)
	if has_not_split_char ~= 0 and strsub(cur_line, -has_not_split_char) == strsub(next_line, 1, has_not_split_char) then
		cur_line = cur_line..strsub(cur_line, -has_not_split_char)
		next_line = strsub(next_line, has_not_split_char + 1)
	end
	return cur_line, next_line
end

function LW_SplitStrToLines(text, width_per_line)
	local CharWidth = LW_GetCharWidthTable()

	local result = {}
	local i_current = 1
	local i_wordbound = 1
	local current_width = 0
	while i_current <= strlen(text) do
		current_char = strsub(text, i_current, i_current)
		if current_char == "\n" then
			text = LW_SplitStrToLines_InsertLine(result, text, i_current)
			i_current = 1
			i_wordbound = 1
			current_width = 0
		else
			new_char_width = CharWidth[current_char]
			local is_multibyte = nil
			if new_char_width == nil then
				-- maybe it is a multi byte char
				new_char_width = CharWidth[strsub(text, i_current, i_current + 1)]
				if new_char_width ~= nil then
					-- it is a 2 bytes char
					is_multibyte = 1
					i_current = i_current + 1
				else
					-- cannot find the width of this char. assume it is 1
					new_char_width = 1
				end
			end
			if is_multibyte or current_char==" " or current_char=="\t" or current_char=="-" then
				i_wordbound = i_current -- word boundary chars
			end
			
			if current_width + new_char_width < width_per_line-0.01 then
				current_width = current_width + new_char_width
				i_current = i_current + 1
			else
				-- if there are '\r' and '\n' after i_wordbound, we also include them in this line
				-- to avoid double new lines
				while(strsub(text, i_wordbound + 1, i_wordbound + 1) == "\r" or
					strsub(text, i_wordbound + 1, i_wordbound + 1) == "\n") do
					i_wordbound = i_wordbound + 1
				end
				text = LW_SplitStrToLines_InsertLine(result, text, i_wordbound)
				i_current = 1
				i_wordbound = 1
				current_width = 0
			end
		end
	end
	-- and here is the last line
	text = LW_SplitStrToLines_InsertLine(result, text, strlen(text))
	tinsert(result, text)
	return result
end