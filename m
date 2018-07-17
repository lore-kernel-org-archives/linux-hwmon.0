Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:37377 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729754AbeGQUX3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jul 2018 16:23:29 -0400
From: Andrew Lunn <andrew@lunn.ch>
To: David Miller <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next 2/4] hwmon: Add support for power min, lcrit, min_alarm and lcrit_alarm
Date: Tue, 17 Jul 2018 21:48:11 +0200
Message-Id: <1531856893-27884-3-git-send-email-andrew@lunn.ch>
In-Reply-To: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
References: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some sensors support reporting minimal and lower critical power, as
well as alarms when these thresholds are reached. Add support for
these attributes to the hwmon core.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/hwmon/hwmon.c | 4 ++++
 include/linux/hwmon.h | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index e88c01961948..33d51281272b 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -394,12 +394,16 @@ static const char * const hwmon_power_attr_templates[] = {
 	[hwmon_power_cap_hyst] = "power%d_cap_hyst",
 	[hwmon_power_cap_max] = "power%d_cap_max",
 	[hwmon_power_cap_min] = "power%d_cap_min",
+	[hwmon_power_min] = "power%d_min",
 	[hwmon_power_max] = "power%d_max",
+	[hwmon_power_lcrit] = "power%d_lcrit",
 	[hwmon_power_crit] = "power%d_crit",
 	[hwmon_power_label] = "power%d_label",
 	[hwmon_power_alarm] = "power%d_alarm",
 	[hwmon_power_cap_alarm] = "power%d_cap_alarm",
+	[hwmon_power_min_alarm] = "power%d_min_alarm",
 	[hwmon_power_max_alarm] = "power%d_max_alarm",
+	[hwmon_power_lcrit_alarm] = "power%d_lcrit_alarm",
 	[hwmon_power_crit_alarm] = "power%d_crit_alarm",
 };
 
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 1b74ad11a5a4..b217101ca76e 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -188,12 +188,16 @@ enum hwmon_power_attributes {
 	hwmon_power_cap_hyst,
 	hwmon_power_cap_max,
 	hwmon_power_cap_min,
+	hwmon_power_min,
 	hwmon_power_max,
 	hwmon_power_crit,
+	hwmon_power_lcrit,
 	hwmon_power_label,
 	hwmon_power_alarm,
 	hwmon_power_cap_alarm,
+	hwmon_power_min_alarm,
 	hwmon_power_max_alarm,
+	hwmon_power_lcrit_alarm,
 	hwmon_power_crit_alarm,
 };
 
@@ -214,12 +218,16 @@ enum hwmon_power_attributes {
 #define HWMON_P_CAP_HYST		BIT(hwmon_power_cap_hyst)
 #define HWMON_P_CAP_MAX			BIT(hwmon_power_cap_max)
 #define HWMON_P_CAP_MIN			BIT(hwmon_power_cap_min)
+#define HWMON_P_MIN			BIT(hwmon_power_min)
 #define HWMON_P_MAX			BIT(hwmon_power_max)
+#define HWMON_P_LCRIT			BIT(hwmon_power_lcrit)
 #define HWMON_P_CRIT			BIT(hwmon_power_crit)
 #define HWMON_P_LABEL			BIT(hwmon_power_label)
 #define HWMON_P_ALARM			BIT(hwmon_power_alarm)
 #define HWMON_P_CAP_ALARM		BIT(hwmon_power_cap_alarm)
+#define HWMON_P_MIN_ALARM		BIT(hwmon_power_max_alarm)
 #define HWMON_P_MAX_ALARM		BIT(hwmon_power_max_alarm)
+#define HWMON_P_LCRIT_ALARM		BIT(hwmon_power_lcrit_alarm)
 #define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
 
 enum hwmon_energy_attributes {
-- 
2.18.0

