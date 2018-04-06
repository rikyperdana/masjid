if Meteor.isClient

	comp = {}
	
	comp.front =
		view: ->
			m \body,
				style:
					display: \flex
					min-height: \100vh
					flex-direction: \column
				m \main,
					style: flex: '1 0 auto'
				m \footer.page-footer.green, m \.container, m \.row,
					m \.col.l6,
						m \h5.white-text, 'Informasi Masjid'
						m \p.grey-text.text-lighten-4, 'Jumlah infaq & sodaqoh hari ini'
					m \.col.l4,
						m \h5.white-text, 'Jadwal Sholat'
						m \ul,
							m \li, 'Subuh'
							m \li, 'Zuhur'

	m.route document.body, \/front,
		'/front': comp.front
