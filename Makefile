EXTENSION    = temporal
EXTVERSION   = 0.7.1

DATA         = sql/temporal--0.7.1.sql
DATA_built   = temporal.sql
DOCS         = doc/html/abstract.html    \
               doc/html/index.html       \
               doc/html/index.dist.html  \
               doc/html/reference.html   \
               doc/html/tutorial.html
TESTS        = test/sql/period.sql
REGRESS      = period
REGRESS_OPTS = --inputdir=test --load-language=plpgsql
MODULES      = temporal

PG_CONFIG    = pg_config

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
