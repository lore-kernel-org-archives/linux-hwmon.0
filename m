Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:24000 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755369AbcHBL36 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:29:58 -0400
From: Baole Ni <baolex.ni@intel.com>
To: pali.rohar@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
	airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0238/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:17 +0800
Message-Id: <20160802105217.29612-1-baolex.ni@intel.com>
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
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c43318d..04863a5 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -99,7 +99,7 @@ module_param(restricted, bool, 0);
 MODULE_PARM_DESC(restricted, "Allow fan control if SYS_ADMIN capability set");
 
 static bool power_status;
-module_param(power_status, bool, 0600);
+module_param(power_status, bool, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(power_status, "Report power status in /proc/i8k");
 #endif
 
-- 
2.9.2

