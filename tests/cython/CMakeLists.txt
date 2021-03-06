INCLUDE_DIRECTORIES(
	${PYTHON_INCLUDE_PATH}
)

# The PythonModuleUTest is derived from the CogServer class, and so 
# cannot be tested unless the cogserver is actually being built!
IF (HAVE_SERVER)
	ADD_CXXTEST(PythonModuleUTest)
	ADD_DEPENDENCIES(PythonModuleUTest
		PythonModule
	)
	CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/tests/cython/pymodule.conf
		${PROJECT_BINARY_DIR}/tests/cython/pymodule.conf)

	TARGET_LINK_LIBRARIES(PythonModuleUTest
		PythonModule
		server
		${ATOMSPACE_LIBRARIES}
		${COGUTIL_LIBRARY}
	)
	SET_TESTS_PROPERTIES(PythonModuleUTest
		PROPERTIES ENVIRONMENT
		"PYTHONPATH=/usr/local/share/opencog/python:${PROJECT_BINARY_DIR}/opencog/cython"
	)
ENDIF (HAVE_SERVER)


# The PyEvalUTest is derived from the CogServer class, and so 
# cannot be tested unless the cogserver is actually being built!
IF (HAVE_SERVER)
	ADD_CXXTEST(PyEvalUTest)
	CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/tests/cython/pyeval.conf
		${PROJECT_BINARY_DIR}/tests/cython/pyeval.conf)

	TARGET_LINK_LIBRARIES(PyEvalUTest
		py-shell
		server
		${ATOMSPACE_LIBRARIES}
		${COGUTIL_LIBRARY}
	)
	SET_TESTS_PROPERTIES(PyEvalUTest
		PROPERTIES ENVIRONMENT "PYTHONPATH=/usr/local/share/opencog/python")

ENDIF (HAVE_SERVER)


IF (HAVE_NOSETESTS)

	IF (HAVE_SERVER)
		ADD_TEST(CythonServer ${NOSETESTS_EXECUTABLE} -vs
			${CMAKE_SOURCE_DIR}/tests/cython/server/)
		SET_TESTS_PROPERTIES(CythonServer
			PROPERTIES ENVIRONMENT
			"PYTHONPATH=/usr/local/share/opencog/python:${PROJECT_BINARY_DIR}/opencog/cython:${PROJECT_SOURCE_DIR}/tests/cython/agents")
	ENDIF(HAVE_SERVER)

	IF (HAVE_MOSES)
		ADD_TEST(CythonMoses ${NOSETESTS_EXECUTABLE} -vs
			${CMAKE_SOURCE_DIR}/tests/cython/moses/)
		SET_TESTS_PROPERTIES(CythonMoses
			PROPERTIES ENVIRONMENT "PYTHONPATH=${PROJECT_BINARY_DIR}/opencog/cython")
	ENDIF (HAVE_MOSES)

	IF (HAVE_STATISTICS)
		ADD_TEST(CythonStatistics ${NOSETESTS_EXECUTABLE} -vs
			${CMAKE_SOURCE_DIR}/tests/cython/statistics/)
		SET_TESTS_PROPERTIES(CythonStatistics
			PROPERTIES ENVIRONMENT "PYTHONPATH=${PROJECT_BINARY_DIR}/opencog/cython")
	ENDIF (HAVE_STATISTICS)

ENDIF (HAVE_NOSETESTS)
