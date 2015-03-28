require 'spec_helper'

module Enpitsu::MetadataModules
  describe Loader do
    subject { Class.new.extend(Loader) }

    describe '#init_metadata' do
      it 'totology' do
        expect(true).to eq true
      end
    end
  end
end