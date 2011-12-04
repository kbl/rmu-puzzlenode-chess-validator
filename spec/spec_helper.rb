require 'rspec'
require 'stringio'
require 'chess/chessman/pawn'
require 'chess/chessman/knight'
require 'chess/chessman/rook'
require 'chess/chessman/bishop'
require 'chess/chessman/queen'
require 'chess/chessman/king'
require 'chess/board'
require 'chess/parser/board_parser'
require 'chess/chessman/chessman_factory'

RSpec::Matchers.define :be_chessman do |field, color, klass|
  match do |chessman|
    chessman.field.should == field
    chessman.color.should == color
    chessman.class.should == klass
  end
end
