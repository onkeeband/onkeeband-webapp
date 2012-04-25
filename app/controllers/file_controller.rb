class FileController < ActionController::Base
  
  def vcard
    @card = params[:card]
    
    if @card == "anita"
      send_file File.join(Rails.root, 'public', 'docs', 'onkeeband-anita.vcf'), :type => "text/vcard"
    elsif @card == "lenny"
      send_file File.join(Rails.root, 'public', 'docs', 'onkeeband-lenny.vcf'), :type => "text/vcard"
    end
  end
  
end