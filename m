Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C628C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E24920850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXDRovRQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbfARRPk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:40 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37892 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728586AbfARRPk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id q1so6901593pfi.5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qc9tw4S5gMb95GQFATQQTBKjiYFT6i7dz1cnNK6EFBQ=;
        b=VXDRovRQBeEjKvLSlKiPDkQc6iHhBWuC0vSXqSSCrEXZyas9pqBfHz5w1xbrZayyGw
         d8pUo263RX8MllyK4+KfKay3s2xNIMX5t9LaoGTiz2gi9FR95HP4lRsz8ff4SPwfb7EA
         KMTcY0nOaQ7oE9rWw7GpG5QKHLp6bIa++KDAzO1YBffVDnCpc/6XQ1QbAlx0UuWCuPxq
         TIeVtdMw8Flmw7SG8sYvGX6r5rd1YmXRY0y2J486I4HOs1pVnkbCuHW376+wHwEGe/Yz
         8UzlZyve6uDQ7xUkl7ocx7XTDvCw56xGgmNW3i+PAmsGKf1xiaL/CyxZxrhfKQfrZ1gr
         zg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=qc9tw4S5gMb95GQFATQQTBKjiYFT6i7dz1cnNK6EFBQ=;
        b=mr3gH27MMMba4SrJIL3aWhfb5g6v7fl0eqeH1CSu6938dIIhg3DRxmoseDqqi0Add7
         AwB21MXrNKl+kZDlVHiFXM+Nc0oMajZQS+14amSmLNCHgbohOoabOEHvBy5dC4lhv0Ux
         9549CvsD5Vdo7B5gXpV5mOeTTlUpVxwLx/hBbMlZH4LHaw/Et3RUNnuWLXTy3DdWEm6D
         2fmBkOGl8xPNepd5uoLgS1ODNNrSeUA4FZzD8CNJYIJO/RRfyomIZQJbN8r2TxbR7sj3
         7yt3kWkfIsEyxgK/8Y0JR0+lcU8l1P8h+kuVZJPtrtuFoxF8VeHQD7Qe8zhCbs1s5bjn
         67Jg==
X-Gm-Message-State: AJcUukfS694cUSJ0gU4jsCEUpbA/bvXG8PFa3ja4vHYpRNzc7DT3PKg5
        bVPBt4jXw7TeA7A88K4kEmXXXU1c
X-Google-Smtp-Source: ALg8bN6pXttVLobO/P8qoFzC0jRI+7rfV5O4ax1KUOzn7ga0344Q039oLtEUcbFEt0WmFpBHnFAMoQ==
X-Received: by 2002:a62:55c4:: with SMTP id j187mr20068781pfb.129.1547831738870;
        Fri, 18 Jan 2019 09:15:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z127sm10249051pfb.80.2019.01.18.09.15.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:38 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 21/30] hwmon: (sht3x) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:51 -0800
Message-Id: <1547831700-15865-22-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/sht3x.c | 50 ++++++++++++++++----------------------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 370b57dafab7..81ebc96cdec9 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -629,40 +629,22 @@ static ssize_t update_interval_store(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, temp1_input_show, NULL, 0);
-static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, humidity1_input_show,
-			  NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR,
-			  temp1_limit_show, temp1_limit_store,
-			  limit_max);
-static SENSOR_DEVICE_ATTR(humidity1_max, S_IRUGO | S_IWUSR,
-			  humidity1_limit_show, humidity1_limit_store,
-			  limit_max);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
-			  temp1_limit_show, temp1_limit_store,
-			  limit_max_hyst);
-static SENSOR_DEVICE_ATTR(humidity1_max_hyst, S_IRUGO | S_IWUSR,
-			  humidity1_limit_show, humidity1_limit_store,
-			  limit_max_hyst);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO | S_IWUSR,
-			  temp1_limit_show, temp1_limit_store,
-			  limit_min);
-static SENSOR_DEVICE_ATTR(humidity1_min, S_IRUGO | S_IWUSR,
-			  humidity1_limit_show, humidity1_limit_store,
-			  limit_min);
-static SENSOR_DEVICE_ATTR(temp1_min_hyst, S_IRUGO | S_IWUSR,
-			  temp1_limit_show, temp1_limit_store,
-			  limit_min_hyst);
-static SENSOR_DEVICE_ATTR(humidity1_min_hyst, S_IRUGO | S_IWUSR,
-			  humidity1_limit_show, humidity1_limit_store,
-			  limit_min_hyst);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, temp1_alarm_show, NULL, 0);
-static SENSOR_DEVICE_ATTR(humidity1_alarm, S_IRUGO, humidity1_alarm_show,
-			  NULL, 0);
-static SENSOR_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR,
-			  heater_enable_show, heater_enable_store, 0);
-static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
-			  update_interval_show, update_interval_store, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp1_input, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_input, humidity1_input, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp1_limit, limit_max);
+static SENSOR_DEVICE_ATTR_RW(humidity1_max, humidity1_limit, limit_max);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp1_limit, limit_max_hyst);
+static SENSOR_DEVICE_ATTR_RW(humidity1_max_hyst, humidity1_limit,
+			     limit_max_hyst);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp1_limit, limit_min);
+static SENSOR_DEVICE_ATTR_RW(humidity1_min, humidity1_limit, limit_min);
+static SENSOR_DEVICE_ATTR_RW(temp1_min_hyst, temp1_limit, limit_min_hyst);
+static SENSOR_DEVICE_ATTR_RW(humidity1_min_hyst, humidity1_limit,
+			     limit_min_hyst);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, temp1_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_alarm, humidity1_alarm, 0);
+static SENSOR_DEVICE_ATTR_RW(heater_enable, heater_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(update_interval, update_interval, 0);
 
 static struct attribute *sht3x_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

