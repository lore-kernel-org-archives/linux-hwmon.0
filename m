Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E06AC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06E0C20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7R7rJmh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbfAQVOg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:36 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46611 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728247AbfAQVOg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:36 -0500
Received: by mail-pg1-f193.google.com with SMTP id w7so4968189pgp.13
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4oN4DfCbyOJBgronYPm2NRTFxa/eOSg3PS7u4j0k/D4=;
        b=m7R7rJmhq2ahsCc4cJD3yui3q3s2TmKTxNrej3KlKv5mUe/7OsxnjjliPcwvPF0WC6
         P01pevvBGDF7mAjmlTLdDaBi57FKXZpWMd6G2Gk5w4n3OKnhaC8ffdcl3MWSpPH6LcnQ
         BOz+R/ck8s58mhHx14i6uZ4E+37qVNXDwx1zfTDkOWrRjitLw8ftHGgraKJNmBApE/5W
         aHGfOcStykKS57ag0nf/zH+c+eeEMLg4KAhIIDHj9R6+6wv4X5YBGfMvruYL0Gs5EhwP
         QaSruRlS8Qc0lmby0BpP9T+iH4WSn2xEABXztOhWhDtreP/q8pdtNdrhkemPJXH66tZB
         6laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=4oN4DfCbyOJBgronYPm2NRTFxa/eOSg3PS7u4j0k/D4=;
        b=p2lLmbDu6GmD7puFS3YXg0H8YbWZKwwc3qxQwtiunyZQ91Qxri3L47V4aItsIKqIiR
         nczXyxdDYypLdlsJzfHuieeaNixSnCBAeati4zkDBwIFKnJnRmwuOsWbL3Oem+ex06FP
         See64aDGo2Wgd5SJYU/ga2ZYuHBY8FiuQoMZIjmkthOL6gHMKM0p+CnsEfaOkfIcwoHv
         TDINpN190rqr4KQssOQG0WFICTZTDoOdz4yCfxQ0+sigABOm82YWRCEumhzD33FlBG+/
         0RvYIx14C69moSnY6Cn69QsKrtERopcdi+LIEEoJi/ongftf22MUzGvQJMPIawf2KNcY
         eU4w==
X-Gm-Message-State: AJcUukfdhlZetx8frV5TO91KfA9tEFp3N5M05SENBZxeXnVxrct4ou0g
        gQR+19JmFO+ZoEyCYgYmOLL6K2EH
X-Google-Smtp-Source: ALg8bN7bQ1dfov1RumWiLqL9j9Ej+pyt8wAkfQKq9MbPDu8ymjAsKbwIrsylTKmnIvtYXRASY5MufQ==
X-Received: by 2002:a62:60c5:: with SMTP id u188mr16592084pfb.4.1547759672765;
        Thu, 17 Jan 2019 13:14:32 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e123sm3553056pgc.58.2019.01.17.13.14.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:31 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 23/29] hwmon: (lm93) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:43 -0800
Message-Id: <1547759629-23007-24-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm93.c | 630 +++++++++++++++++++++------------------------------
 1 file changed, 256 insertions(+), 374 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 77a0a83399b3..a0b5fbf958f3 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -1111,8 +1111,8 @@ static void lm93_update_client_min(struct lm93_data *data,
 }
 
 /* following are the sysfs callback functions */
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 
@@ -1120,25 +1120,25 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", LM93_IN_FROM_REG(nr, data->block3[nr]));
 }
 
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_in, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_in, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_in, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_in, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, show_in, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, show_in, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, show_in, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, show_in, NULL, 7);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, show_in, NULL, 8);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, show_in, NULL, 9);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, show_in, NULL, 10);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, show_in, NULL, 11);
-static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, show_in, NULL, 12);
-static SENSOR_DEVICE_ATTR(in14_input, S_IRUGO, show_in, NULL, 13);
-static SENSOR_DEVICE_ATTR(in15_input, S_IRUGO, show_in, NULL, 14);
-static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, show_in, NULL, 15);
-
-static ssize_t show_in_min(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static SENSOR_DEVICE_ATTR_RO(in1_input, in, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in, 1);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in, 2);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in, 3);
+static SENSOR_DEVICE_ATTR_RO(in5_input, in, 4);
+static SENSOR_DEVICE_ATTR_RO(in6_input, in, 5);
+static SENSOR_DEVICE_ATTR_RO(in7_input, in, 6);
+static SENSOR_DEVICE_ATTR_RO(in8_input, in, 7);
+static SENSOR_DEVICE_ATTR_RO(in9_input, in, 8);
+static SENSOR_DEVICE_ATTR_RO(in10_input, in, 9);
+static SENSOR_DEVICE_ATTR_RO(in11_input, in, 10);
+static SENSOR_DEVICE_ATTR_RO(in12_input, in, 11);
+static SENSOR_DEVICE_ATTR_RO(in13_input, in, 12);
+static SENSOR_DEVICE_ATTR_RO(in14_input, in, 13);
+static SENSOR_DEVICE_ATTR_RO(in15_input, in, 14);
+static SENSOR_DEVICE_ATTR_RO(in16_input, in, 15);
+
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1154,7 +1154,7 @@ static ssize_t show_in_min(struct device *dev,
 	return sprintf(buf, "%ld\n", rc);
 }
 
-static ssize_t store_in_min(struct device *dev, struct device_attribute *attr,
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -1185,41 +1185,25 @@ static ssize_t store_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in1_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 0);
-static SENSOR_DEVICE_ATTR(in2_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 1);
-static SENSOR_DEVICE_ATTR(in3_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 2);
-static SENSOR_DEVICE_ATTR(in4_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 3);
-static SENSOR_DEVICE_ATTR(in5_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 4);
-static SENSOR_DEVICE_ATTR(in6_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 5);
-static SENSOR_DEVICE_ATTR(in7_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 6);
-static SENSOR_DEVICE_ATTR(in8_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 7);
-static SENSOR_DEVICE_ATTR(in9_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 8);
-static SENSOR_DEVICE_ATTR(in10_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 9);
-static SENSOR_DEVICE_ATTR(in11_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 10);
-static SENSOR_DEVICE_ATTR(in12_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 11);
-static SENSOR_DEVICE_ATTR(in13_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 12);
-static SENSOR_DEVICE_ATTR(in14_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 13);
-static SENSOR_DEVICE_ATTR(in15_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 14);
-static SENSOR_DEVICE_ATTR(in16_min, S_IWUSR | S_IRUGO,
-			  show_in_min, store_in_min, 15);
-
-static ssize_t show_in_max(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 0);
+static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 1);
+static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 2);
+static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 3);
+static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 4);
+static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 5);
+static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 6);
+static SENSOR_DEVICE_ATTR_RW(in8_min, in_min, 7);
+static SENSOR_DEVICE_ATTR_RW(in9_min, in_min, 8);
+static SENSOR_DEVICE_ATTR_RW(in10_min, in_min, 9);
+static SENSOR_DEVICE_ATTR_RW(in11_min, in_min, 10);
+static SENSOR_DEVICE_ATTR_RW(in12_min, in_min, 11);
+static SENSOR_DEVICE_ATTR_RW(in13_min, in_min, 12);
+static SENSOR_DEVICE_ATTR_RW(in14_min, in_min, 13);
+static SENSOR_DEVICE_ATTR_RW(in15_min, in_min, 14);
+static SENSOR_DEVICE_ATTR_RW(in16_min, in_min, 15);
+
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1235,7 +1219,7 @@ static ssize_t show_in_max(struct device *dev,
 	return sprintf(buf, "%ld\n", rc);
 }
 
-static ssize_t store_in_max(struct device *dev, struct device_attribute *attr,
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -1266,61 +1250,46 @@ static ssize_t store_in_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in1_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 0);
-static SENSOR_DEVICE_ATTR(in2_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 1);
-static SENSOR_DEVICE_ATTR(in3_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 2);
-static SENSOR_DEVICE_ATTR(in4_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 3);
-static SENSOR_DEVICE_ATTR(in5_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 4);
-static SENSOR_DEVICE_ATTR(in6_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 5);
-static SENSOR_DEVICE_ATTR(in7_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 6);
-static SENSOR_DEVICE_ATTR(in8_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 7);
-static SENSOR_DEVICE_ATTR(in9_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 8);
-static SENSOR_DEVICE_ATTR(in10_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 9);
-static SENSOR_DEVICE_ATTR(in11_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 10);
-static SENSOR_DEVICE_ATTR(in12_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 11);
-static SENSOR_DEVICE_ATTR(in13_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 12);
-static SENSOR_DEVICE_ATTR(in14_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 13);
-static SENSOR_DEVICE_ATTR(in15_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 14);
-static SENSOR_DEVICE_ATTR(in16_max, S_IWUSR | S_IRUGO,
-			  show_in_max, store_in_max, 15);
-
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 0);
+static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 1);
+static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 2);
+static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 3);
+static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 4);
+static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 5);
+static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 6);
+static SENSOR_DEVICE_ATTR_RW(in8_max, in_max, 7);
+static SENSOR_DEVICE_ATTR_RW(in9_max, in_max, 8);
+static SENSOR_DEVICE_ATTR_RW(in10_max, in_max, 9);
+static SENSOR_DEVICE_ATTR_RW(in11_max, in_max, 10);
+static SENSOR_DEVICE_ATTR_RW(in12_max, in_max, 11);
+static SENSOR_DEVICE_ATTR_RW(in13_max, in_max, 12);
+static SENSOR_DEVICE_ATTR_RW(in14_max, in_max, 13);
+static SENSOR_DEVICE_ATTR_RW(in15_max, in_max, 14);
+static SENSOR_DEVICE_ATTR_RW(in16_max, in_max, 15);
+
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->block2[nr]));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
 
-static ssize_t show_temp_min(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->temp_lim[nr].min));
 }
 
-static ssize_t store_temp_min(struct device *dev, struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1339,14 +1308,11 @@ static ssize_t store_temp_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
-			  show_temp_min, store_temp_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO,
-			  show_temp_min, store_temp_min, 1);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO,
-			  show_temp_min, store_temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
 
-static ssize_t show_temp_max(struct device *dev,
+static ssize_t temp_max_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -1354,8 +1320,9 @@ static ssize_t show_temp_max(struct device *dev,
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->temp_lim[nr].max));
 }
 
-static ssize_t store_temp_max(struct device *dev, struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1374,24 +1341,21 @@ static ssize_t store_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			  show_temp_max, store_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO,
-			  show_temp_max, store_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO,
-			  show_temp_max, store_temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
 
-static ssize_t show_temp_auto_base(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_base_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->block10.base[nr]));
 }
 
-static ssize_t store_temp_auto_base(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t temp_auto_base_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1410,14 +1374,11 @@ static ssize_t store_temp_auto_base(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_auto_base, S_IWUSR | S_IRUGO,
-			  show_temp_auto_base, store_temp_auto_base, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_base, S_IWUSR | S_IRUGO,
-			  show_temp_auto_base, store_temp_auto_base, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_base, S_IWUSR | S_IRUGO,
-			  show_temp_auto_base, store_temp_auto_base, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_base, temp_auto_base, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_base, temp_auto_base, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_base, temp_auto_base, 2);
 
-static ssize_t show_temp_auto_boost(struct device *dev,
+static ssize_t temp_auto_boost_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -1425,7 +1386,7 @@ static ssize_t show_temp_auto_boost(struct device *dev,
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->boost[nr]));
 }
 
-static ssize_t store_temp_auto_boost(struct device *dev,
+static ssize_t temp_auto_boost_store(struct device *dev,
 				     struct device_attribute *attr,
 				     const char *buf, size_t count)
 {
@@ -1446,14 +1407,11 @@ static ssize_t store_temp_auto_boost(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_auto_boost, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost, store_temp_auto_boost, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_boost, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost, store_temp_auto_boost, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_boost, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost, store_temp_auto_boost, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_boost, temp_auto_boost, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_boost, temp_auto_boost, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_boost, temp_auto_boost, 2);
 
-static ssize_t show_temp_auto_boost_hyst(struct device *dev,
+static ssize_t temp_auto_boost_hyst_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
@@ -1464,7 +1422,7 @@ static ssize_t show_temp_auto_boost_hyst(struct device *dev,
 		       LM93_AUTO_BOOST_HYST_FROM_REGS(data, nr, mode));
 }
 
-static ssize_t store_temp_auto_boost_hyst(struct device *dev,
+static ssize_t temp_auto_boost_hyst_store(struct device *dev,
 					  struct device_attribute *attr,
 					  const char *buf, size_t count)
 {
@@ -1490,18 +1448,12 @@ static ssize_t store_temp_auto_boost_hyst(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_auto_boost_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost_hyst,
-			  store_temp_auto_boost_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_boost_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost_hyst,
-			  store_temp_auto_boost_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_boost_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_boost_hyst,
-			  store_temp_auto_boost_hyst, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_boost_hyst, temp_auto_boost_hyst, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_boost_hyst, temp_auto_boost_hyst, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_boost_hyst, temp_auto_boost_hyst, 2);
 
-static ssize_t show_temp_auto_offset(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_offset_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute_2 *s_attr = to_sensor_dev_attr_2(attr);
 	int nr = s_attr->index;
@@ -1513,9 +1465,9 @@ static ssize_t show_temp_auto_offset(struct device *dev,
 					      nr, mode));
 }
 
-static ssize_t store_temp_auto_offset(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t temp_auto_offset_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	struct sensor_device_attribute_2 *s_attr = to_sensor_dev_attr_2(attr);
 	int nr = s_attr->index;
@@ -1542,81 +1494,46 @@ static ssize_t store_temp_auto_offset(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset1, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset2, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 1, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset3, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 2, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset4, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 3, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset5, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 4, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset6, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 5, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset7, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 6, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset8, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 7, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset9, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 8, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset10, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 9, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset11, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 10, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_offset12, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 11, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset1, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset2, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 1, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset3, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 2, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset4, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 3, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset5, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 4, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset6, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 5, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset7, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 6, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset8, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 7, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset9, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 8, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset10, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 9, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset11, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 10, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_offset12, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 11, 1);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset1, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 0, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset2, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 1, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset3, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 2, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset4, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 3, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset5, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 4, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset6, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 5, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset7, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 6, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset8, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 7, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset9, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 8, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset10, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 9, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset11, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 10, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_offset12, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset, store_temp_auto_offset, 11, 2);
-
-static ssize_t show_temp_auto_pwm_min(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset1, temp_auto_offset, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset2, temp_auto_offset, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset3, temp_auto_offset, 2, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset4, temp_auto_offset, 3, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset5, temp_auto_offset, 4, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset6, temp_auto_offset, 5, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset7, temp_auto_offset, 6, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset8, temp_auto_offset, 7, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset9, temp_auto_offset, 8, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset10, temp_auto_offset, 9, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset11, temp_auto_offset, 10, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_offset12, temp_auto_offset, 11, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset1, temp_auto_offset, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset2, temp_auto_offset, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset3, temp_auto_offset, 2, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset4, temp_auto_offset, 3, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset5, temp_auto_offset, 4, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset6, temp_auto_offset, 5, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset7, temp_auto_offset, 6, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset8, temp_auto_offset, 7, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset9, temp_auto_offset, 8, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset10, temp_auto_offset, 9, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset11, temp_auto_offset, 10, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_offset12, temp_auto_offset, 11, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset1, temp_auto_offset, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset2, temp_auto_offset, 1, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset3, temp_auto_offset, 2, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset4, temp_auto_offset, 3, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset5, temp_auto_offset, 4, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset6, temp_auto_offset, 5, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset7, temp_auto_offset, 6, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset8, temp_auto_offset, 7, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset9, temp_auto_offset, 8, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset10, temp_auto_offset, 9, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset11, temp_auto_offset, 10, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_offset12, temp_auto_offset, 11, 2);
+
+static ssize_t temp_auto_pwm_min_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	u8 reg, ctl4;
@@ -1627,9 +1544,9 @@ static ssize_t show_temp_auto_pwm_min(struct device *dev,
 				LM93_PWM_MAP_LO_FREQ : LM93_PWM_MAP_HI_FREQ));
 }
 
-static ssize_t store_temp_auto_pwm_min(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t temp_auto_pwm_min_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1655,18 +1572,13 @@ static ssize_t store_temp_auto_pwm_min(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_auto_pwm_min, S_IWUSR | S_IRUGO,
-			  show_temp_auto_pwm_min,
-			  store_temp_auto_pwm_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_pwm_min, S_IWUSR | S_IRUGO,
-			  show_temp_auto_pwm_min,
-			  store_temp_auto_pwm_min, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_pwm_min, S_IWUSR | S_IRUGO,
-			  show_temp_auto_pwm_min,
-			  store_temp_auto_pwm_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_pwm_min, temp_auto_pwm_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_pwm_min, temp_auto_pwm_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_pwm_min, temp_auto_pwm_min, 2);
 
-static ssize_t show_temp_auto_offset_hyst(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_offset_hyst_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1675,9 +1587,9 @@ static ssize_t show_temp_auto_offset_hyst(struct device *dev,
 					data->auto_pwm_min_hyst[nr / 2], mode));
 }
 
-static ssize_t store_temp_auto_offset_hyst(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf, size_t count)
+static ssize_t temp_auto_offset_hyst_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1703,18 +1615,12 @@ static ssize_t store_temp_auto_offset_hyst(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_auto_offset_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset_hyst,
-			  store_temp_auto_offset_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_offset_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset_hyst,
-			  store_temp_auto_offset_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_offset_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_auto_offset_hyst,
-			  store_temp_auto_offset_hyst, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_offset_hyst, temp_auto_offset_hyst, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_offset_hyst, temp_auto_offset_hyst, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_offset_hyst, temp_auto_offset_hyst, 2);
 
-static ssize_t show_fan_input(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t fan_input_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *s_attr = to_sensor_dev_attr(attr);
 	int nr = s_attr->index;
@@ -1723,13 +1629,13 @@ static ssize_t show_fan_input(struct device *dev,
 	return sprintf(buf, "%d\n", LM93_FAN_FROM_REG(data->block5[nr]));
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan_input, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan_input, 3);
 
-static ssize_t show_fan_min(struct device *dev,
-			      struct device_attribute *attr, char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1737,8 +1643,9 @@ static ssize_t show_fan_min(struct device *dev,
 	return sprintf(buf, "%d\n", LM93_FAN_FROM_REG(data->block8[nr]));
 }
 
-static ssize_t store_fan_min(struct device *dev, struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1757,14 +1664,10 @@ static ssize_t store_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, store_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, store_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan3_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, store_fan_min, 2);
-static SENSOR_DEVICE_ATTR(fan4_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, store_fan_min, 3);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
 
 /*
  * some tedious bit-twiddling here to deal with the register format:
@@ -1780,8 +1683,8 @@ static SENSOR_DEVICE_ATTR(fan4_min, S_IWUSR | S_IRUGO,
  *		       T4    T3    T2    T1
  */
 
-static ssize_t show_fan_smart_tach(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t fan_smart_tach_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1819,9 +1722,9 @@ static void lm93_write_fan_smart_tach(struct i2c_client *client,
 	lm93_write_byte(client, LM93_REG_SFC2, data->sfc2);
 }
 
-static ssize_t store_fan_smart_tach(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t fan_smart_tach_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1849,16 +1752,12 @@ static ssize_t store_fan_smart_tach(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_smart_tach, S_IWUSR | S_IRUGO,
-			  show_fan_smart_tach, store_fan_smart_tach, 0);
-static SENSOR_DEVICE_ATTR(fan2_smart_tach, S_IWUSR | S_IRUGO,
-			  show_fan_smart_tach, store_fan_smart_tach, 1);
-static SENSOR_DEVICE_ATTR(fan3_smart_tach, S_IWUSR | S_IRUGO,
-			  show_fan_smart_tach, store_fan_smart_tach, 2);
-static SENSOR_DEVICE_ATTR(fan4_smart_tach, S_IWUSR | S_IRUGO,
-			  show_fan_smart_tach, store_fan_smart_tach, 3);
+static SENSOR_DEVICE_ATTR_RW(fan1_smart_tach, fan_smart_tach, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_smart_tach, fan_smart_tach, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_smart_tach, fan_smart_tach, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_smart_tach, fan_smart_tach, 3);
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -1876,8 +1775,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%ld\n", rc);
 }
 
-static ssize_t store_pwm(struct device *dev, struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -1904,11 +1803,11 @@ static ssize_t store_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
 
-static ssize_t show_pwm_enable(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t pwm_enable_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -1923,7 +1822,7 @@ static ssize_t show_pwm_enable(struct device *dev,
 	return sprintf(buf, "%ld\n", rc);
 }
 
-static ssize_t store_pwm_enable(struct device *dev,
+static ssize_t pwm_enable_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
@@ -1961,13 +1860,11 @@ static ssize_t store_pwm_enable(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-				show_pwm_enable, store_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO,
-				show_pwm_enable, store_pwm_enable, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
 
-static ssize_t show_pwm_freq(struct device *dev, struct device_attribute *attr,
-				char *buf)
+static ssize_t pwm_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2001,9 +1898,9 @@ static void lm93_disable_fan_smart_tach(struct i2c_client *client,
 	lm93_write_byte(client, LM93_REG_SFC2, data->sfc2);
 }
 
-static ssize_t store_pwm_freq(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t pwm_freq_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2028,22 +1925,21 @@ static ssize_t store_pwm_freq(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_freq, S_IWUSR | S_IRUGO,
-			  show_pwm_freq, store_pwm_freq, 0);
-static SENSOR_DEVICE_ATTR(pwm2_freq, S_IWUSR | S_IRUGO,
-			  show_pwm_freq, store_pwm_freq, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_freq, pwm_freq, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_freq, pwm_freq, 1);
 
-static ssize_t show_pwm_auto_channels(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_channels_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", data->block9[nr][LM93_PWM_CTL1]);
 }
 
-static ssize_t store_pwm_auto_channels(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t pwm_auto_channels_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2063,13 +1959,12 @@ static ssize_t store_pwm_auto_channels(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_auto_channels, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_channels, store_pwm_auto_channels, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_channels, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_channels, store_pwm_auto_channels, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_channels, pwm_auto_channels, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_channels, pwm_auto_channels, 1);
 
-static ssize_t show_pwm_auto_spinup_min(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_spinup_min_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2082,9 +1977,9 @@ static ssize_t show_pwm_auto_spinup_min(struct device *dev,
 			LM93_PWM_MAP_LO_FREQ : LM93_PWM_MAP_HI_FREQ));
 }
 
-static ssize_t store_pwm_auto_spinup_min(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf, size_t count)
+static ssize_t pwm_auto_spinup_min_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2109,15 +2004,12 @@ static ssize_t store_pwm_auto_spinup_min(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_auto_spinup_min, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_spinup_min,
-			  store_pwm_auto_spinup_min, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_spinup_min, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_spinup_min,
-			  store_pwm_auto_spinup_min, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_spinup_min, pwm_auto_spinup_min, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_spinup_min, pwm_auto_spinup_min, 1);
 
-static ssize_t show_pwm_auto_spinup_time(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_spinup_time_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2125,9 +2017,9 @@ static ssize_t show_pwm_auto_spinup_time(struct device *dev,
 				data->block9[nr][LM93_PWM_CTL3]));
 }
 
-static ssize_t store_pwm_auto_spinup_time(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf, size_t count)
+static ssize_t pwm_auto_spinup_time_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2149,12 +2041,8 @@ static ssize_t store_pwm_auto_spinup_time(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_auto_spinup_time, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_spinup_time,
-			  store_pwm_auto_spinup_time, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_spinup_time, S_IWUSR | S_IRUGO,
-			  show_pwm_auto_spinup_time,
-			  store_pwm_auto_spinup_time, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_spinup_time, pwm_auto_spinup_time, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_spinup_time, pwm_auto_spinup_time, 1);
 
 static ssize_t pwm_auto_prochot_ramp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
@@ -2220,7 +2108,7 @@ static ssize_t pwm_auto_vrdhot_ramp_store(struct device *dev,
 
 static DEVICE_ATTR_RW(pwm_auto_vrdhot_ramp);
 
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
+static ssize_t vid_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -2228,21 +2116,21 @@ static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", LM93_VID_FROM_REG(data->vid[nr]));
 }
 
-static SENSOR_DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL, 0);
-static SENSOR_DEVICE_ATTR(cpu1_vid, S_IRUGO, show_vid, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(cpu0_vid, vid, 0);
+static SENSOR_DEVICE_ATTR_RO(cpu1_vid, vid, 1);
 
-static ssize_t show_prochot(struct device *dev, struct device_attribute *attr,
-				char *buf)
+static ssize_t prochot_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", data->block4[nr].cur);
 }
 
-static SENSOR_DEVICE_ATTR(prochot1, S_IRUGO, show_prochot, NULL, 0);
-static SENSOR_DEVICE_ATTR(prochot2, S_IRUGO, show_prochot, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(prochot1, prochot, 0);
+static SENSOR_DEVICE_ATTR_RO(prochot2, prochot, 1);
 
-static ssize_t show_prochot_avg(struct device *dev,
+static ssize_t prochot_avg_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -2250,10 +2138,10 @@ static ssize_t show_prochot_avg(struct device *dev,
 	return sprintf(buf, "%d\n", data->block4[nr].avg);
 }
 
-static SENSOR_DEVICE_ATTR(prochot1_avg, S_IRUGO, show_prochot_avg, NULL, 0);
-static SENSOR_DEVICE_ATTR(prochot2_avg, S_IRUGO, show_prochot_avg, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(prochot1_avg, prochot_avg, 0);
+static SENSOR_DEVICE_ATTR_RO(prochot2_avg, prochot_avg, 1);
 
-static ssize_t show_prochot_max(struct device *dev,
+static ssize_t prochot_max_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
@@ -2261,9 +2149,9 @@ static ssize_t show_prochot_max(struct device *dev,
 	return sprintf(buf, "%d\n", data->prochot_max[nr]);
 }
 
-static ssize_t store_prochot_max(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t prochot_max_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2283,15 +2171,13 @@ static ssize_t store_prochot_max(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(prochot1_max, S_IWUSR | S_IRUGO,
-			  show_prochot_max, store_prochot_max, 0);
-static SENSOR_DEVICE_ATTR(prochot2_max, S_IWUSR | S_IRUGO,
-			  show_prochot_max, store_prochot_max, 1);
+static SENSOR_DEVICE_ATTR_RW(prochot1_max, prochot_max, 0);
+static SENSOR_DEVICE_ATTR_RW(prochot2_max, prochot_max, 1);
 
 static const u8 prochot_override_mask[] = { 0x80, 0x40 };
 
-static ssize_t show_prochot_override(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t prochot_override_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2299,9 +2185,9 @@ static ssize_t show_prochot_override(struct device *dev,
 		(data->prochot_override & prochot_override_mask[nr]) ? 1 : 0);
 }
 
-static ssize_t store_prochot_override(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t prochot_override_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2324,13 +2210,11 @@ static ssize_t store_prochot_override(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(prochot1_override, S_IWUSR | S_IRUGO,
-			  show_prochot_override, store_prochot_override, 0);
-static SENSOR_DEVICE_ATTR(prochot2_override, S_IWUSR | S_IRUGO,
-			  show_prochot_override, store_prochot_override, 1);
+static SENSOR_DEVICE_ATTR_RW(prochot1_override, prochot_override, 0);
+static SENSOR_DEVICE_ATTR_RW(prochot2_override, prochot_override, 1);
 
-static ssize_t show_prochot_interval(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t prochot_interval_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2342,9 +2226,9 @@ static ssize_t show_prochot_interval(struct device *dev,
 	return sprintf(buf, "%d\n", LM93_INTERVAL_FROM_REG(tmp));
 }
 
-static ssize_t store_prochot_interval(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t prochot_interval_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
@@ -2369,10 +2253,8 @@ static ssize_t store_prochot_interval(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(prochot1_interval, S_IWUSR | S_IRUGO,
-			  show_prochot_interval, store_prochot_interval, 0);
-static SENSOR_DEVICE_ATTR(prochot2_interval, S_IWUSR | S_IRUGO,
-			  show_prochot_interval, store_prochot_interval, 1);
+static SENSOR_DEVICE_ATTR_RW(prochot1_interval, prochot_interval, 0);
+static SENSOR_DEVICE_ATTR_RW(prochot2_interval, prochot_interval, 1);
 
 static ssize_t prochot_override_duty_cycle_show(struct device *dev,
 						struct device_attribute *attr,
@@ -2438,8 +2320,8 @@ static ssize_t prochot_short_store(struct device *dev,
 
 static DEVICE_ATTR_RW(prochot_short);
 
-static ssize_t show_vrdhot(struct device *dev, struct device_attribute *attr,
-				char *buf)
+static ssize_t vrdhot_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2447,8 +2329,8 @@ static ssize_t show_vrdhot(struct device *dev, struct device_attribute *attr,
 		       data->block1.host_status_1 & (1 << (nr + 4)) ? 1 : 0);
 }
 
-static SENSOR_DEVICE_ATTR(vrdhot1, S_IRUGO, show_vrdhot, NULL, 0);
-static SENSOR_DEVICE_ATTR(vrdhot2, S_IRUGO, show_vrdhot, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(vrdhot1, vrdhot, 0);
+static SENSOR_DEVICE_ATTR_RO(vrdhot2, vrdhot, 1);
 
 static ssize_t gpio_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
-- 
2.7.4

