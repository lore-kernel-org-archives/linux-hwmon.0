Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] hwmon: (ina3221) Make sure data is ready after channel enabling
Date: Tue, 16 Oct 2018 18:24:25 -0700
Message-Id: <20181017012426.26958-5-nicoleotsuka@gmail.com>
In-Reply-To: <20181017012426.26958-1-nicoleotsuka@gmail.com>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

The data might need some time to get ready after channel enabling,
although the data register is readable without CVRF being set. So
this patch adds a CVRF polling to make sure that data register is
updated with the new data.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 5fc375bf6635..160ddc404d73 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -45,6 +45,7 @@
 #define INA3221_CONFIG_MODE_BUS		BIT(1)
 #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
 #define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
+#define INA3221_CONFIG_CHs_EN_MASK	GENMASK(14, 12)
 
 #define INA3221_RSHUNT_DEFAULT		10000
 
@@ -52,6 +53,9 @@ enum ina3221_fields {
 	/* Configuration */
 	F_RST,
 
+	/* Status Flags */
+	F_CVRF,
+
 	/* Alert Flags */
 	F_WF3, F_WF2, F_WF1,
 	F_CF3, F_CF2, F_CF1,
@@ -63,6 +67,7 @@ enum ina3221_fields {
 static const struct reg_field ina3221_reg_fields[] = {
 	[F_RST] = REG_FIELD(INA3221_CONFIG, 15, 15),
 
+	[F_CVRF] = REG_FIELD(INA3221_MASK_ENABLE, 0, 0),
 	[F_WF3] = REG_FIELD(INA3221_MASK_ENABLE, 3, 3),
 	[F_WF2] = REG_FIELD(INA3221_MASK_ENABLE, 4, 4),
 	[F_WF1] = REG_FIELD(INA3221_MASK_ENABLE, 5, 5),
@@ -111,6 +116,19 @@ static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 	return ina->reg_config & INA3221_CONFIG_CHx_EN(channel);
 }
 
+static inline int ina3221_wait_for_data_if_active(struct ina3221_data *ina)
+{
+	u32 cvrf;
+
+	/* No need to wait if all channels are disabled */
+	if ((ina->reg_config & INA3221_CONFIG_CHs_EN_MASK) == 0)
+		return 0;
+
+	/* Polling the CVRF bit to make sure read data is ready */
+	return regmap_field_read_poll_timeout(ina->fields[F_CVRF],
+					      cvrf, cvrf, 100, 100000);
+}
+
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
 			      int *val)
 {
@@ -258,6 +276,13 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	if (ret)
 		return ret;
 
+	/* Make sure data conversion is finished */
+	ret = ina3221_wait_for_data_if_active(ina);
+	if (ret) {
+		dev_err(dev, "Timed out at waiting for CVRF bit\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -676,6 +701,13 @@ static int __maybe_unused ina3221_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Make sure data conversion is finished */
+	ret = ina3221_wait_for_data_if_active(ina);
+	if (ret) {
+		dev_err(dev, "Timed out at waiting for CVRF bit\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.17.1
