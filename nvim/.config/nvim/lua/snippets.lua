local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('cpp', {
  s('pre', {
    t {
      '#include <bits/stdc++.h>',
      'using namespace std;',
      'typedef long long ll;',
      'typedef vector<int> vi;',
      'typedef vector<ll> vll;',
      'typedef vector<string> vs;',
      'typedef pair<int, int> pii;',
      'typedef pair<ll, ll> pll;',
      'typedef vector<pii> vpii;',
      'typedef vector<pll> vpll;',
      '#define pb push_back',
      '#define loop(i, a, b) for (int i = a; i < b; i++)',
      '#define all(x) (x).begin(), (x).end()',
      '#define allr(x) (x).rbegin(), (x).rend()',
      '#define f first',
      '#define s second',
      'void fast() {',
      '  ios::sync_with_stdio(false);',
      '  cin.tie(NULL);',
      '}',
      'void solve();',
      'int main(void) {',
      '  fast();',
      '  int t;',
      '  cin >> t;',
      '  while (t--) {',
      '    solve();',
      '  }',
      '}',
      'void solve(){',
      '    // Agar pura solution bana hai tabhi code krna bhai',
      '    ',
    },
    i(1),
    t {
      '',
      '}',
    },
  }),
})
-- In your snippets file (e.g., lua/snippets.lua or via LuaSnip config)
ls.add_snippets('cpp', {
  ls.snippet('leet', {
    ls.text_node {
      '#include <bits/stdc++.h>',
      'using namespace std;',
      '',
      'typedef long long ll;',
      'typedef vector<int> vi;',
      'typedef vector<ll> vll;',
      'typedef vector<string> vs;',
      'typedef pair<int, int> pii;',
      'typedef pair<ll, ll> pll;',
      'typedef vector<pii> vpii;',
      'typedef vector<pll> vpll;',
      '#define pb push_back',
      '#define loop(i,a,b) for(int i = a; i < b; i++)',
      '#define all(x) (x).begin(), (x).end()',
      '#define allr(x) (x).rbegin(), (x).rend()',
      '#define f first',
      '#define s second',
      '',
    },
    ls.insert_node(0),
  }),
})
