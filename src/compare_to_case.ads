package Compare_To_Case is

   type Result is (Left, Equal, Right);

   type Bool_Result is (Left, Right, None, Both);

   -------------
   -- Compare --
   -------------

   generic
      type Comparable (<>) is limited private;
      with function "<" (L, R : Comparable) return Boolean is <>;
   function Compare (L, R : Comparable) return Result
   --  This is the purpose of this crate, which is to get in one call the three
   --  possible outcomes of comparing two values.
     with Post => Compare'Result =
       (if L < R
        then Left
        else (if R < L
              then Right
              else Equal));

   ---------------
   -- Which_One --
   ---------------

   function Which_One (L, R : Boolean) return Bool_Result
   is (if L and then not R then
          Left
       elsif R and then not L then
          Right
       elsif L then
          Both
       else
          None);

end Compare_To_Case;
