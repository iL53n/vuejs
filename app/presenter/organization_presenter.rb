# class OrganizationPresenter < BasePresenter
#   # attr_reader :resource
#   # delegate %i[id form_of_owership title clients tax_number reg_number], to: :resource
#
#   COLUMNS = [
#       { name: 'id', align: 'left', label: 'ID', field: :id, sortable: true },
#       { name: 'form_of_owership', align: 'center', label: 'Форма собственности', field: :form_of_owership, sortable: true },
#       { name: 'title', align: 'left', label: 'Наименование', field: :title, sortable: true },
#       { name: 'clients', align: 'center', label: 'Клиент(-ы)', field: '', sortable: true },
#       { name: 'tax_number', align: 'center', label: 'ИНН', field: :tax_number, sortable: true },
#       { name: 'reg_number', align: 'center', label: 'ОГРН', field: :reg_number, sortable: true },
#       { name: 'actions', align: 'center' }
#   ],
#
#   def columns
#     COLUMNS
#   end
#
#   def columns_keys
#     columns.map { |column| column[:name] }
#   end
#
#   def actions
#     [
#         { name: :edit, label: 'Редактировать' },
#         { name: :delete, label: 'Удалить' }
#     ]
#   end
#
#   # def meta
#   #   {
#   #       columns: columns,
#   #       columns_keys: columns_keys,
#   #       actions: actions
#   #   }
#   # end
# end
#
class OrganizationPresenter < BasePresenter
  # attr_reader :resource
  # delegate [:id, :name, :inn, :ogrn], to: :resource

  COLUMNS = [
    { name: :id, field: :id, label: 'ID', align: 'left', sortable: true },
    { name: :title, field: :title, label: 'Name', align: 'left', sortable: true },
    { name: :form_of_owership, field: :form_of_owership, label: 'Kind', align: 'left', sortable: true },
    { name: :tax_number, field: :tax_number, label: 'ИНН' },
    { name: :reg_number, field: :reg_number, label: 'ОГРН' },
    { name: :action, label: '', align: 'left' }
  ]

  def columns
    COLUMNS
  end

  def columns_keys
    COLUMNS.map { |column| column[:name] }
  end

  def actions
    [
      { name: :edit, label: 'Edit', icon: 'fas fa-edit' },
      { name: :delete, label: 'Delete', icon: 'fas fa-trash' }
    ]
  end

  def meta
    {
      columns: columns,
      columns_keys: columns_keys,
      actions: actions
    }
  end
end