Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92D3C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B02E420850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tSsk9G7j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfARRPt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45032 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id u6so6887148pfh.11
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+AL5oegf4P1qAu1UJRmqWL7zrX94+oXz6D/WINEIdy4=;
        b=tSsk9G7jMwWX5wgSERJfNyiYEO6r9IdImvbJG8yURY+yzzgPOlXZaEoQUTNVopYln0
         jlL+6GRF2le+Stlu5pX0KgSfZ0jZtSumMCCBA+KiKnsh0KeKHSkiHFybXEOSAHUz/iG2
         e8DpHHxZ/V70GPEUFipUfJlZQzheHadRDtbNTnbmPnP13/Kldvw7p1g4qrm7yIkWwHQV
         zjorUbX7o3cTIxr6KpWGtljezJfHPWEBi2ajvCiBLq81vqcFa6KpI8kDttDUq5mSWOFT
         bUm2yUQO738KeiLdC/PZQa5lLfKH0vaVSH1mXKGrxNZM9Ik+XZ8Xu2M0Vd4lXup+hOtr
         otlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=+AL5oegf4P1qAu1UJRmqWL7zrX94+oXz6D/WINEIdy4=;
        b=LByHJYhddgGDlJUvAkcyJXQZvTbtVDEfcZq9nBC30Zslkkj5XlrSgN4aJtwkPHj9Qj
         +OV0j3mQY6jhXrj8zjA7+iGZkl7H3Eh9RT/J9hTgRynRZMIXdJkAgvLTbswWKmX3uvdf
         UlrrgKYLA92ihvww3AvGsWhhhqJUYTDYCCeNd+bvNTOXV/Kod13ai6nGcepNawlq31jk
         jv/zySLuzFqILw+pqxLUpOgIyIRYcTDYk9oWoVIE341kNMZwlB83Zme41YfEdpLu1IAy
         dl3jH3yuK9nA3DD9OeCCbPyCZX24CIr1XtZv2nZPIp/hP46+DghnLB4U8ZpCtqoSjn/F
         mBYw==
X-Gm-Message-State: AJcUukdWaBLVAnk6Ed74rZa9HrEwy3So0v/jSrBweTGCfdbpRyIx5bgC
        5Ff6E13N0g9hV8aHnNUVQAEDhlWs
X-Google-Smtp-Source: ALg8bN5F4iBA+b9XEwuFHGInxolsO2VyJINjFOzFOuidKoa/CBBOV9yn/BNOXgFPJxtBo/+GdYC4nA==
X-Received: by 2002:a62:ca9c:: with SMTP id y28mr20091321pfk.236.1547831748034;
        Fri, 18 Jan 2019 09:15:48 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e86sm7414344pfb.6.2019.01.18.09.15.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:47 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 27/30] hwmon: (tmp103) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:57 -0800
Message-Id: <1547831700-15865-28-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/tmp103.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index 7f85b14544df..bda0fdc1eb53 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -61,9 +61,8 @@ static inline u8 tmp103_mc_to_reg(int val)
 	return DIV_ROUND_CLOSEST(val, 1000);
 }
 
-static ssize_t tmp103_show_temp(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static ssize_t tmp103_temp_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct regmap *regmap = dev_get_drvdata(dev);
@@ -77,9 +76,9 @@ static ssize_t tmp103_show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", tmp103_reg_to_mc(regval));
 }
 
-static ssize_t tmp103_set_temp(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t tmp103_temp_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct regmap *regmap = dev_get_drvdata(dev);
@@ -94,14 +93,11 @@ static ssize_t tmp103_set_temp(struct device *dev,
 	return ret ? ret : count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp103_show_temp, NULL ,
-			  TMP103_TEMP_REG);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, tmp103_temp, TMP103_TEMP_REG);
 
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, tmp103_show_temp,
-			  tmp103_set_temp, TMP103_TLOW_REG);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, tmp103_temp, TMP103_TLOW_REG);
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, tmp103_show_temp,
-			  tmp103_set_temp, TMP103_THIGH_REG);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, tmp103_temp, TMP103_THIGH_REG);
 
 static struct attribute *tmp103_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

