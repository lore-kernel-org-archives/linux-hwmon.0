Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E2EC43612
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 238DC20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj22x0KL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfAQVOK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:10 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38862 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfAQVOJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:09 -0500
Received: by mail-pl1-f193.google.com with SMTP id e5so5302665plb.5
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J1pLXu5NklQ5Cb5PVVzVAM6/wdnwaHWdgnwAP9Klmm4=;
        b=Qj22x0KLDe5YEYKmKLqZBRcLS7TCwK6Rh55WJaL6jtdF9ESj/ODmUafVy4dcu0v/Kp
         QFy8NYIWi2pJl/Bc2511cWDFB4/fn4g5v010LEnsI9heBAt2d5woY0iiIGdNtpzknoM4
         UYyiEFOP3gfLu2ahIo64qnhRO33rmQ7puyYp+eX4viKTjYGRzbXLR8wzv4Rrif3Tsdaf
         EWbw+f6v9KmhM1W5lxo6HCeg/+wxXrebHUjitAblIvojnLE9Y6jbW2IPLx67eWhJcJHZ
         /+UsXXL8lyeYQooZvr9uaf0oEab5Pzc6OhlrNspD7E0ndLMNaABd+RhVYWuoS7+r4P+w
         2YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=J1pLXu5NklQ5Cb5PVVzVAM6/wdnwaHWdgnwAP9Klmm4=;
        b=BTBfqE6+UfGLe+okLHa/WPNyat5Wf3vJ8H8f8D98uIthVa6txdOG66ZBNbDQY3+KiT
         A+tuXmPwhGNCvaqfSIOwYtOPCxCpGwivmf2g1RTMLzbTJuXaoqeRe7+BJbb+VaYRIbw0
         xVcDkOZ0FmzdozZW7pxxWnTQ+fSHJqIaqIhXxeXwTCYZO+qZw3GI5L5Dv2NdWim2sIw4
         lcZ6J8BX9+HSIQrKNukFPzW/YHfvQJ/6O6fZyoPPUEZ2eM37OZe4gstm8dlWDVIrbRlO
         m72NQUp4lGhmcwJvK7bjOrpbezRZQSuMzE3t3x4jjNyxvJBTSFEru6H4qhTn5/gLNr1J
         WfQw==
X-Gm-Message-State: AJcUukdZCJvnHzpdjkNFL/0Y08HQ1vJswG8RTPqv4sIYxF6wrTnyO4fK
        NvTKRxJ5awZs1KDKE+eTS47t/fUA
X-Google-Smtp-Source: ALg8bN6v5HP9P5g0JsWcKJ8dksCxIqDfDpkAH+LuxcUghy1F1ZXSkC56o1ZQnaX6R0jjrazsEWVDzg==
X-Received: by 2002:a17:902:820f:: with SMTP id x15mr15913324pln.224.1547759648719;
        Thu, 17 Jan 2019 13:14:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d129sm5466658pfc.31.2019.01.17.13.14.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:08 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/29] hwmon: (ibmpex) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:29 -0800
Message-Id: <1547759629-23007-10-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ibmpex.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index bb17a29af64c..5fd70faf0d16 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -269,12 +269,12 @@ static struct ibmpex_bmc_data *get_bmc_data(int iface)
 	return NULL;
 }
 
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	return sprintf(buf, "%s\n", DRVNAME);
 }
-static SENSOR_DEVICE_ATTR(name, S_IRUGO, show_name, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(name, name, 0);
 
 static ssize_t ibmpex_show_sensor(struct device *dev,
 				  struct device_attribute *devattr,
@@ -289,10 +289,9 @@ static ssize_t ibmpex_show_sensor(struct device *dev,
 		       data->sensors[attr->index].values[attr->nr] * mult);
 }
 
-static ssize_t ibmpex_reset_high_low(struct device *dev,
+static ssize_t ibmpex_high_low_store(struct device *dev,
 				     struct device_attribute *devattr,
-				     const char *buf,
-				     size_t count)
+				     const char *buf, size_t count)
 {
 	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
 
@@ -301,8 +300,7 @@ static ssize_t ibmpex_reset_high_low(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(reset_high_low, S_IWUSR, NULL,
-			  ibmpex_reset_high_low, 0);
+static SENSOR_DEVICE_ATTR_WO(reset_high_low, ibmpex_high_low, 0);
 
 static int is_power_sensor(const char *sensor_id, int len)
 {
@@ -358,7 +356,7 @@ static int create_sensor(struct ibmpex_bmc_data *data, int type,
 
 	sysfs_attr_init(&data->sensors[sensor].attr[func].dev_attr.attr);
 	data->sensors[sensor].attr[func].dev_attr.attr.name = n;
-	data->sensors[sensor].attr[func].dev_attr.attr.mode = S_IRUGO;
+	data->sensors[sensor].attr[func].dev_attr.attr.mode = 0444;
 	data->sensors[sensor].attr[func].dev_attr.show = ibmpex_show_sensor;
 	data->sensors[sensor].attr[func].index = sensor;
 	data->sensors[sensor].attr[func].nr = func;
-- 
2.7.4

