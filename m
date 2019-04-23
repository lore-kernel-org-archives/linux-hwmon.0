Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F60C282DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB04E2077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0ta/tqF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfDWNdb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41318 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id 188so7502175pfd.8
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uVYTZjgdXMQ/MJbbt7RN8oRmdDqyxdXIQwT02b93xtk=;
        b=D0ta/tqF602yPitvvyg9xzhTgJi6lbmGzR4hqxeeKB2X6ShKNEyomo0ttxBAuppKCe
         nNVScYi68dDn5fZ7YeEHQzCZUifokZdaC61vPAZqs7S84WRJfpoextZTynvWVTXnRWkY
         tYV37m2euMtCYIg7/Y2kr3V3ug6O3XOHy1FvZZdDpaaqFlZcI4RK0KxoqyxszJFb6yKI
         s/3Wrp/IK99VLlA4c4tNH0n2mbcrw8Fkt2QTfH7Clb+0ZniY9O8+pC8A16mrpbimXzJz
         ECLmd5IZwSEHCl/rmGrmk7QoR9hK858PkZUa6g2K0kmbK5nKEvnHSkbgmJsn1pOFlMF9
         jvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=uVYTZjgdXMQ/MJbbt7RN8oRmdDqyxdXIQwT02b93xtk=;
        b=NegaoGDAk0CWd8UjX37pubyJOfisFK19bTTYCOf4t+F095mnVrv+WKI69mxpo+6ZRX
         RqLTLXSv2nqn/VYXag2oEsiaCUcFyDlDzCyHNlsCXJ1nomkRyDiPOhUR8OAx+O/GPR47
         hQdi05e6t+2Rvq156J33t3D1CvOPUqT3TFNQwhIaBF+El8e3ETKqCD3EK9fV8SZ4JkYS
         CUSw3Iea0e4JMXmAU6cR4SYaVVRnAeiAcuMLtMAqhJmz1sbaUB/62r5AYmKBpkEZgiR8
         QwWrVsT8XT6tGbcE3XU0J9kLdPHFIUsFDi2dLq2yUCoSrMWabpdPJoUAKyoUUsUojS8d
         m9zw==
X-Gm-Message-State: APjAAAVg9e5ZbTgxtGqj1HmJ0J94e7SGjJintCrXFqYWGj9/hROd0cWU
        RJ5uGZIDqFNgCD9QoDJKo1srP1fF
X-Google-Smtp-Source: APXvYqyyI/XMm3Rwq8MKHy4Mp2PCL9KTtU3JYxW/nJpoR03KW1CdCPF8tmPHweHB21i2aK8LxUzMQA==
X-Received: by 2002:aa7:8282:: with SMTP id s2mr26675695pfm.7.1556026410450;
        Tue, 23 Apr 2019 06:33:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm19591274pgh.93.2019.04.23.06.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:29 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 09/11] hwmon: (max6650) Improve error handling in max6650_update_device
Date:   Tue, 23 Apr 2019 06:33:09 -0700
Message-Id: <1556026391-15360-9-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pass errors from i2c_smbus_read_byte_data() back to the caller of
max6650_update_device().

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 7c8b1b8ededc..3c79949a741c 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -171,14 +171,19 @@ static struct max6650_data *max6650_update_device(struct device *dev)
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
@@ -186,15 +191,20 @@ static struct max6650_data *max6650_update_device(struct device *dev)
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
 
@@ -303,8 +313,12 @@ static ssize_t alarm_show(struct device *dev,
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
@@ -531,6 +545,9 @@ static int max6650_read(struct device *dev, enum hwmon_sensor_types type,
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

