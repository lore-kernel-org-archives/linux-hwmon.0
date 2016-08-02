Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:41330 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932198AbcHBLaN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:30:13 -0400
From: Baole Ni <baolex.ni@intel.com>
To: linux@roeck-us.net, jdelvare@suse.com, airlied@linux.ie,
	kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0241/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:31 +0800
Message-Id: <20160802105231.29810-1-baolex.ni@intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/hwmon/pmbus/zl6100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 771802d..369d3b3 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -59,7 +59,7 @@ struct zl6100_data {
 #define ZL6100_WAIT_TIME		1000	/* uS	*/
 
 static ushort delay = ZL6100_WAIT_TIME;
-module_param(delay, ushort, 0644);
+module_param(delay, ushort, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(delay, "Delay between chip accesses in uS");
 
 /* Convert linear sensor value to milli-units */
-- 
2.9.2

