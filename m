Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AF3C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jan 2022 09:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353108AbiASJzD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353276AbiASJyk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jan 2022 04:54:40 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897E0C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jan 2022 01:54:40 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jf1Fp4CpYz9sk6;
        Wed, 19 Jan 2022 10:54:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1642586076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ADp/XzfanNSHY4hlp33t8ccopn4wMg5ytSzZsnX4hGQ=;
        b=x01mSOyAW/qBs6sOBeLWbnSNqGGHQgxgr5k+nEAWd7vK0Xor28HedYs1dQUQUVUoOtlIH1
        AbUkvVrXdC0/zQbdASO7/pT1FbD0b76ffKe72gxwBDBdDIJsDPksebNw/XIAxm7ljVjZ7l
        MWtsBU1fXPbXmTO57LgzjkxM7KUGAMJS+maxr7BAeoJ0ZRl84Wv7n1RVSde3YjIqGtca+x
        6foB4Q+UTvZLxNhoo3CELVqUhfWGjztsJi+Q45HLN4YIz5KzaJr2RHBR12hTMCYoEc340Y
        VrhiCWEHdeUnCKUN/ebjd+8DY+W72J6IG97xSUQNlpC0VHpWaU1lVd/ZjagySw==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 2/4] hwmon: (max6639) Add regulator support
Date:   Wed, 19 Jan 2022 10:53:53 +0100
Message-Id: <2cb9ed600fb43cdc604799746fbde2e2942cdca6.1642585539.git.sylv@sylv.io>
In-Reply-To: <cover.1642585539.git.sylv@sylv.io>
References: <cover.1642585539.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator support for boards where the fan-supply have to be
powered up before it can be used.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 drivers/hwmon/max6639.c | 62 +++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index ccc0f047bd44..14bb7726f8d7 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -87,6 +87,9 @@ struct max6639_data {
 	/* Register values initialized only once */
 	u8 ppr;			/* Pulses per rotation 0..3 for 1..4 ppr */
 	u8 rpm_range;		/* Index in above rpm_ranges table */
+
+	/* Optional regulator for FAN supply */
+	struct regulator *reg;
 };
 
 static struct max6639_data *max6639_update_device(struct device *dev)
@@ -516,6 +519,11 @@ static int max6639_detect(struct i2c_client *client,
 	return 0;
 }
 
+static void max6639_regulator_disable(void *data)
+{
+	regulator_disable(data);
+}
+
 static int max6639_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -528,6 +536,28 @@ static int max6639_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
+
+	data->reg = devm_regulator_get_optional(dev, "fan");
+	if (IS_ERR(data->reg)) {
+		if (PTR_ERR(data->reg) != -ENODEV)
+			return PTR_ERR(data->reg);
+
+		data->reg = NULL;
+	} else {
+		/* Spin up fans */
+		err = regulator_enable(data->reg);
+		if (err) {
+			dev_err(dev, "Failed to enable fan supply: %d\n", err);
+			return err;
+		}
+		err = devm_add_action_or_reset(dev, max6639_regulator_disable,
+					       data->reg);
+		if (err) {
+			dev_err(dev, "Failed to register action: %d\n", err);
+			return err;
+		}
+	}
+
 	mutex_init(&data->update_lock);
 
 	/* Initialize the max6639 chip */
@@ -545,23 +575,39 @@ static int max6639_probe(struct i2c_client *client)
 static int max6639_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	int data = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
-	if (data < 0)
-		return data;
+	struct max6639_data *data = dev_get_drvdata(dev);
+	int ret = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
+
+	if (ret < 0)
+		return ret;
+
+	if (data->reg)
+		regulator_disable(data->reg);
 
 	return i2c_smbus_write_byte_data(client,
-			MAX6639_REG_GCONFIG, data | MAX6639_GCONFIG_STANDBY);
+			MAX6639_REG_GCONFIG, ret | MAX6639_GCONFIG_STANDBY);
 }
 
 static int max6639_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	int data = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
-	if (data < 0)
-		return data;
+	struct max6639_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	if (data->reg) {
+		ret = regulator_enable(data->reg);
+		if (ret) {
+			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
+	if (ret < 0)
+		return ret;
 
 	return i2c_smbus_write_byte_data(client,
-			MAX6639_REG_GCONFIG, data & ~MAX6639_GCONFIG_STANDBY);
+			MAX6639_REG_GCONFIG, ret & ~MAX6639_GCONFIG_STANDBY);
 }
 #endif /* CONFIG_PM_SLEEP */
 
-- 
2.33.1

