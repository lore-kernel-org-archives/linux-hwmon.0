Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38999 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbeJZI0N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 04:26:13 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] hwmon: (ina3221) Make sure data is ready before reading
Date: Thu, 25 Oct 2018 16:51:21 -0700
Message-Id: <20181025235122.3240-5-nicoleotsuka@gmail.com>
In-Reply-To: <20181025235122.3240-1-nicoleotsuka@gmail.com>
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The data might need some time to get ready after channel enabling,
although the data register is always readable. The CVRF bit is to
indicate that data conversion is finished, so polling the CVRF bit
before data reading could ensure the result being valid.

An alternative way could be to wait for expected time between the
channel enabling and the data reading. And this could avoid extra
I2C communications. However, INA3221 seemly takes longer time than
what's stated in the datasheet. Test results show that sometimes
it couldn't finish data conversion in time.

So this patch plays safe by adding a CVRF polling to make sure the
data register is updated with the new data.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v3->v4:
 * N/A
v2->v3:
 * Dropped timeout dev_err messages as it's indicated in the errno
v1->v2:
 * Moved CVRF polling to data read routine
 * Added calculation of wait time based on conversion time setting

 drivers/hwmon/ina3221.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 10e8347a3c80..07dd6ef58d3e 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -44,6 +44,13 @@
 #define INA3221_CONFIG_MODE_SHUNT	BIT(0)
 #define INA3221_CONFIG_MODE_BUS		BIT(1)
 #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
+#define INA3221_CONFIG_VSH_CT_SHIFT	3
+#define INA3221_CONFIG_VSH_CT_MASK	GENMASK(5, 3)
+#define INA3221_CONFIG_VSH_CT(x)	(((x) & GENMASK(5, 3)) >> 3)
+#define INA3221_CONFIG_VBUS_CT_SHIFT	6
+#define INA3221_CONFIG_VBUS_CT_MASK	GENMASK(8, 6)
+#define INA3221_CONFIG_VBUS_CT(x)	(((x) & GENMASK(8, 6)) >> 6)
+#define INA3221_CONFIG_CHs_EN_MASK	GENMASK(14, 12)
 #define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
 
 #define INA3221_RSHUNT_DEFAULT		10000
@@ -52,6 +59,9 @@ enum ina3221_fields {
 	/* Configuration */
 	F_RST,
 
+	/* Status Flags */
+	F_CVRF,
+
 	/* Alert Flags */
 	F_WF3, F_WF2, F_WF1,
 	F_CF3, F_CF2, F_CF1,
@@ -63,6 +73,7 @@ enum ina3221_fields {
 static const struct reg_field ina3221_reg_fields[] = {
 	[F_RST] = REG_FIELD(INA3221_CONFIG, 15, 15),
 
+	[F_CVRF] = REG_FIELD(INA3221_MASK_ENABLE, 0, 0),
 	[F_WF3] = REG_FIELD(INA3221_MASK_ENABLE, 3, 3),
 	[F_WF2] = REG_FIELD(INA3221_MASK_ENABLE, 4, 4),
 	[F_WF1] = REG_FIELD(INA3221_MASK_ENABLE, 5, 5),
@@ -111,6 +122,28 @@ static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 	return ina->reg_config & INA3221_CONFIG_CHx_EN(channel);
 }
 
+/* Lookup table for Bus and Shunt conversion times in usec */
+static const u16 ina3221_conv_time[] = {
+	140, 204, 332, 588, 1100, 2116, 4156, 8244,
+};
+
+static inline int ina3221_wait_for_data(struct ina3221_data *ina)
+{
+	u32 channels = hweight16(ina->reg_config & INA3221_CONFIG_CHs_EN_MASK);
+	u32 vbus_ct_idx = INA3221_CONFIG_VBUS_CT(ina->reg_config);
+	u32 vsh_ct_idx = INA3221_CONFIG_VSH_CT(ina->reg_config);
+	u32 vbus_ct = ina3221_conv_time[vbus_ct_idx];
+	u32 vsh_ct = ina3221_conv_time[vsh_ct_idx];
+	u32 wait, cvrf;
+
+	/* Calculate total conversion time */
+	wait = channels * (vbus_ct + vsh_ct);
+
+	/* Polling the CVRF bit to make sure read data is ready */
+	return regmap_field_read_poll_timeout(ina->fields[F_CVRF],
+					      cvrf, cvrf, wait, 100000);
+}
+
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
 			      int *val)
 {
@@ -150,6 +183,10 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
 		if (!ina3221_is_enabled(ina, channel))
 			return -ENODATA;
 
+		ret = ina3221_wait_for_data(ina);
+		if (ret)
+			return ret;
+
 		ret = ina3221_read_value(ina, reg, &regval);
 		if (ret)
 			return ret;
@@ -189,6 +226,11 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 	case hwmon_curr_input:
 		if (!ina3221_is_enabled(ina, channel))
 			return -ENODATA;
+
+		ret = ina3221_wait_for_data(ina);
+		if (ret)
+			return ret;
+
 		/* fall through */
 	case hwmon_curr_crit:
 	case hwmon_curr_max:
-- 
2.17.1
