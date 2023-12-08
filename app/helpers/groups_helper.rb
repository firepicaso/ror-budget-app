module GroupsHelper
  def total_amount(group)
    group.purchases.sum(:amount)
  end
end
