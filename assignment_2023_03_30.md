# What are the main features of redis?

* Redis is an open-source, in-memory data structure store that can be used as a database, cache, and message broker. Some of the main features of Redis include:

* In-Memory Data Storage: Redis stores data in memory, which provides fast access and retrieval times. This makes it an ideal solution for applications that require low latency and high throughput.

* Data Structures: Redis supports a wide range of data structures such as strings, hashes, lists, sets, and sorted sets. These data structures provide the flexibility to model data in different ways and solve various use cases.

# Write down the limitations of redis?

* Limited Storage Capacity: Redis stores data in memory, which means that the available storage capacity is limited by the amount of RAM on the system. This can be a challenge when dealing with very large datasets that cannot fit into memory.

* Single-Threaded: Redis is single-threaded by design, which means that it can only handle one request at a time. This can become a bottleneck when dealing with large numbers of concurrent requests or when executing complex operations that take a long time to complete.

* Limited Query Capabilities: Redis provides a limited set of query capabilities compared to more advanced databases like SQL databases. It does not support complex query languages or indexing, which can make it difficult to perform complex data analysis tasks.

* No ACID Compliance: Redis does not provide ACID (Atomicity, Consistency, Isolation, Durability) compliance, which means that it cannot ensure transactional consistency in the same way as traditional relational databases. This can make it challenging to maintain data consistency in complex systems that require strict transactional guarantees.

# Perform a basic CRUD operation using redis.

LPUSH friends "john" "harry" "rohan"

LRANGE friends 0 -1

LSET friends 2 "karan"

LREM friends 1 "rohan"

# Explain TTL command with an example.

ttl means time to live.

set title "Barik"  -- this command will set barik in title key and if we use expire like

expire title 10   -- this will remove the title key after 10 seconds. means its' ttl is 10 seconds

# Create a transaction in redis to perform the following operations.

* Create two keys in a single line and one key differently. (one value should be number)

MSET name "subhradip" age "22"

SET state "WestBengal"

* Read any two value in a single line

MGET name age state

* Increment the number value

INCR age

* Expire any two keys after some time

expire name 10
expire age 20
