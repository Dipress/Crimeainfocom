ActiveAdmin.register Payment do
  permit_params :title, :slug, :body
  menu label: proc{ I18n.t "active_admin.headers.payment" }

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    column :updated_at
    actions
  end

  show do
    panel "#{I18n.t('active_admin.forms.detail')}" do
      attributes_table_for payment do
        row :id
        row :title
        row :slug
        row :body
      end
    end
  end

  filter :title
  filter :created_at

  form(html: { multipart: true }) do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :title
      f.input :slug
      f.input :body, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
    end
    f.actions
  end
end