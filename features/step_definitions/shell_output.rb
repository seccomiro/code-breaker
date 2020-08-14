# frozen_string_literal: true

class ShellOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def shell_output
  @shell_output ||= ShellOutput.new
end
