class Api::Versions::Friends::FriendsCandidateForm < BaseForm
  include ActiveModel::Validations

  form_attributes :register_word_id

  validates :register_word_id, presence: true
  # validates :status, inclusion: %w|notes raised resolved|, if: -> { self.status.present? }
end
