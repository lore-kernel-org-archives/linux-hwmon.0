Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0325C0015E
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 13:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbjGNNvr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbjGNNvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 09:51:44 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B65535B0
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:36 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99364ae9596so257405066b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689342694; x=1691934694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cANOGybmFj7Zq4gL4JbpXEsjPGs2Mp7a7KHpPLol+0g=;
        b=elMOQ6Cxyp9aePnQwUVZxGZTe4HItRyaljpXRaHdVNx/HyYZ23eUe7m33iV3g49oXx
         NFcl6ARzebs0GWpgPd3Vi9I1gICQQnzRvkdswTqsAsBAdRgIOJx634dJwFvY6oY49zpU
         axKNjNfX8hBv4Mt5+m+1rQRoD+r9aj1lVYTXgOtFT+mTNMXuZozFvVmpoOM7AhRkko1u
         uGjvfuAETqeLMd5R9AMcdENX7wFmQwLFY9EL63YTBsajxaPqQI7S/f1LbUM+LQ9FfWCw
         bCuSaAflH/DJZ9hBqqE6FX++XRmd6y2DRZN09jegNLBz5RbkpVCKpuUXKOJ05RywichT
         eHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342694; x=1691934694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cANOGybmFj7Zq4gL4JbpXEsjPGs2Mp7a7KHpPLol+0g=;
        b=I50h32j6uzro1UuDltqfsFjh/ovV8yVLCbRY5oHgKOadU7821VUATsVV7WleBaTrGz
         SH252N5+b5EhMZLCG28UZjErhkWRVw991t82Qj3PIyDrohq+u4McF3YZ2SPb9YPq57u8
         RRE2+e5WUMrlNyu7BO1nkkJxjhv2YDtXwMOljXHMTPYdpIOEXI9Xcp5dwVT2Wc+Bzxs6
         G89t5HPH3OqDL6xCHvZEgEaYpd3VhMjq2EbxDWiP0OPNIwg9sYSl2YgEvG7+DVrDCr8F
         6C3K+5nhqRcTWdM8eVJig2bFracTmJvRogik9wA0483HzoVvfxsl4liXz01l3rA3FvwJ
         3Dsw==
X-Gm-Message-State: ABy/qLZ++yIXTtoGnaxh9WvhTFPIopBkGhRgnZtuJYmu4tdCB6i4RxUn
        qRbC70e1pRoB5r8239AlMG+fUw==
X-Google-Smtp-Source: APBJJlEOFHP+bl7m0zAqVK4MnGT5p2kOeFC8XU46qTTTSOnF48gexnMF58zEckeUIP/wZGVZ1HOOow==
X-Received: by 2002:a17:906:35c2:b0:98d:ef34:c0c8 with SMTP id p2-20020a17090635c200b0098def34c0c8mr3479555ejb.67.1689342694776;
        Fri, 14 Jul 2023 06:51:34 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906261500b0099236e3f270sm5405991ejc.58.2023.07.14.06.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:51:34 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 5/8] hwmon: (pmbus/mp2975) Make phase count variable
Date:   Fri, 14 Jul 2023 15:51:13 +0200
Message-ID: <20230714135124.2645339-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
References: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

In order to add support for MP2973 and MP2971 replace hardcoded
phase count for both channels by a variable.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 0dca4c24fe5a..a4453b9284fa 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -61,10 +61,15 @@ enum chips {
 	mp2975
 };
 
+static const int mp2975_max_phases[][MP2975_PAGE_NUM] = {
+	[mp2975] = { MP2975_MAX_PHASE_RAIL1, MP2975_MAX_PHASE_RAIL2 },
+};
+
 struct mp2975_data {
 	struct pmbus_driver_info info;
 	enum chips chip_id;
 	int vout_scale;
+	int max_phases[MP2975_PAGE_NUM];
 	int vid_step[MP2975_PAGE_NUM];
 	int vref[MP2975_PAGE_NUM];
 	int vref_off[MP2975_PAGE_NUM];
@@ -304,25 +309,25 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
-static int mp2975_identify_multiphase_rail2(struct i2c_client *client)
+static int mp2975_identify_multiphase_rail2(struct i2c_client *client,
+					    struct mp2975_data *data)
 {
 	int ret;
 
 	/*
-	 * Identify multiphase for rail 2 - could be from 0 to 4.
+	 * Identify multiphase for rail 2 - could be from 0 to data->max_phases[1].
 	 * In case phase number is zero – only page zero is supported
 	 */
 	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
 	if (ret < 0)
 		return ret;
 
-	/* Identify multiphase for rail 2 - could be from 0 to 4. */
 	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R2);
 	if (ret < 0)
 		return ret;
 
 	ret &= GENMASK(2, 0);
-	return (ret >= 4) ? 4 : ret;
+	return (ret >= data->max_phases[1]) ? data->max_phases[1] : ret;
 }
 
 static void mp2975_set_phase_rail1(struct pmbus_driver_info *info)
@@ -353,7 +358,7 @@ mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_data *data,
 	if (ret < 0)
 		return ret;
 
-	/* Identify multiphase for rail 1 - could be from 1 to 8. */
+	/* Identify multiphase for rail 1 - could be from 1 to data->max_phases[0]. */
 	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R1);
 	if (ret <= 0)
 		return ret;
@@ -361,19 +366,19 @@ mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_data *data,
 	info->phases[0] = ret & GENMASK(3, 0);
 
 	/*
-	 * The device provides a total of 8 PWM pins, and can be configured
+	 * The device provides a total of $n PWM pins, and can be configured
 	 * to different phase count applications for rail 1 and rail 2.
-	 * Rail 1 can be set to 8 phases, while rail 2 can only be set to 4
-	 * phases at most. When rail 1’s phase count is configured as 0, rail
+	 * Rail 1 can be set to $n phases, while rail 2 can be set to less than
+	 * that. When rail 1’s phase count is configured as 0, rail
 	 * 1 operates with 1-phase DCM. When rail 2 phase count is configured
 	 * as 0, rail 2 is disabled.
 	 */
-	if (info->phases[0] > MP2975_MAX_PHASE_RAIL1)
+	if (info->phases[0] > data->max_phases[0])
 		return -EINVAL;
 
 	mp2975_set_phase_rail1(info);
-	num_phases2 = min(MP2975_MAX_PHASE_RAIL1 - info->phases[0],
-			  MP2975_MAX_PHASE_RAIL2);
+	num_phases2 = min(data->max_phases[0] - info->phases[0],
+			  data->max_phases[1]);
 	if (info->phases[1] && info->phases[1] <= num_phases2)
 		mp2975_set_phase_rail2(info, num_phases2);
 
@@ -669,11 +674,13 @@ static int mp2975_probe(struct i2c_client *client)
 	else
 		data->chip_id = i2c_match_id(mp2975_id, client)->driver_data;
 
-	memcpy(&data->info, &mp2975_info, sizeof(*info));
+	memcpy(data->max_phases, mp2975_max_phases[data->chip_id],
+	       sizeof(data->max_phases));
+
 	info = &data->info;
 
 	/* Identify multiphase configuration for rail 2. */
-	ret = mp2975_identify_multiphase_rail2(client);
+	ret = mp2975_identify_multiphase_rail2(client, data);
 	if (ret < 0)
 		return ret;
 
-- 
2.41.0

