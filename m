Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD62C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8AAB20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plRVLOOj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfARRPI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:08 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42407 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id 64so6887555pfr.9
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oEv95w+r5cpeVMyZqeUnUXPmqGok8v9FtfLEOIrW5kY=;
        b=plRVLOOj3hLGD01AF8eXi1+GAUYrCRsJKL5hYO0sPt27GG03t9DTTw4E8zI5D+V6sn
         H0BYzBKHbo2guVwY28H5hPrj4JXQkTUWg+lbQdsbqzLZ8s6PdE1z1SEv+jeAfi6wBtP8
         0QWqdzlQtT2221j900Uj5HOjoWL+0qkexw9+iBeXfZATnIf3ezSQvE1y+gXleJTzUsbA
         2IjRoYFMuYvCmEZ/+WYbvw66QI48QHXNkgfrdudLd+o9ZNpnrpVlZSTJ7WuyYA0Rgfp5
         zTGcoVEsU7AVeheV5sAG4flMor0tJBWylCVXYRI6BhMAp/3mMoBqaPmoqNS2DSA7LJo6
         H2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=oEv95w+r5cpeVMyZqeUnUXPmqGok8v9FtfLEOIrW5kY=;
        b=R5om0Ji8C4BlOnKvE1kngmS7Zeq4GeGHJXg7nxzp/9/vYZKT+xDt8dEzmkAKqKrt5J
         0zdv/tNUwuspscK//kANsSqsHNzOTHSc5/8hNjkqCJsgfTHkUA0eMUlKyouaCDMCURIe
         ugUnquCe9sixtG0j0bwV9T2BCjCZ9DgBtvJjSw8L9zbg6EoHVP/4DXBgR11o18/sqovX
         U8vZzyWHOR3IzUh960nhJKWOAihqsifirMNmBHddfgLKMv3/AXwdetJxIb4rY9u9qsfX
         EI3IYufJzW+jYK6FmWmN8gAPXzr3coUShJjqpS6oMEseFqThznKe5aIOtPMuocTE/LU9
         bV1Q==
X-Gm-Message-State: AJcUukf1SKZznSLTuAbWncp8NmCAo00KL7D0fQZo1vDKu1DEWgLrr8iM
        LAhvBV6zYLs8HFSXc6eOeoaTkB9h
X-Google-Smtp-Source: ALg8bN7B869yfMoIAfsnSiIpuWDjWR0gD1xPuhn/AxA+4TSc9amp+PYWvRfvJp9Ozcd3Geaw57ERAA==
X-Received: by 2002:a62:9913:: with SMTP id d19mr20074627pfe.107.1547831707206;
        Fri, 18 Jan 2019 09:15:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h19sm6782520pfn.114.2019.01.18.09.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:06 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/30] hwmon: (ltc4261) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:31 -0800
Message-Id: <1547831700-15865-2-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ltc4261.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/ltc4261.c b/drivers/hwmon/ltc4261.c
index 0becd69842bb..6eb3415e0639 100644
--- a/drivers/hwmon/ltc4261.c
+++ b/drivers/hwmon/ltc4261.c
@@ -132,7 +132,7 @@ static int ltc4261_get_value(struct ltc4261_data *data, u8 reg)
 	return val;
 }
 
-static ssize_t ltc4261_show_value(struct device *dev,
+static ssize_t ltc4261_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -146,7 +146,7 @@ static ssize_t ltc4261_show_value(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", value);
 }
 
-static ssize_t ltc4261_show_bool(struct device *dev,
+static ssize_t ltc4261_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -166,10 +166,8 @@ static ssize_t ltc4261_show_bool(struct device *dev,
 /*
  * Input voltages.
  */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4261_show_value, NULL,
-			  LTC4261_ADIN_H);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4261_show_value, NULL,
-			  LTC4261_ADIN2_H);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc4261_value, LTC4261_ADIN_H);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc4261_value, LTC4261_ADIN2_H);
 
 /*
  * Voltage alarms. The chip has only one set of voltage alarm status bits,
@@ -179,22 +177,16 @@ static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4261_show_value, NULL,
  * To ensure that the alarm condition is reported to the user, report it
  * with both voltage sensors.
  */
-static SENSOR_DEVICE_ATTR(in1_min_alarm, S_IRUGO, ltc4261_show_bool, NULL,
-			  FAULT_UV);
-static SENSOR_DEVICE_ATTR(in1_max_alarm, S_IRUGO, ltc4261_show_bool, NULL,
-			  FAULT_OV);
-static SENSOR_DEVICE_ATTR(in2_min_alarm, S_IRUGO, ltc4261_show_bool, NULL,
-			  FAULT_UV);
-static SENSOR_DEVICE_ATTR(in2_max_alarm, S_IRUGO, ltc4261_show_bool, NULL,
-			  FAULT_OV);
+static SENSOR_DEVICE_ATTR_RO(in1_min_alarm, ltc4261_bool, FAULT_UV);
+static SENSOR_DEVICE_ATTR_RO(in1_max_alarm, ltc4261_bool, FAULT_OV);
+static SENSOR_DEVICE_ATTR_RO(in2_min_alarm, ltc4261_bool, FAULT_UV);
+static SENSOR_DEVICE_ATTR_RO(in2_max_alarm, ltc4261_bool, FAULT_OV);
 
 /* Currents (via sense resistor) */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4261_show_value, NULL,
-			  LTC4261_SENSE_H);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc4261_value, LTC4261_SENSE_H);
 
 /* Overcurrent alarm */
-static SENSOR_DEVICE_ATTR(curr1_max_alarm, S_IRUGO, ltc4261_show_bool, NULL,
-			  FAULT_OC);
+static SENSOR_DEVICE_ATTR_RO(curr1_max_alarm, ltc4261_bool, FAULT_OC);
 
 static struct attribute *ltc4261_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
-- 
2.7.4

