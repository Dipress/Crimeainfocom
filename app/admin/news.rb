ActiveAdmin.register News do
  permit_params :title, :slug, :description, :body, :published, :main_page

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

  form do |f|
    f.inputs "News Details" do
      f.input :title
      f.input :slug
      f.input :description
      f.input :body
      f.input :published
      f.input :main_page
    end
    f.actions
  end
end
