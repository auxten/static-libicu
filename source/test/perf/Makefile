## Makefile.in for ICU tests
##
## Copyright (C) 2016 and later: Unicode, Inc. and others.
## License & terms of use: http://www.unicode.org/copyright.html#License
##
## Copyright (c) 1999-2011, International Business Machines Corporation and
## others. All Rights Reserved.

## Source directory information
srcdir = .
top_srcdir = ../..

top_builddir = ../..

include $(top_builddir)/icudefs.mk

## Build directory information
subdir = test/perf

IOTEST = iotest

## Files to remove for 'make clean'
CLEANFILES = *~

SUBDIRS = collationperf collperf collperf2 charperf dicttrieperf normperf ubrkperf unisetperf usetperf ustrperf utfperf utrie2perf DateFmtPerf howExpensiveIs

# Subdirs that support 'xperf'
XSUBDIRS = DateFmtPerf

## List of phony targets
.PHONY : everything all all-local all-recursive install install-local		\
install-recursive clean clean-local clean-recursive distclean		\
distclean-local distclean-recursive dist dist-recursive dist-local	\
check check-recursive check-local xperf xperf-recursive

## Clear suffix list
.SUFFIXES :

## List of standard targets
everything: all-recursive all-local
all:
ifneq ($(RECURSIVE),YES)
	@echo simply use \`make\' \(or \`make everything\'\) to do all
endif

install: install-recursive install-local
clean: clean-recursive clean-local
distclean : distclean-recursive distclean-local
	$(RMV) hdrtst/Makefile
	$(RMV) perf/convperf/Makefile

dist: dist-recursive dist-local
check: everything check-recursive check-local
check-recursive: all-recursive

xperf: everything
	list='$(XSUBDIRS)'; for xsubdir in $$list; do \
		$(MAKE) -w -C $$xsubdir xperf; \
	done

## Recursive targets
all-recursive install-recursive clean-recursive distclean-recursive dist-recursive check-recursive:
	@dot_seen=no; \
	target=`echo $@ | sed s/-recursive//`; \
	list='$(SUBDIRS)'; for subdir in $$list; do \
	  echo "$(MAKE)[$(MAKELEVEL)]: Making \`$$target' in \`$$subdir'"; \
	  if test "$$subdir" = "."; then \
	    dot_seen=yes; \
	    local_target="$$target-local"; \
	  else \
	    local_target="$$target"; \
	  fi; \
	  (cd $$subdir && $(MAKE) $$local_target) || exit; \
	done; \
	if test "$$dot_seen" = "no"; then \
	  $(MAKE) "$$target-local" || exit; \
	fi

all-local:

install-local:

dist-local:

clean-local:
	test -z "$(CLEANFILES)" || $(RMV) $(CLEANFILES)

distclean-local: clean-local
	$(RMV) Makefile

check-local: all-local

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	&& CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status

