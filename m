Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 53/66] hwmon: (lm90) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:22 +0100
Message-Id: <1482408335-3435-54-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-hwmon@vger.kernel.org>

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/lm90.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 322ed92..de1d61a 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -830,7 +830,7 @@ static u16 temp_to_u16_adt7461(struct lm90_data *data, long val)
 }
 
 /* pec used for ADM1032 only */
-static ssize_t show_pec(struct device *dev, struct device_attribute *dummy,
+static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
 			char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -838,8 +838,8 @@ static ssize_t show_pec(struct device *dev, struct device_attribute *dummy,
 	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
 }
 
-static ssize_t set_pec(struct device *dev, struct device_attribute *dummy,
-		       const char *buf, size_t count)
+static ssize_t pec_store(struct device *dev, struct device_attribute *dummy,
+			 const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	long val;
@@ -863,7 +863,7 @@ static ssize_t set_pec(struct device *dev, struct device_attribute *dummy,
 	return count;
 }
 
-static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO, show_pec, set_pec);
+static DEVICE_ATTR_RW(pec);
 
 static int lm90_get_temp11(struct lm90_data *data, int index)
 {
