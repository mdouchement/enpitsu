module GLib
  module_function

  def exit_application(exception, status)
    fail exception if exception.is_a?(SystemExit)
    original_exit_application(exception, status)
  end

  # Original from ruby-gnome gem
  def original_exit_application(exception, status)
    msg = exception.message || exception.to_s
    msg = exception.class.to_s if msg == ''
    backtrace = exception.backtrace
    STDERR.puts "#{backtrace.shift}: #{msg}"
    backtrace.each do |v|
      STDERR.puts "\t from #{v}"
    end
    exit(status)
  end
end
