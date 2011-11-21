require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do
      describe 'Pawn#moves' do

        let(:board) { Board.new }

        def white(field)
          Pawn.white(field)
        end
        def black(field)
          Pawn.black(field)
        end

        context 'standard movement by one field' do
          context 'white' do
            it 'pawn moves one by one field' do
              p = white('c4')
              p.moves(board).should == ['c5']
            end
            it 'shouldnt allow to move from last line' do
              p = white('h8')
              p.moves(board).should == []
            end
          end
          context 'black' do
            it 'pawn moves one by one field' do
              p = black('a4')
              p.moves(board).should == ['a3']
            end
            it 'shouldnt allow to move from last line' do
              p = black('c1')
              p.moves(board).should == []
            end
          end
        end

        context 'movement from first line' do
          it 'should allow move by 2 field from first line (white)' do
            p = white('b2')
            p.moves(board).should == ['b3', 'b4']
          end
          it 'should allow move by 2 field from first line (black)' do
            p = black('e7')
            p.moves(board).should == ['e6', 'e5']
          end
        end

        context 'movement to occupied position' do
          context 'white' do
            it 'shouldnt allow for movement to occupied position' do
              p = white('c3')
              board << black('c4')

              p.moves(board).should == []
            end
            it 'shouldnt allow for movement by two fields to occupied position' do
              p = white('E2')
              board << black('e3')

              p.moves(board).should == []
            end
          end
          context 'black' do
            it 'shouldnt allow for movement to occupied position' do
              p = black('d6')
              board << black('d5')

              p.moves(board).should == []
            end
            it 'shouldnt allow for movement by two fields to occupied position' do
              p = black('f7')
              board << black('f6')

              p.moves(board).should == []
            end
          end

          context 'capturing' do
            context 'black' do
              it 'should be possible to capture different color man' do
                pending
                p = black('G5')
                board << white('f4')
                board << white('h4')

                p.moves(board).should == ['f4', 'h4', 'g4']
              end
              it 'shouldnt be possible to capture same color man' do
                pending
                p = black('G5')
                board << black('f4')
                board << white('h4')

                p.moves(board).should == ['h4', 'g4']
              end
            end
            context 'white' do
              it 'should be possible to capture different color man' do
                pending
                p = white('C3')
                board << white('b4')
                board << white('D4')

                p.moves(board).should == ['b4', 'd4', 'c4']
              end
              it 'shouldnt be possible to capture same color man' do
                pending
                p = white('c3')
                board << black('B4')
                board << white('d4')

                p.moves(board).should == ['b4', 'c4']
              end
            end
          end

        end
      end
    end
  end
end
