ActiveAdmin.register Service do
  permit_params :name, :description, :body, :service_ids

  index do
    selectable_column
    id_column
    column :name
    column :service_id
    column :created_at
    actions
  end

  filter :name
  filter :service_id
  filter :created_at

  form do |f|
    f.inputs "Service Details" do
      f.input :name
      f.input :description
      f.input :body
      f.input :service_ids, as: :select, collection: Service.all.collect {|service| [service.name, service.id] }
    end
    f.actions
  end
end
