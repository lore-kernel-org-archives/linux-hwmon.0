Return-Path: <SRS0=e0Qf=AU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B346BC433DF
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jul 2020 04:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 844D5206F6
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jul 2020 04:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+kVGjQt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGIEGW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Jul 2020 00:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgGIEGV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Jul 2020 00:06:21 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2A0C061A0B
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2020 21:06:21 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 205so1321647yby.19
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2020 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=1y2c3rjVWMDvkKdYX8ZNaWmxEBIIQ3QnKUzqSw9YCtw=;
        b=v+kVGjQtYzAabSAO2hVKtBYznz8uI02EUUuXTacWLcGXnVXhea9CwSYIsZtGhtthah
         h/+cSWroxJWyTyGcFs465H2HD9/sIjqtZFwUH03rkplMnoTi1vTfMBerm5WA517N4Qfg
         EJeH/U3ffEFGZCS3iICsNNefitXPX3j3iy9S1ip8ujMtHfAGmuiBmxovYam+sjIF1B04
         HFwkf3qBzbRKekmUJ68IpQMvcUg611xkelANY1Fltk4u7wAbpBNEOcXalgIV1Rw0lSIW
         vv3tnHZ1ZDyPuikQ9k9xf1EK/mhOQPeSrLKQUH4q36ZNQ5u8zfRk8t3yIJ5iaBPNn4qH
         92gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=1y2c3rjVWMDvkKdYX8ZNaWmxEBIIQ3QnKUzqSw9YCtw=;
        b=gUWR9aeiY+gurp1EXrF0DS2AwT0QPcsITfdk5ZTDz/3cHucsfPz5bY+Oew/X8uSKKu
         lwU+9qAgSX51sZXV4KZ84LUFgtYLZcRcbqO24+VZgV2ynFH3hkoMMLESUYWDg4m5JOp0
         sKG9VMfe0aUWa0owNukZoRnMqUiNjgV5m88spgC4gnthZtgPFmXPqC71FdY6OMj6GNa8
         /EsheTL8ClaWSyg5zVoqwe/AzLDTC1lNEa5Z+grlxZ+4I5j52tU/gxLzf7p5ndw3T7jm
         9frNzSmMWaqa6PxGgIZJ3CTJ0zv8V8bZgHnUPjvcxYYOD5hrPkFt+O3jNq9lfEmhrH1z
         tfNQ==
X-Gm-Message-State: AOAM533pMXS+zDgdMLeNE41EqE62OdFDEBvJNv0ACB7eLOimsaAOCKlG
        2aSfKVWwhZt5KWwH8E6rF8lxo8xxhinCg83v
X-Google-Smtp-Source: ABdhPJysVuabU1/EIYkuOguPqwUhvSghCQ6RiPLy3m040sjW13pEIAe6T9sUlWstOcS5Rovj8NjC7SwRQ2He9Hk+
X-Received: by 2002:a25:4143:: with SMTP id o64mr17348936yba.226.1594267580232;
 Wed, 08 Jul 2020 21:06:20 -0700 (PDT)
Date:   Thu,  9 Jul 2020 04:06:12 +0000
Message-Id: <20200709040612.3977094-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v2] hwmon: adm1275: Make sure we are reading enough data for
 different chips
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linchuyuan@google.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Issue:
When PEC is enabled, binding adm1272 to the adm1275 would
fail due to PEC error. See below:
adm1275: probe of xxxx failed with error -74

Diagnosis:
Per the datasheet of adm1272, adm1278, adm1293 and amd1294,
PMON_CONFIG (0xd4) is 16bits wide. On the other hand,
PMON_CONFIG (0xd4) for adm1275 is 8bits wide. The driver should not
assume everything is 8bits wide and read only 8bits from it.

Solution:
If it is adm1272, adm1278, adm1293 and adm1294, use i2c_read_word.
Else, use i2c_read_byte

Testing:
Binding adm1272 to the driver.
The change is only tested on adm1272.

Signed-off-by: Chu Lin <linchuyuan@google.com>
---

ChangeLog v1 -> v2
  - Rename config_read_fn_ptr to config_read_fn
  - Move config_read_fn to the first line as it is the longest
    variable declaration
  - Include adm1293 and adm1294
  - Remove the inline comment as I think the purpose is obvious


 drivers/hwmon/pmbus/adm1275.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e25f541227da..19317575d1c6 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -465,6 +465,7 @@ MODULE_DEVICE_TABLE(i2c, adm1275_id);
 static int adm1275_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	s32 (*config_read_fn)(const struct i2c_client *client, u8 reg);
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
 	int config, device_config;
 	int ret;
@@ -510,11 +511,16 @@ static int adm1275_probe(struct i2c_client *client,
 			   "Device mismatch: Configured %s, detected %s\n",
 			   id->name, mid->name);
 
-	config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
+	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+		config_read_fn = i2c_smbus_read_word_data;
+	else
+		config_read_fn = i2c_smbus_read_byte_data;
+	config = config_read_fn(client, ADM1275_PMON_CONFIG);
 	if (config < 0)
 		return config;
 
-	device_config = i2c_smbus_read_byte_data(client, ADM1275_DEVICE_CONFIG);
+	device_config = config_read_fn(client, ADM1275_DEVICE_CONFIG);
 	if (device_config < 0)
 		return device_config;
 
-- 
2.27.0.383.g050319c2ae-goog

