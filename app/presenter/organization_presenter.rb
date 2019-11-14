class OrganizationPresenter < BasePresenter
  # attr_reader :resource
  # delegate [], to: :resource

  COLUMNS = [
    { name: :id, align: 'left', label: 'ID', field: :id, sortable: true },
    { name: :form_of_owership, align: 'center', label: 'Форма собственности', field: :form_of_owership, sortable: true },
    { name: :title, align: 'left', label: 'Наименование', field: :title, sortable: true },
    { name: :clients, align: 'center', label: 'Клиент(-ы)', field: '' },
    { name: :tax_number, align: 'center', label: 'ИНН', field: :tax_number, sortable: true },
    { name: :reg_number, align: 'center', label: 'ОГРН', field: :reg_number, sortable: true },
    { name: :action, label: '', align: 'center' }
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