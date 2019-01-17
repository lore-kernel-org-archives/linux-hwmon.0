Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38147C43444
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A25420855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cp0/ygOB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbfAQVOi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:38 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41014 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:38 -0500
Received: by mail-pl1-f193.google.com with SMTP id u6so5286983plm.8
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DHouWOvhUX3vj41jUSNNLk+ua3xvbLE3Pnv5TtdZ6aM=;
        b=cp0/ygOB+aNoLQnPpu2XOtjUl0OfGC2UeXZEK+/Ty4RIDz7h4VYlvCAdFtngCgGL1K
         dGKnq/Q3jCShOFwFlLYH3mwZBXZDWkS6hQFfAFzc793Boa4NISHjSMaonD/CppUa4iKj
         VY5Rr5Z2FMaPnS0xymLfHaVor5z8lzFzAPN5xD81FFNfeVJ0mMY3YOnt0MIHCq/Fr2q8
         HcSBTos1qMuIjkT2m63OiAAfJDsdBuIu9UkmDO3LH2DCEnnhgrUnmXwEojsP6+TQMiRB
         ljhR7P/76ONz3GKb6f6XnPtpK7WujKMYxszK8GUOv1inMOZgiSTdoANeclM+kIMKINz9
         YeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=DHouWOvhUX3vj41jUSNNLk+ua3xvbLE3Pnv5TtdZ6aM=;
        b=IvquNxbfLyL5DTfBV3JgQPSYWp4ra1IqJiqyFZTvsi5lsdXKYRTrsSJVPxkHzzT0E5
         Mjg4czWSJGQXeNZ86/RIN2F0ZV6eLyP9n0bIqA+Y1DKvCbdaiIT+V8dZeQPFS2KUn469
         jVWxyCi3tijuNruyYJl/AqLmmXD3Bv+LwSswYo/jSW4IYW47OyYM9PgXeNTOkk0/tBTT
         ko8w7Vwwg4QyptRQWBqzDWx4h5WqpvgiF1m+QwEj+Me+GHaoVEDTL+xYrESURN7dly+/
         4GRgH/lk3QvftWvhKQF1vXpM+O9dYEDiHaJQPeBNu+pWX+gaKMQDK+332IsQMMaDw3Gl
         vp2g==
X-Gm-Message-State: AJcUukclMrlD/zp8EEh4NrPGcaEqSCxZO6tU7dudI8n4UPATVUexpZHB
        NLYjEE6JFLrpalPKz4PwY/6NIzOx
X-Google-Smtp-Source: ALg8bN57AnlRENOQcuE7ri698ErN2DM6ZPg3nqEbeo1JXiScCAbpFWPMR+ZohCgdv6VrbPCebpVDmA==
X-Received: by 2002:a17:902:a50a:: with SMTP id s10mr15809090plq.278.1547759677742;
        Thu, 17 Jan 2019 13:14:37 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v191sm4166700pgb.77.2019.01.17.13.14.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:37 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 26/29] hwmon: (ltc2990) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:46 -0800
Message-Id: <1547759629-23007-27-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc2990.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 2aefdc58b242..be4e89645c0b 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -136,7 +136,7 @@ static int ltc2990_get_value(struct i2c_client *i2c, int index, int *result)
 	return 0;
 }
 
-static ssize_t ltc2990_show_value(struct device *dev,
+static ssize_t ltc2990_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -170,26 +170,16 @@ static umode_t ltc2990_attrs_visible(struct kobject *kobj,
 	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_TEMP1);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_TEMP2);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_TEMP3);
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_CURR1);
-static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_CURR2);
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_IN0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_IN1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_IN2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_IN3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ltc2990_show_value, NULL,
-			  LTC2990_IN4);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, ltc2990_value, LTC2990_TEMP1);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, ltc2990_value, LTC2990_TEMP2);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, ltc2990_value, LTC2990_TEMP3);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc2990_value, LTC2990_CURR1);
+static SENSOR_DEVICE_ATTR_RO(curr2_input, ltc2990_value, LTC2990_CURR2);
+static SENSOR_DEVICE_ATTR_RO(in0_input, ltc2990_value, LTC2990_IN0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc2990_value, LTC2990_IN1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc2990_value, LTC2990_IN2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, ltc2990_value, LTC2990_IN3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, ltc2990_value, LTC2990_IN4);
 
 static struct attribute *ltc2990_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

