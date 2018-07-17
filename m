Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
From: Andrew Lunn <andrew@lunn.ch>
To: David Miller <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-hwmon@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next 1/4] hwmon: Add missing HWMON_T_LCRIT_ALARM define
Date: Tue, 17 Jul 2018 21:48:10 +0200
Message-Id: <1531856893-27884-2-git-send-email-andrew@lunn.ch>
In-Reply-To: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
References: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
List-ID: <linux-hwmon@vger.kernel.org>

The enum hwmon_temp_lcrit_alarm exists, but the BIT definition is
missing.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 include/linux/hwmon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index e5fd2707b6df..1b74ad11a5a4 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -93,6 +93,7 @@ enum hwmon_temp_attributes {
 #define HWMON_T_MIN_ALARM	BIT(hwmon_temp_min_alarm)
 #define HWMON_T_MAX_ALARM	BIT(hwmon_temp_max_alarm)
 #define HWMON_T_CRIT_ALARM	BIT(hwmon_temp_crit_alarm)
+#define HWMON_T_LCRIT_ALARM	BIT(hwmon_temp_lcrit_alarm)
 #define HWMON_T_EMERGENCY_ALARM	BIT(hwmon_temp_emergency_alarm)
 #define HWMON_T_FAULT		BIT(hwmon_temp_fault)
 #define HWMON_T_OFFSET		BIT(hwmon_temp_offset)
-- 
2.18.0
