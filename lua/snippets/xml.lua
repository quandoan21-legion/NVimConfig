local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
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
}
