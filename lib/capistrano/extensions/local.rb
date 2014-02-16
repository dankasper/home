module SSHKit
  module DSL
    alias_method :on_remote, :on
    def on hosts, options = {}, &block
      if ENV['LOCAL_ONLY']
	run_locally &block
      else
        on_remote hosts, options, &block
      end
    end
  end
end
