require 'onix'
require 'json'

onix_file = ARGV[0]
reader = ONIX::Reader.new(onix_file)
puts "["
reader.each do |item|
  # Initialize bib for couch
  @bib = Hash.new
  # Use the local identifier for the id. ISBNs for stdnum. Skip duplicate EAN
  item.product_identifiers.each do |identifier|
    if identifier.product_id_type == 1
      @bib['id'] = identifier.id_value
       #@bib = @db.get(id)
    elsif identifier.product_id_type == 2 || identifier.product_id_type == 15
      (@bib['stdnum'] ||= []) << identifier.id_value
    end
  end
  # Get first title and subtitle if needed. None with multiple titles that I saw.
   @bib['title'] = item.titles.first.title_text
   if item.titles.first.subtitle
     @bib['title'] = @bib['title'] + " : " + item.titles.first.subtitle
   end
  #
  # # Get authors
   if item.contributors.size == 1
     @bib['author'] = item.contributors.first.person_name
   else
     item.contributors.each do |author|
       (@bib['addl_author'] ||= []) << author.person_name
     end
   end
  #
  # # Get language of text. Not grabbing anything else at this point
   item.languages.each do |lang|
     if lang.language_role == 1
       @bib['lang'] = lang.language_code
     end
   end
  #
  # # Get edition if there
   if item.edition_number
     @bib['edition'] = item.edition_number
   end
  
  # # Get BISAC
   item.subjects.each do |subject|
     if subject.subject_scheme_id == 10
       (@bib['bisac'] ||= []) << subject.subject_code
     end
   end
  #
  # # Get Publisher
   item.publishers.each do |publisher|
     if publisher.publishing_role == 1
       @bib['pub_info'] = publisher.publisher_name
       #puts publisher.publisher_name
     end
   end
  #
  # # Get series
   if item.series
     item.series.each do |series|
       (@bib['series'] ||= []) << series.title_of_series
     end
   end
  #
  # # Get overview
   item.text.each do |text|
     if text.text_type_code == 1
       @bib['overview'] = text.text
     end
   end
   @bib['pub_year'] = item.publication_date.year
   puts @bib.to_json + ','
end
puts "{}]"