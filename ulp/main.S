#include "soc/soc_ulp.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/rtc_io_reg.h"

entry:
    STAGE_RST

exit:
    HALT

try_wakeup:
    // try to wake up
    STAGE_INC 1
    //jump to exit when stage count > 10
    JUMPS exit, 10, GT
    // if RTC_CNTL_RDY_FOR_WAKEUP is 0, even with wake, still in sleep mode 
    // RTC_CNTL_LOW_POWER_ST_REG is the register that store RTC_CNTL_RDY_FOR_WAKEUP
    // READ_RTC_FIELD read from a field of the RTC register into R0
    READ_RTC_FIELD(RTC_CNTL_RDY_FOR_WAKEUP, RTC_CNTL_LOW_POWER_ST_REG) 
    AND R0, R0, 1
    JUMP try_wakeup, EQ //Jump to try_wakeup when latest operation is 0
    WAKE