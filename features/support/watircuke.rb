module WatirCukeHelpers
  def find_button(type)
    if type == Fixnum then
      type = type.to_i
      kind = [:id]
      kind.collect { |k| @browser.button(k, type).click unless @browser.button(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    else    
      type = type.to_s
      kind = [:id, :name, :value, :text, :class]
      kind.collect { |k| @browser.button(k, type).click unless @browser.button(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
    #   if @browser.button(:id, type).exists? then
    #      @browser.button(:id, type).click
    #   elsif
    #      @browser.button(:name, type).exists? then
    #      @browser.button(:name, type).click
    #   elsif
    #      @browser.button(:value, type).exists? then
    #      @browser.button(:value, type).click
    #   elsif
    #      @browser.button(:text, type).exists? then
    #      @browser.button(:text, type).click
    #   elsif
    #     @browser.button(:class, type).exists? then
    #     @browser.button(:class, type).click
    #   else
    #     fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    #   end
    # end
  end
  def find_checkbox(type)
    if type == Fixnum then
      type = type.to_i
      kind = [:id]
      kind.collect { |k| @browser.checkbox(k, type).click unless @browser.checkbox(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    else
      type = type.to_s
      kind = [:id, :name, :text, :class]
      kind.collect { |k| @browser.checkbox(k, type).click unless @browser.checkbox(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
    # if @browser.checkbox(:id, /#{type}/).exists? then
    #      @browser.checkbox(:id, /#{type}/).click
    #   elsif
    #      @browser.checkbox(:name, type).exists? then
    #      @browser.checkbox(:name, type).click
    #   elsif
    #      @browser.checkbox(:value, type).exists? then
    #      @browser.checkbox(:value, type).click
    #   elsif
    #      @browser.checkbox(:text, type).exists? then
    #      @browser.checkbox(:text, type).click
    #   elsif
    #     @browser.checkbox(:class, type).exists? then
    #     @browser.checkbox(:class, type).click
    #   else
    #     fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    #   end
  end

  def find_image(type)
    if type == Fixnum then
      type.to_i    
      kind = [:id]
      kind.collect { |k| @browser.image(k, type).click unless @browser.link(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    else
      type.to_s    
      kind = [:src, :id, :name, :text, :class]
      kind.collect { |k| @browser.link(k, type).click unless @browser.link(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
    # if type == Fixnum then
    #     type = type.to_i
    #     @browser.image(:index, type).click
    #   end
    #   if @browser.image(:src, /#{type}/).exists? then
    #      @browser.image(:src, /#{type}/).click
    #   elsif 
    #     @browser.image(:id, type).exists? then
    #     @browser.image(:id, type).click
    #   elsif 
    #     @browser.image(:name, type).exists? then
    #     @browser.image(:name, type).click
    #   elsif 
    #     @browser.image(:text, type).exists? then
    #     @browser.image(:text, type).click
    #   elsif 
    #     @browser.image(:class, type).exists? then
    #     @browser.image(:class, type).click
    #   else
    #     fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    #   end
  end

  def find_link(type)
    if type == Fixnum then
      type.to_i    
      kind = [:id]
      kind.collect { |k| @browser.link(k, type).click unless @browser.link(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    else
      type.to_s    
      kind = [:text, :class]
      kind.collect { |k| @browser.link(k, type).click unless @browser.link(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
 #    if @browser.link(:text, type).wait_until_present then
 #       @browser.link(:text, type).click
 # elsif @browser.link(:class, /(^|\s)#{type}(\s|$)/).wait_until_present then
 #       @browser.link(:class, /(^|\s)#{type}(\s|$)/).click
 #    else
 #      fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
 #    end
  end

  def find_radio_button(type)
    if type == Fixnum then
      type.to_i    
      kind = [:id]
      kind.collect { |k| @browser.radio(k, type).click unless @browser.radio(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    else
      type.to_s    
      kind = [:text, :class]
      kind.collect { |k| @browser.radio(k, type).click unless @browser.radio(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
    # if @browser.radio(:id, type).exists? then
    #      @browser.radio(:id, type).click
    #   elsif 
    #     @browser.radio(:name, type).exists? then
    #     @browser.radio(:name, type).click
    #   elsif 
    #     @browser.radio(:value, type).exists? then
    #     @browser.radio(:value, type).click
    #   elsif 
    #     @browser.radio(:text, type).exists? then
    #     @browser.radio(:text, type).click
    #   elsif 
    #     @browser.radio(:class, type).exists? then
    #     @browser.radio(:class, type).click
    #   else
    #     fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    #   end
  end

  def find_select_list(text, type)
    if type == Fixnum then
      type = type.to_i
      @browser.select_list(:index, type).select(text)
    else
      type = type.to_s
      kind = [:id, :text, :class]
      kind.collect { |k| @browser.select_list(k, type).select(text) unless @browser.select_list(k, /(^|\s)#{type}(\s|$)/).exists? == false }
   end
      #  
      # if @browser.select_list(:id, type).exists? then
      #    @browser.select_list(:id, type).select(text)
      # 
      # elsif @browser.select_list(:name, type).exists? then
      #       @browser.select_list(:name, type).select(text)
      # 
      # elsif @browser.select_list(:value, type).exists? then
      #       @browser.select_list(:value, type).select(text)
      # 
      # elsif @browser.select_list(:text, type).exists? then
      #       @browser.select_list(:text, type).select(text)
      # 
      # elsif @browser.select_list(:class, /(^|\s)#{type}(\s|$)/).exists? then
      #       @browser.select_list(:class, /(^|\s)#{type}(\s|$)/).select(text)
      # else
      #   fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
      # end
  end
  
  def find_text_field(type, text)
    if type == Fixnum then
      type = type.to_i
      @browser.text_field(:index, type).set(text)
    else
      type = type.to_s
      kind = [:id, :text, :class]
      kind.collect { |k| @browser.text_field(k, /(^|\s)#{type}(\s|$)/).set(text) unless @browser.text_field(k, /(^|\s)#{type}(\s|$)/).exists? == false }
    end
    # kind.each do |k|
    #   @browser.text_field(k, /(^|\s)#{type}(\s|$)/).set(text) unless @browser.text_field(k, /(^|\s)#{type}(\s|$)/).exists? == false
    # end
    # if @browser.text_field(:text, type).exits? then
    #    @browser.text_field(:text, type).set(text)     
    # elsif 
    #   @browser.text_field(:class, /(^|\s)#{type}(\s|$)/).exists? then
    #   @browser.text_field(:class, /(^|\s)#{type}(\s|$)/).set(text)    
    # else
    #   fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    # end
  end
  

  
  def find_span(type)
    if @browser.span(:class, type).exists? then
      @browser.span(:class, type).click
    else
      fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    end
  end
  
  def find_text_field_with_random(type, text)
    if @browser.text_field(:id, type).exists? then
       @browser.text_field(:id, type).set(text + @random)
     
    elsif @browser.text_field(:name, type).exists? then
          @browser.text_field(:name, type).set(text + @random)
     
    elsif @browser.text_field(:value, type).exists? then
          @browser.text_field(:value, type).set(text + @random)
     
    elsif @browser.text_field(:class, /(^|\s)#{type}(\s|$)/).exists? then
          @browser.text_field(:class, /(^|\s)#{type}(\s|$)/).set(text + @random)
    else
      fail("Sorry, I wasn't able to find the " + "'#{type}'" + " element ")
    end
  end
  
  def find_div(type)
    type = type.to_s
    if @browser.div(:id, type).exists? then
       @browser.div(:id, type).click
    elsif
       @browser.div(:text, /(^|\s)#{type}(\s|$)/).exists? then
       @browser.div(:text, /(^|\s)#{type}(\s|$)/).click
    elsif
      @browser.div(:class, type).exists? then
      @browser.div(:class, type).click
    else
      fail("could not find what you asked for")
    end
  end
  
  def find_table(row, type)
    row = row.to_i
    if @browser.table(:id, type).exists? then
       @browser.table(:id, type)[row][2].click
    elsif
      @browser.table(:class, /(^|\s)#{type}(\s|$)/).exists? then
      @browser.table(:class, /(^|\s)#{type}(\s|$)/)[row][1].click
    else
      fail("could not find what you asked for")
    end
  end
  
  def find_table_with_cell(cell, row, type)
    row = row.to_i
    cell = cell.to_i
    if @browser.table(:id, type).exists? then
       @browser.table(:id, type)[row][cell].click
    elsif
      @browser.table(:class, /(^|\s)#{type}(\s|$)/).exists? then
      cell = @browser.table(:class, /(^|\s)#{type}(\s|$)/)[row][cell]
      cell.link(:text, "1").click
    else
      fail("could not find what you asked for")
    end
  end
  
  def find_form(form_name)
    if @browser.form(:id, form_name).exists? then
      @browser.form(:id, form_name).submit
    else
      fail("could not find what you asked for")
    end
  end
  
  def find_file_field(file, type)
    type.to_s
    sleep 2
    file_path = File.expand_path(File.dirname(__FILE__)) + File::SEPARATOR + File.join("..", "files", "imports", File::SEPARATOR)
    sleep 2
    file_path.gsub!(File::SEPARATOR, File::ALT_SEPARATOR) if File::ALT_SEPARATOR
    sleep 2
    if @browser.file_field(:id, type).exists? then
      sleep 2
      @browser.file_field(:id, type).set(file_path + file)
    else
      fail("could not find what you asked for")
    end
  end

  
  def find_page(page_name)
    @browser.goto(path_to(page_name))
  end
end

World(WatirCukeHelpers)