module ApplicationHelper
  def trim num
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-outline-primary btn-sm", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def show_date datetime
    datetime.nil? ? "-" : datetime.in_time_zone.strftime("%d-%m-%Y")
  end

  def show_date_time datetime
    datetime.nil? ? "-" : datetime.in_time_zone.strftime("%d-%m-%Y %T")
  end

  def show_sex sex
    sex == 1 ? "LAKI-LAKI" : "PEREMPUAN"
  end

  def show_sex_short sex
    sex == 1 ? "LK" : "PR"
  end

  def thousands_format number
    number_with_precision(number, strip_insignificant_zeros: true, delimiter: ".", separator: ",")
  end

  def greeting
    case Time.zone.now.hour
    when 0..9 then 'Selamat Pagi !'
    when 10..13 then 'Selamat Siang !'
    when 14..18 then 'Selamat Sore !'
    when 19..23 then 'Selamat Malam !'
    end
  end
end
