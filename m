Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0CAC2BA83
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D6572073A
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozzBLIX+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgBOM0I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:08 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38078 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:08 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so6419364pfc.5
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ul4CF0duXZESNZdurZEkg7+R6i9VPUKre68+wWSoDQc=;
        b=ozzBLIX++84OgAr1hLH2tB32bVmxJNJAXMOEyfXQJiLIilHVmDitLF6VYIxr+h+Hep
         ZtVR0zSoWBu/En1/nablZVE7op54eTf3/FUR49LRoSBY465AIUMXUeNuheviFrVDEB8d
         m3ds/Y4Pv0AOavYR2XLouAMDFDeOjVDt5ocUOXpoFlcQTaVpY62wBDW9aiC7Lo0BAOSY
         iH2lKs40t6OIvZum3cyJiYN3cWQWPig4GPZtP0E0ucmDpzZIL78a9xh7dYpLm4dHvFtH
         1VUNTF+swa2ymKHp6gH4a4iFlD7axZ5jVbqFq+YlBeT6LivIrH4IYromud367BiTES3h
         jhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Ul4CF0duXZESNZdurZEkg7+R6i9VPUKre68+wWSoDQc=;
        b=sU71vNRoGppaqvCNFHi/6SeqgDGTWyWhMUTm1/l/zowh8q7fESIvyILe3WDX6y/RuY
         CGH8h816sSTNrFy7e98YjZvnO94sNXyuEm/xPQm0tF7Y2ereLdC0BeGzc9wmIXV9x2mT
         593oiT/0ad5iy3CjTgAvYjLFhPo4OzYo6j9kHCzICJpmyzGNw+Rgn8TpKECHfv5ZvLnS
         HcWGFvmg5x0+plaeUE9cHA2akGYqfbpR1alGTyFiKvCi4db1lSy6q3CmHh0J4uRYIfFC
         PXJ3pbEQaMBV2dPSgHOwQzCON2gv/cY20mVn1rjy7wBf0ijKnW5g+uEdZZPOv5Ug3tIj
         aL6w==
X-Gm-Message-State: APjAAAW5SWziKChsoyKGxRVY+VanP4nM9MjHpZHvT5roMOaKuTTb1Koa
        9+a0nAPGkQF16bs4ghKvjTZX0IqK
X-Google-Smtp-Source: APXvYqwuSgi+fTQwm60SQIcsc+uqPOj+8ZyvWsmDGZ5EY9tAIz0OuHjU8TW8rYF+mpAJY9wdF34AzQ==
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr8611343pgb.313.1581769566123;
        Sat, 15 Feb 2020 04:26:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q4sm10936430pfl.175.2020.02.15.04.26.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:05 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 2/8] hwmon: (pmbus) Add 'phase' parameter where needed for multi-phase support
Date:   Sat, 15 Feb 2020 04:25:56 -0800
Message-Id: <20200215122602.14245-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In preparation for multi-phase support, add 'phase' parameter to read_word
and set_page functions. Actual multi-phase support will be added in
a subsequent patch.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/pmbus-core.rst | 22 +++++++++++------
 drivers/hwmon/pmbus/adm1275.c      | 37 ++++++++++++++++++----------
 drivers/hwmon/pmbus/ibm-cffps.c    | 15 ++++++------
 drivers/hwmon/pmbus/ir35221.c      | 23 +++++++++++-------
 drivers/hwmon/pmbus/isl68137.c     |  3 ++-
 drivers/hwmon/pmbus/lm25066.c      | 39 ++++++++++++++++++------------
 drivers/hwmon/pmbus/ltc2978.c      | 36 ++++++++++++++++-----------
 drivers/hwmon/pmbus/ltc3815.c      | 20 +++++++++------
 drivers/hwmon/pmbus/max16064.c     |  7 +++---
 drivers/hwmon/pmbus/max20730.c     |  3 ++-
 drivers/hwmon/pmbus/max31785.c     |  6 ++---
 drivers/hwmon/pmbus/max34440.c     | 25 ++++++++++---------
 drivers/hwmon/pmbus/max8688.c      | 17 +++++++------
 drivers/hwmon/pmbus/pmbus.c        |  4 +--
 drivers/hwmon/pmbus/pmbus.h        | 11 ++++++---
 drivers/hwmon/pmbus/pmbus_core.c   | 36 ++++++++++++++++-----------
 drivers/hwmon/pmbus/ucd9000.c      |  2 +-
 drivers/hwmon/pmbus/zl6100.c       |  5 ++--
 18 files changed, 189 insertions(+), 122 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index 92515c446fe3..501b37b0610d 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -162,9 +162,12 @@ Read byte from page <page>, register <reg>.
 
 ::
 
-  int (*read_word_data)(struct i2c_client *client, int page, int reg);
+  int (*read_word_data)(struct i2c_client *client, int page, int phase,
+                        int reg);
 
-Read word from page <page>, register <reg>.
+Read word from page <page>, phase <pase>, register <reg>. If the chip does not
+support multiple phases, the phase parameter can be ignored. If the chip
+supports multiple phases, a phase value of 0xff indicates all phases.
 
 ::
 
@@ -201,16 +204,21 @@ is mandatory.
 
 ::
 
-  int pmbus_set_page(struct i2c_client *client, u8 page);
+  int pmbus_set_page(struct i2c_client *client, u8 page, u8 phase);
 
-Set PMBus page register to <page> for subsequent commands.
+Set PMBus page register to <page> and <phase> for subsequent commands.
+If the chip does not support multiple phases, the phase parameter is
+ignored. Otherwise, a phase value of 0xff selects all phases.
 
 ::
 
-  int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
+  int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 phase,
+                           u8 reg);
 
-Read word data from <page>, <reg>. Similar to i2c_smbus_read_word_data(), but
-selects page first.
+Read word data from <page>, <phase>, <reg>. Similar to
+i2c_smbus_read_word_data(), but selects page and phase first. If the chip does
+not support multiple phases, the phase parameter is ignored. Otherwise, a phase
+value of 0xff selects all phases.
 
 ::
 
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 5caa37fbfc18..e25f541227da 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -226,7 +226,8 @@ static int adm1275_write_pmon_config(const struct adm1275_data *data,
 	return ret;
 }
 
-static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
+static int adm1275_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	const struct adm1275_data *data = to_adm1275_data(info);
@@ -239,58 +240,68 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_IOUT_UC_FAULT_LIMIT:
 		if (!data->have_uc_fault)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1275_IOUT_WARN2_LIMIT);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1275_IOUT_WARN2_LIMIT);
 		break;
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
 		if (!data->have_oc_fault)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1275_IOUT_WARN2_LIMIT);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1275_IOUT_WARN2_LIMIT);
 		break;
 	case PMBUS_VOUT_OV_WARN_LIMIT:
 		if (data->have_vout)
 			return -ENODATA;
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   ADM1075_VAUX_OV_WARN_LIMIT);
 		break;
 	case PMBUS_VOUT_UV_WARN_LIMIT:
 		if (data->have_vout)
 			return -ENODATA;
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   ADM1075_VAUX_UV_WARN_LIMIT);
 		break;
 	case PMBUS_READ_VOUT:
 		if (data->have_vout)
 			return -ENODATA;
-		ret = pmbus_read_word_data(client, 0, ADM1075_READ_VAUX);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1075_READ_VAUX);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MIN:
 		if (!data->have_iout_min)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1293_IOUT_MIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1293_IOUT_MIN);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
-		ret = pmbus_read_word_data(client, 0, ADM1275_PEAK_IOUT);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1275_PEAK_IOUT);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, 0, ADM1275_PEAK_VOUT);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1275_PEAK_VOUT);
 		break;
 	case PMBUS_VIRT_READ_VIN_MAX:
-		ret = pmbus_read_word_data(client, 0, ADM1275_PEAK_VIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1275_PEAK_VIN);
 		break;
 	case PMBUS_VIRT_READ_PIN_MIN:
 		if (!data->have_pin_min)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1293_PIN_MIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1293_PIN_MIN);
 		break;
 	case PMBUS_VIRT_READ_PIN_MAX:
 		if (!data->have_pin_max)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1276_PEAK_PIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1276_PEAK_PIN);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
 		if (!data->have_temp_max)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, 0, ADM1278_PEAK_TEMP);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   ADM1278_PEAK_TEMP);
 		break;
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 3795fe55b84f..b9bfa43f2508 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -148,7 +148,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 	struct ibm_cffps *psu = to_psu(idxp, idx);
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
-	pmbus_set_page(psu->client, 0);
+	pmbus_set_page(psu->client, 0, 0xff);
 
 	switch (idx) {
 	case CFFPS_DEBUGFS_INPUT_HISTORY:
@@ -247,7 +247,7 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
 
 	switch (idx) {
 	case CFFPS_DEBUGFS_ON_OFF_CONFIG:
-		pmbus_set_page(psu->client, 0);
+		pmbus_set_page(psu->client, 0, 0xff);
 
 		rc = simple_write_to_buffer(&data, 1, ppos, buf, count);
 		if (rc <= 0)
@@ -325,13 +325,13 @@ static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
 }
 
 static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
-				    int reg)
+				    int phase, int reg)
 {
 	int rc, mfr;
 
 	switch (reg) {
 	case PMBUS_STATUS_WORD:
-		rc = pmbus_read_word_data(client, page, reg);
+		rc = pmbus_read_word_data(client, page, phase, reg);
 		if (rc < 0)
 			return rc;
 
@@ -348,7 +348,8 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 			rc |= PB_STATUS_OFF;
 		break;
 	case PMBUS_VIRT_READ_VMON:
-		rc = pmbus_read_word_data(client, page, CFFPS_12VCS_VOUT_CMD);
+		rc = pmbus_read_word_data(client, page, phase,
+					  CFFPS_12VCS_VOUT_CMD);
 		break;
 	default:
 		rc = -ENODATA;
@@ -379,7 +380,7 @@ static int ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
 	dev_dbg(&psu->client->dev, "LED brightness set: %d. Command: %d.\n",
 		brightness, next_led_state);
 
-	pmbus_set_page(psu->client, 0);
+	pmbus_set_page(psu->client, 0, 0xff);
 
 	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
 				       next_led_state);
@@ -401,7 +402,7 @@ static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
 
 	dev_dbg(&psu->client->dev, "LED blink set.\n");
 
-	pmbus_set_page(psu->client, 0);
+	pmbus_set_page(psu->client, 0, 0xff);
 
 	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
 				       CFFPS_LED_BLINK);
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index 0d878bcd6d26..3eea3e006a96 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -21,37 +21,42 @@
 #define IR35221_MFR_IOUT_VALLEY		0xcb
 #define IR35221_MFR_TEMP_VALLEY		0xcc
 
-static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
+static int ir35221_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	int ret;
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VIN_MAX:
-		ret = pmbus_read_word_data(client, page, IR35221_MFR_VIN_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   IR35221_MFR_VIN_PEAK);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, page, IR35221_MFR_VOUT_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   IR35221_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
-		ret = pmbus_read_word_data(client, page, IR35221_MFR_IOUT_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   IR35221_MFR_IOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
-		ret = pmbus_read_word_data(client, page, IR35221_MFR_TEMP_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   IR35221_MFR_TEMP_PEAK);
 		break;
 	case PMBUS_VIRT_READ_VIN_MIN:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   IR35221_MFR_VIN_VALLEY);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   IR35221_MFR_VOUT_VALLEY);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MIN:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   IR35221_MFR_IOUT_VALLEY);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MIN:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   IR35221_MFR_TEMP_VALLEY);
 		break;
 	default:
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 515596c92fe1..a95835a96014 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -49,7 +49,8 @@ static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
 	 * enabling AVS control is the workaround.
 	 */
 	if (op_val == ISL68137_VOUT_AVS) {
-		rc = pmbus_read_word_data(client, page, PMBUS_VOUT_COMMAND);
+		rc = pmbus_read_word_data(client, page, 0xff,
+					  PMBUS_VOUT_COMMAND);
 		if (rc < 0)
 			return rc;
 
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 05fce86f1f81..9e4cf0800186 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -211,7 +211,8 @@ struct lm25066_data {
 
 #define to_lm25066_data(x)  container_of(x, struct lm25066_data, info)
 
-static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
+static int lm25066_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	const struct lm25066_data *data = to_lm25066_data(info);
@@ -219,7 +220,7 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VMON:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_VAUX);
+		ret = pmbus_read_word_data(client, 0, 0xff, LM25066_READ_VAUX);
 		if (ret < 0)
 			break;
 		/* Adjust returned value to match VIN coefficients */
@@ -244,33 +245,40 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
 		}
 		break;
 	case PMBUS_READ_IIN:
-		ret = pmbus_read_word_data(client, 0, LM25066_MFR_READ_IIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_MFR_READ_IIN);
 		break;
 	case PMBUS_READ_PIN:
-		ret = pmbus_read_word_data(client, 0, LM25066_MFR_READ_PIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_MFR_READ_PIN);
 		break;
 	case PMBUS_IIN_OC_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   LM25066_MFR_IIN_OC_WARN_LIMIT);
 		break;
 	case PMBUS_PIN_OP_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   LM25066_MFR_PIN_OP_WARN_LIMIT);
 		break;
 	case PMBUS_VIRT_READ_VIN_AVG:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_AVG_VIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_READ_AVG_VIN);
 		break;
 	case PMBUS_VIRT_READ_VOUT_AVG:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_AVG_VOUT);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_READ_AVG_VOUT);
 		break;
 	case PMBUS_VIRT_READ_IIN_AVG:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_AVG_IIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_READ_AVG_IIN);
 		break;
 	case PMBUS_VIRT_READ_PIN_AVG:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_AVG_PIN);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_READ_AVG_PIN);
 		break;
 	case PMBUS_VIRT_READ_PIN_MAX:
-		ret = pmbus_read_word_data(client, 0, LM25066_READ_PIN_PEAK);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   LM25066_READ_PIN_PEAK);
 		break;
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret = 0;
@@ -288,13 +296,14 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
-static int lm25056_read_word_data(struct i2c_client *client, int page, int reg)
+static int lm25056_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	int ret;
 
 	switch (reg) {
 	case PMBUS_VIRT_VMON_UV_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   LM25056_VAUX_UV_WARN_LIMIT);
 		if (ret < 0)
 			break;
@@ -302,7 +311,7 @@ static int lm25056_read_word_data(struct i2c_client *client, int page, int reg)
 		ret = DIV_ROUND_CLOSEST(ret * 293, 6140);
 		break;
 	case PMBUS_VIRT_VMON_OV_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   LM25056_VAUX_OV_WARN_LIMIT);
 		if (ret < 0)
 			break;
@@ -310,7 +319,7 @@ static int lm25056_read_word_data(struct i2c_client *client, int page, int reg)
 		ret = DIV_ROUND_CLOSEST(ret * 293, 6140);
 		break;
 	default:
-		ret = lm25066_read_word_data(client, page, reg);
+		ret = lm25066_read_word_data(client, page, phase, reg);
 		break;
 	}
 	return ret;
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index f01f4887fb2e..50b8c6f91d66 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -151,7 +151,8 @@ static int ltc_wait_ready(struct i2c_client *client)
 	return -ETIMEDOUT;
 }
 
-static int ltc_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc_read_word_data(struct i2c_client *client, int page, int phase,
+			      int reg)
 {
 	int ret;
 
@@ -159,7 +160,7 @@ static int ltc_read_word_data(struct i2c_client *client, int page, int reg)
 	if (ret < 0)
 		return ret;
 
-	return pmbus_read_word_data(client, page, reg);
+	return pmbus_read_word_data(client, page, 0xff, reg);
 }
 
 static int ltc_read_byte_data(struct i2c_client *client, int page, int reg)
@@ -202,7 +203,7 @@ static int ltc_get_max(struct ltc2978_data *data, struct i2c_client *client,
 {
 	int ret;
 
-	ret = ltc_read_word_data(client, page, reg);
+	ret = ltc_read_word_data(client, page, 0xff, reg);
 	if (ret >= 0) {
 		if (lin11_to_val(ret) > lin11_to_val(*pmax))
 			*pmax = ret;
@@ -216,7 +217,7 @@ static int ltc_get_min(struct ltc2978_data *data, struct i2c_client *client,
 {
 	int ret;
 
-	ret = ltc_read_word_data(client, page, reg);
+	ret = ltc_read_word_data(client, page, 0xff, reg);
 	if (ret >= 0) {
 		if (lin11_to_val(ret) < lin11_to_val(*pmin))
 			*pmin = ret;
@@ -238,7 +239,8 @@ static int ltc2978_read_word_data_common(struct i2c_client *client, int page,
 				  &data->vin_max);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = ltc_read_word_data(client, page, LTC2978_MFR_VOUT_PEAK);
+		ret = ltc_read_word_data(client, page, 0xff,
+					 LTC2978_MFR_VOUT_PEAK);
 		if (ret >= 0) {
 			/*
 			 * VOUT is 16 bit unsigned with fixed exponent,
@@ -269,7 +271,8 @@ static int ltc2978_read_word_data_common(struct i2c_client *client, int page,
 	return ret;
 }
 
-static int ltc2978_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc2978_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct ltc2978_data *data = to_ltc2978_data(info);
@@ -281,7 +284,8 @@ static int ltc2978_read_word_data(struct i2c_client *client, int page, int reg)
 				  &data->vin_min);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
-		ret = ltc_read_word_data(client, page, LTC2978_MFR_VOUT_MIN);
+		ret = ltc_read_word_data(client, page, phase,
+					 LTC2978_MFR_VOUT_MIN);
 		if (ret >= 0) {
 			/*
 			 * VOUT_MIN is known to not be supported on some lots
@@ -314,7 +318,8 @@ static int ltc2978_read_word_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
-static int ltc2974_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc2974_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct ltc2978_data *data = to_ltc2978_data(info);
@@ -333,13 +338,14 @@ static int ltc2974_read_word_data(struct i2c_client *client, int page, int reg)
 		ret = 0;
 		break;
 	default:
-		ret = ltc2978_read_word_data(client, page, reg);
+		ret = ltc2978_read_word_data(client, page, phase, reg);
 		break;
 	}
 	return ret;
 }
 
-static int ltc2975_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc2975_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct ltc2978_data *data = to_ltc2978_data(info);
@@ -367,13 +373,14 @@ static int ltc2975_read_word_data(struct i2c_client *client, int page, int reg)
 		ret = 0;
 		break;
 	default:
-		ret = ltc2978_read_word_data(client, page, reg);
+		ret = ltc2978_read_word_data(client, page, phase, reg);
 		break;
 	}
 	return ret;
 }
 
-static int ltc3880_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc3880_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct ltc2978_data *data = to_ltc2978_data(info);
@@ -405,7 +412,8 @@ static int ltc3880_read_word_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
-static int ltc3883_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc3883_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct ltc2978_data *data = to_ltc2978_data(info);
@@ -420,7 +428,7 @@ static int ltc3883_read_word_data(struct i2c_client *client, int page, int reg)
 		ret = 0;
 		break;
 	default:
-		ret = ltc3880_read_word_data(client, page, reg);
+		ret = ltc3880_read_word_data(client, page, phase, reg);
 		break;
 	}
 	return ret;
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index b83a18a58364..3036263e0a66 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -55,7 +55,7 @@ static int ltc3815_write_byte(struct i2c_client *client, int page, u8 reg)
 		 * LTC3815 does not support the CLEAR_FAULTS command.
 		 * Emulate it by clearing the status register.
 		 */
-		ret = pmbus_read_word_data(client, 0, PMBUS_STATUS_WORD);
+		ret = pmbus_read_word_data(client, 0, 0xff, PMBUS_STATUS_WORD);
 		if (ret > 0) {
 			pmbus_write_word_data(client, 0, PMBUS_STATUS_WORD,
 					      ret);
@@ -69,25 +69,31 @@ static int ltc3815_write_byte(struct i2c_client *client, int page, u8 reg)
 	return ret;
 }
 
-static int ltc3815_read_word_data(struct i2c_client *client, int page, int reg)
+static int ltc3815_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	int ret;
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VIN_MAX:
-		ret = pmbus_read_word_data(client, page, LTC3815_MFR_VIN_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   LTC3815_MFR_VIN_PEAK);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, page, LTC3815_MFR_VOUT_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   LTC3815_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
-		ret = pmbus_read_word_data(client, page, LTC3815_MFR_TEMP_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   LTC3815_MFR_TEMP_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
-		ret = pmbus_read_word_data(client, page, LTC3815_MFR_IOUT_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   LTC3815_MFR_IOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IIN_MAX:
-		ret = pmbus_read_word_data(client, page, LTC3815_MFR_IIN_PEAK);
+		ret = pmbus_read_word_data(client, page, phase,
+					   LTC3815_MFR_IIN_PEAK);
 		break;
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
 	case PMBUS_VIRT_RESET_VIN_HISTORY:
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index b3e7b8d2e69d..288e93f74c28 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -15,17 +15,18 @@
 #define MAX16064_MFR_VOUT_PEAK		0xd4
 #define MAX16064_MFR_TEMPERATURE_PEAK	0xd6
 
-static int max16064_read_word_data(struct i2c_client *client, int page, int reg)
+static int max16064_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
 {
 	int ret;
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX16064_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX16064_MFR_TEMPERATURE_PEAK);
 		break;
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 294e2212f61e..c0bb05487e0e 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -85,7 +85,8 @@ static u32 max_current[][5] = {
 	[max20743] = { 18900, 24100, 29200, 34100 },
 };
 
-static int max20730_read_word_data(struct i2c_client *client, int page, int reg)
+static int max20730_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	const struct max20730_data *data = to_max20730_data(info);
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 254b0f98c755..d9aa5c873d21 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -72,7 +72,7 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
 
 	cmdbuf[0] = reg;
 
-	rc = pmbus_set_page(client, page);
+	rc = pmbus_set_page(client, page, 0xff);
 	if (rc < 0)
 		return rc;
 
@@ -110,7 +110,7 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 	if (config < 0)
 		return config;
 
-	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
+	command = pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -126,7 +126,7 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 }
 
 static int max31785_read_word_data(struct i2c_client *client, int page,
-				   int reg)
+				   int phase, int reg)
 {
 	u32 val;
 	int rv;
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 5c63a6600729..18b4e071067f 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -41,7 +41,8 @@ struct max34440_data {
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
 
-static int max34440_read_word_data(struct i2c_client *client, int page, int reg)
+static int max34440_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
 {
 	int ret;
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
@@ -49,44 +50,44 @@ static int max34440_read_word_data(struct i2c_client *client, int page, int reg)
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VOUT_MIN:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_MIN);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
 		if (data->id != max34446 && data->id != max34451)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_IOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_POUT_AVG:
 		if (data->id != max34446)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_POUT_AVG);
 		break;
 	case PMBUS_VIRT_READ_POUT_MAX:
 		if (data->id != max34446)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_POUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_TEMP_AVG:
 		if (data->id != max34446 && data->id != max34460 &&
 		    data->id != max34461)
 			return -ENXIO;
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_TEMPERATURE_AVG);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
-		ret = pmbus_read_word_data(client, page,
+		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_TEMPERATURE_PEAK);
 		break;
 	case PMBUS_VIRT_RESET_POUT_HISTORY:
@@ -159,14 +160,14 @@ static int max34440_read_byte_data(struct i2c_client *client, int page, int reg)
 	int mfg_status;
 
 	if (page >= 0) {
-		ret = pmbus_set_page(client, page);
+		ret = pmbus_set_page(client, page, 0xff);
 		if (ret < 0)
 			return ret;
 	}
 
 	switch (reg) {
 	case PMBUS_STATUS_IOUT:
-		mfg_status = pmbus_read_word_data(client, 0,
+		mfg_status = pmbus_read_word_data(client, 0, 0xff,
 						  PMBUS_STATUS_MFR_SPECIFIC);
 		if (mfg_status < 0)
 			return mfg_status;
@@ -176,7 +177,7 @@ static int max34440_read_byte_data(struct i2c_client *client, int page, int reg)
 			ret |= PB_IOUT_OC_FAULT;
 		break;
 	case PMBUS_STATUS_TEMPERATURE:
-		mfg_status = pmbus_read_word_data(client, 0,
+		mfg_status = pmbus_read_word_data(client, 0, 0xff,
 						  PMBUS_STATUS_MFR_SPECIFIC);
 		if (mfg_status < 0)
 			return mfg_status;
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index bc5f4cb6450e..643ccfc05106 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -28,7 +28,8 @@
 #define MAX8688_STATUS_OT_FAULT		BIT(13)
 #define MAX8688_STATUS_OT_WARNING	BIT(14)
 
-static int max8688_read_word_data(struct i2c_client *client, int page, int reg)
+static int max8688_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
 {
 	int ret;
 
@@ -37,13 +38,15 @@ static int max8688_read_word_data(struct i2c_client *client, int page, int reg)
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VOUT_MAX:
-		ret = pmbus_read_word_data(client, 0, MAX8688_MFR_VOUT_PEAK);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   MAX8688_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
-		ret = pmbus_read_word_data(client, 0, MAX8688_MFR_IOUT_PEAK);
+		ret = pmbus_read_word_data(client, 0, 0xff,
+					   MAX8688_MFR_IOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
-		ret = pmbus_read_word_data(client, 0,
+		ret = pmbus_read_word_data(client, 0, 0xff,
 					   MAX8688_MFR_TEMPERATURE_PEAK);
 		break;
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
@@ -94,7 +97,7 @@ static int max8688_read_byte_data(struct i2c_client *client, int page, int reg)
 
 	switch (reg) {
 	case PMBUS_STATUS_VOUT:
-		mfg_status = pmbus_read_word_data(client, 0,
+		mfg_status = pmbus_read_word_data(client, 0, 0xff,
 						  MAX8688_MFG_STATUS);
 		if (mfg_status < 0)
 			return mfg_status;
@@ -108,7 +111,7 @@ static int max8688_read_byte_data(struct i2c_client *client, int page, int reg)
 			ret |= PB_VOLTAGE_OV_FAULT;
 		break;
 	case PMBUS_STATUS_IOUT:
-		mfg_status = pmbus_read_word_data(client, 0,
+		mfg_status = pmbus_read_word_data(client, 0, 0xff,
 						  MAX8688_MFG_STATUS);
 		if (mfg_status < 0)
 			return mfg_status;
@@ -120,7 +123,7 @@ static int max8688_read_byte_data(struct i2c_client *client, int page, int reg)
 			ret |= PB_IOUT_OC_FAULT;
 		break;
 	case PMBUS_STATUS_TEMPERATURE:
-		mfg_status = pmbus_read_word_data(client, 0,
+		mfg_status = pmbus_read_word_data(client, 0, 0xff,
 						  MAX8688_MFG_STATUS);
 		if (mfg_status < 0)
 			return mfg_status;
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 51e8312b6c2d..6d384e8ee1db 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -102,10 +102,10 @@ static int pmbus_identify(struct i2c_client *client,
 			int page;
 
 			for (page = 1; page < PMBUS_PAGES; page++) {
-				if (pmbus_set_page(client, page) < 0)
+				if (pmbus_set_page(client, page, 0xff) < 0)
 					break;
 			}
-			pmbus_set_page(client, 0);
+			pmbus_set_page(client, 0, 0xff);
 			info->pages = page;
 		} else {
 			info->pages = 1;
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index cbc47af732c2..27c7ae0ffa6b 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -418,7 +418,8 @@ struct pmbus_driver_info {
 	 * the standard register.
 	 */
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
-	int (*read_word_data)(struct i2c_client *client, int page, int reg);
+	int (*read_word_data)(struct i2c_client *client, int page, int phase,
+			      int reg);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
 			       u16 word);
 	int (*write_byte)(struct i2c_client *client, int page, u8 value);
@@ -457,9 +458,11 @@ extern const struct regulator_ops pmbus_regulator_ops;
 /* Function declarations */
 
 void pmbus_clear_cache(struct i2c_client *client);
-int pmbus_set_page(struct i2c_client *client, int page);
-int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg);
-int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg, u16 word);
+int pmbus_set_page(struct i2c_client *client, int page, int phase);
+int pmbus_read_word_data(struct i2c_client *client, int page, int phase,
+			 u8 reg);
+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
+			  u16 word);
 int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg);
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value);
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d9c17feb7b4a..9343ca7d4069 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -146,7 +146,7 @@ void pmbus_clear_cache(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 
-int pmbus_set_page(struct i2c_client *client, int page)
+int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int rv;
@@ -177,7 +177,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
+	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
@@ -208,7 +208,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
+	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
@@ -286,11 +286,11 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 }
 EXPORT_SYMBOL_GPL(pmbus_update_fan);
 
-int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
+int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
+	rv = pmbus_set_page(client, page, phase);
 	if (rv < 0)
 		return rv;
 
@@ -320,14 +320,15 @@ static int pmbus_read_virt_reg(struct i2c_client *client, int page, int reg)
  * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
  */
-static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
+static int _pmbus_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
 	int status;
 
 	if (info->read_word_data) {
-		status = info->read_word_data(client, page, reg);
+		status = info->read_word_data(client, page, phase, reg);
 		if (status != -ENODATA)
 			return status;
 	}
@@ -335,14 +336,20 @@ static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
 	if (reg >= PMBUS_VIRT_BASE)
 		return pmbus_read_virt_reg(client, page, reg);
 
-	return pmbus_read_word_data(client, page, reg);
+	return pmbus_read_word_data(client, page, phase, reg);
+}
+
+/* Same as above, but without phase parameter, for use in check functions */
+static int __pmbus_read_word_data(struct i2c_client *client, int page, int reg)
+{
+	return _pmbus_read_word_data(client, page, 0xff, reg);
 }
 
 int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
+	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
@@ -354,7 +361,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
+	rv = pmbus_set_page(client, page, 0xff);
 	if (rv < 0)
 		return rv;
 
@@ -440,7 +447,7 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
 
 	have_rpm = !!(config & pmbus_fan_rpm_mask[id]);
 	if (want_rpm == have_rpm)
-		return pmbus_read_word_data(client, page,
+		return pmbus_read_word_data(client, page, 0xff,
 					    pmbus_fan_command_registers[id]);
 
 	/* Can't sensibly map between RPM and PWM, just return zero */
@@ -530,7 +537,7 @@ EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
 
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
 {
-	return pmbus_check_register(client, _pmbus_read_word_data, page, reg);
+	return pmbus_check_register(client, __pmbus_read_word_data, page, reg);
 }
 EXPORT_SYMBOL_GPL(pmbus_check_word_register);
 
@@ -595,6 +602,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 				sensor->data
 				    = _pmbus_read_word_data(client,
 							    sensor->page,
+							    0xff,
 							    sensor->reg);
 		}
 		pmbus_clear_faults(client);
@@ -1964,7 +1972,7 @@ static ssize_t pmbus_show_samples(struct device *dev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
 
-	val = _pmbus_read_word_data(client, reg->page, reg->attr->reg);
+	val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
 	if (val < 0)
 		return val;
 
@@ -2120,7 +2128,7 @@ static int pmbus_read_status_byte(struct i2c_client *client, int page)
 
 static int pmbus_read_status_word(struct i2c_client *client, int page)
 {
-	return _pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
+	return _pmbus_read_word_data(client, page, 0xff, PMBUS_STATUS_WORD);
 }
 
 static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 23ea3415f166..81f4c4f166cd 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -370,7 +370,7 @@ static void ucd9000_probe_gpio(struct i2c_client *client,
 #ifdef CONFIG_DEBUG_FS
 static int ucd9000_get_mfr_status(struct i2c_client *client, u8 *buffer)
 {
-	int ret = pmbus_set_page(client, 0);
+	int ret = pmbus_set_page(client, 0, 0xff);
 
 	if (ret < 0)
 		return ret;
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 190b898e404a..3a827d0a881d 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -125,7 +125,8 @@ static inline void zl6100_wait(const struct zl6100_data *data)
 	}
 }
 
-static int zl6100_read_word_data(struct i2c_client *client, int page, int reg)
+static int zl6100_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct zl6100_data *data = to_zl6100_data(info);
@@ -167,7 +168,7 @@ static int zl6100_read_word_data(struct i2c_client *client, int page, int reg)
 	}
 
 	zl6100_wait(data);
-	ret = pmbus_read_word_data(client, page, vreg);
+	ret = pmbus_read_word_data(client, page, phase, vreg);
 	data->access = ktime_get();
 	if (ret < 0)
 		return ret;
-- 
2.17.1

