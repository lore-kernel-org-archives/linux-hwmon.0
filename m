Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46519 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753891AbdGSOCJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2017 10:02:09 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jc42) Add support for CAT34TS02C
Date: Wed, 19 Jul 2017 07:01:58 -0700
Message-Id: <1500472918-32331-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

CAT34TS02C is similar to CAT34TS02 but has a different device ID.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index edb6a81a0e10..5f11dc014ed6 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -139,6 +139,9 @@ static const unsigned short normal_i2c[] = {
 #define CAT6095_DEVID		0x0800	/* Also matches CAT34TS02 */
 #define CAT6095_DEVID_MASK	0xffe0
 
+#define CAT34TS02C_DEVID	0x0a00
+#define CAT34TS02C_DEVID_MASK	0xfff0
+
 #define CAT34TS04_DEVID		0x2200
 #define CAT34TS04_DEVID_MASK	0xfff0
 
@@ -184,6 +187,7 @@ static struct jc42_chips jc42_chips[] = {
 	{ MCP_MANID, MCP9843_DEVID, MCP9843_DEVID_MASK },
 	{ NXP_MANID, SE97_DEVID, SE97_DEVID_MASK },
 	{ ONS_MANID, CAT6095_DEVID, CAT6095_DEVID_MASK },
+	{ ONS_MANID, CAT34TS02C_DEVID, CAT34TS02C_DEVID_MASK },
 	{ ONS_MANID, CAT34TS04_DEVID, CAT34TS04_DEVID_MASK },
 	{ NXP_MANID, SE98_DEVID, SE98_DEVID_MASK },
 	{ STM_MANID, STTS424_DEVID, STTS424_DEVID_MASK },
-- 
2.7.4

