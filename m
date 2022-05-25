Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88C8C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244356AbiEYHha (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244337AbiEYHhY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:24 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661885F8E8
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:21 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:19 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 5/7] hwmon: (lm90) Define maximum number of channels that are supported
Date:   Wed, 25 May 2022 09:36:55 +0200
Message-Id: <20220525073657.573327-6-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464240;
        bh=WpSCCaXVgV8guUzHhXFxPXtohySKH0oEJGvpMDhhHbE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=kRRzJ+6+exXQ9Znvc95NwRMff6Ss0GZYCLU2IGLTn1I/3oqI2/THbL8DlJuUvaYw2
         AhMB8GucSWVFjofBWk67FV1zLLjFVeVzattp4KYJVKKXi+K3I75xdccoDTnirEr2Hu
         SWVcflYCv0KqsCO9U/WtsBNSmLLFxScKcOVrXnew=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Use this define in all the places where literal '3' was used in this
context.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index d226f1dea2ba..82b020ffd490 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -110,6 +110,9 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+/* The maximum number of channels currently supported */
+#define MAX_CHANNELS	3
+
 /*
  * Addresses to scan
  * Address is fully defined internally and cannot be changed except for
@@ -684,7 +687,7 @@ struct lm90_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
 	u32 chip_config[2];
-	u32 channel_config[4];
+	u32 channel_config[MAX_CHANNELS + 1];
 	struct hwmon_channel_info chip_info;
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
@@ -1436,32 +1439,32 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
 }
 
-static const u8 lm90_temp_index[3] = {
+static const u8 lm90_temp_index[MAX_CHANNELS] = {
 	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
 };
 
-static const u8 lm90_temp_min_index[3] = {
+static const u8 lm90_temp_min_index[MAX_CHANNELS] = {
 	LOCAL_LOW, REMOTE_LOW, REMOTE2_LOW
 };
 
-static const u8 lm90_temp_max_index[3] = {
+static const u8 lm90_temp_max_index[MAX_CHANNELS] = {
 	LOCAL_HIGH, REMOTE_HIGH, REMOTE2_HIGH
 };
 
-static const u8 lm90_temp_crit_index[3] = {
+static const u8 lm90_temp_crit_index[MAX_CHANNELS] = {
 	LOCAL_CRIT, REMOTE_CRIT, REMOTE2_CRIT
 };
 
-static const u8 lm90_temp_emerg_index[3] = {
+static const u8 lm90_temp_emerg_index[MAX_CHANNELS] = {
 	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
 };
 
-static const u16 lm90_min_alarm_bits[3] = { BIT(5), BIT(3), BIT(11) };
-static const u16 lm90_max_alarm_bits[3] = { BIT(6), BIT(4), BIT(12) };
-static const u16 lm90_crit_alarm_bits[3] = { BIT(0), BIT(1), BIT(9) };
-static const u16 lm90_crit_alarm_bits_swapped[3] = { BIT(1), BIT(0), BIT(9) };
-static const u16 lm90_emergency_alarm_bits[3] = { BIT(15), BIT(13), BIT(14) };
-static const u16 lm90_fault_bits[3] = { BIT(0), BIT(2), BIT(10) };
+static const u16 lm90_min_alarm_bits[MAX_CHANNELS] = { BIT(5), BIT(3), BIT(11) };
+static const u16 lm90_max_alarm_bits[MAX_CHANNELS] = { BIT(6), BIT(4), BIT(12) };
+static const u16 lm90_crit_alarm_bits[MAX_CHANNELS] = { BIT(0), BIT(1), BIT(9) };
+static const u16 lm90_crit_alarm_bits_swapped[MAX_CHANNELS] = { BIT(1), BIT(0), BIT(9) };
+static const u16 lm90_emergency_alarm_bits[MAX_CHANNELS] = { BIT(15), BIT(13), BIT(14) };
+static const u16 lm90_fault_bits[MAX_CHANNELS] = { BIT(0), BIT(2), BIT(10) };
 
 static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
-- 
2.36.1

