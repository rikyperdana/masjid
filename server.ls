if Meteor.isServer

	Meteor.publish \masjid, -> coll.masjid.find {}

	Meteor.methods do
		upsert: (doc) -> coll.masjid.upsert doc._id, $set: doc
