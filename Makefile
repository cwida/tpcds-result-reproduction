all: matrix.pdf

clean:
	rm -f *.pdf *.tsv


hyper.tsv : roundingdiff.py answer_sets_nulls_last/*.ans systems_results/hyper/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_last systems_results/hyper/answer_sets > hyper.tsv

db2.tsv : roundingdiff.py answer_sets_nulls_last/*.ans systems_results/db2/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_last systems_results/db2/answer_sets > db2.tsv

monetdb.tsv : roundingdiff.py answer_sets_nulls_first/*.ans systems_results/monetdb/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/monetdb/answer_sets > monetdb.tsv

oracle.tsv : roundingdiff.py answer_sets_nulls_first/*.ans systems_results/oracle/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/oracle/answer_sets > oracle.tsv

postgres.tsv : roundingdiff.py answer_sets_nulls_last/*.ans systems_results/postgres/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_last systems_results/postgres/answer_sets > postgres.tsv

sqlite.tsv : roundingdiff.py answer_sets_nulls_first/*.ans systems_results/sqlite/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/sqlite/answer_sets > sqlite.tsv

sqlserver.tsv : roundingdiff.py answer_sets_nulls_first/*.ans systems_results/sqlserver/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/sqlserver/answer_sets > sqlserver.tsv

matrix.pdf : plot-matrix.R hyper.tsv monetdb.tsv oracle.tsv postgres.tsv sqlite.tsv sqlserver.tsv db2.tsv
	R -f plot-matrix.R 
