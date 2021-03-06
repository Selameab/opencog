;; Define simple implications to test implication instantiation rules

(ImplicationLink (stv 1 1)
   (TypedVariableLink
      (VariableNode "$X")
      (TypeNode "ConceptNode"))
   (EvaluationLink
      (PredicateNode "P")
      (VariableNode "$X"))
   (EvaluationLink
      (PredicateNode "Q")
      (VariableNode "$X")))

(EvaluationLink (stv 1 1)
   (PredicateNode "P")
   (ConceptNode "A"))

(ImplicationLink (stv 1 1)
   (VariableList
      (TypedVariableLink
         (VariableNode "$X")
         (TypeNode "ConceptNode"))
      (TypedVariableLink
         (VariableNode "$Y")
         (TypeNode "ConceptNode")))
   (EvaluationLink
      (PredicateNode "P")
      (ListLink
         (VariableNode "$X")
         (VariableNode "$Y")))
   (EvaluationLink
      (PredicateNode "Q")
      (ListLink
         (VariableNode "$Y")
         (VariableNode "$X"))))

(EvaluationLink (stv 1 1)
   (PredicateNode "P")
   (ListLink
      (ConceptNode "A")
      (ConceptNode "B")))
