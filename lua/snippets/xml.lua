local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
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
	-- OWL Basic Template
	s(
		"owltemplate",
		fmt(
			[[
    <templates xml:space="preserve">
        <t t-name="{}.{}">
            {}
        </t>
    </templates>
  ]],
			{
				i(1, "my_module"),
				i(2, "MyComponent"),
				i(3, "<p>Hello World</p>"),
			}
		)
	),

	-- OWL Button with event
	s(
		"owlbutton",
		fmt(
			[[
    <button class="btn btn-primary" t-on-click="{}">{}</button>
  ]],
			{
				i(1, "onClick"),
				i(2, "Click me"),
			}
		)
	),

	-- OWL t-if
	s(
		"owlif",
		fmt(
			[[
    <t t-if="{}">
        {}
    </t>
  ]],
			{
				i(1, "condition"),
				i(2, "<p>Shown if true</p>"),
			}
		)
	),

	-- OWL t-foreach
	s(
		"owlforeach",
		fmt(
			[[
    <t t-foreach="{}.{}" t-as="{}">
        <t t-key="{}">
            {}
        </t>
    </t>
  ]],
			{
				i(1, "props"),
				i(2, "items"),
				i(3, "item"),
				i(4, "item.id"),
				i(5, '<p><t t-esc="item.name"/></p>'),
			}
		)
	),
	-- OWL t-esc
	s(
		"owltesc",
		fmt(
			[[
    <t t-esc="{}">
    </t>
  ]],
			{
				i(1, "expression"),
			}
		)
	),
}
