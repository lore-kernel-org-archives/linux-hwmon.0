Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:1040 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754709AbcHBL3p (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:29:45 -0400
From: Baole Ni <baolex.ni@intel.com>
To: alistair@devzero.co.uk, jdelvare@suse.com, linux@roeck-us.net,
	airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0235/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:02 +0800
Message-Id: <20160802105202.29414-1-baolex.ni@intel.com>
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
 drivers/hwmon/abituguru3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index 3d2a4ae..262bb8c 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -635,7 +635,7 @@ module_param(force, bool, 0);
 MODULE_PARM_DESC(force, "Set to one to force detection.");
 /* Default verbose is 1, since this driver is still in the testing phase */
 static bool verbose = 1;
-module_param(verbose, bool, 0644);
+module_param(verbose, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(verbose, "Enable/disable verbose error reporting");
 
 static const char *never_happen = "This should never happen.";
-- 
2.9.2

