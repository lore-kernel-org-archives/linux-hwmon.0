Return-Path: <SRS0=50Tr=QH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED60C282D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 22:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DD1620833
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 22:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sweptlaser-com.20150623.gappssmtp.com header.i=@sweptlaser-com.20150623.gappssmtp.com header.b="C76RMqBO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbfAaWHI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Jan 2019 17:07:08 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:39919 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbfAaWHA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Jan 2019 17:07:00 -0500
Received: by mail-it1-f195.google.com with SMTP id a6so6847190itl.4
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Jan 2019 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8HX/Q0Q0YXHh0N7JBuVTXEi1U08jlS7KA/W4WOsuBz4=;
        b=C76RMqBO1Txu+mRk8i6tKqG0L8zB5Zjvxmju4grLnJSQ+m9fAO70vD4mI1dXeWOizo
         pr84upoPGxiBneQVB+a4fy71jpQ8oWVNI2OLOBLQ5MKGGIffUzIQuCCSmmcN5mAl0vsv
         aPbnukagno1YZaFXV//x534U1r2/WEKT9/z2WTEs5nlwstY7DIve6pZ/s8tJj70sJgb1
         Z8PUTFgS1n5wCHPkYKKQlVfASZ6XTtwMEwOlFklOzXOnT67tE56amgWFWCx7T3OghYZC
         cgEIr4aJ58gK6ezyTOMR5vvNyGlTe1YJt/9vNobtwCa7syBFUdwz7pNoYrc+M8cwlkQE
         9WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8HX/Q0Q0YXHh0N7JBuVTXEi1U08jlS7KA/W4WOsuBz4=;
        b=irCPVDYn384jcbA1KQiXzCvMGnFBV2GLqb1YEQs0g/+0DSKsCswuZO8HJNYJPfV/rc
         N6QaDkLj3Wux7GV88koZJksEbQC1Gg2hcJ1SQZxtnqvb+W8XHklBquLxwXvbzLLx4X/k
         La0QCZ8jIxEhSVSVrCgwrcVFJfMwU3JRfb6Ng+kQziljD/fa20E2N7zcGYqkmBCzQJnO
         +3Jar9SgHdCp/OvxxDMxHp7Nh1il/r8jhj8pc8eK8D9N7qHWREk85oCO6KSG7jinDA9t
         5+NhF+Om25f+xq/vXlqryVFnEUofXBT2sIUy/P17YOgoOqcqKG5eX1t2TZ93kUHD10qL
         E5HQ==
X-Gm-Message-State: AJcUukfemDIWquA8p7KRXKdt4tz0T+nKdJkZYx8ji5bTuG1KdvDmTxDB
        0Z6iBQa6JrGce1HN09vH0+m9Td4wd48=
X-Google-Smtp-Source: ALg8bN5G0WKX5yWjV8tLuA1R+c0e38mQpMrT32D8ZJIVr4ab4sUsDeqgJe94bdqjaIepskQkx+C5YQ==
X-Received: by 2002:a24:f143:: with SMTP id q3mr20462381iti.42.1548972419045;
        Thu, 31 Jan 2019 14:06:59 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id l186sm286439itl.22.2019.01.31.14.06.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 14:06:58 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (lm85) add support for LM96000 high frequencies
Date:   Thu, 31 Jan 2019 15:06:17 -0700
Message-Id: <20190131220617.15223-4-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190131220617.15223-1-jgebben@sweptlaser.com>
References: <20190131220617.15223-1-jgebben@sweptlaser.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This chip expands the freqency field from 3 to 4 bits, to
add more frequencies in the 22.5 to 30 kHz ranges.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/hwmon/lm85 | 3 +++
 drivers/hwmon/lm85.c     | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/lm85 b/Documentation/hwmon/lm85
index 9f3a945d1..264874f09 100644
--- a/Documentation/hwmon/lm85
+++ b/Documentation/hwmon/lm85
@@ -140,6 +140,9 @@ of voltage and temperature channels.
 SMSC EMC6D103S is similar to EMC6D103, but does not support pwm#_auto_pwm_minctl
 and temp#_auto_temp_off.
 
+The LM96000 supports additional high frequency PWM modes (22.5 kHz, 24 kHz,
+25.7 kHz, 27.7 kHz and 30 kHz), which can be configured on a per-PWM basis.
+
 Hardware Configurations
 -----------------------
 
diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 4b15193d1..88f08f4bc 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -202,6 +202,11 @@ static const int lm85_freq_map[] = { /* 1 Hz */
 	10, 15, 23, 30, 38, 47, 61, 94
 };
 
+static const int lm85_high_freq_map[] = { /* 1 Hz */
+	10, 15, 23, 30, 38, 47, 61, 94,
+	22500, 24000, 25700, 25700, 27700, 27700, 30000, 30000
+};
+
 static const int adm1027_freq_map[] = { /* 1 Hz */
 	11, 15, 22, 29, 35, 44, 59, 88
 };
@@ -1574,6 +1579,10 @@ static int lm85_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->freq_map = adm1027_freq_map;
 		data->freq_map_size = ARRAY_SIZE(adm1027_freq_map);
 		break;
+	case lm85:
+		data->freq_map = lm85_high_freq_map;
+		data->freq_map_size = ARRAY_SIZE(lm85_high_freq_map);
+		break;
 	default:
 		data->freq_map = lm85_freq_map;
 		data->freq_map_size = ARRAY_SIZE(lm85_freq_map);
-- 
2.17.1

