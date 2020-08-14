# frozen_string_literal: true

require_relative 'shell_output'

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(shell_output)
  game.start
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(shell_output.messages).to include(message)
end
