local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

ls.add_snippets("cs", {
	s("nclass", {
		t("namespace "),
		i(1, "Namespace"),
		t({ "", "", "" }),
		i(2, "public"),
		t({ " class " }),
		i(3, "ClassName"),
		t({ "", "{", "\t" }),
		i(0),
		t({ "", "}", "" }),
	}),
	s("ninterface", {
		t("namespace "),
		i(1, "Namespace"),
		t({ "", "", "" }),
		i(2, "public"),
		t({ " interface " }),
		i(3, "InterfaceName"),
		t({ "", "{", "\t" }),
		i(0),
		t({ "", "}", "" }),
	}),
	s("prop", {
		t("public "),
		i(1, "string"),
		t(" "),
		i(2, "Name"),
		t(" { get; set; }"),
	}),
})
