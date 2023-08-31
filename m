Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2300FC83F2F
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Aug 2023 19:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347115AbjHaTHq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Aug 2023 15:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347122AbjHaTHl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Aug 2023 15:07:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A95E67
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 12:07:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401d24f1f27so12206015e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 12:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693508857; x=1694113657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ9ATWA183GyjCcPXztWr1VXWORzSLDZzN/JKaeTvQ8=;
        b=I5oAnjMWr9uRlf3u8j0bVSG2f5Wt31dP1MT5ziWKQdo7bcc3WUa0KB9nXCdnmeiV3i
         wolrOU+k/g+6sEjCaJnxVUypyJ7MnILv1MoQ+rQ3FUQs99SaAcZ3d7QGgPGAhLF1Lybu
         ukj2k+Iik5E43zMGJbcW2Sy0V7rtoQIDlXBFUbbn4U5Ihw2P6wNO5r57HwttmkodFK6N
         yU79D7VzFb/elULm9QoGRDpE1OVMgKn6rRH0/FkxsgZdTXOL9jA1oScqPt+wD/cJ5aFU
         Aol1Q9atul/dRfWKNDWUMcDdl9fRJdMUCWfswpytz71mY24WKuts18uqz32LXctrlS1A
         iz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693508857; x=1694113657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ9ATWA183GyjCcPXztWr1VXWORzSLDZzN/JKaeTvQ8=;
        b=lbtvNGrpYkBfj/pce5tdUsHvG1Whgg/KXl3sZlcrlUBghhdMoZvk/LIYq0S0XRWiR4
         R2guYhu7FphG3/JNea+qc+3RXVV1z9dxqRCblZOBYQMAJ2SSyFBJkEKe/aw0leP9H+7Q
         ALNcYTXDe3WqYCDu2vKxDq8Tyh+lyfLVVsYwOiainKYUMpZZBZKvCiYuzMLUvvnUXiej
         NH/RoJuxg5BprPwMz5NUBY+cG8AtwYS60j9cIpGodYaHYn5ZU4Mu8EbtWe/XtXfgmjVq
         8gIUdrdMzCX0ksdnFGb1FFin2H7KIYzSkwd7FBPdcrgHipXBJe+HAUr1boFzx78fRt5Z
         ps1Q==
X-Gm-Message-State: AOJu0YwbdayiCnw+n2P/HkTR1hMzx8Y64RIdhjQp39JrWljEwRDRCKm2
        XUvy0dLR3Th5zTOzDiLn13TOog==
X-Google-Smtp-Source: AGHT+IFkrAJW1/yHbvi1AcuQ6iFP9HyVNqF/dfdtinvdYkmTkeNiosRB1WT80WH2FIkvSMOSaMd84w==
X-Received: by 2002:adf:fc46:0:b0:31d:da10:e46d with SMTP id e6-20020adffc46000000b0031dda10e46dmr305309wrs.69.1693508857027;
        Thu, 31 Aug 2023 12:07:37 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x9-20020adfdd89000000b003196b1bb528sm3058627wrl.64.2023.08.31.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 12:07:36 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] hwmon: (pmbus/tda38640) Add workaround for SVID mode
Date:   Thu, 31 Aug 2023 21:07:29 +0200
Message-ID: <20230831190731.265099-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
References: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

TDA38640 can operate in either PMBus mode or SVID mode.

In SVID mode, by design ENABLE pin is the only option for controlling
the output rail i.e., ENABLE pin is chained to power good of another
reglator & FPGA.

In cases where the chip is configured for SVID mode, and the ENABLE pin
is set at a fixed level or is left unconnected (with an internal
pull-down), while requiring software control, the following
workaround is necessary.

The workaround utilizes ENABLE pin polarity flipping to control
output rail.

If property 'infineon,en-pin-fixed-level' is specified then
determine if chip is in SVID mode by checking BIT15 of MTP memory offset
0x44 as described in the datasheet.

If chip is in SVID mode then apply the workaround by
1. Determine EN pin level
2. Maps BIT7 of OPERATION(01h) to EN_PIN_POLARITY(BIT1) of
   PB_ON_OFF_CONFIG.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
----
Changes in V5:
- None
Changes in V4:
- Update DT property name
- Commit message update
Changes in V3:
- Use dt property to determine if workaround is needed.
Changes in V2:
- Remove dependency on DT propery,
- Runtime determine SVID mode & ENABLE pin level,
- Update commit message.
---
 drivers/hwmon/pmbus/tda38640.c | 154 ++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index 450b0273fb59..c238330d2e6c 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -18,6 +18,127 @@ static const struct regulator_desc __maybe_unused tda38640_reg_desc[] = {
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
+static int svid_mode(struct i2c_client *client, struct tda38640_data *data)
+{
+	/* PMBUS_MFR_READ(0xD0) + MTP Address offset */
+	u8 write_buf[] = {0xd0, 0x44, 0x00};
+	u8 read_buf[2];
+	int ret, svid;
+	bool off, reg_en_pin_pol;
+
+	struct i2c_msg msgs[2] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.buf = write_buf,
+			.len = sizeof(write_buf),
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.buf = read_buf,
+			.len = sizeof(read_buf),
+		}
+	};
+
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret < 0) {
+		dev_err(&client->dev, "i2c_transfer failed. %d", ret);
+		return ret;
+	}
+
+	/*
+	 * 0x44[15] determines PMBus Operating Mode
+	 * If bit is set then it is SVID mode.
+	 */
+	svid = !!(read_buf[1] & BIT(7));
+
+	/*
+	 * Determine EN pin level for use in SVID mode.
+	 * This is done with help of STATUS_BYTE bit 6(OFF) & ON_OFF_CONFIG bit 2(EN pin polarity).
+	 */
+	if (svid) {
+		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		if (ret < 0)
+			return ret;
+		off = !!(ret & PB_STATUS_OFF);
+
+		ret = i2c_smbus_read_byte_data(client, PMBUS_ON_OFF_CONFIG);
+		if (ret < 0)
+			return ret;
+		reg_en_pin_pol = !!(ret & PB_ON_OFF_CONFIG_POLARITY_HIGH);
+		data->en_pin_lvl = off ^ reg_en_pin_pol;
+	}
+
+	return svid;
+}
+
 static struct pmbus_driver_info tda38640_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -26,7 +147,6 @@ static struct pmbus_driver_info tda38640_info = {
 	.format[PSC_CURRENT_IN] = linear,
 	.format[PSC_POWER] = linear,
 	.format[PSC_TEMPERATURE] = linear,
-
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_IIN
@@ -41,7 +161,37 @@ static struct pmbus_driver_info tda38640_info = {
 
 static int tda38640_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, &tda38640_info);
+	struct tda38640_data *data;
+	int svid;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	memcpy(&data->info, &tda38640_info, sizeof(tda38640_info));
+
+	if (IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR) && \
+	    of_property_read_bool(client->dev.of_node, "infineon,en-pin-fixed-level")) {
+		svid = svid_mode(client, data);
+		if (svid < 0) {
+			dev_err_probe(&client->dev, svid, "Could not determine operating mode.");
+			return svid;
+		}
+
+		/*
+		 * Apply ON_OFF_CONFIG workaround as enabling the regulator using the
+		 * OPERATION register doesn't work in SVID mode.
+		 *
+		 * One should configure PMBUS_ON_OFF_CONFIG here, but
+		 * PB_ON_OFF_CONFIG_POWERUP_CONTROL and PB_ON_OFF_CONFIG_EN_PIN_REQ
+		 * are ignored by the device.
+		 * Only PB_ON_OFF_CONFIG_POLARITY_HIGH has an effect.
+		 */
+		if (svid) {
+			data->info.read_byte_data = tda38640_read_byte_data;
+			data->info.write_byte_data = tda38640_write_byte_data;
+		}
+	}
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id tda38640_id[] = {
-- 
2.41.0

