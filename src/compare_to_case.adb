package body Compare_To_Case is

   -------------
   -- Compare --
   -------------

   function Compare (L, R : Comparable) return Result is
   begin
      if L < R then
         return Left;
      elsif R < L then
         return Right;
      else
         return Equal;
      end if;
   end Compare;

end Compare_To_Case;
