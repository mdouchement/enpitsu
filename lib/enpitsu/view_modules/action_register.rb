module Enpitsu
  module ViewModules
    module ActionRegister
      def init_actions
        browse_btn.click { browse }
      end
    end
  end
end
