local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = require("luasnip.extras").f
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {

	-- ========================================
	-- 🚀 General JavaScript/React Snippets
	-- ========================================

	s(
		"af",
		fmt(
			[[
    const {} = ({}) => {{
      {}
    }};
  ]],
			{
				i(1, "myFunction"),
				i(2, "args"),
				i(0, "// body"),
			}
		)
	),

	s(
		"log",
		fmt([[console.log({});]], {
			i(0, "value"),
		})
	),

	s(
		"for",
		fmt(
			[[
    for (let {} = 0; {} < {}; {}++) {{
      {}
    }}
  ]],
			{
				i(1, "i"),
				rep(1),
				i(2, "arr.length"),
				rep(1),
				i(0, "// body"),
			}
		)
	),

	s(
		"imp",
		fmt([[import {} from '{}';]], {
			i(1, "name"),
			i(2, "module"),
		})
	),

	s(
		"us",
		fmt(
			[[
    const [{}{}, set{}{}] = useState({});
  ]],
			{
				i(1, "count"),
				t(""),
				f(function(args)
					local var = args[1][1] or ""
					return var:gsub("^%l", string.upper)
				end, { 1 }),
				t(""),
				i(2, "0"),
			}
		)
	),

	s(
		"try",
		fmt(
			[[
    try {{
      {}
    }} catch ({}) {{
      console.error({});
    }}
  ]],
			{
				i(1, "// try body"),
				i(2, "err"),
				rep(2),
			}
		)
	),

	-- ========================================
	-- 🦉 Odoo OWL Snippets (prefix: 'o')
	-- ========================================

	s(
		"oclass",
		fmt(
			[[
    export class {} extends Component {{
      static template = "{}.{}";

      setup() {{
        this.state = useState({{
          {}
        }});
      }}

      {}() {{
        {}
      }}
    }}
  ]],
			{
				i(1, "MyComponent"),
				i(2, "my_module"),
				rep(1),
				i(3, "value: 0"),
				i(4, "increment"),
				i(5, "this.state.value++;"),
			}
		)
	),

	s(
		"oservice",
		fmt(
			[[
    export class {} extends owl.Component {{
      setup() {{
        super.setup();
      }}

      {}
    }}
  ]],
			{
				i(1, "MyService"),
				i(2, "// your methods here"),
			}
		)
	),

	s(
		"oref",
		fmt([[this.{} = useRef("{}");]], {
			i(1, "myRef"),
			i(2, "element"),
		})
	),

	s(
		"oevent",
		fmt(
			[[
    {}(ev) {{
      {}
    }}
  ]],
			{
				i(1, "onClick"),
				i(2, "console.log(ev);"),
			}
		)
	),
}
