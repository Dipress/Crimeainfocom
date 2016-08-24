ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :middle_name, role_ids: []
  menu label: proc{ I18n.t "active_admin.headers.user" }

  index do
    selectable_column
    id_column
    column :email
    column :roles do |user|
      user.roles.first.name unless user.roles.blank?
    end
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form(html: { multipart: true }) do |f|
    f.inputs "#{I18n.t('active_admin.forms.detail')}" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :roles, as: :select, collection: Role.all.collect {|role| [role.name, role.id] }
    end
    f.actions
  end

end
