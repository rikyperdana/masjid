if Meteor.isServer

	Meteor.publish \masjid, -> coll.masjid.find {}
