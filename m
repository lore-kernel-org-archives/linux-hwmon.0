Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (lm95241) Use BIT macro where appropriate
Date: Sun,  7 Aug 2016 16:31:59 -0700
Message-Id: <1470612720-30165-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
References: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Drop some of the SHIFT defines since shift is implied with BIT().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 507b32b67974..df94f486b21c 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -17,6 +17,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -50,29 +51,25 @@ static const unsigned short normal_i2c[] = {
 #define LM95241_REG_RW_REMOTE_MODEL	0x30
 
 /* LM95241 specific bitfields */
-#define CFG_STOP 0x40
-#define CFG_CR0076 0x00
-#define CFG_CR0182 0x10
-#define CFG_CR1000 0x20
-#define CFG_CR2700 0x30
-#define CFG_CRMASK 0x30
-#define R1MS_SHIFT 0
-#define R2MS_SHIFT 2
-#define R1MS_MASK (0x01 << (R1MS_SHIFT))
-#define R2MS_MASK (0x01 << (R2MS_SHIFT))
-#define R1DF_SHIFT 1
-#define R2DF_SHIFT 2
-#define R1DF_MASK (0x01 << (R1DF_SHIFT))
-#define R2DF_MASK (0x01 << (R2DF_SHIFT))
-#define R1FE_MASK 0x01
-#define R2FE_MASK 0x05
-#define R1DM 0x01
-#define R2DM 0x02
-#define TT1_SHIFT 0
-#define TT2_SHIFT 4
-#define TT_OFF 0
-#define TT_ON 1
-#define TT_MASK 7
+#define CFG_STOP	BIT(6)
+#define CFG_CR0076	0x00
+#define CFG_CR0182	BIT(4)
+#define CFG_CR1000	BIT(5)
+#define CFG_CR2700	(BIT(4) | BIT(5))
+#define CFG_CRMASK	(BIT(4) | BIT(5))
+#define R1MS_MASK	BIT(0)
+#define R2MS_MASK	BIT(2)
+#define R1DF_MASK	BIT(1)
+#define R2DF_MASK	BIT(2)
+#define R1FE_MASK	BIT(0)
+#define R2FE_MASK	BIT(2)
+#define R1DM		BIT(0)
+#define R2DM		BIT(1)
+#define TT1_SHIFT	0
+#define TT2_SHIFT	4
+#define TT_OFF		0
+#define TT_ON		1
+#define TT_MASK		7
 #define NATSEMI_MAN_ID	0x01
 #define LM95231_CHIP_ID	0xA1
 #define LM95241_CHIP_ID	0xA4
@@ -148,7 +145,7 @@ static ssize_t show_input(struct device *dev, struct device_attribute *attr,
 	int index = to_sensor_dev_attr(attr)->index;
 
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n",
-			index == 0 || (data->config & (1 << (index / 2))) ?
+			index == 0 || (data->config & BIT(index / 2)) ?
 		temp_from_reg_signed(data->temp[index], data->temp[index + 1]) :
 		temp_from_reg_unsigned(data->temp[index],
 				       data->temp[index + 1]));
-- 
2.5.0
