ActiveAdmin.register News do
  permit_params :title, :slug, :description, :body, :published, :main_page, pictures_attributes: [:id, :file, :_destroy]
  menu label: proc{ I18n.t "active_admin.headers.news" }

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :main_page
    column :created_at
    actions
  end

  show do
    panel "#{I18n.t('active_admin.forms.detail')}" do
      attributes_table_for news do
        row :id
        row :title
        row :slug
        row :description
        row :body
        row :published
        row :main_page
        row "Pictures" do
          ul do 
            news.pictures.each do |p|
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
  filter :published
  filter :main_page
  filter :created_at

  form(html: { multipart: true }) do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :title
      f.input :slug
      f.input :description
      f.input :body, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
      f.input :published
      f.input :main_page
      f.has_many :pictures do |p|
        p.input :file, as: :file, label: "#{I18n.t('activerecord.models.picture.one')}", hint: image_tag(p.object.file.url(:thumb).to_s)
        p.input :_destroy, as: :boolean, required: :false, label: "#{I18n.t('active_admin.forms.delete_image')}"
      end
    end
    f.actions
  end
end