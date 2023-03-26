defmodule Sublist do
  def compare(a, b) when a==b do
    :equal
  end
  def compare(a, b) when a==[] and not(b==[]) do
    :sublist
  end  
  def compare(a, b) when not(a==[]) and b==[] do
    :superlist
  end
  # For Superlist
  def compare(a, b) when not(a==[]) and not(b==[]) and length(a) > length(b) do
    check(a, b)
  end
   defp check([],b) do
  :unequal
  end
  defp check(a,b) do
    if List.starts_with?(a, b) do  
        :superlist
    else
      check(tl(a),b) 
    end
  end
# For Sublist
  def compare(a, b) when not(a==[]) and not(b==[]) and length(b) > length(a) do
    check2(b, a)
  end
  defp check2([],b) do
  :unequal
  end
  defp check2(b,a) do
    if List.starts_with?(b, a) do  
        :sublist
    else
      check2(tl(b),a) 
    end
  end
# For unequal    
  def compare(a, b) when length(a) == length(b) do
    :unequal
  end
end
