Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248AAC10F0F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7E7620693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp6MP94k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbfDEDVb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:31 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43765 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbfDEDVb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id z9so2274014pgu.10
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WGEF0rawVB6SXvOf5h/w2l9FllRyufhPklnRAM4tYIA=;
        b=Lp6MP94kGi/fwWPtF51mAa+G4IQd0S2jrkcuSgaBIN8s7wvg/rtREDjJUx/sUa6O25
         t9ZxODj6VJHnmmEIARjTP5U8CP4XpjmU1yLXO/ZAcFnrb77PgLZrW50LF9tLAkC5vRYW
         YTopEoRJZxEZ6kIQ01HUWgs6rcKajbbgd1YuYYptUJ8Xf1wwzKD0c2sKgZ3/xJ25W+n4
         kAiJmA5hig2UXauw2EqzgPX42YT/15wfwBXhsXCZbMIZ2sFz31wwL5TiRLRAHUC58zIE
         TWr2axgHZtnRgM7QZ7mBYp4BL3938j5owO6oIHQe1jBY4EVh4FuTyiOlouq5JNOm+RX7
         5fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WGEF0rawVB6SXvOf5h/w2l9FllRyufhPklnRAM4tYIA=;
        b=S6JqUg4qoabqN2mCtwVYT+e2aCh+6GmKCot7uc+x4dr+TyFodEJjlnYHUx7EuF2zZO
         bOCSKftcBxx/FpqZKFE+wVpg1+WdoFyabI5qmEnMcM0R7leWpL+KnOOzxzsjL76a8DuP
         TlfTA2di98iqeLr0zieVWv2IH2PNq+o6MRQ/azTaslXpxVvGc2Twd+V1SoLNuvYeCUL+
         PMSY3Z4XCcptpqr4eLk3353pWxMZUlRFqzKfBXPCtvACnMrPlX417Sk2VdcIUkyHJEC0
         uesZyKwAoyDTLvZBkDwCVYwIefeF+fnRQdjRpQQdi3Wx3Ph+H/r8cSQTMY5mT2llo37p
         8aKA==
X-Gm-Message-State: APjAAAUsw50iJIzICFKC48LsGnsRHatl+GP8QHTJKf1pe5qfW42LhXli
        lg8GTBa8NadxZqJSx6SJ8MJXzjpa
X-Google-Smtp-Source: APXvYqzRJwVQaaKkkXRvdnfJyr02T3nqvcTet6gUHj5NkdyUo5H4Zf+ZIs3oP8UrfCj4/zWIy+RoJg==
X-Received: by 2002:aa7:8615:: with SMTP id p21mr9961974pfn.98.1554434490368;
        Thu, 04 Apr 2019 20:21:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k22sm26491116pfa.84.2019.04.04.20.21.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:29 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 16/16] hwmon: (adm1029) Use permission specific [SENSOR_][DEVICE_]ATTR variants
Date:   Thu,  4 Apr 2019 20:21:02 -0700
Message-Id: <1554434462-6087-16-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554434462-6087-1-git-send-email-linux@roeck-us.net>
References: <1554434462-6087-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use [SENSOR_][DEVICE_]ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1029.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/adm1029.c b/drivers/hwmon/adm1029.c
index e561279aea21..388060ff85e7 100644
--- a/drivers/hwmon/adm1029.c
+++ b/drivers/hwmon/adm1029.c
@@ -166,7 +166,7 @@ static struct adm1029_data *adm1029_update_device(struct device *dev)
  */
 
 static ssize_t
-show_temp(struct device *dev, struct device_attribute *devattr, char *buf)
+temp_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm1029_data *data = adm1029_update_device(dev);
@@ -175,7 +175,7 @@ show_temp(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_fan(struct device *dev, struct device_attribute *devattr, char *buf)
+fan_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm1029_data *data = adm1029_update_device(dev);
@@ -193,7 +193,7 @@ show_fan(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *devattr, char *buf)
+fan_div_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm1029_data *data = adm1029_update_device(dev);
@@ -203,8 +203,9 @@ show_fan_div(struct device *dev, struct device_attribute *devattr, char *buf)
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->index]));
 }
 
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct adm1029_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -254,26 +255,26 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *devattr,
 }
 
 /* Access rights on sysfs. */
-static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, 0444, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, 0444, show_temp, NULL, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
 
-static SENSOR_DEVICE_ATTR(temp1_max, 0444, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_max, 0444, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp3_max, 0444, show_temp, NULL, 5);
+static SENSOR_DEVICE_ATTR_RO(temp1_max, temp, 3);
+static SENSOR_DEVICE_ATTR_RO(temp2_max, temp, 4);
+static SENSOR_DEVICE_ATTR_RO(temp3_max, temp, 5);
 
-static SENSOR_DEVICE_ATTR(temp1_min, 0444, show_temp, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp2_min, 0444, show_temp, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp3_min, 0444, show_temp, NULL, 8);
+static SENSOR_DEVICE_ATTR_RO(temp1_min, temp, 6);
+static SENSOR_DEVICE_ATTR_RO(temp2_min, temp, 7);
+static SENSOR_DEVICE_ATTR_RO(temp3_min, temp, 8);
 
-static SENSOR_DEVICE_ATTR(fan1_input, 0444, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, 0444, show_fan, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
 
-static SENSOR_DEVICE_ATTR(fan1_min, 0444, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan2_min, 0444, show_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_min, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan2_min, fan, 3);
 
-static SENSOR_DEVICE_ATTR(fan1_div, 0644, show_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, 0644, show_fan_div, set_fan_div, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 
 static struct attribute *adm1029_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

