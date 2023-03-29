# question 1

if we have the closure of {CourseNo, StudentName} and {CourseNo, EntrollmentNo} we got,
{CourseNo, StudentName}+ -> { CourseNo, StudentName, EntrollmentNo, Grade }
{CourseNo, EntrollmentNo}+ -> { CourseNo, StudentName, EntrollmentNo, Grade }

Candidate key = { {CourseNo, StudentName}, {CourseNo, EntrollmentNo} }

primary attribute = { CourseNo, StudentName, EntrollmentNo }

non-primary attribute = { Grade }

For BCNF, the relation is not in BCNF because in production StudentName -> EnrollmentNo,
StudentName is not a candidate key.So this is not in BCNF.

For 3NF, the relation is in 3NF because in all functional dependencies we dont have any transitive dependencies.


# question 2

R=(A,B,C,D,E)

**taking closure of CE we get , (CE)+ = (DBCEA) , so this is the candidate key for the relation R**. Prime attributes are : (C,E) and non prime attributes are : (A,B,D).

functional dependencies are defined as : CE->A,D->B,C->A

if we check the bcnf of the relation R , CE->A satisfies bcnf but others two are not in bcnf, in case of 3nf CE->D and C->A satisfies 3nf D->B does not satisfy.In case of 2nf CE-> D and D->B satisfies but C->A does not satisfy.

So the table in 1nf but not in 2nf or 3nf or bcnf

to make it in 2nf decomposition will be like **R1(BDEC) and R2(CA)**
R1 follows CE->D AND D->B and R2 follows C->A, now the relation R1 in 2nf and R2 in 2nf as well as in bcnf because it contains only 2 attributes.

to make it in 3nf, decomposition of R1 will be like **R3(CED) and R4(DB)**
R3 follows CE->D AND ommited D->B and R4 follows D->B, now the relation R3 in 3nf and R4 in 3nf as well as in bcnf because it contains only 2 attributes.

Now no need to make it to BCNF anymore because the relations are already in BCNF.


# question3

R(A, B, C, D, E, F)

F ={ABC → D, ABD→E,CD→F,CDF →B,BF →D}

if we check the closure of ABC we get, (ABC)+ = (ABCDEF)

if we check the closure of ABC we get, (ACD)+ = (ACDFBE)

so we get 2 candidate keys {ABC,ACD}


# question 4

1.advantages of normalization :

* Reduce data redundancy : breaking a table into smaller table helps to remove redundent data from relations or table.It helps to keep tracks of data while updating or deleting chunck of data.

* Increase data integrity : data integrity refers to consistency and accuracy of data. Breaking into smaller tables ensure that all pieces kept together while updaing or deleting datas.It will reduce chances of data loss while updating or deleting.

* Improve query performance : While tables are normalized it ensures more speed and performance in terms of performing complex queries.It boost up the speed the application.


1.disadvantages of normalization :

* Increase complexity : In case of normalization tables are decomposed into smaller tables ,so necessary datas will be present in different tables. Now to write complex query you need to join or use subqueries,so it increse the complexity of the query.

* Slower write performance : While normalized databases can improve query performance on reads (select statements), they can actually slow down write performance (update/insert/delete statements) as it necessary to write in so many different places.


# question5

R(STUV)

functional dependencies are : S->T , T->U , U->V , V->S
closure checking ,
S+ = TUVS

T+ = UVST

U+ = VSTU

v+ = STUV

here all the attributes are prime attributes because they all are candidate keys itself.

so we can break down the table just keeping some attributes between then ,
Here, the decomposition will be like :
**R1(STU) and R2(UV)**  and these relations are in both 2nf and 3nf and bcnf.

