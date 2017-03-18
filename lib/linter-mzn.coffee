{BufferedProcess} = require 'atom'

class LinterMZN
  lintProcess: null

  config: (key) ->
    atom.config.get "language-mzn.#{key}"

  lint: (textEditor) =>
    if @config 'enableLinter'
      return new Promise (resolve, reject) =>
        output = ''
        command = @config 'mzn2fznPath'
        args = ['--instance-check-only', textEditor.getPath()]
        options = process.env

        stdout = (data) ->
          atom.notifications.addWarning data
        stderr = (data) ->
          output += data
        exit = (code) =>
          if code is 0
            resolve []
          else
            messages = @parse output, textEditor.getPath()
            resolve messages

        @lintProcess = new BufferedProcess({command, args, options, stdout, stderr, exit})
        @lintProcess.onWillThrowError ({error, handle}) ->
          atom.notifications.addError "Failed to run #{command}",
            detail: "#{error.message}"
            dismissable: true
          handle()
          resolve []
    else
      return []

  parse: (output, filePath) =>
    messages = []
    output = output.split('\n')
    warningLines = (i for line, i in output when /:([0-9]+):/.test(line) && ! /(did you forget to specify a data file\?)/.test(output[i+1]))

    i = 0
    while i < warningLines.length
      if i >= warningLines.length - 1
        messages.push @generateMessage output[warningLines[i]..], filePath
      else
        messages.push @generateMessage output[warningLines[i]..warningLines[i+1]-1], filePath
      i++

    return messages

  generateMessage: (output, filePath) ->
    match = output[0].match(/:([0-9]+):/)
    line = parseInt(match[1])

    startcol = 0
    endcol = 500;
    if output.length > 2 and /\^/.test(output[2])
      startcol = output[2].match(/\^/).index
      endcol = output[2].match(/\^(\s|$)/).index + 1

    message = {
      severity: 'error',
      excerpt: output[1..].join('\n').replace(/MiniZinc: /, ""),
      location:{
        file: filePath,
        position: [[line-1,startcol], [line-1,endcol]],
      }
    }

    return message


module.exports = LinterMZN
