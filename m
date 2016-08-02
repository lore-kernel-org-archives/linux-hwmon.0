Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:50913 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932200AbcHBLaN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:30:13 -0400
From: Baole Ni <baolex.ni@intel.com>
To: clemens@ladisch.de, jdelvare@suse.com, linux@roeck-us.net,
	airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0240/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:26 +0800
Message-Id: <20160802105226.29744-1-baolex.ni@intel.com>
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
 drivers/hwmon/k10temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 9cdfde6..ffdef73 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -30,7 +30,7 @@ MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
 MODULE_LICENSE("GPL");
 
 static bool force;
-module_param(force, bool, 0444);
+module_param(force, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
 
 /* Provide lock for writing to NB_SMU_IND_ADDR */
-- 
2.9.2

