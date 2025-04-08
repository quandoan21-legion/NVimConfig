local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	-- 1. Class with export and extends
	s(
		"class",
		fmt(
			[[
    export class {} extends Component {{
      {}
    }}
  ]],
			{
				i(1, "MyClass"),
				i(0),
			}
		)
	),

	-- 2. Arrow function
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
				i(2),
				i(0),
			}
		)
	),

	-- 3. Console.log
	s("log", fmt([[console.log({});]], { i(0) })),

	-- 4. For loop
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
				i(0),
			}
		)
	),

	-- 5. Import statement
	s(
		"imp",
		fmt([[import {} from '{}';]], {
			i(1, "something"),
			i(2, "module"),
		})
	),

	-- 6. useState (React-style)
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

	-- 7. try-catch
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
				i(1),
				i(2, "err"),
				rep(2),
			}
		)
	),
}
