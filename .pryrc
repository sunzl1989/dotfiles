# vim: ft=ruby

PLUGINS = %w[
  pry-doc
  pry-git
  pry-stack_explorer
  pry-remote
  pry-byebug
  hirb
  coolline
  awesome_print
  readline
]

PLUGINS.each do |name|
  begin
    require name
  rescue LoadError
    puts "\e[31mFailed\e[0m loading '#{name}'"
    @load_error = true
  end
end

if @load_error
  puts "\e[2mInstall them with `gem` or add them in `bundler` (if needed)\e[0m"
end

##
# Edit this
#
Pry.editor = ENV['EDITOR'] || 'vim'

# Use awesome_print for output, but keep pry's pager. If Hirb is
# enabled, try printing with it first.
Pry.config.print = ->(output, value) do
  pretty = value.ai(indent: 2)
  Pry::Helpers::BaseHelpers.stagger_output("=> #{pretty}", output)
end if String.respond_to?(:ai)

# Friendlier prompt - line number, app name, nesting levels look like
# directory paths.
#
# Heavy use of lazy lambdas so configuration (like Pry.color) can be
# changed later or even during console usage.
#
# Custom color helpers using hints \001 and \002 so that good readline
# libraries (GNU, rb-readline) correctly ignore color codes when
# calculating line length.

red  = ->(text) { "\001\e[0;31m\002#{text}\001\e[0m\002" }
bold = ->(text) { "\001\e[1m\002#{text}\001\e[0m\002"    }

separator = -> { red.("\u00BB") }

line = ->(pry) { "[#{bold.(pry.input_array.size)}] " }
target_string = ->(object, level) do
  level = 0 if level < 0
  unless (string = Pry.view_clip(object)) == 'main'
    "(#{'../' * level}#{string})"
  else
    ''
  end
end

line = ->(pry) { "[#{bold.(pry.input_array.size)}] " }
target_string = ->(object, level) do
  level = 0 if level < 0
  unless (string = Pry.view_clip(object)) == 'main'
    "(#{'../' * level}#{string})"
  else
    ''
  end
end

Pry.config.prompt = [
  ->(object, level, pry) do      # Main prompt
    "#{line.(pry)}#{target_string.(object, level)} #{separator.()}  "
  end,
  ->(object, level, pry) do      # Wait prompt in multiline input
    spaces = ' ' * (
      "[#{pry.input_array.size}] ".size +  # Uncolored `line.(pry)`
      target_string.(object, level).size
    )
    "#{spaces} #{separator.()}  "
  end
]

##
# Make sure that $ pry ./ruby works
#
Pry.config.hooks.add_hook(:before_session, :start_interactively) do |o, t, _pry_|
  _pry_.print = Pry.config.print
end
