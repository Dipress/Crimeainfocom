ActiveAdmin.register Role do
  permit_params :id, :name, :resource_type, :resource_id
  menu label: proc{ I18n.t "active_admin.headers.role" }

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name

  form do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :name
    end
    f.actions
  end
end
