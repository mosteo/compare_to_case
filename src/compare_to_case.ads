generic
   type Comparable (<>) is limited private;
   with function "<" (L, R : Comparable) return Boolean;
package Compare_To_Case is

   type Result is (Left_First, Equal, Right_First);

   function Is_Same (L, R : Comparable) return Boolean
   is (not (L < R) and then not (R < L));
   --  If the provided "<" does not honor this property, the result of the
   --  following compare function will be wrong.

   function Compare (L, R : Comparable) return Result
   --  This is the purpose of this crate, which is to get in one call the three
   --  possible outcomes of comparing two values.
     with Post => Compare'Result =
       (if L < R
        then Left_First
        else (if R < L
              then Right_First
              else Equal));

end Compare_To_Case;
