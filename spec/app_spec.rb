require 'spec_helper'

describe C80GitBash::App do
  it do
    subject.run('/home/scout/git/bitbucket')
  end
end