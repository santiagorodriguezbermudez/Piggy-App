module SavingsHelper
  def total_savings(array)
    array.inject{ |sum, saving| sum +=saving[:amount]}
  end
end
