Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DB4C2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB55E207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqNTQGk0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730667AbfFGRXk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46440 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id 81so1543985pfy.13
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XT1nhTy4ELf5Q+5YK4wIqW6Tn5xh2dn3l5+D9RDZ2xg=;
        b=aqNTQGk0tYQRTjnmNEeA6ALIDk6RnqFlfunPuWNqsK0knwUX3f1Jz4wOBsS8NOo+Ax
         Q6MP+74EenTGKU/AgjpL6uVIeMuoND/TxjofD0SLcMQIQuT2qykBWq6/vuHgH/AvBYRo
         1Qt7Q+jmRuGbOcGZbHTkSKHJh4i2Wx9lbWBKqNq/ljHVNLOzdKxjF3/CxN9jPl4r2DG5
         6WtSCym8gpjE5AMF3mMISqNe0RUgzj6J2CfcNZwtQbOgq0q9nRLOFC5Y6LhC2Mo/2sv5
         UFmj/cKnDQuhUYZfsYTSKOTKvsTpGpGwAV4wsK7JpbyFrSyYFMrIrizYsTgHF48kP8Oo
         c37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XT1nhTy4ELf5Q+5YK4wIqW6Tn5xh2dn3l5+D9RDZ2xg=;
        b=dCvNb4VxyB2XwQijgcH4tE5J8Jcn/VDCuJTukyL/O2uLliyuu7fwvnQNCTTk0bcFIP
         naGhk5puSxTM9mFgmzIV+tm+eqoF/Bu2wW9bBk8c5HaiIb/e5eHBkKJ2Wtm0v0KzvlXU
         qt2S2cunLngScEYahTfPzdtNtlHpSD9SXHAiSHyvFAjop4nZTdj+ZWxoZan8v1A2e6N1
         O3gxJZ0cqg3zzhVpGhmf+GHZYevR3r2jyfZrunidFI+TqUlFWceo7sFUWeFWrZl/uJc+
         BdgyQRHCT3FVa0WNCL/2exvhXsdILJdkJ/G3w4L1Ovp1Kx1j/Nzn/5HYwhzfwIw7XTYu
         0fAQ==
X-Gm-Message-State: APjAAAWpbvQGsa+PQF0ur5MI49IQ/MZs/NXt5o1i565oGWUryP4tyvkV
        EAvKya0b8Ko6K+aWdPpT7jZ4AsJ9
X-Google-Smtp-Source: APXvYqyBFDAKs9zlIV3xoaA8LYjP/AplPucof7gPJPrLu6gd7VXLV/tChZBVyX3P/pfFd8tDU/3qVQ==
X-Received: by 2002:a17:90a:d16:: with SMTP id t22mr6971598pja.130.1559928219510;
        Fri, 07 Jun 2019 10:23:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2sm1824672pgj.39.2019.06.07.10.23.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:39 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 09/10] hwmon: (max6650) Improve error handling in max6650_update_device
Date:   Fri,  7 Jun 2019 10:23:24 -0700
Message-Id: <1559928205-14030-9-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pass errors from i2c_smbus_read_byte_data() back to the caller of
max6650_update_device().

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 6f1a1a6eae46..e65792020ca1 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -157,14 +157,19 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	int reg, err = 0;
 	int i;
 
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
 		for (i = 0; i < data->nr_fans; i++) {
-			data->tach[i] = i2c_smbus_read_byte_data(client,
-								 tach_reg[i]);
+			reg = i2c_smbus_read_byte_data(client, tach_reg[i]);
+			if (reg < 0) {
+				err = reg;
+				goto error;
+			}
+			data->tach[i] = reg;
 		}
 
 		/*
@@ -172,15 +177,20 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 		 * caused the alarm is removed. Keep the value latched here
 		 * for providing the register through different alarm files.
 		 */
-		data->alarm |= i2c_smbus_read_byte_data(client,
-							MAX6650_REG_ALARM);
-
+		reg = i2c_smbus_read_byte_data(client, MAX6650_REG_ALARM);
+		if (reg < 0) {
+			err = reg;
+			goto error;
+		}
+		data->alarm |= reg;
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
 
+error:
 	mutex_unlock(&data->update_lock);
-
+	if (err)
+		data = ERR_PTR(err);
 	return data;
 }
 
@@ -289,8 +299,12 @@ static ssize_t alarm_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max6650_data *data = max6650_update_device(dev);
-	bool alarm = data->alarm & attr->index;
+	bool alarm;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	alarm = data->alarm & attr->index;
 	if (alarm) {
 		mutex_lock(&data->update_lock);
 		data->alarm &= ~attr->index;
@@ -512,6 +526,9 @@ static int max6650_read(struct device *dev, enum hwmon_sensor_types type,
 	struct max6650_data *data = max6650_update_device(dev);
 	int mode;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	switch (type) {
 	case hwmon_pwm:
 		switch (attr) {
-- 
2.7.4

