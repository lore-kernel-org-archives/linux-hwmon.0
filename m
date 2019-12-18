Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE51C43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 02:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C647221775
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 02:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="th0T7UAz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLRCpI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Dec 2019 21:45:08 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55161 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfLRCpI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Dec 2019 21:45:08 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B58D7891AA;
        Wed, 18 Dec 2019 15:45:05 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576637105;
        bh=faOsqBAUEPT8CjaDaKs7LA0D7i3HgLI9rNUXSoFJ+ko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=th0T7UAzzTudRg+Uo35UyAwkG2Y4fVkCenHlzwBElybSpiRFyaBG615f0ZIO1mWSN
         VGfhQ6uGTKI1LAaxlI83l9R6wreaCxKOqVuvTcYFrkvEIanf7C38TjkrA/xdFbMtoY
         jOVL/vPa8PwEPUf4JUoMmDtxoV7lP0qFhQUBmjbbd7G/imVaf9CtNxbagf0nTpxD0X
         aEXMlYEYwMTRFnng8z1ynSQttTn1ETWxY8mKOFYb15bSXFHaq3Ua3H1gUV54TS0Fng
         aAwSBIK3nf59zOmJa5bawSexEgr6J+hvZSgic4zchqqf5gh2OYTIv2zCaVJq/avcAF
         JXgtHrImSI3ng==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df992ac0000>; Wed, 18 Dec 2019 15:45:05 +1300
Received: from logans-dl.ws.atlnz.lc (logans-dl.ws.atlnz.lc [10.33.25.49])
        by smtp (Postfix) with ESMTP id EFF5613EEA8;
        Wed, 18 Dec 2019 15:44:59 +1300 (NZDT)
Received: by logans-dl.ws.atlnz.lc (Postfix, from userid 1820)
        id 622D3C03C3; Wed, 18 Dec 2019 15:45:00 +1300 (NZDT)
From:   Logan Shaw <logan.shaw@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org,
        Logan Shaw <logan.shaw@alliedtelesis.co.nz>
Subject: [PATCH 1/1] hwmon: (adt7475) Added attenuator bypass support
Date:   Wed, 18 Dec 2019 15:42:38 +1300
Message-Id: <20191218024238.19836-2-logan.shaw@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218024238.19836-1-logan.shaw@alliedtelesis.co.nz>
References: <20191218024238.19836-1-logan.shaw@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added support for reading and writing the individual and global voltage
attenuator bypasses. Added loading DTS properties to bypass attenuators o=
n
device probe.

Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
---
---
 drivers/hwmon/adt7475.c | 163 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 6c64d50c9aae..92a4be9e33eb 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -19,6 +19,7 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
+#include <linux/of.h>
 #include <linux/util_macros.h>
=20
 /* Indexes for the sysfs hooks */
@@ -39,6 +40,7 @@
=20
 #define ALARM		9
 #define FAULT		10
+#define ATTENUATE	11
=20
 /* 7475 Common Registers */
=20
@@ -126,9 +128,11 @@
 #define ADT7475_TACH_COUNT	4
 #define ADT7475_PWM_COUNT	3
=20
-/* Macro to read the registers */
+/* Macros to read and write registers */
=20
 #define adt7475_read(reg) i2c_smbus_read_byte_data(client, (reg))
+#define adt7475_write(reg, data) i2c_smbus_write_byte_data(client, (reg)=
, \
+								(data))
=20
 /* Macros to easily index the registers */
=20
@@ -534,6 +538,82 @@ static ssize_t temp_store(struct device *dev, struct=
 device_attribute *attr,
 	return count;
 }
=20
+/**
+ * Gets the attenuator bit index for a sattr_index.
+ *
+ * If there is no attenuator bit index for a given sattr_index then retu=
rns
+ * a negative error code.
+ */
+static int config4_attenuate_index(char sattr_index)
+{
+	int index =3D -EBADR;
+
+	switch (sattr_index) {
+	case 0:
+		index =3D 4;
+		break;
+	case 1:
+		index =3D 5;
+		break;
+	case 3:
+		index =3D 6;
+		break;
+	case 4:
+		index =3D 7;
+		break;
+	}
+
+	return index;
+}
+
+/**
+ * Gets the bypass attenuator bit for a voltage input and stores it in t=
he char
+ * array buf.
+ */
+static ssize_t bypass_attenuator_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct adt7475_data *data =3D adt7475_update_device(dev);
+	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
+	u8 attn_bypassed =3D !!(data->config4 &
+				(1 << config4_attenuate_index(sattr->index)));
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return sprintf(buf, "%d\n", attn_bypassed);
+}
+
+/**
+ * Sets the bypass attenuator bit for a given voltage input.
+ */
+static ssize_t bypass_attenuator_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct adt7475_data *data =3D i2c_get_clientdata(client);
+	long val;
+
+	if (kstrtol(buf, 2, &val))
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	data->config4 =3D adt7475_read(REG_CONFIG4);
+	if (data->config4 < 0)
+		return data->config4;
+
+	if (val =3D=3D 0)
+		data->config4 &=3D ~(1 << config4_attenuate_index(sattr->index));
+	else
+		data->config4 |=3D (1 << config4_attenuate_index(sattr->index));
+
+	adt7475_write(REG_CONFIG4, data->config4);
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
 /* Assuming CONFIG6[SLOW] is 0 */
 static const int ad7475_st_map[] =3D {
 	37500, 18800, 12500, 7500, 4700, 3100, 1600, 800,
@@ -1080,10 +1160,14 @@ static SENSOR_DEVICE_ATTR_2_RO(in0_input, voltage=
, INPUT, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in0_max, voltage, MAX, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in0_min, voltage, MIN, 0);
 static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, voltage, ALARM, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in0_attenuator_bypass, bypass_attenuator,
+				ATTENUATE, 0);
 static SENSOR_DEVICE_ATTR_2_RO(in1_input, voltage, INPUT, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in1_max, voltage, MAX, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in1_min, voltage, MIN, 1);
 static SENSOR_DEVICE_ATTR_2_RO(in1_alarm, voltage, ALARM, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in1_attenuator_bypass, bypass_attenuator,
+				ATTENUATE, 1);
 static SENSOR_DEVICE_ATTR_2_RO(in2_input, voltage, INPUT, 2);
 static SENSOR_DEVICE_ATTR_2_RW(in2_max, voltage, MAX, 2);
 static SENSOR_DEVICE_ATTR_2_RW(in2_min, voltage, MIN, 2);
@@ -1092,10 +1176,14 @@ static SENSOR_DEVICE_ATTR_2_RO(in3_input, voltage=
, INPUT, 3);
 static SENSOR_DEVICE_ATTR_2_RW(in3_max, voltage, MAX, 3);
 static SENSOR_DEVICE_ATTR_2_RW(in3_min, voltage, MIN, 3);
 static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, voltage, ALARM, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in3_attenuator_bypass, bypass_attenuator,
+				ATTENUATE, 3);
 static SENSOR_DEVICE_ATTR_2_RO(in4_input, voltage, INPUT, 4);
 static SENSOR_DEVICE_ATTR_2_RW(in4_max, voltage, MAX, 4);
 static SENSOR_DEVICE_ATTR_2_RW(in4_min, voltage, MIN, 4);
 static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, voltage, ALARM, 8);
+static SENSOR_DEVICE_ATTR_2_RW(in4_attenuator_bypass, bypass_attenuator,
+				ATTENUATE, 4);
 static SENSOR_DEVICE_ATTR_2_RO(in5_input, voltage, INPUT, 5);
 static SENSOR_DEVICE_ATTR_2_RW(in5_max, voltage, MAX, 5);
 static SENSOR_DEVICE_ATTR_2_RW(in5_min, voltage, MIN, 5);
@@ -1177,6 +1265,7 @@ static struct attribute *adt7475_attrs[] =3D {
 	&sensor_dev_attr_in1_max.dev_attr.attr,
 	&sensor_dev_attr_in1_min.dev_attr.attr,
 	&sensor_dev_attr_in1_alarm.dev_attr.attr,
+	&sensor_dev_attr_in1_attenuator_bypass.dev_attr.attr,
 	&sensor_dev_attr_in2_input.dev_attr.attr,
 	&sensor_dev_attr_in2_max.dev_attr.attr,
 	&sensor_dev_attr_in2_min.dev_attr.attr,
@@ -1263,6 +1352,7 @@ static struct attribute *in0_attrs[] =3D {
 	&sensor_dev_attr_in0_max.dev_attr.attr,
 	&sensor_dev_attr_in0_min.dev_attr.attr,
 	&sensor_dev_attr_in0_alarm.dev_attr.attr,
+	&sensor_dev_attr_in0_attenuator_bypass.dev_attr.attr,
 	NULL
 };
=20
@@ -1271,6 +1361,7 @@ static struct attribute *in3_attrs[] =3D {
 	&sensor_dev_attr_in3_max.dev_attr.attr,
 	&sensor_dev_attr_in3_min.dev_attr.attr,
 	&sensor_dev_attr_in3_alarm.dev_attr.attr,
+	&sensor_dev_attr_in3_attenuator_bypass.dev_attr.attr,
 	NULL
 };
=20
@@ -1279,6 +1370,7 @@ static struct attribute *in4_attrs[] =3D {
 	&sensor_dev_attr_in4_max.dev_attr.attr,
 	&sensor_dev_attr_in4_min.dev_attr.attr,
 	&sensor_dev_attr_in4_alarm.dev_attr.attr,
+	&sensor_dev_attr_in4_attenuator_bypass.dev_attr.attr,
 	NULL
 };
=20
@@ -1457,6 +1549,69 @@ static int adt7475_update_limits(struct i2c_client=
 *client)
 	return 0;
 }
=20
+/**
+ * Reads individual voltage input bypass attenuator properties from the =
DTS,
+ * and if the property is present the corresponding bit is set in the
+ * register.
+ *
+ * Properties must be in the form of "bypass-attenuator-inx", where x is=
 an
+ * integer from the set {0, 1, 3, 4} (can not bypass in2 attenuator).
+ *
+ * Returns a negative error code if there was an error writing to the re=
gister.
+ */
+static int load_individual_bypass_attenuators(const struct i2c_client *c=
lient,
+					      u8 *config4)
+{
+	char buf[32];
+	int attenuate_index, input_index;
+	u8 config4_copy =3D *config4;
+
+	for (input_index =3D 0; input_index < 5; input_index++) {
+		attenuate_index =3D config4_attenuate_index(input_index);
+		if (attenuate_index < 0)
+			continue;
+
+		sprintf(buf, "bypass-attenuator-in%d", input_index);
+		if (of_get_property(client->dev.of_node, buf, NULL))
+			config4_copy |=3D (1 << attenuate_index);
+	}
+
+	if (adt7475_write(REG_CONFIG4, config4_copy) < 0)
+		// Failed to update register
+		return -EREMOTEIO;
+
+	*config4 =3D config4_copy;
+
+	return 0;
+}
+
+/**
+ * Sets the bypass all attenuators bit, if the "bypass-attenuator-all"
+ * property exists in the DTS.
+ *
+ * Returns a negative error code if there was an error writing to the
+ * register.
+ */
+static int load_all_bypass_attenuator(const struct i2c_client *client,
+				      u8 *config2)
+{
+	u8 config2_copy =3D *config2;
+
+	if (!of_get_property(client->dev.of_node,
+			     "bypass-attenuator-all", NULL))
+		return 0;
+
+	config2_copy |=3D (1 << 5);
+
+	if (adt7475_write(REG_CONFIG2, config2_copy) < 0)
+		// failed to write to register
+		return -EREMOTEIO;
+
+	*config2 =3D config2_copy;
+
+	return 0;
+}
+
 static int adt7475_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1545,7 +1700,13 @@ static int adt7475_probe(struct i2c_client *client=
,
 	}
=20
 	/* Voltage attenuators can be bypassed, globally or individually */
+	if (load_individual_bypass_attenuators(client, &(data->config4)) < 0)
+		dev_warn(&client->dev,
+			 "Error setting bypass attenuator bits\n");
+
 	config2 =3D adt7475_read(REG_CONFIG2);
+	if (load_all_bypass_attenuator(client, &config2) < 0)
+		dev_warn(&client->dev, "Error setting bypass all attenuator\n");
 	if (config2 & CONFIG2_ATTN) {
 		data->bypass_attn =3D (0x3 << 3) | 0x3;
 	} else {
--=20
2.23.0

