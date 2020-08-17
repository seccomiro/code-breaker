# frozen_string_literal: true

require_relative 'shell_output'

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(shell_output)
  game.start('1234')
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(shell_output.messages).to include(message)
end

Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(shell_output)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  shell_output.messages.should include(mark)
end
