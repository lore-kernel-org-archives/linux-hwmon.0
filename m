Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DE5C001E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 11:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbjGYLlD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 07:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbjGYLkv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 07:40:51 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F901FE1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98377c5d53eso866270366b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690285236; x=1690890036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhNRFqKFycYKruMGsOn/+moIjC44ZjyIo8XOGyCOCbo=;
        b=W2qr9brom56oLdtsCeuu9GTb8LiKF8Rmiyb6kPM5pb4gsnB1NMl/kBvG4z0HQiFyWi
         wcrClJsqLQTy8wIFPOp5VbuInGicV4S5RseU2Gb94+uX+6v2Zt0555n2P9WSO8/IaElb
         cbqPHTwMNEkk9OmFPNJwtTfhmm7m2lLJSwfTRkE0J8MoXPAe3skVCjhmoqncJpmBl1Lr
         fL05Q/A3IodQggCnh72C/zDDHPJWwH4sI2EvbTC7MabLDtmdffdAkkhf3SZt6zDx8dnV
         hvYP2JxodPEFQawW+88ZveccEvZ2aVX6Y1Y6Klt+QWyvKfePRwlS9LiG9fS0QI6yI/ri
         6PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690285236; x=1690890036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhNRFqKFycYKruMGsOn/+moIjC44ZjyIo8XOGyCOCbo=;
        b=OOPcuu04IZG97U+exEnh2oLNrNhUWFL71Q83aQwgmzGPbXM/C3MvLoX8/uMCOHlghK
         OxZV8YqrlX2FEvDzaK45ONxnr3CCzer2vGxtUJV+OjSuzLgSoEFWU225iSHnc93aIsMG
         hpWMxAx7/PKXwj69mglk8CyEogyWS8lQbnsOgegineC8IBU2033ZrkajJtL3m5tTbSrB
         TrZ1UKTAapb0LnBHmTakvR4LgdwZiS9i3GAcMRXPJZ3oShKzF4JA4MflHjLOEeLLFbrZ
         6HOkX8I1EHTSgVcO+f5PZpm+/0ZFPp+tUD8zAwbFmZov+PUVqjG4AigrfwwbKG0LrwlV
         bEUg==
X-Gm-Message-State: ABy/qLabjjRSOqKRE6XFJJ8vIM1xd51N6Me/Ji/eJGSddD8GCkbhL4KA
        S5r2kxFvVjgNbRVxKBMX10bHog==
X-Google-Smtp-Source: APBJJlEYKr4k9vX9l1hBB3qpQa6GwkQ6GVgVlbcGeB/RqmZwjIkCu/ps2Hsbrzuu+EaDsTLiNlnCDg==
X-Received: by 2002:a17:906:209e:b0:993:d617:bdc2 with SMTP id 30-20020a170906209e00b00993d617bdc2mr12718738ejq.75.1690285236112;
        Tue, 25 Jul 2023 04:40:36 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d6-20020a1709067f0600b009925cbafeaasm8088206ejr.100.2023.07.25.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 04:40:35 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (pmbus/tda38640) Add workaround for bug in SVID mode
Date:   Tue, 25 Jul 2023 13:40:28 +0200
Message-ID: <20230725114030.1860571-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
References: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The TDA38640 supports two operating modes to set the output voltage:
- PMBUS
- SVID

Due to an undocumented bug the regulator cannot be enabled using BIT7
of OPERATION(01h) register when in SVID mode.
It works when in PMBUS mode. In SVID mode the regulator only cares
about the ENABLE pin.

Add a workaround that needs the ENABLE pin to be left floating or
tied to a fixed level. The DT must contain the newly introduced
property 'infineon,en-pin-fixed-level' to enable this workaround.

The workaround will map the PB_OPERATION_CONTROL_ON bit to the
PB_ON_OFF_CONFIG_EN_PIN_REQ bit of the ON_OFF_CONFIG register.
In combination with the fixed level on the ENABLE pin the regulator
can be controlled as expected.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/tda38640.c | 95 +++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index 450b0273fb59..9d3b89d9845c 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -18,6 +18,72 @@ static const struct regulator_desc __maybe_unused tda38640_reg_desc[] = {
 	PMBUS_REGULATOR("vout", 0),
 };
 
+struct tda38640_data {
+	struct pmbus_driver_info info;
+	u32 en_pin_lvl;
+};
+
+#define to_tda38640_data(x)  container_of(x, struct tda38640_data, info)
+
+/*
+ * Map PB_ON_OFF_CONFIG_POLARITY_HIGH to PB_OPERATION_CONTROL_ON.
+ */
+static int tda38640_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tda38640_data *data = to_tda38640_data(info);
+	int ret, on_off_config, enabled;
+
+	if (reg != PMBUS_OPERATION)
+		return -ENODATA;
+
+	ret = pmbus_read_byte_data(client, page, reg);
+	if (ret < 0)
+		return ret;
+
+	on_off_config = pmbus_read_byte_data(client, page,
+					     PMBUS_ON_OFF_CONFIG);
+	if (on_off_config < 0)
+		return on_off_config;
+
+	enabled = !!(on_off_config & PB_ON_OFF_CONFIG_POLARITY_HIGH);
+
+	enabled ^= data->en_pin_lvl;
+	if (enabled)
+		ret &= ~PB_OPERATION_CONTROL_ON;
+	else
+		ret |= PB_OPERATION_CONTROL_ON;
+
+	return ret;
+}
+
+/*
+ * Map PB_OPERATION_CONTROL_ON to PB_ON_OFF_CONFIG_POLARITY_HIGH.
+ */
+static int tda38640_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 byte)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tda38640_data *data = to_tda38640_data(info);
+	int enable, ret;
+
+	if (reg != PMBUS_OPERATION)
+		return -ENODATA;
+
+	enable = !!(byte & PB_OPERATION_CONTROL_ON);
+
+	byte &= ~PB_OPERATION_CONTROL_ON;
+	ret = pmbus_write_byte_data(client, page, reg, byte);
+	if (ret < 0)
+		return ret;
+
+	enable ^= data->en_pin_lvl;
+
+	return pmbus_update_byte_data(client, page, PMBUS_ON_OFF_CONFIG,
+				      PB_ON_OFF_CONFIG_POLARITY_HIGH,
+				      enable ? 0 : PB_ON_OFF_CONFIG_POLARITY_HIGH);
+}
+
 static struct pmbus_driver_info tda38640_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -26,7 +92,6 @@ static struct pmbus_driver_info tda38640_info = {
 	.format[PSC_CURRENT_IN] = linear,
 	.format[PSC_POWER] = linear,
 	.format[PSC_TEMPERATURE] = linear,
-
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_IIN
@@ -41,7 +106,33 @@ static struct pmbus_driver_info tda38640_info = {
 
 static int tda38640_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, &tda38640_info);
+	struct device *dev = &client->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct tda38640_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	memcpy(&data->info, &tda38640_info, sizeof(tda38640_info));
+
+	if (!CONFIG_SENSORS_TDA38640_REGULATOR || !np ||
+	    of_property_read_u32(np, "infineon,en-pin-fixed-level", &data->en_pin_lvl))
+		return pmbus_do_probe(client, &data->info);
+
+	/*
+	 * Apply ON_OFF_CONFIG workaround as enabling the regulator using the
+	 * OPERATION register doesn't work in SVID mode.
+	 */
+	data->info.read_byte_data = tda38640_read_byte_data;
+	data->info.write_byte_data = tda38640_write_byte_data;
+	/*
+	 * One should configure PMBUS_ON_OFF_CONFIG here, but
+	 * PB_ON_OFF_CONFIG_POWERUP_CONTROL, PB_ON_OFF_CONFIG_EN_PIN_REQ and
+	 * PB_ON_OFF_CONFIG_EN_PIN_REQ are ignored by the device.
+	 * Only PB_ON_OFF_CONFIG_POLARITY_HIGH has an effect.
+	 */
+
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id tda38640_id[] = {
-- 
2.41.0

