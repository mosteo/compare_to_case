package Compare_To_Case is

   type Result is (Left_First, Equal, Right_First);

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
        then Left_First
        else (if R < L
              then Right_First
              else Equal));

   ----------------
   -- Which_True --
   ----------------

   function Which_True (L, R : Boolean) return Result
   is (if L and then not R then
          Left_First
       elsif R and then not L then
          Right_First
       else
          Equal);

end Compare_To_Case;
