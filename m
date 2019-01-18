Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E46EC5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D467120850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjH/OfII"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfARRPl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:41 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40294 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:41 -0500
Received: by mail-pf1-f196.google.com with SMTP id i12so6890637pfo.7
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UBdaIjgsPrAJJ1r8AAIMxI36hYVj0xAqdqS9IIjnBaI=;
        b=KjH/OfIIFj7XyH+L9Mw33JpOTY+qzmaWpBhHvuyXKw4axPAucUG2uyl8iReiAafZ2G
         1AwEkpA64YRcH6cUMWaAs2aDvMHEXd9XmNIZK+DddVPdbE7MGuguUBlb/nH3qlpUswEa
         ok92kVzYWe2lpRCOEJ5V++hz8j8NrMCPGFKYg26J9LwYM2lHr2O3eL7lTkG1tCzKtwIQ
         2uFF4HySd+eCG0mzbmb3kmbiKTXZeFkfhDdSCMuP18J/gcc9oJvbGwz8vRMltkFBDIl8
         LgGr7bJQ+R04DMYXrIxnK3C+LomIH8hz7OZSklezHsl5vjQGQaRN4k+Yii8k9sKPxuat
         SfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=UBdaIjgsPrAJJ1r8AAIMxI36hYVj0xAqdqS9IIjnBaI=;
        b=ThPhfufakoAMLXaAY/8mjip8nh1vaQrgli+ffhJoKiQayItCLPW6LDOnp179qHtzFH
         igWGkGiABn3rfAzcR1dL9r5eQZ0NQnsUx4TEOwl6SdSG4E3Nvvoc7e9d6AA/eH3dLRc+
         KtaF0mAsGgWSRXFO+gp3GoBVaazkiS5SZ3v6GzQpf1Dawg8CP1tRv310hzomvKi30Bf6
         H0JoDiLQcD5KNsNEo+vuokEzyawvi1yiTTNJuH5juEmrturqyyfkmJz0aHyi/qPlifDm
         bVZDuoQgNmuCjTx1uG+DT0DcUldRMJI99CM8n5XM2J/J3qzg+Sm7p3f5Tz+4u2cpAUaM
         8MCw==
X-Gm-Message-State: AJcUukfurn/5fWwKFjcWqfh66MKWQBeXGjp+38FhRG4inIYwVBWv8tQf
        uWxMzpLSiDMQnJXa2uKdzCiZPDqU
X-Google-Smtp-Source: ALg8bN4zpCNrCuYw8J/YWwG2S1BsyrCjSSyYYvrb8izhBmu8V0uks2ej4dvLfMvW/k24JUcNp90nCw==
X-Received: by 2002:a62:4bcf:: with SMTP id d76mr21005114pfj.170.1547831740339;
        Fri, 18 Jan 2019 09:15:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w136sm7299902pfd.169.2019.01.18.09.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:39 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 22/30] hwmon: (smsc47b397) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:52 -0800
Message-Id: <1547831700-15865-23-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/smsc47b397.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/smsc47b397.c b/drivers/hwmon/smsc47b397.c
index 6bd200756560..c0775084dde0 100644
--- a/drivers/hwmon/smsc47b397.c
+++ b/drivers/hwmon/smsc47b397.c
@@ -164,18 +164,18 @@ static int temp_from_reg(u8 reg)
 	return (s8)reg * 1000;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute
-			 *devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47b397_data *data = smsc47b397_update_device(dev);
 	return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
 
 /*
  * FAN: 1 RPM/bit
@@ -188,17 +188,17 @@ static int fan_from_reg(u16 reg)
 	return 90000 * 60 / reg;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute
-			*devattr, char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47b397_data *data = smsc47b397_update_device(dev);
 	return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]));
 }
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
 
 static struct attribute *smsc47b397_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

