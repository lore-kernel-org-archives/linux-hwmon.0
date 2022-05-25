Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4F7C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243462AbiEYHhd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244349AbiEYHhZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:25 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3D360042
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:22 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:20 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 6/7] hwmon: (lm90) Read the channel's label from device-tree
Date:   Wed, 25 May 2022 09:36:56 +0200
Message-Id: <20220525073657.573327-7-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464241;
        bh=bUaqc8FAsvXQMoHQH74ICXcKexdammv+Fav5Lo8E4iM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=ts0OVhEKlIe55LCmU61pClpSc2aGif2H2ntajaHKtEoPOFrVTqNRVVq/pUQ6qEiyc
         hEjUUNQ4aIHsvrTbblBJaq5j8XXpFEb/UFD3gTEiEPjhvdcCjUGS+h5I8/jI4e0+DI
         7eSvk8kleQDzNlyHIMblN1ngke4ndagyYrAHNKpU=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Try to read the channel's label from device-tree. Having label in
device-tree node is not mandatory.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 82b020ffd490..3837c4ab5833 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -688,6 +688,7 @@ struct lm90_data {
 	struct device *hwmon_dev;
 	u32 chip_config[2];
 	u32 channel_config[MAX_CHANNELS + 1];
+	const char *channel_label[MAX_CHANNELS];
 	struct hwmon_channel_info chip_info;
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
@@ -1610,6 +1611,7 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
 	case hwmon_temp_emergency_alarm:
 	case hwmon_temp_emergency_hyst:
 	case hwmon_temp_fault:
+	case hwmon_temp_label:
 		return 0444;
 	case hwmon_temp_min:
 	case hwmon_temp_max:
@@ -1729,6 +1731,16 @@ static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
+static int lm90_read_string(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, const char **str)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel_label[channel];
+
+	return 0;
+}
+
 static int lm90_write(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long val)
 {
@@ -2634,10 +2646,63 @@ static void lm90_regulator_disable(void *regulator)
 	regulator_disable(regulator);
 }
 
+static int lm90_probe_channel_from_dt(struct i2c_client *client,
+				      struct device_node *child,
+				      struct lm90_data *data)
+{
+	u32 id;
+	int err;
+	struct device *dev = &client->dev;
+
+	err = of_property_read_u32(child, "reg", &id);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (id >= MAX_CHANNELS) {
+		dev_err(dev, "invalid reg property value %d in %pOFn\n", id, child);
+		return -EINVAL;
+	}
+
+	err = of_property_read_string(child, "label", &data->channel_label[id]);
+	if (err == -ENODATA || err == -EILSEQ) {
+		dev_err(dev, "invalid label property in %pOFn\n", child);
+		return err;
+	}
+
+	if (data->channel_label[id])
+		data->channel_config[id] |= HWMON_T_LABEL;
+
+	return 0;
+}
+
+static int lm90_parse_dt_channel_info(struct i2c_client *client,
+				      struct lm90_data *data)
+{
+	int err;
+	struct device_node *child;
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+
+	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "channel"))
+			continue;
+
+		err = lm90_probe_channel_from_dt(client, child, data);
+		if (err) {
+			of_node_put(child);
+			return err;
+		}
+	}
+
+	return 0;
+}
 
 static const struct hwmon_ops lm90_ops = {
 	.is_visible = lm90_is_visible,
 	.read = lm90_read,
+	.read_string = lm90_read_string,
 	.write = lm90_write,
 };
 
@@ -2775,6 +2840,13 @@ static int lm90_probe(struct i2c_client *client)
 	/* Set maximum conversion rate */
 	data->max_convrate = lm90_params[data->kind].max_convrate;
 
+	/* Parse device-tree channel information */
+	if (client->dev.of_node) {
+		err = lm90_parse_dt_channel_info(client, data);
+		if (err)
+			return err;
+	}
+
 	/* Initialize the LM90 chip */
 	err = lm90_init_client(client, data);
 	if (err < 0) {
-- 
2.36.1

