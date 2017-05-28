RSpec.describe 'Context' do
  let(:context_hash) { {
      "topic" => "Self",
      "scratch" => [
        "Absolute", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""
      ],
      "elements" => [
        { "name"=>"Identity", "sub_elements" => ["Drive", "", "", ""] },
        { "name"=>"Consciousness", "sub_elements"=>["Perception", "Growth", "", ""] },
        { "name"=>"Personality", "sub_elements"=>["Truth", "", "", ""] },
        { "name"=>"", "sub_elements"=>["", "", "", ""] }
      ]
    }.with_indifferent_access
  }

  describe '#collect_into_scratch' do
    it 'adds elements' do
      context = Entities::Context.from_hash(context_hash)
      context.collect_into_scratch
      expect(context.scratch.sub_elements.collect(&:name)).to eq([ "Absolute", "Identity", "Consciousness", "Personality", "Drive", "Perception", "Growth", "Truth", ""])
    end
  end

  describe '#pass_in' do
    it 'replaces elements with ones passed in' do
      context = Entities::Context.from_hash(context_hash)
      context.pass_in(['hi', 'mom'])
      expect(context.elements.elements.collect(&:name)).to eq(['hi', 'mom', "", ""])
    end
  end
end