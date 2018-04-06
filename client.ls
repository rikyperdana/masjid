if Meteor.isClient

	comp = {}
	
	comp.front =
		view: -> m \footer.page-footer, m \.container, m \.row,
			m \.col.l6,
				m \h5.white-text, 'Footer Content'
				m \p.grey-text.text-lighten-4, 'You can use rows and columns'
			m \.col.l4,
				m \h5.white-text, 'Links'
				m \ul,
					m \li, 'Link 1'
					m \li, 'Link 2'

	m.route document.body, \/front,
		'/front': comp.front
