# exmaple 1 - replica sets

# install mongodb from MongoDb Inc. Repositories
class {'mongodb::install':
    enable_10gen    => true,
}

#if you have a MongoDB DEB file locally put it into the files directory
# and enable this
# class {'mongodb::install':
#    enable_dpkg     => true,
#    deb_file        => '/tmp/mongodbfiles/mongodb-10gen_2.4.5_amd64.deb',
# }

$replset1 = 'replset-1'

mongodb {'mongo-1' :
    servicename     => 'mongo-1',
    port            => 27017,
    replset         => $replset1,
    smallfiles      => true,
}