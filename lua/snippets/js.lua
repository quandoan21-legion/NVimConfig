local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local f = require("luasnip.extras").f

return {
	-- 🔹 Component Class (oclass)
	s(
		"oclass",
		fmt(
			[[
    /** @odoo-module **/
    import {{ Component, useState }} from "@odoo/owl";

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
				i(3, "count: 0"),
				i(4, "increment"),
				i(5, "this.state.count++;"),
			}
		)
	),

	-- 🔹 OWL Component with Props (oprops)
	s(
		"oprops",
		fmt(
			[[
    /** @odoo-module **/
    import {{ Component }} from "@odoo/owl";

    export class {} extends Component {{
      static template = "{}.{}";
      static props = {{
        {}: {{ type: {}, optional: {} }}
      }};
    }}
  ]],
			{
				i(1, "MyComponent"),
				i(2, "my_module"),
				rep(1),
				i(3, "myProp"),
				i(4, "String"),
				i(5, "false"),
			}
		)
	),

	-- 🔹 OWL Service Class (oservice)
	s(
		"oservice",
		fmt(
			[[
    /** @odoo-module **/
    import {{ registry }} from "@web/core/registry";

    export const {}Service = {{
      start() {{
        return {{
          {}: () => {{
            {}
          }}
        }};
      }}
    }};

    registry.category("services").add("{}", {}Service);
  ]],
			{
				i(1, "my"),
				i(2, "doSomething"),
				i(3, "console.log('doing something');"),
				rep(1),
				rep(1),
			}
		)
	),

	-- 🔹 useRef (ouse)
	s(
		"ouse",
		fmt('this.{} = useRef("{}");', {
			i(1, "myRef"),
			i(2, "element"),
		})
	),

	-- 🔹 Event handler method (oevent)
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

	-- 🔹 Template registration (otemplate)
	s(
		"otemplate",
		fmt(
			[[
    <?xml version="1.0" encoding="UTF-8"?>
    <templates xml:space="preserve">
      <t t-name="{}">
        {}
      </t>
    </templates>
  ]],
			{
				i(1, "my_module.MyComponent"),
				i(0, "<!-- content -->"),
			}
		)
	),
}
