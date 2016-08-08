ActiveAdmin.register StaticPage do
  permit_params :body, :title, :slug, pictures_attributes: [:id, :file, :_destroy]
  menu label: proc{ I18n.t "active_admin.headers.static_page" }

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :created_at
    actions
  end

  show do
    panel "#{I18n.t('active_admin.forms.detail')}" do
      attributes_table_for static_page do
        row :id
        row :title
        row :slug
        row :body
        row "Pictures" do
          ul do 
            static_page.pictures.each do |p|
              li do
                image_tag(p.file_url.to_s)
              end
            end
          end
        end
      end
    end
  end

  filter :title
  filter :slug
  filter :created_at

  form do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :title
      f.input :slug
      f.input :body, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
      f.has_many :pictures do |p|
        p.input :file, as: :file, label: "#{I18n.t('activerecord.models.picture.one')}", hint: image_tag(p.object.file.url(:thumb).to_s)
        p.input :_destroy, as: :boolean, required: :false, label: "#{I18n.t('active_admin.forms.delete_image')}"
      end
    end
    f.actions
  end
end
