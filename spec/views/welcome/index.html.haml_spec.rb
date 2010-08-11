require 'spec_helper'

describe 'welcome/index.html.haml' do

  before do
    render
  end

  it 'should have title' do
    rendered.should have_selector('div#title', :content => 'budkop')
  end

  it 'should have what question' do
    rendered.should have_selector('div#what.question', :content => 'What we are doing?')
  end

  it 'should have tag ruby with tooltip' do
    rendered.should have_selector('div#tag_holder') do |tag_holder|
      tag_holder.should have_selector('a.tag.tip', :href => '#ruby', :content => 'ruby', :title => 'We programming in Ruby')
    end
  end

  it 'should have tag mac with tooltip' do
    rendered.should have_selector('div#tag_holder') do |tag_holder|
      tag_holder.should have_selector('a.tag.tip', :href => '#mac', :content => 'mac', :title => 'We hack Macs')
    end
  end

  it 'should have tag iphone with tooltip' do
    rendered.should have_selector('div#tag_holder') do |tag_holder|
      tag_holder.should have_selector('a.tag.tip', :href => '#iphone', :content => 'iphone', :title => 'We hack iPhones')
    end
  end

  it 'should have people' do
    rendered.should have_selector('div#people', :content => 'People')
  end


  it 'should have where question' do
    rendered.should have_selector('div#where.question', :content => 'Where you can meet us?')
  end

  it 'should have github_link' do
    rendered.should have_selector('div#github_link', :href => 'http://github.com/hash4di', :content => 'http://github.com/hash4di')
  end

  it 'should have facebook_link' do
    rendered.should have_selector('div#facebook_link', :href => 'http://facebook.com/hash4di', :content => 'http://facebook.com/hash4di')
  end

  it 'should have Twitter_link' do
    rendered.should have_selector('div#twitter_follow', :href => 'http://twitter.com/hash4di', :content => 'follow us on twitter')
  end

end
