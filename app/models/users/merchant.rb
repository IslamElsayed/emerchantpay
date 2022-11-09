class Merchant < User
  enum :status, [:active, :inactive]
end
