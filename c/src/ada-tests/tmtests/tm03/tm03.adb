--
--  MAIN / BODY
--
--  DESCRIPTION:
--
--  This is the entry point for Test TM03 of the Single Processor Test Suite.
--
--  DEPENDENCIES: 
--
--  
--
--  COPYRIGHT (c) 1989-1997.
--  On-Line Applications Research Corporation (OAR).
--  Copyright assigned to U.S. Government, 1994.
--
--  The license and distribution terms for this file may in
--  the file LICENSE in this distribution or at
--  http://www.OARcorp.com/rtems/license.html.
--
--  $Id$
--

with RTEMS;
with TMTEST;
with TEST_SUPPORT;

procedure TM03 is
  INIT_ID : RTEMS.ID;
  STATUS  : RTEMS.STATUS_CODES;
begin

   RTEMS.TASK_CREATE(
      RTEMS.BUILD_NAME(  'I', 'N', 'I', 'T' ),
      1,
      RTEMS.MINIMUM_STACK_SIZE,
      RTEMS.NO_PREEMPT,
      RTEMS.DEFAULT_ATTRIBUTES,
      INIT_ID,
      STATUS
   );
   TEST_SUPPORT.DIRECTIVE_FAILED( STATUS, "TASK_CREATE OF INIT" );


   RTEMS.TASK_START(
      INIT_ID,
      TMTEST.INIT'ACCESS,
      0,
      STATUS
   );
   TEST_SUPPORT.DIRECTIVE_FAILED( STATUS, "TASK_START OF INIT" );

   loop
      delay 120.0;
   end loop;

end TM03;

