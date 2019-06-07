Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76230C468BC
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BC60207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb0k0axa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbfFGRXf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36781 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:34 -0400
Received: by mail-pf1-f196.google.com with SMTP id u22so1568233pfm.3
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AgYk50VfYYgdjtpp569rCHkp5TkFGnn10uk0jvvSqDE=;
        b=jb0k0axalThHqh5hz51kxhr8VClPQoZzCFMNG8TcRIJy3qPE3c2C4Cwl1BlNSfqJhT
         PUCaY6xXearbeeRNXaMo7GEclwn/AYoKZGu6gAcC/aR2DE5XUrx8u6D6IFB4v8Xrr4nP
         U1kNM7ZXgA9DkQc961t+XZWyh/Ag6PPfKwelfj0IiSWIXoZW0nKIrakUEY5NiaK3f2AF
         JNlNscZ9/6vMH2TockAXvDgcPW9TZDxi2WzoGeDqAer4l6J4APBeKiOqcywBfFeCISWA
         9w+v06bpZcE06ylQKZSEmhdaRuou86SozqtjzQA7Y03z8qgdDXcgK5ur/8WG1ip45Y6L
         Elrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=AgYk50VfYYgdjtpp569rCHkp5TkFGnn10uk0jvvSqDE=;
        b=biOk928A7fiyyVfQrENHO8dgafFj/G1q1ZslckHfygE4BrlTU/O1vJ8X13tGx+Bx0x
         44MrkKtfOeAPJ2m+nMCmWXutcuwE9U5E03JiniZFyPZzMkjlBH+IAexH4048grvlrv51
         V7b0rY1DU7MdU0tuEFNyfDEdR3uRhDfk4cpcwO9BHPhYcREurt1LMgSrPrsISZzP6kYG
         TkNIMhZSaOVlvQqb4yao7lPL5/Zv1tKm+YQokOVEA6/FjnCcwKRjwKBaZLkHS+N2AHnf
         gZrfLUaGMIMopQ7TJ7RGSJ+tKUehLVEMlQ6BSQxBX7AasjThXxUvueoddLeeuM5V+r+f
         g7tQ==
X-Gm-Message-State: APjAAAWzGXUL1dMouv3xfjvhSmUvcwb26Tak23ohbMQJ0Q9BapoMrnn+
        +GlEg4RkOmdyya/nYeH6J3cr2WWC
X-Google-Smtp-Source: APXvYqzN3doO85QAZe/7ETmXGT+23Yc44rXRAaFiSR3RHMK/uOBk8GcDMaGN9tZatWqBSj9qzRsm1Q==
X-Received: by 2002:a17:90a:9202:: with SMTP id m2mr6841629pjo.37.1559928213980;
        Fri, 07 Jun 2019 10:23:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m8sm7257462pff.137.2019.06.07.10.23.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:33 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 05/10] hwmon: (max6650) Cache alarm_en register
Date:   Fri,  7 Jun 2019 10:23:20 -0700
Message-Id: <1559928205-14030-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The alarm_en register is read each time the is_visible function is called.
Since it is a configuration register, this is completely unnecessary.
Read it once and cache its value.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 90565318aafb..2edee4ca5cae 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -114,6 +114,7 @@ struct max6650_data {
 	u8 count;
 	u8 dac;
 	u8 alarm;
+	u8 alarm_en;
 	unsigned long cooling_dev_state;
 };
 
@@ -545,8 +546,6 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct max6650_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	u8 alarm_en = i2c_smbus_read_byte_data(client, MAX6650_REG_ALARM_EN);
 	struct device_attribute *devattr;
 
 	/*
@@ -559,7 +558,7 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 	 || devattr == &sensor_dev_attr_fan1_fault.dev_attr
 	 || devattr == &sensor_dev_attr_gpio1_alarm.dev_attr
 	 || devattr == &sensor_dev_attr_gpio2_alarm.dev_attr) {
-		if (!(alarm_en & to_sensor_dev_attr(devattr)->index))
+		if (!(data->alarm_en & to_sensor_dev_attr(devattr)->index))
 			return 0;
 	}
 
@@ -682,6 +681,13 @@ static int max6650_init_client(struct max6650_data *data,
 	}
 	data->count = reg;
 
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_ALARM_EN);
+	if (reg < 0) {
+		dev_err(dev, "Failed to read alarm configuration, aborting.\n");
+		return reg;
+	}
+	data->alarm_en = reg;
+
 	if (!of_property_read_u32(client->dev.of_node, "maxim,fan-target-rpm",
 				  &target_rpm)) {
 		max6650_set_target(data, target_rpm);
-- 
2.7.4

