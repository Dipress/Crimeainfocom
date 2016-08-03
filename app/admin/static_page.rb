ActiveAdmin.register StaticPage do
  permit_params :body, :title, :slug

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
    end
    f.actions
  end
end
