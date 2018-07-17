Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:37367 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729720AbeGQUXN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jul 2018 16:23:13 -0400
From: Andrew Lunn <andrew@lunn.ch>
To: David Miller <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next 3/4] hwmon: Add helper to tell if a char is invalid in a name
Date: Tue, 17 Jul 2018 21:48:12 +0200
Message-Id: <1531856893-27884-4-git-send-email-andrew@lunn.ch>
In-Reply-To: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
References: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

HWMON device names are not allowed to contain "-* \t\n". Add a helper
which will return true if passed an invalid character. It can be used
to massage a string into a hwmon compatible name by replacing invalid
characters with '_'.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 include/linux/hwmon.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index b217101ca76e..9493d4a388db 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -398,4 +398,27 @@ devm_hwmon_device_register_with_info(struct device *dev,
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
 
+/**
+ * hwmon_is_bad_char - Is the char invalid in a hwmon name
+ * @ch: the char to be considered
+ *
+ * hwmon_is_bad_char() can be used to determine if the given character
+ * may not be used in a hwmon name.
+ *
+ * Returns true if the char is invalid, false otherwise.
+ */
+static inline bool hwmon_is_bad_char(const char ch)
+{
+	switch (ch) {
+	case '-':
+	case '*':
+	case ' ':
+	case '\t':
+	case '\n':
+		return true;
+	default:
+		return false;
+	}
+}
+
 #endif
-- 
2.18.0

