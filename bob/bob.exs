defmodule Teenager do
  def hey(input) do
  	input 
  	|> listen
  	|> respond

  end

	defp listen(input) do
    cond do
        String.ends_with? input, "?" -> :question
    	  Regex.run(~r/(\S)/, input) == nil -> :silence
	    	String.upcase(input) == input &&
	      String.downcase(input) != input -> :shouting
        true -> true
    end
  end

  defp respond(msg) do
  	case msg do
  		:question -> "Sure."
  		:silence -> "Fine. Be that way!"
  		:shouting -> "Whoa, chill out!"
  		_ -> "Whatever."
  	end

  end
end
