!KGEN-generated Fortran source file

!Generated at : 2016-03-01 08:44:55
!KGEN version : 0.6.2

!BOP ===========================================================================
!
! !MODULE: shr_log_mod -- variables and methods for logging
!
! !DESCRIPTION:
!    Low-level shared variables for logging.
!
!    Also, routines for generating log file messages.
!
! !INTERFACE: ------------------------------------------------------------------

module shr_log_mod

! !USES:

    USE shr_kind_mod


    USE, INTRINSIC :: iso_fortran_env, ONLY: output_unit

    USE kgen_utils_mod, ONLY: kgen_dp, kgen_array_sumcheck
    IMPLICIT NONE
    PRIVATE

! !PUBLIC TYPES:

   ! no public types

! !PUBLIC MEMBER FUNCTIONS:


! !PUBLIC DATA MEMBERS:

    PUBLIC shr_log_unit

!EOP

  ! low-level shared variables for logging, these may not be parameters
  integer(SHR_KIND_IN) :: shr_log_Unit  = output_unit

  PUBLIC kr_externs_in_shr_log_mod

!===============================================================================
!BOP ===========================================================================
!
! !IROUTINE: shr_log_errMsg -- Return an error message containing file & line info
!
! !DESCRIPTION:
!     Return an error message containing file & line info
!     \newline
!     errMsg = shr\_log\_errMsg("<stdin>", 55)
!
! !REVISION HISTORY:
!     2013-July-23 - Bill Sacks
!
! !INTERFACE: ------------------------------------------------------------------

  
  CONTAINS
  

! !INPUT/OUTPUT PARAMETERS:


!EOP



! Create a message for an out of bounds error.

  ! A name for the operation being attempted when the bounds error
  ! occurred. A string containing the subroutine name is ideal, but more
  ! generic descriptions such as "read", "modify", or "insert" could be used.

  ! Upper and lower bounds allowed for the operation.

  ! Index at which access was attempted.

  ! Output message



  !read state subroutine for kr_externs_in_shr_log_mod
  SUBROUTINE kr_externs_in_shr_log_mod(kgen_unit)
      INTEGER, INTENT(IN) :: kgen_unit
      LOGICAL :: kgen_istrue
      REAL(KIND=8) :: kgen_array_sum
      
      READ (UNIT = kgen_unit) shr_log_unit
  END SUBROUTINE kr_externs_in_shr_log_mod
  
end module shr_log_mod