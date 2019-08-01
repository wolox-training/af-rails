require 'rails_helper'

describe SuggestionBook do
  subject(:suggestion_book) { create(:suggestion_book) }

  it { is_expected.to be_valid }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:link) }
  it { is_expected.to validate_presence_of(:editor) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:user) }
end
