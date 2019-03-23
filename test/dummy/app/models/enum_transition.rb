class EnumTransition < ApplicationRecord
  include Enum::Transition

  enum status: {initial: 0, verified: 1, completed: 2, rejected: 3}

  enum_columns [:status]
  enum_transitions :initial, [:verified, :rejected]
  enum_transitions :verified, [:completed, :rejected]
end