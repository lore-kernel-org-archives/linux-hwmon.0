Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:17530 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932169AbcHBL3j (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:29:39 -0400
From: Baole Ni <baolex.ni@intel.com>
To: hdegoede@redhat.com, jdelvare@suse.com, linux@roeck-us.net,
	airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0234/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:51:58 +0800
Message-Id: <20160802105158.29348-1-baolex.ni@intel.com>
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
 drivers/hwmon/abituguru.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index 7a09c16..84d7070 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -194,7 +194,7 @@ MODULE_PARM_DESC(pwms, "Number of PWMs on the uGuru "
 
 /* Default verbose is 2, since this driver is still in the testing phase */
 static int verbose = 2;
-module_param(verbose, int, 0644);
+module_param(verbose, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(verbose, "How verbose should the driver be? (0-3):\n"
 	"   0 normal output\n"
 	"   1 + verbose error reporting\n"
-- 
2.9.2

