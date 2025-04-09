local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

-- Dynamic closing tag
local function closing_tag(args)
	return sn(nil, {
		t("</"),
		f(function(inner_args)
			return inner_args[1][1] -- mirror tag name
		end, args),
		t(">"),
	})
end

return {
	-- Trigger: tag
	s("tag", {
		t("<"),
		i(1, "div"), -- Opening tag name
		t(">"),
		i(2, "content"), -- Tag content
		d(3, closing_tag, { 1 }), -- Closing tag synced with opening
	}),
}
