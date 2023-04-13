# What is the main difference between SQL and NoSQL databases?

* Data model : In sql datas are stored in forms of tables with predefined columns and relationships between them where each row represents
a single data and each column represents a attribute.

whre as nosql have a many data models like graph models,key-value pair,document oriented,column based. It can handle semi structured and unstructured data.

* Query Language: SQL databases use SQL (Structured Query Language) for querying data. SQL is a standard language used for relational databases and is optimized for working with structured data.

NoSQL databases use a variety of query languages, depending on the data model. For example, document-oriented databases may use MongoDB's query language, which is based on JSON-like syntax.

* Scalability: SQL databases are vertically scalable, meaning that they can handle larger amounts of data by adding more processing power and memory to a single machine. However, there is a limit to how much a single machine can handle.

NoSQL databases are horizontally scalable, meaning that they can handle larger amounts of data by distributing the data across multiple machines. NoSQL databases can handle larger volumes of data and provide better performance for some types of workloads.

# What are some of the benefits of using NoSQL databases over traditional SQL databases?

* using NoSQL databases we can handle semi structured data and unstructured data , this is not possible in sql databases.
* Nosql databases are horizontally scalable that's why it can take more workload than sql databases.
* Nosql databases are more cost friendly than sql databases because it requires less resources to store very large amount of data
* In terms of availibility nosql win the race because it is designed to handle node failures without having downtime.

# What are some common use cases for NoSQL databases?

* web and mobile applications
* IoT and sensor data
* social media and user data
* e commerce and product catalog
* machine learning

# What are the four main types of NoSQL databases, and what are their key characteristics?

* Document oriented databases: Document-oriented databases store data in flexible JSON-like documents instead of tables with rows and columns.

Example : MongoDb,CouchDb

* Key-value databases: Key-value databases store data as simple key-value pairs, where the key is a unique identifier for the data and the value is the actual data. This makes them ideal for caching and real-time applications that require high-performance and low latency.

Example : Redis, DynamoDb

* Column store databases: A column store database is a type of database that stores data using a column oriented model.

Example : SimpleDb

* Graph databases: Graph databases store data in nodes and edges, which represent entities and relationships between them.

Examples : OrientDb

# What is the CAP theorem, and how does it relate to distributed systems?

The CAP theorem is a concept that describes the trade-offs that exist in distributed systems between three key properties: consistency, availability, and partition tolerance. It states that in a distributed system, it is impossible to achieve all three properties simultaneously.
According to the CAP theorem, in a distributed system, you can only have two out of the three properties at the same time.

For example, if you prioritize consistency and partition tolerance, you may sacrifice availability in the event of a network partition. Similarly, if you prioritize availability and partition tolerance, you may sacrifice consistency.

# What are the three properties of the CAP theorem?

* Consistency: Consistency refers to the property that all nodes in a distributed system see the same data at the same time, regardless of where the data is stored or which node is accessed. Achieving strong consistency can be challenging in distributed systems because it requires all nodes to agree on the same state, which can lead to slower performance and higher latency.

* Availability: Availability refers to the property that all nodes in a distributed system can respond to read and write requests, even if some nodes fail or are unavailable. Achieving high availability can be challenging in distributed systems because it requires redundant nodes and replication mechanisms, which can add complexity and cost.

* Partition Tolerance: Partition tolerance refers to the property that a distributed system can continue to function even if network partitions occur, meaning that nodes are unable to communicate with each other. Achieving strong partition tolerance can be challenging in distributed systems because it requires designing for network failures, which can add complexity and require careful consideration of failure scenarios.

# What are the BASE properties, and how do they relate to the CAP theorem?

BASE : Basically Available,Soft State and Eventually Consistent
We will understand the BASE and how it is related to the CAP theorem by using a senario. Suppose we have 2 similar nodes A and B.
So it expected that A and B will produce the same outputs.

* Eventually Consistent : If an user do a write operation on node A that change shold be reflect in node B also but it will take some time.
If no more operations are performed on node A then the time period from the write operation on node A to to the updation on Node B is refered to
eventuall consistent state.

Afetr that time period system will achive hard or solid consistency then only it will follow CAP theorem.

* Soft State : Untill node B gets its' changes Node A didn't receive any more inputs,this is called soft state.

according to CAP theorem it does not follow the availability concept as its' not accepting any more inputs in Node A.

* Basically Available : in the senario when Node B didn't receive the updates any user do a read operation in node B, then node B can do
2 things.it will show failure or it will hold the operation.If it holds the operation the latency will be high or if it show failure it
will disrupt the availability property of CAP theorem.So this state is called Basically available .
