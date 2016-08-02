Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48063 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755300AbcHBL3y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:29:54 -0400
From: Baole Ni <baolex.ni@intel.com>
To: fenghua.yu@intel.com, jdelvare@suse.com, linux@roeck-us.net,
	airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0237/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:12 +0800
Message-Id: <20160802105212.29546-1-baolex.ni@intel.com>
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
 drivers/hwmon/coretemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6a27eb2..83ba05c 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -48,7 +48,7 @@
  * When set, it replaces the driver's suboptimal heuristic.
  */
 static int force_tjmax;
-module_param_named(tjmax, force_tjmax, int, 0444);
+module_param_named(tjmax, force_tjmax, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
 
 #define BASE_SYSFS_ATTR_NO	2	/* Sysfs Base attr no for coretemp */
-- 
2.9.2

