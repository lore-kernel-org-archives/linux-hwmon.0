Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13018 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754309AbcHBLaC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 07:30:02 -0400
From: Baole Ni <baolex.ni@intel.com>
To: jdelvare@suse.com, linux@roeck-us.net, airlied@linux.ie,
	kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com,
	aduggan@synaptics.com, dianders@chromium.org
Subject: [PATCH 0239/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:52:21 +0800
Message-Id: <20160802105221.29678-1-baolex.ni@intel.com>
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
 drivers/hwmon/fschmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index d58abdc..a7e4885 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -602,7 +602,7 @@ static ssize_t store_alert_led(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(alert_led, 0644, show_alert_led, store_alert_led);
+static DEVICE_ATTR(alert_led, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_alert_led, store_alert_led);
 
 static struct sensor_device_attribute fschmd_attr[] = {
 	SENSOR_ATTR(in0_input, 0444, show_in_value, NULL, 0),
-- 
2.9.2

