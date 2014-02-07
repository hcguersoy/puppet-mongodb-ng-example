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

$replsetmembers = [
    {'host' => 'node1.localdomain', 'port' => '27017', 'priority' => 2},
    {'host' => 'node2.localdomain', 'port' => '27017', 'priority' => 1},
]

mongodb {'mongo-2' :
    servicename     => 'mongo-2',
    port            => 27017,
    replset         => $replset1,    
    smallfiles      => true,
}

mongodb::replset {"$replset1" :
    replset        => $replset1,
    replsetmembers => $replsetmembers,
    require        => [Service['mongo-2'],],
}  