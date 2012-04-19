class FileController < ActionController::Base
  
  def vcard
    @person = params[:band_member]
    
    if @person == "anita"
      send_file File.join(Rails.root, 'app', 'assets', 'docs', 'onkeeband-anita.vcf'), :type => "text/vcard"
    elsif @person == "lenny"
      send_file File.join(Rails.root, 'app', 'assets', 'docs', 'onkeeband-lenny.vcf'), :type => "text/vcard"
    end
  end
  
  def promo_pkg
    @format = params[:doc_format]
    
    if @format == "doc"
      send_file File.join(Rails.root, 'app', 'assets', 'docs', 'onkeeband-promo-pkg.doc'), :type => "application/msword"
    elsif @format == "pdf"
      send_file File.join(Rails.root, 'app', 'assets', 'docs', 'onkeeband-promo-pkg.pdf'), :type => "text/pdf"
    end
  end
  
end