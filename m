Return-path: <davej@codemonkey.org.uk>
Date: Mon, 29 Aug 2016 12:11:31 -0400
From: Dave Jones <davej@codemonkey.org.uk>
To: linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: it87: NULL terminate attribute list.
Message-ID: <20160829161131.zelpth64i6z4tdl2@codemonkey.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Without the termination, we walk off the end of the list, which is usually
harmless, but KASAN spews this..

BUG: KASAN: global-out-of-bounds in internal_create_group+0x75b/0x970 at addr ffffffffae2d59c8
Read of size 8 by task swapper/0/1
Address belongs to variable it87_attributes_in+0x168/0x1a0
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc4-firewall+ #1
 ffffffffae2d59c8 ffff8801d352f4f0 ffffffffac90ee56 ffff8801d352f588
 ffffffffae2d59c8 ffff8801d352f578 ffffffffac442ccd 0000000000001000
 ffffffffae2d93c0 ffffffffadab6d20 0000000000000297 ffffffffac59b19c
Call Trace:
 [<ffffffffac90ee56>] dump_stack+0x68/0x92
 [<ffffffffac442ccd>] kasan_report_error+0x4dd/0x500
 [<ffffffffac59b19c>] ? __kernfs_create_file+0x1dc/0x280
 [<ffffffffac442ed4>] __asan_report_load8_noabort+0x44/0x50
 [<ffffffffac59f0fb>] ? internal_create_group+0x75b/0x970
 [<ffffffffac59f0fb>] internal_create_group+0x75b/0x970
 [<ffffffffac59f551>] sysfs_create_groups+0x91/0x120
 [<ffffffffacf15866>] device_add+0xe56/0x13e0
 [<ffffffffacf14a10>] ? device_private_init+0x1a0/0x1a0
 [<ffffffffac1b3cd1>] ? __init_waitqueue_head+0x41/0xa0
 [<ffffffffacf3acff>] ? pm_runtime_init+0x35f/0x450
 [<ffffffffacf1605a>] device_register+0x1a/0x20
 [<ffffffffad1d504f>] hwmon_device_register_with_groups.part.4+0x1cf/0x2b0
 [<ffffffffad1d51b4>] hwmon_device_register_with_groups+0x84/0xa0
 [<ffffffffad1d53bc>] devm_hwmon_device_register_with_groups+0x6c/0xd0
 [<ffffffffad1e07ed>] it87_probe+0x154d/0x2aa0
 [<ffffffffac9739f7>] ? debug_smp_processor_id+0x17/0x20
 [<ffffffffac1beeae>] ? get_lock_stats+0x1e/0xa0
 [<ffffffffad1df2a0>] ? show_vid_reg+0xd0/0xd0
 [<ffffffffacf14229>] ? devices_kset_move_last+0x79/0x90
 [<ffffffffaca86262>] ? acpi_dev_pm_attach+0x45/0x179
 [<ffffffffacf23783>] platform_drv_probe+0x83/0x170
 [<ffffffffacf14229>] ? devices_kset_move_last+0x79/0x90
 [<ffffffffacf20172>] driver_probe_device+0x1f2/0x730
 [<ffffffffacf209d3>] __device_attach_driver+0x183/0x240
 [<ffffffffacf20850>] ? __driver_attach+0x1a0/0x1a0
 [<ffffffffacf1ba2f>] bus_for_each_drv+0x11f/0x1c0
 [<ffffffffacf1b910>] ? subsys_find_device_by_id+0x330/0x330
 [<ffffffffad8e89c3>] ? _raw_spin_unlock_irqrestore+0x43/0x70
 [<ffffffffacf1fd3c>] __device_attach+0x1cc/0x2a0
 [<ffffffffacf1fb70>] ? device_bind_driver+0xc0/0xc0
 [<ffffffffac917b6c>] ? kobject_uevent_env+0x22c/0xb40
 [<ffffffffacf20b13>] device_initial_probe+0x13/0x20
 [<ffffffffacf1c304>] bus_probe_device+0x1c4/0x270
 [<ffffffffacf152c7>] device_add+0x8b7/0x13e0
 [<ffffffffacf14a10>] ? device_private_init+0x1a0/0x1a0
 [<ffffffffac15e4ab>] ? preempt_count_sub+0x10b/0x1e0
 [<ffffffffad8e8fe1>] ? _raw_write_unlock+0x31/0x50
 [<ffffffffacf248cc>] platform_device_add+0x27c/0x5f0
 [<ffffffffae5fb7f5>] sm_it87_init+0xabe/0xba9
 [<ffffffffae5fad37>] ? coretemp_init+0x465/0x465
 [<ffffffffac239b5e>] ? ktime_get+0xee/0x2a0
 [<ffffffffae5fad37>] ? coretemp_init+0x465/0x465
 [<ffffffffae5fad37>] ? coretemp_init+0x465/0x465
 [<ffffffffae5937fa>] do_one_initcall+0xf5/0x1e5
 [<ffffffffae593705>] ? start_kernel+0x594/0x594
 [<ffffffffac13513e>] ? parse_args+0x42e/0x850
 [<ffffffffac117d92>] ? __usermodehelper_set_disable_depth+0x42/0x50
 [<ffffffffae593d0c>] kernel_init_freeable+0x422/0x4b3
 [<ffffffffad8d09b4>] kernel_init+0x14/0x120
 [<ffffffffad8e94bf>] ret_from_fork+0x1f/0x40
 [<ffffffffad8d09a0>] ? rest_init+0x160/0x160
Memory state around the buggy address:
 ffffffffae2d5880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffffae2d5900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffffffae2d5980: 00 00 00 00 00 00 00 00 00 fa fa fa fa fa fa fa
                                              ^
 ffffffffae2d5a00: 00 00 00 00 00 00 00 fa fa fa fa fa 00 00 00 00
 ffffffffae2d5a80: 00 00 00 fa fa fa fa fa 00 00 00 00 00 00 00 fa
==================================================================

Signed-off-by; Dave Jones <davej@codemonkey.org.uk>

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index d0203a115eff..89685845abaa 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2015,6 +2015,7 @@ static struct attribute *it87_attributes_in[] = {
 	&sensor_dev_attr_in10_input.dev_attr.attr,	/* 41 */
 	&sensor_dev_attr_in11_input.dev_attr.attr,	/* 41 */
 	&sensor_dev_attr_in12_input.dev_attr.attr,	/* 41 */
+	NULL,
 };
 
 static const struct attribute_group it87_group_in = {
