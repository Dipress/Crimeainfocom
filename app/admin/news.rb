ActiveAdmin.register News do
  permit_params :title, :slug, :description, :body, :published, :main_page, pictures_attributes: [:id, :file, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :main_page
    column :created_at
    actions
  end

  filter :title
  filter :published
  filter :main_page
  filter :created_at

  form(html: { multipart: true }) do |f|
    f.inputs "News Details" do
      f.input :title
      f.input :slug
      f.input :description
      f.input :body, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
      f.input :published
      f.input :main_page
      f.has_many :pictures do |p|
        p.input :file, as: :file
      end
  end
    f.actions
  end
end