ActiveAdmin.register Service do
  permit_params :name, :description, :body, :service_ids, pictures_attributes: [:id, :file, :_destroy]
  menu label: proc{ I18n.t "active_admin.headers.service" }

  index do
    selectable_column
    id_column
    column :name
    column :service_id
    column :created_at
    actions
  end

  show do
    panel "#{I18n.t('active_admin.forms.detail')}" do
      attributes_table_for service do
        row :id
        row :name
        row :description
        row :body
        row :service_id
        row "Pictures" do
          ul do 
            service.pictures.each do |p|
              li do
                image_tag(p.file_url.to_s)
              end
            end
          end
        end
      end
    end
  end

  filter :name
  filter :service_id
  filter :created_at

  form do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :name
      f.input :description
      f.input :body, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
      f.input :service_ids, as: :select, collection: Service.all.collect {|service| [service.name, service.id] }
       f.has_many :pictures do |p|
        p.input :id, input_html: { value: p.object.id }, as: :hidden
        p.input :file, as: :file, label: "#{I18n.t('activerecord.models.picture.one')}", hint: image_tag(p.object.file.url(:thumb).to_s)
        p.input :_destroy, as: :boolean, required: :false, label: "#{I18n.t('active_admin.forms.delete_image')}"
      end
    end
    f.actions
  end
end
