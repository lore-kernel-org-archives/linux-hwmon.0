Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:64772 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752075AbdCPX1j (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Mar 2017 19:27:39 -0400
From: Peter Huewe <peterhuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH] hwmon: Add missing HWMON_T_ALARM
Date: Fri, 17 Mar 2017 00:28:56 +0100
Message-Id: <1489706936-26535-1-git-send-email-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Unfortunately the HWMON_T_ALARM define was missing,
although the associated entry was present in hwmon_temp_attributes.
This is needed to convert drivers to the new interface which use channel
based alarms.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 include/linux/hwmon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 78d59dba563e..88b673749121 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -88,6 +88,7 @@ enum hwmon_temp_attributes {
 #define HWMON_T_CRIT_HYST	BIT(hwmon_temp_crit_hyst)
 #define HWMON_T_EMERGENCY	BIT(hwmon_temp_emergency)
 #define HWMON_T_EMERGENCY_HYST	BIT(hwmon_temp_emergency_hyst)
+#define HWMON_T_ALARM		BIT(hwmon_temp_alarm)
 #define HWMON_T_MIN_ALARM	BIT(hwmon_temp_min_alarm)
 #define HWMON_T_MAX_ALARM	BIT(hwmon_temp_max_alarm)
 #define HWMON_T_CRIT_ALARM	BIT(hwmon_temp_crit_alarm)
-- 
2.7.3

