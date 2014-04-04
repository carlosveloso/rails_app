require 'spec_helper'

describe ApplicationHelper do
	describe 'full_title' do
		it { full_title('foo').should =~ /foo/ }
		it { full_title('foo').should =~ /Aplicacion de pruebas/ }
		it { full_title('').should_not =~ /\|/ }
	end
end