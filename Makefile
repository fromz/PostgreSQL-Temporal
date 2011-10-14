EXTENSION    = temporal
EXTVERSION   = 0.7.0

DATA         = sql/temporal--0.7.0.sql
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
PG91         = $(shell $(PG_CONFIG) --version | grep -qE " 8\.| 9\.0" && echo no || echo yes)

ifeq ($(PG91),yes)
all: sql/$(EXTENSION)--$(EXTVERSION).sql

sql/$(EXTENSION)--$(EXTVERSION).sql: $(EXTENSION).sql.in
	cp $< $@

DATA = $(wildcard sql/*--*.sql) sql/$(EXTENSION)--$(EXTVERSION).sql
EXTRA_CLEAN = sql/$(EXTENSION)--$(EXTVERSION).sql
endif

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
