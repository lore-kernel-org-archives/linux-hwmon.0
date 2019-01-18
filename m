Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9A9C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F6CC20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThM51yTU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbfARRPj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:39 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40395 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728586AbfARRPi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:38 -0500
Received: by mail-pg1-f194.google.com with SMTP id z10so6347147pgp.7
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5d4bnYB/8NEk8iJhjySinmCO7SdOo8lOKxQrDzee/nw=;
        b=ThM51yTUt0DCEpW9NKBgFoo75XxTp+hBIQpy3W/V1SmjC5XXcZdvCjmtYtlK1uW68A
         VF15+wtD+iKylnmu5xR4QrFHgsyzYtU3oUTJ+Am8+naQ3zh6B8M/c8iQL0Y4cXyiM5cE
         Jh5Wpuar1f5WDzdQ7cwHAm6Ihck6A6t+Wt+V4/hQW2UDdo7s8LkXFiN6dOnBFtiDadU3
         KSY8ZnGXODEhUf1RBFvy7rthEaiBfqlQtAsneBKr9B9Ks1PwJscYV4kwwRX66CMvPHvx
         ga6zWMq6MjDt9OxvNkAWdy3xUHJbreg+1jEA++/qbdvsJVGblDTJjb+Bvzg84SQ1GnlZ
         ynVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=5d4bnYB/8NEk8iJhjySinmCO7SdOo8lOKxQrDzee/nw=;
        b=SJlavt8zRi2mv7Ib22Q/DZLP1XFPI6zQobRuGqtnf6dRAOihQ4KHq9gIDYcleN77je
         VHen6kDGATi7h8xwCnx+NDWBs89JOViC4wuG/bhG+gWnMRFFFFvd2Df2iyikMJwEyKLt
         fAeaxecx14L/VHhY5fva4+8kzZtvRTpMvC2iCaBN5l/+1viPIw1FupOsYgfgd8QxMhwa
         Xeeex/1kSuWqjkGJCxcvH1dCPV2D94IM9+jPeKegoF/InMj6zMHFWB7eENzbF78nGNQS
         H/nIdBTgmdNcuHTmye3w500YExu+XGMCR/4CgxEaop4pi8533pszPcQrz6//1KSe2WmY
         BJuQ==
X-Gm-Message-State: AJcUukf1qpQFZl9tWEEui6xFXYaG+FoLp2toiVvJ0utvclKXd1ZVn/fS
        bPP3VsWCkIbW+y4IlUixuUWQo2Ja
X-Google-Smtp-Source: ALg8bN7ne3aTi7de8NiS9nyW0HDv0F5jH6AZGUeTdTtFRFhBtKf68GKhZKPjg63wOLxNS9bvDgEIAg==
X-Received: by 2002:a63:e655:: with SMTP id p21mr18332237pgj.70.1547831737270;
        Fri, 18 Jan 2019 09:15:37 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm10261884pff.101.2019.01.18.09.15.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:36 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 20/30] hwmon: (sht21) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:50 -0800
Message-Id: <1547831700-15865-21-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/sht21.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 2c7ba70921f5..df112b73b635 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -135,9 +135,9 @@ static int sht21_update_measurements(struct device *dev)
  * Will be called on read access to temp1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t sht21_show_temperature(struct device *dev,
-	struct device_attribute *attr,
-	char *buf)
+static ssize_t sht21_temperature_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
 {
 	struct sht21 *sht21 = dev_get_drvdata(dev);
 	int ret;
@@ -157,9 +157,8 @@ static ssize_t sht21_show_temperature(struct device *dev,
  * Will be called on read access to humidity1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t sht21_show_humidity(struct device *dev,
-	struct device_attribute *attr,
-	char *buf)
+static ssize_t sht21_humidity_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct sht21 *sht21 = dev_get_drvdata(dev);
 	int ret;
@@ -251,10 +250,8 @@ static ssize_t eic_show(struct device *dev,
 }
 
 /* sysfs attributes */
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, sht21_show_temperature,
-	NULL, 0);
-static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, sht21_show_humidity,
-	NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, sht21_temperature, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_input, sht21_humidity, 0);
 static DEVICE_ATTR_RO(eic);
 
 static struct attribute *sht21_attrs[] = {
-- 
2.7.4

