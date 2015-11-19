LanguageMznView = require './language-mzn-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageMzn =
  languageMznView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageMznView = new LanguageMznView(state.languageMznViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageMznView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-mzn:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageMznView.destroy()

  serialize: ->
    languageMznViewState: @languageMznView.serialize()

  toggle: ->
    console.log 'LanguageMzn was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
