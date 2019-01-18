Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D5CC5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E99E120850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEmcH7nA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfARRPK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38669 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:10 -0500
Received: by mail-pg1-f193.google.com with SMTP id g189so6340070pgc.5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qMU5gpgRT6GsE6xFbMxw1t2k3fsCgFJhz1qYNP6OJL8=;
        b=fEmcH7nA1y88BPJ5m/3DAQvbGulNxyMw3bahqRRVL/TK387tswY6G2Kq60DcG8xl5Q
         U30A97kREGGefx6iUvnLZAukqnQL8z2sLNtYW0syxPXZPuEEJihC9eEzqadhGiT1seJP
         7aiLNpi1K4c98tWZ9XayPy27392e9lk7cImZvJjO/RxldRqXuQY6eViBMMrZCgBGLUAa
         x9uSq037hJvA5fYb8FMxfrqw2wIY+IxBhCcHNsmSO6Jduvl8pMMb76hC6p6y1oULoexN
         xzf1rXVB4MqilKb7Y64QeaRF9tbQF/AYQwwrORr/wxuNAdsbOSrhA2RvygWReGMLJDVT
         UF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=qMU5gpgRT6GsE6xFbMxw1t2k3fsCgFJhz1qYNP6OJL8=;
        b=kvw/Yl8QxnNhsgLYsmnOp//rvolBNCEVDFy9SYBBOds8402STepTgWpcG30dPpev2G
         DfYS/qCMhAv2FDMHuhGvLI2VGT9q1TzqZeATeEoV3PZ94yJ4U+vMRam/5l67wA6CqIUV
         YNj0BY7dRyfUqxOTZp7ArYuN+qGh/e0D8Def0/HaktYLy34IPdnTXN1mInyVTaNwt/wN
         MRBjG0iGe4ZyQ8AruEwU71sv32yBhPtAqRjcFAFTBMsD/804zknxbhD2sR8JcRkIR5es
         4wi1fFlqUCle4rzC84pZirq3C6mPlN4xUdD/r8l6LToSEHGGtxfO0h7ailOARIu9mv2y
         uqDg==
X-Gm-Message-State: AJcUukeeATpRE5/N62E12k5WNLlfFGqCCy+H1Cd4qStuQpUgW0DGtPjC
        FeQbJOnV28Q7wQmBdkp+GKWxoZbp
X-Google-Smtp-Source: ALg8bN4jf3h0vwezS1TomhxYQ6tkrFq1O7Fo7uKXZ9JhCtTFDb3p6PyVOLitCromIfij2p6CyaBYlQ==
X-Received: by 2002:a62:9419:: with SMTP id m25mr20958741pfe.147.1547831708852;
        Fri, 18 Jan 2019 09:15:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm10261050pff.101.2019.01.18.09.15.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:08 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/30] hwmon: (max16065) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:32 -0800
Message-Id: <1547831700-15865-3-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max16065.c | 225 +++++++++++++++++------------------------------
 1 file changed, 82 insertions(+), 143 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 162401aaef71..1c372f76cd0b 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -175,7 +175,7 @@ static struct max16065_data *max16065_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t max16065_show_alarm(struct device *dev,
+static ssize_t max16065_alarm_show(struct device *dev,
 				   struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(da);
@@ -193,7 +193,7 @@ static ssize_t max16065_show_alarm(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!val);
 }
 
-static ssize_t max16065_show_input(struct device *dev,
+static ssize_t max16065_input_show(struct device *dev,
 				   struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -207,7 +207,7 @@ static ssize_t max16065_show_input(struct device *dev,
 			ADC_TO_MV(adc, data->range[attr->index]));
 }
 
-static ssize_t max16065_show_current(struct device *dev,
+static ssize_t max16065_current_show(struct device *dev,
 				     struct device_attribute *da, char *buf)
 {
 	struct max16065_data *data = max16065_update_device(dev);
@@ -219,9 +219,9 @@ static ssize_t max16065_show_current(struct device *dev,
 			ADC_TO_CURR(data->curr_sense, data->curr_gain));
 }
 
-static ssize_t max16065_set_limit(struct device *dev,
-				  struct device_attribute *da,
-				  const char *buf, size_t count)
+static ssize_t max16065_limit_store(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(da);
 	struct max16065_data *data = dev_get_drvdata(dev);
@@ -246,7 +246,7 @@ static ssize_t max16065_set_limit(struct device *dev,
 	return count;
 }
 
-static ssize_t max16065_show_limit(struct device *dev,
+static ssize_t max16065_limit_show(struct device *dev,
 				   struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(da);
@@ -259,154 +259,93 @@ static ssize_t max16065_show_limit(struct device *dev,
 /* Construct a sensor_device_attribute structure for each register */
 
 /* Input voltages */
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, max16065_show_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, max16065_show_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, max16065_show_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, max16065_show_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, max16065_show_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, max16065_show_input, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, max16065_show_input, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, max16065_show_input, NULL, 7);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, max16065_show_input, NULL, 8);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, max16065_show_input, NULL, 9);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, max16065_show_input, NULL, 10);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, max16065_show_input, NULL, 11);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, max16065_show_input, NULL, 12);
+static SENSOR_DEVICE_ATTR_RO(in0_input, max16065_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, max16065_input, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, max16065_input, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, max16065_input, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, max16065_input, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, max16065_input, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, max16065_input, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, max16065_input, 7);
+static SENSOR_DEVICE_ATTR_RO(in8_input, max16065_input, 8);
+static SENSOR_DEVICE_ATTR_RO(in9_input, max16065_input, 9);
+static SENSOR_DEVICE_ATTR_RO(in10_input, max16065_input, 10);
+static SENSOR_DEVICE_ATTR_RO(in11_input, max16065_input, 11);
+static SENSOR_DEVICE_ATTR_RO(in12_input, max16065_input, 12);
 
 /* Input voltages lcrit */
-static SENSOR_DEVICE_ATTR_2(in0_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 0);
-static SENSOR_DEVICE_ATTR_2(in1_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 1);
-static SENSOR_DEVICE_ATTR_2(in2_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 2);
-static SENSOR_DEVICE_ATTR_2(in3_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 3);
-static SENSOR_DEVICE_ATTR_2(in4_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 4);
-static SENSOR_DEVICE_ATTR_2(in5_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 5);
-static SENSOR_DEVICE_ATTR_2(in6_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 6);
-static SENSOR_DEVICE_ATTR_2(in7_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 7);
-static SENSOR_DEVICE_ATTR_2(in8_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 8);
-static SENSOR_DEVICE_ATTR_2(in9_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 9);
-static SENSOR_DEVICE_ATTR_2(in10_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 10);
-static SENSOR_DEVICE_ATTR_2(in11_lcrit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 2, 11);
+static SENSOR_DEVICE_ATTR_2_RW(in0_lcrit, max16065_limit, 2, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_lcrit, max16065_limit, 2, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_lcrit, max16065_limit, 2, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_lcrit, max16065_limit, 2, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_lcrit, max16065_limit, 2, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_lcrit, max16065_limit, 2, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_lcrit, max16065_limit, 2, 6);
+static SENSOR_DEVICE_ATTR_2_RW(in7_lcrit, max16065_limit, 2, 7);
+static SENSOR_DEVICE_ATTR_2_RW(in8_lcrit, max16065_limit, 2, 8);
+static SENSOR_DEVICE_ATTR_2_RW(in9_lcrit, max16065_limit, 2, 9);
+static SENSOR_DEVICE_ATTR_2_RW(in10_lcrit, max16065_limit, 2, 10);
+static SENSOR_DEVICE_ATTR_2_RW(in11_lcrit, max16065_limit, 2, 11);
 
 /* Input voltages crit */
-static SENSOR_DEVICE_ATTR_2(in0_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 0);
-static SENSOR_DEVICE_ATTR_2(in1_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 1);
-static SENSOR_DEVICE_ATTR_2(in2_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 2);
-static SENSOR_DEVICE_ATTR_2(in3_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 3);
-static SENSOR_DEVICE_ATTR_2(in4_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 4);
-static SENSOR_DEVICE_ATTR_2(in5_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 5);
-static SENSOR_DEVICE_ATTR_2(in6_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 6);
-static SENSOR_DEVICE_ATTR_2(in7_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 7);
-static SENSOR_DEVICE_ATTR_2(in8_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 8);
-static SENSOR_DEVICE_ATTR_2(in9_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 9);
-static SENSOR_DEVICE_ATTR_2(in10_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 10);
-static SENSOR_DEVICE_ATTR_2(in11_crit, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 1, 11);
+static SENSOR_DEVICE_ATTR_2_RW(in0_crit, max16065_limit, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_crit, max16065_limit, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_crit, max16065_limit, 1, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_crit, max16065_limit, 1, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_crit, max16065_limit, 1, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_crit, max16065_limit, 1, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_crit, max16065_limit, 1, 6);
+static SENSOR_DEVICE_ATTR_2_RW(in7_crit, max16065_limit, 1, 7);
+static SENSOR_DEVICE_ATTR_2_RW(in8_crit, max16065_limit, 1, 8);
+static SENSOR_DEVICE_ATTR_2_RW(in9_crit, max16065_limit, 1, 9);
+static SENSOR_DEVICE_ATTR_2_RW(in10_crit, max16065_limit, 1, 10);
+static SENSOR_DEVICE_ATTR_2_RW(in11_crit, max16065_limit, 1, 11);
 
 /* Input voltages min */
-static SENSOR_DEVICE_ATTR_2(in0_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 0);
-static SENSOR_DEVICE_ATTR_2(in1_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 1);
-static SENSOR_DEVICE_ATTR_2(in2_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 2);
-static SENSOR_DEVICE_ATTR_2(in3_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 3);
-static SENSOR_DEVICE_ATTR_2(in4_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 4);
-static SENSOR_DEVICE_ATTR_2(in5_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 5);
-static SENSOR_DEVICE_ATTR_2(in6_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 6);
-static SENSOR_DEVICE_ATTR_2(in7_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 7);
-static SENSOR_DEVICE_ATTR_2(in8_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 8);
-static SENSOR_DEVICE_ATTR_2(in9_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 9);
-static SENSOR_DEVICE_ATTR_2(in10_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 10);
-static SENSOR_DEVICE_ATTR_2(in11_min, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 11);
+static SENSOR_DEVICE_ATTR_2_RW(in0_min, max16065_limit, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_min, max16065_limit, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_min, max16065_limit, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_min, max16065_limit, 0, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_min, max16065_limit, 0, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_min, max16065_limit, 0, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_min, max16065_limit, 0, 6);
+static SENSOR_DEVICE_ATTR_2_RW(in7_min, max16065_limit, 0, 7);
+static SENSOR_DEVICE_ATTR_2_RW(in8_min, max16065_limit, 0, 8);
+static SENSOR_DEVICE_ATTR_2_RW(in9_min, max16065_limit, 0, 9);
+static SENSOR_DEVICE_ATTR_2_RW(in10_min, max16065_limit, 0, 10);
+static SENSOR_DEVICE_ATTR_2_RW(in11_min, max16065_limit, 0, 11);
 
 /* Input voltages max */
-static SENSOR_DEVICE_ATTR_2(in0_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 0);
-static SENSOR_DEVICE_ATTR_2(in1_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 1);
-static SENSOR_DEVICE_ATTR_2(in2_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 2);
-static SENSOR_DEVICE_ATTR_2(in3_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 3);
-static SENSOR_DEVICE_ATTR_2(in4_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 4);
-static SENSOR_DEVICE_ATTR_2(in5_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 5);
-static SENSOR_DEVICE_ATTR_2(in6_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 6);
-static SENSOR_DEVICE_ATTR_2(in7_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 7);
-static SENSOR_DEVICE_ATTR_2(in8_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 8);
-static SENSOR_DEVICE_ATTR_2(in9_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 9);
-static SENSOR_DEVICE_ATTR_2(in10_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 10);
-static SENSOR_DEVICE_ATTR_2(in11_max, S_IWUSR | S_IRUGO, max16065_show_limit,
-			    max16065_set_limit, 0, 11);
+static SENSOR_DEVICE_ATTR_2_RW(in0_max, max16065_limit, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_max, max16065_limit, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_max, max16065_limit, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_max, max16065_limit, 0, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_max, max16065_limit, 0, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_max, max16065_limit, 0, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_max, max16065_limit, 0, 6);
+static SENSOR_DEVICE_ATTR_2_RW(in7_max, max16065_limit, 0, 7);
+static SENSOR_DEVICE_ATTR_2_RW(in8_max, max16065_limit, 0, 8);
+static SENSOR_DEVICE_ATTR_2_RW(in9_max, max16065_limit, 0, 9);
+static SENSOR_DEVICE_ATTR_2_RW(in10_max, max16065_limit, 0, 10);
+static SENSOR_DEVICE_ATTR_2_RW(in11_max, max16065_limit, 0, 11);
 
 /* alarms */
-static SENSOR_DEVICE_ATTR_2(in0_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 0);
-static SENSOR_DEVICE_ATTR_2(in1_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 1);
-static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 2);
-static SENSOR_DEVICE_ATTR_2(in3_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 3);
-static SENSOR_DEVICE_ATTR_2(in4_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 4);
-static SENSOR_DEVICE_ATTR_2(in5_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 5);
-static SENSOR_DEVICE_ATTR_2(in6_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 6);
-static SENSOR_DEVICE_ATTR_2(in7_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    0, 7);
-static SENSOR_DEVICE_ATTR_2(in8_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    1, 0);
-static SENSOR_DEVICE_ATTR_2(in9_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    1, 1);
-static SENSOR_DEVICE_ATTR_2(in10_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    1, 2);
-static SENSOR_DEVICE_ATTR_2(in11_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    1, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, max16065_alarm, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in1_alarm, max16065_alarm, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, max16065_alarm, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, max16065_alarm, 0, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, max16065_alarm, 0, 4);
+static SENSOR_DEVICE_ATTR_2_RO(in5_alarm, max16065_alarm, 0, 5);
+static SENSOR_DEVICE_ATTR_2_RO(in6_alarm, max16065_alarm, 0, 6);
+static SENSOR_DEVICE_ATTR_2_RO(in7_alarm, max16065_alarm, 0, 7);
+static SENSOR_DEVICE_ATTR_2_RO(in8_alarm, max16065_alarm, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in9_alarm, max16065_alarm, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in10_alarm, max16065_alarm, 1, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in11_alarm, max16065_alarm, 1, 3);
 
 /* Current and alarm */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, max16065_show_current, NULL, 0);
-static SENSOR_DEVICE_ATTR_2(curr1_alarm, S_IRUGO, max16065_show_alarm, NULL,
-			    1, 4);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, max16065_current, 0);
+static SENSOR_DEVICE_ATTR_2_RO(curr1_alarm, max16065_alarm, 1, 4);
 
 /*
  * Finally, construct an array of pointers to members of the above objects,
-- 
2.7.4

