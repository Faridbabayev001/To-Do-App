module ShareHelper

  def convert_share_type_number_to_text(share_type)
    if share_type
      "Can write comment"
    else
      "Only view"
    end
  end
end
