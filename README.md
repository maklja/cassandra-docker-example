Run a CQL client that will connect to cassandra cluster.
```docker
    docker run -it --rm --network cassandra_db_network bitnami/cassandra:4.0 cqlsh --username cassandra --password cassandra cass_1
```
