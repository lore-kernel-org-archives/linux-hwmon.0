Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E480C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAF0220850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9EraJYl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbfARRPn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:43 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35014 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:43 -0500
Received: by mail-pg1-f193.google.com with SMTP id s198so6356071pgs.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vBM03/aGHdDi2mIiohqFlZI/qfaV09K1cg4F8KFISCg=;
        b=D9EraJYlfcfFJLGs9y3GGB1TUVYEiXLZci1LoE1hM7f1S0I5fX0jKIT6f8yJvPSXNA
         h305zPoVH2x7tWprAIz9WwIF3Z/4qx+cVt4pZQcvBuHl3ll2KqbJotndKz3p/bKGBHgS
         l+ri3wrtxooW5C/mK1yJ4ipI6zrx8eKZnJFhJUxy3a9WVm3qoCAaGA82sSFhvK0bdTJt
         x3kVy7HCCaXxY9DBLTxwoiPqJGSZk7gjOXCfgsYFr0L1ps+AiONdDVHlsHXjktolzmkS
         Fd8+fZQncyMg3L+mBtMcfJF6Z727Ls8sFVYrzWCIaeQW39gyj9Z05gu7SwjvH1bSxDIk
         /mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=vBM03/aGHdDi2mIiohqFlZI/qfaV09K1cg4F8KFISCg=;
        b=L5pj+U+LS1ItiLXz1n+b27eiX9eSxWqQm1Ew5JcVP3Prj8RvX9ypDnqLCq1h0kdqj6
         c4F8lv2mzRemba9xNUZn+dROYnO1kACuQWKEk9yeaj+EjjKrlEsschOXPNU+v2hxIKCx
         Ts7UuOJtGI8bldztRLN3Tdkxq07WGMKl1w8OAbnN/xrkuX3H1HXy8vq/U1Eieq6iR+Wu
         5VOXag+VENvq7G0WtCVtF5jJBCYlvZu5H0Xvm0R/kf6SXvgsslL7RQH5mCNQcuTV6a3Z
         VjQzNKMp17WLUxJJyn+zcFJcudGalTTZdHxAvpt8li9ywAVmlqojDxlhQ2VBUdbM29QY
         0o5g==
X-Gm-Message-State: AJcUukdlyGsvFe9+vtKcEFzBwZK2ZR/Or+YwuIziUU62eL7wdjDWMIfL
        LDWlobPbmLmtIrxLN+SQlKPbjpxU
X-Google-Smtp-Source: ALg8bN7xc6LUk+/j9qf0Vgk32yv3CsTY5LrWr//Q42vO/EG2KwX+aJFKVwJH+wfrtlDCzaqSwfK3GQ==
X-Received: by 2002:a63:ea4f:: with SMTP id l15mr18132436pgk.102.1547831741890;
        Fri, 18 Jan 2019 09:15:41 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t5sm10727376pfb.60.2019.01.18.09.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:41 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 23/30] hwmon: (stts751) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:53 -0800
Message-Id: <1547831700-15865-24-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/stts751.c | 64 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 7fe152d92350..90b60297f2f7 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -382,8 +382,8 @@ static int stts751_update(struct stts751_priv *priv)
 	return 0;
 }
 
-static ssize_t show_max_alarm(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t max_alarm_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	int ret;
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -399,8 +399,8 @@ static ssize_t show_max_alarm(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->max_alert);
 }
 
-static ssize_t show_min_alarm(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t min_alarm_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	int ret;
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -416,7 +416,7 @@ static ssize_t show_min_alarm(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->min_alert);
 }
 
-static ssize_t show_input(struct device *dev, struct device_attribute *attr,
+static ssize_t input_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int ret;
@@ -431,7 +431,7 @@ static ssize_t show_input(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->temp);
 }
 
-static ssize_t show_therm(struct device *dev, struct device_attribute *attr,
+static ssize_t therm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -439,8 +439,8 @@ static ssize_t show_therm(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm);
 }
 
-static ssize_t set_therm(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
+static ssize_t therm_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	int ret;
 	long temp;
@@ -473,7 +473,7 @@ static ssize_t set_therm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_hyst(struct device *dev, struct device_attribute *attr,
+static ssize_t hyst_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -481,8 +481,8 @@ static ssize_t show_hyst(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->hyst);
 }
 
-static ssize_t set_hyst(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t hyst_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	int ret;
 	long temp;
@@ -506,7 +506,7 @@ static ssize_t set_hyst(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_therm_trip(struct device *dev,
+static ssize_t therm_trip_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	int ret;
@@ -521,7 +521,7 @@ static ssize_t show_therm_trip(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm_trip);
 }
 
-static ssize_t show_max(struct device *dev, struct device_attribute *attr,
+static ssize_t max_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -529,8 +529,8 @@ static ssize_t show_max(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_max);
 }
 
-static ssize_t set_max(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t max_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int ret;
 	long temp;
@@ -555,7 +555,7 @@ static ssize_t set_max(struct device *dev, struct device_attribute *attr,
 	return ret;
 }
 
-static ssize_t show_min(struct device *dev, struct device_attribute *attr,
+static ssize_t min_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
@@ -563,8 +563,8 @@ static ssize_t show_min(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_min);
 }
 
-static ssize_t set_min(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t min_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int ret;
 	long temp;
@@ -589,8 +589,8 @@ static ssize_t set_min(struct device *dev, struct device_attribute *attr,
 	return ret;
 }
 
-static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t interval_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
@@ -598,8 +598,9 @@ static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
 			stts751_intervals[priv->interval]);
 }
 
-static ssize_t set_interval(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t interval_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	unsigned long val;
 	int idx;
@@ -746,16 +747,15 @@ static int stts751_read_chip_config(struct stts751_priv *priv)
 	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, 0644, show_min, set_min, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, 0644, show_max, set_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, 0444, show_min_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, 0444, show_max_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit, 0644, show_therm,	set_therm, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, 0644, show_hyst, set_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, 0444, show_therm_trip, NULL, 0);
-static SENSOR_DEVICE_ATTR(update_interval, 0644,
-			  show_interval, set_interval, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, input, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, min_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, max_alarm, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, therm, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, therm_trip, 0);
+static SENSOR_DEVICE_ATTR_RW(update_interval, interval, 0);
 
 static struct attribute *stts751_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

