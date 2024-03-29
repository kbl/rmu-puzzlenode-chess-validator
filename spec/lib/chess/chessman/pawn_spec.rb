require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do

      let(:board) { Board.new }

      def white(field)
        Pawn.white(field)
      end
      def black(field)
        Pawn.black(field)
      end

      describe 'Pawn#moves' do
        context 'standard movement by one field' do
          context 'white' do
            it 'pawn moves one by one field' do
              p = white('c4')
              p.moves(board).should == %w(c5)
            end
            it 'shouldnt allow to move from last line' do
              p = white('h8')
              p.moves(board).should == []
            end
          end
          context 'black' do
            it 'pawn moves one by one field' do
              p = black('a4')
              p.moves(board).should == %w(a3)
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
            p.moves(board).should == %w(b3 b4)
          end
          it 'should allow move by 2 field from first line (black)' do
            p = black('e7')
            p.moves(board).should == %w(e6 e5)
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
                p = black('G5')
                board << white('f4')
                board << white('h4')

                p.moves(board).should =~ %w(f4 h4 g4)
              end
              it 'shouldnt be possible to capture same color man' do
                p = black('G5')
                board << black('f4')
                board << white('h4')

                p.moves(board).should =~ %w(h4 g4)
              end
            end
            context 'white' do
              it 'should be possible to capture different color man' do
                p = white('C3')
                board << black('b4')
                board << black('D4')

                p.moves(board).should =~ %w(b4 d4 c4)
              end
              it 'shouldnt be possible to capture same color man' do
                p = white('c3')
                board << black('B4')
                board << white('d4')

                p.moves(board).should =~ %w(b4 c4)
              end
            end
          end

        end
      end

      describe 'Pawn#capturing_moves' do
        it 'should properly find capturing moves on last line' do
          p = white('b8')
          p.capturing_moves(board).should be_empty
        end
        it 'should find capturing moves' do
          p = black('e6')
          p.capturing_moves(board).should =~ %w(d5 f5)
        end
        it 'should find capturing moves for occupied fields' do
          p = black('e6')
          board << black('d5')
          board << white('f5')
          p.capturing_moves(board).should =~ %w(d5 f5)
        end
      end
    end
  end
end
