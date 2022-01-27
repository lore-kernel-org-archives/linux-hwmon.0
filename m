Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D060C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 16:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238174AbiA0QRp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238183AbiA0QRo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 11:17:44 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC23C061747
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 08:17:44 -0800 (PST)
Received: from smtp202.mailbox.org (unknown [91.198.250.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jl5N65GN3z9sQv;
        Thu, 27 Jan 2022 17:17:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1643300261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fRcYrpuC5HKE3CXFrYeAD067hJ8mbRFbeDz2toOYrxI=;
        b=rb8KBWjG0bEfQ38JMg59qxM14w+khwuUHNH7kjC9m0OLL8AF/4Qy6hZ+KoDuT4LL9b5JOA
        AeRaJEOVHfuCkXqCGSwe17JOnFeFw20G4FygbxTS0alMjMiakYB27qJcL7Hm9Dvv0bNt3G
        qNCA0HKUrqjNW2upLx/rpHsa0sf+W9SJ3z/mQzGAleBYbtjIRlNbW8CWdFj0Qi8uA/L7JA
        dBwSfU9W9VsAD8uSF82/hr3KGqZlRXU1Wa/TuA8I1imAteSNuaJ3KiWXLI976Qfwn4Tb1x
        ep1a8EgqaCwg4qQBaBYO4JsSokhAaclSW4fnmcS5UUn6yYJCh5a3/Ck6nhzRrg==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 2/4] hwmon: (max6639) Add regulator support
Date:   Thu, 27 Jan 2022 17:17:28 +0100
Message-Id: <2cb9ed600fb43cdc604799746fbde2e2942cdca6.1643299570.git.sylv@sylv.io>
In-Reply-To: <cover.1643299570.git.sylv@sylv.io>
References: <cover.1643299570.git.sylv@sylv.io>
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
2.34.1

