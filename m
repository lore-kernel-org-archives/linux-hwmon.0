Return-Path: <linux@roeck-us.net>
Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jc42) Add support for GT30TS00, GT34TS02, and CAT34TS04
Date: Sat, 15 Jul 2017 17:02:00 -0700
Message-Id: <1500163320-26254-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Giantec GT30TS00 GT30TS00 and GT34TS02 as well as ONS CAT34TS04
are used on DDR4 DIMMs.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 1bf22eff0b08..edb6a81a0e10 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -72,6 +72,8 @@ static const unsigned short normal_i2c[] = {
 #define NXP_MANID		0x1131  /* NXP Semiconductors */
 #define ONS_MANID		0x1b09  /* ON Semiconductor */
 #define STM_MANID		0x104a  /* ST Microelectronics */
+#define GT_MANID		0x1c68	/* Giantec */
+#define GT_MANID2		0x132d	/* Giantec, 2nd mfg ID */
 
 /* Supported chips */
 
@@ -86,6 +88,13 @@ static const unsigned short normal_i2c[] = {
 #define AT30TSE004_DEVID	0x2200
 #define AT30TSE004_DEVID_MASK	0xffff
 
+/* Giantec */
+#define GT30TS00_DEVID		0x2200
+#define GT30TS00_DEVID_MASK	0xff00
+
+#define GT34TS02_DEVID		0x3300
+#define GT34TS02_DEVID_MASK	0xff00
+
 /* IDT */
 #define TSE2004_DEVID		0x2200
 #define TSE2004_DEVID_MASK	0xff00
@@ -130,6 +139,9 @@ static const unsigned short normal_i2c[] = {
 #define CAT6095_DEVID		0x0800	/* Also matches CAT34TS02 */
 #define CAT6095_DEVID_MASK	0xffe0
 
+#define CAT34TS04_DEVID		0x2200
+#define CAT34TS04_DEVID_MASK	0xfff0
+
 /* ST Microelectronics */
 #define STTS424_DEVID		0x0101
 #define STTS424_DEVID_MASK	0xffff
@@ -158,6 +170,8 @@ static struct jc42_chips jc42_chips[] = {
 	{ ADT_MANID, ADT7408_DEVID, ADT7408_DEVID_MASK },
 	{ ATMEL_MANID, AT30TS00_DEVID, AT30TS00_DEVID_MASK },
 	{ ATMEL_MANID2, AT30TSE004_DEVID, AT30TSE004_DEVID_MASK },
+	{ GT_MANID, GT30TS00_DEVID, GT30TS00_DEVID_MASK },
+	{ GT_MANID2, GT34TS02_DEVID, GT34TS02_DEVID_MASK },
 	{ IDT_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ IDT_MANID, TS3000_DEVID, TS3000_DEVID_MASK },
 	{ IDT_MANID, TS3001_DEVID, TS3001_DEVID_MASK },
@@ -170,6 +184,7 @@ static struct jc42_chips jc42_chips[] = {
 	{ MCP_MANID, MCP9843_DEVID, MCP9843_DEVID_MASK },
 	{ NXP_MANID, SE97_DEVID, SE97_DEVID_MASK },
 	{ ONS_MANID, CAT6095_DEVID, CAT6095_DEVID_MASK },
+	{ ONS_MANID, CAT34TS04_DEVID, CAT34TS04_DEVID_MASK },
 	{ NXP_MANID, SE98_DEVID, SE98_DEVID_MASK },
 	{ STM_MANID, STTS424_DEVID, STTS424_DEVID_MASK },
 	{ STM_MANID, STTS424E_DEVID, STTS424E_DEVID_MASK },
-- 
2.7.4
