Return-Path: <SRS0=hNyA=AH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F90C433DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 00:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99E822072E
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 00:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmyhGrsr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgFZAOH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 20:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgFZAOG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 20:14:06 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B582AC08C5C1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 17:14:05 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id r25so5258115qtj.11
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 17:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7oxn+2hCLpGgWo4CYP3Ehu/FRNSLomLpLPwykYjNJbs=;
        b=LmyhGrsrirR5wO09QAAVXYecs9EGuhfiuuBTtgJUC2sHauEpi6J0R8JSgjYZUFWQob
         DJrn0bZ0sYK1UbdDXbnh1+zW8z5dhFxJHhQLjgDq/GSC7ePCSi5zyqd9Fwhd2VTHdxoy
         oMEbkykmfMN1eny1cEUV1/aEXausD97lE2Jd8I46wk6HZf1qT+2T4dbyj+7BFeM0EFmp
         sxiYgo6A58azLbGXodLFPUdpcdhGTkGOHa45aQh7dGsfU6WQuPeDIpk+uvq51c9iVmGd
         vTs9I+OMoJjF6DKOz1FDsL/I6636M0N9X9a58wVfI/9/DJdTiTiktlfPCGSM8wKM/12c
         fvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7oxn+2hCLpGgWo4CYP3Ehu/FRNSLomLpLPwykYjNJbs=;
        b=bw3Um89k+6rbxQSJbTpW+YTF5WxO91u+FeBaz1I4lU1Bbvyv4qUy4K8HkF//MlLlY9
         rCWw1I6xD9UrxeBxz7SmNKpJG1WFgSwLDs4tuP+B1Sn7srX9YKXGw8AcweyHvv+YIy56
         jlWRTqVWSNY8QQvT4bd+r2vGEQ+n9maaDEKskZh7Ey9M+mCImu7sfkZ34XIFwzR6qX9y
         1ohbYp90PsM5nJysCggwR2MV8cWHvVnAHRtBq9hU6vg2ckDhk+LAIUTOAxmvN4AGhQda
         l3iTRH+RuXXhmb7mttoJXo31MbSv7/6HouSodIOCwgayAORT9DQqaC+VNjCbgnnxlGo2
         Z7LA==
X-Gm-Message-State: AOAM531F1Kiy/+yh5HU4dzagJCs3P0Ds6xZiiBrSplentWZd9KW1D8zM
        JpuEKq9S3tak0tOpTPtX5P7JrB4h8T/KYn7OOu37VRQYqJPCweX+gCDVH75g0ihun1XfhCPbFoS
        CHJrpgg8CoijZthGQVduF9zju4lphK3wwjzvO/jZMopUHlibYv8wf2sF49HnOFFiLbKQghRY=
X-Google-Smtp-Source: ABdhPJyfiFTrKY6EJK6r3LyliHwTTvRnOGIXDWNBavvqjxFPfx6cwimAVgwi4McMwpPCDUWboC5ce/p1sQpK
X-Received: by 2002:a0c:b245:: with SMTP id k5mr693438qve.111.1593130444699;
 Thu, 25 Jun 2020 17:14:04 -0700 (PDT)
Date:   Thu, 25 Jun 2020 17:13:43 -0700
Message-Id: <20200626001343.162071-1-krellan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] hwmon: (pmbus/core) Use s64 instead of long for calculations
From:   Josh Lehan <krellan@google.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Using s64 type, instead of long type,
for internal calculations and the sysfs interface.

This allows 64-bit values to appear correctly on 32-bit kernels.
As wattage is reported in microwatts,
monitoring a power supply over 2KW requires this.

Although it may seem unlikely to run a 32-bit kernel on such
a large machine, enterprise servers often include a BMC,
and the BMC might be running a 32-bit kernel....

Effort: semitruck
Google-Bug-Id: 159769574
Signed-off-by: Josh Lehan <krellan@google.com>
Change-Id: If89882e20387454189b2ebe20c793d4cf166dfa8
---
 drivers/hwmon/pmbus/pmbus_core.c | 66 +++++++++++++++-----------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 51eb6d56d29c..52bf71ef5ac4 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -646,12 +646,12 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
  * Convert linear sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_linear(struct pmbus_data *data,
-				  struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_linear(struct pmbus_data *data,
+				 struct pmbus_sensor *sensor)
 {
 	s16 exponent;
 	s32 mantissa;
-	long val;
+	s64 val;
 
 	if (sensor->class == PSC_VOLTAGE_OUT) {	/* LINEAR16 */
 		exponent = data->exponent[sensor->page];
@@ -665,11 +665,11 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
 
 	/* scale result to milli-units for all sensors except fans */
 	if (sensor->class != PSC_FAN)
-		val = val * 1000L;
+		val = val * 1000LL;
 
 	/* scale result to micro-units for power sensors */
 	if (sensor->class == PSC_POWER)
-		val = val * 1000L;
+		val = val * 1000LL;
 
 	if (exponent >= 0)
 		val <<= exponent;
@@ -683,8 +683,8 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
  * Convert direct sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_direct(struct pmbus_data *data,
-				  struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_direct(struct pmbus_data *data,
+				 struct pmbus_sensor *sensor)
 {
 	s64 b, val = (s16)sensor->data;
 	s32 m, R;
@@ -720,15 +720,15 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
 	}
 
 	val = div_s64(val - b, m);
-	return clamp_val(val, LONG_MIN, LONG_MAX);
+	return val;
 }
 
 /*
  * Convert VID sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_vid(struct pmbus_data *data,
-			       struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_vid(struct pmbus_data *data,
+			      struct pmbus_sensor *sensor)
 {
 	long val = sensor->data;
 	long rv = 0;
@@ -750,9 +750,9 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 	return rv;
 }
 
-static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 {
-	long val;
+	s64 val;
 
 	if (!sensor->convert)
 		return sensor->data;
@@ -776,7 +776,7 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 #define MIN_MANTISSA	(511 * 1000)
 
 static u16 pmbus_data2reg_linear(struct pmbus_data *data,
-				 struct pmbus_sensor *sensor, long val)
+				 struct pmbus_sensor *sensor, s64 val)
 {
 	s16 exponent = 0, mantissa;
 	bool negative = false;
@@ -798,8 +798,8 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 			val <<= -data->exponent[sensor->page];
 		else
 			val >>= data->exponent[sensor->page];
-		val = DIV_ROUND_CLOSEST(val, 1000);
-		return val & 0xffff;
+		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
+		return clamp_val(val, 0, 0xffff);
 	}
 
 	if (val < 0) {
@@ -809,14 +809,14 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 
 	/* Power is in uW. Convert to mW before converting. */
 	if (sensor->class == PSC_POWER)
-		val = DIV_ROUND_CLOSEST(val, 1000L);
+		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
 
 	/*
 	 * For simplicity, convert fan data to milli-units
 	 * before calculating the exponent.
 	 */
 	if (sensor->class == PSC_FAN)
-		val = val * 1000;
+		val = val * 1000LL;
 
 	/* Reduce large mantissa until it fits into 10 bit */
 	while (val >= MAX_MANTISSA && exponent < 15) {
@@ -830,11 +830,7 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 	}
 
 	/* Convert mantissa from milli-units to units */
-	mantissa = DIV_ROUND_CLOSEST(val, 1000);
-
-	/* Ensure that resulting number is within range */
-	if (mantissa > 0x3ff)
-		mantissa = 0x3ff;
+	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
 
 	/* restore sign */
 	if (negative)
@@ -845,9 +841,9 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 }
 
 static u16 pmbus_data2reg_direct(struct pmbus_data *data,
-				 struct pmbus_sensor *sensor, long val)
+				 struct pmbus_sensor *sensor, s64 val)
 {
-	s64 b, val64 = val;
+	s64 b;
 	s32 m, R;
 
 	m = data->info->m[sensor->class];
@@ -865,30 +861,30 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 		R -= 3;		/* Adjust R and b for data in milli-units */
 		b *= 1000;
 	}
-	val64 = val64 * m + b;
+	val = val * m + b;
 
 	while (R > 0) {
-		val64 *= 10;
+		val *= 10;
 		R--;
 	}
 	while (R < 0) {
-		val64 = div_s64(val64 + 5LL, 10L);  /* round closest */
+		val = div_s64(val + 5LL, 10L);  /* round closest */
 		R++;
 	}
 
-	return (u16)clamp_val(val64, S16_MIN, S16_MAX);
+	return (u16)clamp_val(val, S16_MIN, S16_MAX);
 }
 
 static u16 pmbus_data2reg_vid(struct pmbus_data *data,
-			      struct pmbus_sensor *sensor, long val)
+			      struct pmbus_sensor *sensor, s64 val)
 {
 	val = clamp_val(val, 500, 1600);
 
-	return 2 + DIV_ROUND_CLOSEST((1600 - val) * 100, 625);
+	return 2 + DIV_ROUND_CLOSEST_ULL((1600LL - val) * 100LL, 625);
 }
 
 static u16 pmbus_data2reg(struct pmbus_data *data,
-			  struct pmbus_sensor *sensor, long val)
+			  struct pmbus_sensor *sensor, s64 val)
 {
 	u16 regval;
 
@@ -954,7 +950,7 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
 		WARN(1, "Bad boolean descriptor %p: s1=%p, s2=%p\n", b, s1, s2);
 		return 0;
 	} else {
-		long v1, v2;
+		s64 v1, v2;
 
 		if (s1->data < 0)
 			return s1->data;
@@ -991,7 +987,7 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	if (sensor->data < 0)
 		return sensor->data;
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", pmbus_reg2data(data, sensor));
+	return snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
 }
 
 static ssize_t pmbus_set_sensor(struct device *dev,
@@ -1002,11 +998,11 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
 	ssize_t rv = count;
-	long val = 0;
+	s64 val;
 	int ret;
 	u16 regval;
 
-	if (kstrtol(buf, 10, &val) < 0)
+	if (kstrtos64(buf, 10, &val) < 0)
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-- 
2.27.0.212.ge8ba1cc988-goog

