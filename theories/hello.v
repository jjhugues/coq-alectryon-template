(*|

=================================================
Literate programming with Alectryon (Coq input)
=================================================

Alectryon supports literate programs and documents (combinations of
code and prose) written in Coq and reStructuredText.  Here is an
example, written in Coq.

.. image:: coq.png
    :width: 200px
    :align: center
    :height: 100px
    :alt: alternate text

.. math::
   A^\alpha = \left({\phi\over c}, {\bf A}\right)

.. coq:: none
|*)

Require Import Arith.

(*|
Here's an *inductive specification* of evenness:

.. index::
   single: even

.. coq::

|*)

Inductive Even : nat -> Prop :=
| EvenO : Even O
| EvenS : forall n, Even n -> Even (S (S n)).

(*|
… and a corresponding decision procedure:
|*)

Fixpoint even (n: nat): bool :=
  match n with
  | 0 => true
  | 1 => false
  | S (S n) => even n
  end.

(* Ensure that we never unfold [even (S n)] *)
Arguments even : simpl nomatch.

(* no-hyps no-goals unfold *)

(*|
Strengthening the spec
======================
The usual approach is to strengthen the spec to work around the weakness of the inductive principle.
no-hyps no-goals unfold

.. coq::
|*)

Lemma even_Even :
  forall n, (even n = true <-> Even n) /\
       (even (S n) = true <-> Even (S n)). (* .fold *)
Proof. (* .fold *)
  induction n; cbn.
  - (* n ← 0 *)
    repeat split; cbn.
    all: try constructor.
    all: inversion 1.
  - (* n ← S _ *)
    destruct IHn as ((Hne & HnE) & (HSne & HSnE)).
    repeat split; cbn.
    all: eauto using EvenS.
    inversion 1; eauto.
Qed.

(*|
.. coq::
   :class: coq-math-2
|*)

   Notation "\mathbb{B}" := bool.
   Print bool. (* .unfold *)
