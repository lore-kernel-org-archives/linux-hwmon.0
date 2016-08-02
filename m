Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:1165 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755063AbcHBL3t (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:29:49 -0400
From: Baole Ni <baolex.ni@intel.com>
To: jdelvare@suse.com, linux@roeck-us.net, airlied@linux.ie,
	kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0236/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:08 +0800
Message-Id: <20160802105208.29480-1-baolex.ni@intel.com>
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
 drivers/hwmon/acpi_power_meter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 579bdf9..11460f7 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -1008,7 +1008,7 @@ MODULE_AUTHOR("Darrick J. Wong <darrick.wong@oracle.com>");
 MODULE_DESCRIPTION("ACPI 4.0 power meter driver");
 MODULE_LICENSE("GPL");
 
-module_param(force_cap_on, bool, 0644);
+module_param(force_cap_on, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(force_cap_on, "Enable power cap even it is unsafe to do so.");
 
 module_init(acpi_power_meter_init);
-- 
2.9.2

