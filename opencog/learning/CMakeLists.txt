ADD_SUBDIRECTORY (clustering)

IF (HAVE_DIMEMBED)
    ADD_SUBDIRECTORY (dimensionalembedding)
ENDIF (HAVE_DIMEMBED)

IF (HAVE_ATOMSPACE)
    ADD_SUBDIRECTORY (PatternMiner)
ENDIF (HAVE_ATOMSPACE)

IF (HAVE_STATISTICS)
    ADD_SUBDIRECTORY (statistics)
ENDIF (HAVE_STATISTICS)