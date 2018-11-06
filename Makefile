queries=$(wildcard query_qualification/*.sql)

all: matrix.png


systems_results/hyper/answer_sets/%.ans: query_qualification/%.sql
	psql -p 7483 -h localhost -w --field-separator '	' -A -t -P null='' -f $< > $@

hyper.tsv : roundingdiff.py answer_sets_nulls_last/*.ans $(patsubst query_qualification/%.sql, systems_results/hyper/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_last systems_results/hyper/answer_sets > $@


systems_results/sqlserver/answer_sets/%.ans: query_qualification/%.sql
	./systems_results/sqlserver/query-sqlserver.sh $< > $@

sqlserver.tsv : roundingdiff.py answer_sets_nulls_first/*.ans $(patsubst query_qualification/%.sql, systems_results/sqlserver/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_first systems_results/sqlserver/answer_sets > $@


systems_results/postgres/answer_sets/%.ans: query_qualification/%.sql
	psql  -U postgres  -p 5432 -h localhost -w --field-separator '	' -A -t -P null='' -f $< > $@

postgres.tsv : roundingdiff.py answer_sets_nulls_last/*.ans $(patsubst query_qualification/%.sql, systems_results/postgres/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_last systems_results/postgres/answer_sets > $@


systems_results/db2/answer_sets/%.ans: query_qualification/%.sql
	DYLD_LIBRARY_PATH="/Applications/dsdriver/lib":"$DYLD_LIBRARY_PATH" python3 systems_results/db2/query_db2.py $< > $@

db2.tsv : roundingdiff.py answer_sets_nulls_last/*.ans $(patsubst query_qualification/%.sql, systems_results/db2/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_last systems_results/db2/answer_sets > $@


systems_results/monetdb/answer_sets/%.ans: query_qualification/%.sql
	mclient -ftab < $< > $@

monetdb.tsv : roundingdiff.py answer_sets_nulls_first/*.ans $(patsubst query_qualification/%.sql, systems_results/monetdb/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_first systems_results/monetdb/answer_sets > $@


systems_results/oracle/answer_sets/%.ans: query_qualification/%.sql
	./systems_results/oracle/query-oracle.sh $< > $@

oracle.tsv : roundingdiff.py answer_sets_nulls_first/*.ans $(patsubst query_qualification/%.sql, systems_results/oracle/answer_sets/%.ans, $(queries))
	./roundingdiff.py answer_sets_nulls_last systems_results/oracle/answer_sets > $@


# # sqlite.tsv : roundingdiff.py answer_sets_nulls_first/*.ans systems_results/sqlite/answer_sets/*.ans
# # 	./roundingdiff.py answer_sets_nulls_first systems_results/sqlite/answer_sets > $@

matrix.pdf : plot-matrix.R hyper.tsv monetdb.tsv oracle.tsv postgres.tsv sqlite.tsv sqlserver.tsv db2.tsv
	R --quiet -f plot-matrix.R 

matrix.png : matrix.pdf
	convert -density 300 matrix.pdf matrix.png
