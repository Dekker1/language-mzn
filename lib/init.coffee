{CompositeDisposable} = require 'atom'

module.exports = AtomLanguageMZN =
  config:
    enableLinter:
      type: 'boolean'
      default: true
      description: "Enable linting using `mzn2fzn`"
    mzn2fznPath:
      type: 'string'
      default: 'mzn2fzn'
      description: 'Path to Minizinc\'s compiler `mzn2fzn`'

  activate: (state) ->
    console.log 'language-mzn: package loaded,
                ready to get initialized by AtomLinter.'

    if not atom.packages.getLoadedPackage 'linter'
      atom.notifications.addError 'Linter package not found',
      detail: '[language-mzn] `linter` package not found. \
      Please install https://github.com/AtomLinter/Linter'

    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.config.observe 'linter-mzn.mzn2fznPath', (mzn2fznPath) =>
      @mzn2fznPath = mzn2fznPath

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    AtomLanguageMZNViewState: @AtomLanguageMZNView.serialize()

  provideLinter: ->
    LinterMZN = require('./linter-mzn')
    @provider = new LinterMZN()
    return {
      name: 'MiniZinc',
      grammarScopes: ['source.mzn'],
      scope: 'file', # or 'project'
      lintOnFly: true,
      lint: @provider.lint
    }
