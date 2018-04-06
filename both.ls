@coll = {}
coll.masjid = new Meteor.Collection 'masjid'
coll.masjid.allow insert: -> true
