Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAEEC00528
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 11:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbjGLLti (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbjGLLtG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 07:49:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4914A1992
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:48:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3142ee41fd2so6900180f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689162499; x=1691754499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ6ZilaXIbXVvZQf4zwkqGWFB61+kWs1K8oV/rSXRlI=;
        b=XOpzP0vYSGIErNEX8B6llRYPeraEJcKzdS/EX9s5HRTGB71CQnA/5+MiaJwWc3+b2+
         +F85ToEAhR8B0ke0RQMa2P8gg7phxnD2jDFISVC9pdYWzyXqiziUbOi98tPjXpbTPCQg
         7KNjyA0YhWhIPHE+rK+IQMNo4l+n/yMysGcu6g24JozD2Ulf3rwhi9Mox8srl1P2Ao9G
         kBPPF+WRUR7IHxOSdBw11V0xDqbkKJJ+GQlN27pw2RSk+9dVtuDxjAmodIHEJQyXxnJ+
         iFJPvsi6HJYgjfBn5Z4WlN6YYIIzg0Y4Cm2fn4pQQ3CeKwiGQvq8bmMG+vOKDimsE5l3
         eJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162499; x=1691754499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ6ZilaXIbXVvZQf4zwkqGWFB61+kWs1K8oV/rSXRlI=;
        b=AWVuH47VN2uAWHel3clv0m4WycF4PmHU8wTefOv8pyO/jF0eCQK/kjsxUw65g+DVxH
         Z0wbHTc5I1YyyGoKL5xt52Jl8cqrJbuYszLiXuoy3ErzKNaX1KI1mFeIz2QABOigNZpW
         LI6I4zk/V2z4r1hIQrk9rSC2zvAk/xm7y6Ff0mJA8hqVjl+Q++EXuydams6pdFyaRU7z
         A2k6tMYkIPZ9I8bsWJ0FOaNHlAOqkxBjlOB1JH1QG+9rIY9JxjwujxhEhfMo3K4plEPV
         mNgF332oLb0onTRS4k+y5fpiBBo7yHGCt6Yyq4CLpVViE81vrW1+erJfzfbGuhAPeKyZ
         fSVg==
X-Gm-Message-State: ABy/qLaS+VU7yL7EZeAN5C7YBzz1jTy+uePPhoZQfUtXT3KbMaOGegXW
        IYQegflKe8kfdlmUrZuD+4Te2w==
X-Google-Smtp-Source: APBJJlFkNAjZXX9Jmo92Fc07lwEB+ZX92wJcCzxV/eXoCWmgURH2c3NZ9NPsW5Gt/LxX71YOScUAig==
X-Received: by 2002:a05:6000:4c5:b0:314:1d7f:a69 with SMTP id h5-20020a05600004c500b003141d7f0a69mr17088296wri.67.1689162499157;
        Wed, 12 Jul 2023 04:48:19 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d4482000000b003143867d2ebsm4867463wrq.63.2023.07.12.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:48:18 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 5/8] hwmon: (pmbus/mp2975) Make phase count variable
Date:   Wed, 12 Jul 2023 13:47:46 +0200
Message-ID: <20230712114754.500477-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712114754.500477-1-Naresh.Solanki@9elements.com>
References: <20230712114754.500477-1-Naresh.Solanki@9elements.com>
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
index ebc9a84b8ad3..13d8b95eb992 100644
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
 
@@ -671,11 +676,13 @@ static int mp2975_probe(struct i2c_client *client)
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

