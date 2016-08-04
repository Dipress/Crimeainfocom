ActiveAdmin.register StaticPage do
  permit_params :body, :title, :slug, :pictures

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :created_at
    actions
  end

  filter :title
  filter :slug
  filter :created_at

  form do |f|
    f.inputs "Static Page Details" do
      f.input :title
      f.input :slug
      f.input :body
      f.input :pictures, required: false, as: :file
    end
    f.actions
  end
end
