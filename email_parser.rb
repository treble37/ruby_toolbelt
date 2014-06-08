class EmailParser
  def initialiaze
  end
  def string_to_emails(s, split_chars)
    #given a string containing emails delimited by "split_chars" (e.g., whitespace, etc.), return an array of emails only
    #e.g., s="1.  google@gmail.com \r\n 2.  Jan@aol.com\n" => ["google@gmail.com", "Jan@aol.com"]
    s.split("\n").map{ |m| /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/.match(m)[0] }
  end
end