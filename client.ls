if Meteor.isClient

	comp = {}; style = {}

	style.front =
		body: style:
			display: \flex
			min-height: \100vh
			flex-direction: \column
		main: style:
			flex: '1 0 auto'
	style.admin =
		container: style:
			padding-left: \200px

	comp.front =
		view: ->
			m \body, style.front.body,
				m \main, style.front.main
				m \footer.page-footer.green, m \.container, m \.row,
					m \.col.l6,
						m \h5.white-text, 'Informasi Masjid'
						m \p.grey-text.text-lighten-4, 'Jumlah infaq & sodaqoh hari ini'
					m \.col.l4,
						m \h5.white-text, 'Jadwal Sholat'
						m \ul,
							m \li, 'Subuh'
							m \li, 'Zuhur'

	comp.admin = (child) ->
		view: (ctrl) -> m \.admin,
			m \.navbar-fixed, m \nav.green, m \.nav-wrapper,
				m \a.brand-logo.center 'Admin Masjid'
				m \ul.right,
					unless Meteor.userId then m \li, m \a, \Login
					else m \li, m \a, \Logout
			m \ul.fixed.side-nav,
				m \li, m \a.center, m \b, 'Admin Menu'
				_.map <[ profil pengaturan keuangan ]>, (i) ->
					m \li, m \a, href: "?/admin/#i", _.startCase i
			m \.container, style.admin.container,
				if child then m \.child, child
				else m \h5, 'Selamat Datang'

	comp.profil =
		controller: reactive ->
			@formEvent = onsubmit: (e) ->
				e.preventDefault!
				Meteor.call \upsert, _.zipObject do
					_.map e.target[0 to 3], \name
					_.map e.target[0 to 3], \value
		view: (ctrl) -> m \div,
			m \h5, 'Identitas Masjid'
			m \form, ctrl.formEvent,
				m \input, name: \nama, placeholder: 'Nama Masjid'
				m \input, name: \alamat, placeholder: 'Alamat Masjid'
				m \.row,
					m \.col.m6, m \input, name: \latitude, placeholder: \Latitude
					m \.col.m6, m \input, name: \longitude, placeholder: \Longitude
				m \input.btn, type: \submit, value: \simpan

	Meteor.subscribe \masjid, onReady: ->
		routes =
			'/front': comp.front
			'/admin': comp.admin!
		adminMenus = <[ profil pengaturan keuangan ]>
		_.assign routes, _.zipObject do
			_.map adminMenus, (i) -> "/admin/#i"
			_.map adminMenus, (i) -> comp.admin comp[i]
		m.route document.body, \/front, routes
