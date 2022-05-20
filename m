Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D440C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347936AbiETJyR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347969AbiETJyP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:15 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36E014ACB1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:12 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:51 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 5/8] hwmon: (lm90) define maximum number of channels that are supported
Date:   Fri, 20 May 2022 11:32:41 +0200
Message-Id: <20220520093243.2523749-6-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040313;
        bh=CueFz9a7mfkox4k37DjBXT5XaBNq4PIE4cBWeHaaVDo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=rcBwsHtntotWrE+OV4Qbax2w9lyytelLIiK6hasa66dEZo9cTyUXG5UdM0Dld81OK
         gvglrQl2T81hrPFZDeMMvKmOu1MKkp/zsqZu/SVP8dOOeYnD2vn7iXOwT+M6LgHYkV
         jo3WJs6NJ0F7Rjfu+0tBZFAT3a3JdwVaIioL+Ap8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Use this define in all the places where literal '3' was used in this
context.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 00fd5734f217..f642c6fd1641 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -93,6 +93,9 @@
 #include <linux/interrupt.h>
 #include <linux/regulator/consumer.h>
 
+/* The maximum number of channels currently supported */
+#define MAX_CHANNELS 3
+
 /*
  * Addresses to scan
  * Address is fully defined internally and cannot be changed except for
@@ -521,9 +524,9 @@ enum lm90_temp11_reg_index {
 struct lm90_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
-	u32 channel_config[4];
+	u32 channel_config[MAX_CHANNELS + 1];
 	struct hwmon_channel_info temp_info;
-	const struct hwmon_channel_info *info[3];
+	const struct hwmon_channel_info *info[MAX_CHANNELS];
 	struct hwmon_chip_info chip;
 	struct mutex update_lock;
 	bool valid;		/* true if register values are valid */
@@ -1223,32 +1226,32 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	return err;
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
 
-static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
-static const u8 lm90_max_alarm_bits[3] = { 6, 4, 12 };
-static const u8 lm90_crit_alarm_bits[3] = { 0, 1, 9 };
-static const u8 lm90_crit_alarm_bits_swapped[3] = { 1, 0, 9 };
-static const u8 lm90_emergency_alarm_bits[3] = { 15, 13, 14 };
-static const u8 lm90_fault_bits[3] = { 0, 2, 10 };
+static const u8 lm90_min_alarm_bits[MAX_CHANNELS] = { 5, 3, 11 };
+static const u8 lm90_max_alarm_bits[MAX_CHANNELS] = { 6, 4, 12 };
+static const u8 lm90_crit_alarm_bits[MAX_CHANNELS] = { 0, 1, 9 };
+static const u8 lm90_crit_alarm_bits_swapped[MAX_CHANNELS] = { 1, 0, 9 };
+static const u8 lm90_emergency_alarm_bits[MAX_CHANNELS] = { 15, 13, 14 };
+static const u8 lm90_fault_bits[MAX_CHANNELS] = { 0, 2, 10 };
 
 static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
-- 
2.36.1

