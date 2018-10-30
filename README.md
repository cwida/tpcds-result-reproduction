[TPC-DS ("Decision Support")](http://www.tpc.org/tpcds/) is a standardized database benchmark. The benchmark toolkit contains reference ("qualification") queries and results. These are quite useful to check data management systems for bugs, as data, query and result are known and standardized.

However, as so often, reality is not so easy. The reference answers that ship with TPC-DS are quite broken, both from a syntactical and semantic perspective. In this repository, we present a cleaned and corrected set of TPC-DS queries and reference answers. We also include a tool (`roundingdiff.py`) that can automatically check sets of query answers against the reference in this repository, allowing some minor numerical drift. 

Since there were serious issues with several reference results, we have fixed them by consensus (two ore more actual systems agreeing) where neccessary. 

In addition, we have included results froms several popular data management systems for further reference, Oracle, SQL Server, PostgreSQL, HyPer, MonetDB and SQLite. The plot below shows how these systems agree with the reference results in this repo. SQL Server and Oracle achieved a perfect score. [Some slides](https://homepages.cwi.nl/~hannes/tpcds-slides.pdf) about the effort are available as well.

The qualification queries were created by replacing the qualification values from the TPC-DS spec in the query templates. In addition, we have reformulated the queries to be more compatible with a broad range of systems. Queries range from 1 to 99. The original query templates 14, 23, 24 and 39 contained two queries, they were split up in query 14a and 14b, etc.

Because databases cannot agree whether NULL values should be first or last in sorting order, there are two sets of reference results, `answer_sets_nulls_first` (Oracle, SQL Server, MonetDB, SQLite) and `answer_sets_nulls_last` (PostgreSQL and HyPer).

Here is a plot of the results. Green means results match the (fixed) references, yellow means some differences remain and red means the system failed to create a result for the query.

![TPC-DS Results Matrix](https://homepages.cwi.nl/~hannes/tpcds-matrix.png)


All reference results are given as tab-separated files, without any quotes, headers or other fluff. Reference results are named `XYZ.ans`, where `XYZ.sql` is the name of the query that produced them in the `query_qualification` folder. The whole set of reference results can be compared with experiment results using the `roundingdiff.py` script, for example

`./roundingdiff.py answer_sets_nulls_last systems_results/hyper/answer_sets`

Individual query results can be compared like so:

`./roundingdiff.py answer_sets_nulls_last/01.ans systems_results/hyper/answer_sets/01.ans`

The output of the folder comparision can be used in the `plot-matrix.R` script for visualization. If you are looking for a copy of the TPC-DS Scale Factor 1 Qualification dataset, we provide a [copy as a direct download](https://homepages.cwi.nl/~hannes/tpcds-sf1-xz/).

The repo also contains a `Makefile` that will produce our plot from the answer files in the repository. Extend as desired.

We welcome and value additions or corrections to this repo through pull requests. 
