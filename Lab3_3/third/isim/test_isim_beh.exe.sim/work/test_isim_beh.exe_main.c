/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_07958154198403372893_2271994298_init();
    work_m_06868191895762026758_1055338038_init();
    work_m_10470631230489975571_2459206784_init();
    work_m_02676820892707897410_3188736432_init();
    work_m_16499900279475574498_3793167531_init();
    work_m_04468806988247211995_1985558087_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_04468806988247211995_1985558087");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
