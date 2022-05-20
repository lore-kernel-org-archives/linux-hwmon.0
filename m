Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49F1C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347969AbiETJyT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiETJyP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:15 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42B914AF52
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:12 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:54 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 7/8] hwmon: (lm90) read the channel's label from device-tree
Date:   Fri, 20 May 2022 11:32:43 +0200
Message-Id: <20220520093243.2523749-8-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040315;
        bh=xFk1LxjyDkD37itPRXtcBJqbTO1hWn+ulsWUgVpJpIw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=fT5mqlScM5PWDV2dAVFQy+VX3g4mFSFZ2ZsNld8O3ynC4ryS352AszEOV7zCpr5y9
         pk2OaigVcdwiZesojFTWj+IE5vuw5aYZ5DKobARCNp3y2RBiGnT1ebMcY5o0twm9vh
         pudbr4ROvlACOl2enRnOV80zy1xzG3LKV1qi5VN8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Try to read the channel's label from device-tree. Having label in
device-tree node is not mandatory.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 67d48707a8d6..e81cc21e525f 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -525,6 +525,7 @@ struct lm90_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
 	u32 channel_config[MAX_CHANNELS + 1];
+	const char *channel_label[MAX_CHANNELS];
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[MAX_CHANNELS];
 	struct hwmon_chip_info chip;
@@ -1393,6 +1394,7 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
 	case hwmon_temp_emergency_alarm:
 	case hwmon_temp_emergency_hyst:
 	case hwmon_temp_fault:
+	case hwmon_temp_label:
 		return 0444;
 	case hwmon_temp_min:
 	case hwmon_temp_max:
@@ -1486,6 +1488,16 @@ static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -1904,10 +1916,64 @@ static void lm90_regulator_disable(void *regulator)
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
+		dev_err(dev, "invalid reg %d in %pOFn\n", id, child);
+		return -EINVAL;
+	}
+
+	err = of_property_read_string(child, "label", &data->channel_label[id]);
+	if (err == -ENODATA || err == -EILSEQ) {
+		dev_err(dev, "invalid label in %pOFn\n", child);
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
+
 
 static const struct hwmon_ops lm90_ops = {
 	.is_visible = lm90_is_visible,
 	.read = lm90_read,
+	.read_string = lm90_read_string,
 	.write = lm90_write,
 };
 
@@ -2027,6 +2093,10 @@ static int lm90_probe(struct i2c_client *client)
 					return err;
 			}
 		}
+
+		err = lm90_parse_dt_channel_info(client, data);
+		if (err)
+			return err;
 	}
 
 	/* Initialize the LM90 chip */
-- 
2.36.1

