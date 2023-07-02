module.exports = {
	root: true,

	parserOptions: {
		parser: require.resolve('@typescript-eslint/parser'),
		extraFileExtensions: ['.vue'],
	},

	env: {
		browser: true,
		es2021: true,
		node: true,
		'vue/setup-compiler-macros': true,
	},

	extends: [
		'plugin:@typescript-eslint/recommended',
		'plugin:vue/vue3-essential',
		'prettier',
	],

	plugins: [
		'@typescript-eslint',
		'vue',
	],

  rules: {
		'prefer-promise-reject-errors': 'off',

    quotes: ['warn', 'single', { avoidEscape: true }],

    '@typescript-eslint/explicit-function-return-type': 'off',

		'@typescript-eslint/no-var-requires': 'off',

		'no-unused-vars': 'off',

		'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',

		'vue/multi-word-component-names': 0,
	},
};

/*
module.exports = {
  env: {
    browser: true,
    es2021: true
  },
  extends: [
    'plugin:vue/vue3-essential',
    'standard-with-typescript'
  ],
  overrides: [
  ],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  plugins: [
    'vue'
  ],
  rules: {
  }
}
*/
