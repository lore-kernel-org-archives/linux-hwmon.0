Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25173C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED03C20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lcf11q4q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfARRPg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:36 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45427 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728586AbfARRPg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:36 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so6604506plm.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i++KvWoBfHwDV8gwxaG8878VT08YzuBifB6QMupCSKA=;
        b=Lcf11q4qNlPDHxXN+BysenvGoPnI+JrGKI0s56MbXCq7EkIKR0nFtWF/qMrmCg1j6m
         dPr/3yj5BTkX9YpxK7+sRTz2MAjzWvLBux2SZQDn71IqR+suluF1H8RF0OliVa7uDRME
         SQy1ZNJu7UC5wLpqsl9J5fSdB0yvl6mvmfXrNDiV/+txRDJD9ONpbfC8RZnfGB+U3uQ3
         uGoa/mcDsuMiK6tnZ/6kMPUqZXNcPX1eEym3/TOywO34vfI+NTBZTI9xJiRalfdBAhM7
         NC/fb201jLuW/OgI3uMYg1fP/tEnIpOeVOr3qW62EqN34M6f0rpmmUrunjiPC5PQmmO2
         Ilpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=i++KvWoBfHwDV8gwxaG8878VT08YzuBifB6QMupCSKA=;
        b=ry/QktZLgmYUoFkLpnEmszsurEthJ5KlsCdOsQ0Su7Dl2rYek4cjFZIoTaurhZ8NsI
         akCff9j3Zlnfnl/0FP2uFMSnqjSzxzUYGox5LTgkuzivnpbsnmrMLeu8AHsYRADXvHHY
         DyHWyF2DA2XQtl3tNVw9tEpf0UsqnhAP57eOnsDpW+vzPVoX3QKFC9mjV1SmzD/BMwL8
         uV/9vNLKn4ngm8AnhADbkrOBcscieUGu8YYh9JZFidWii+RUoyzDdLLBzCaaOAYrojB/
         J+OmDd8lIZW+pcyju+eR3PJEIkJN0TGe19C9MicSMp17HjldRomnS/7vcsz0+jGl1pow
         t8IQ==
X-Gm-Message-State: AJcUukdCaieUqnz/0/wQILV82FWpCsZ4jAe9arnRnaT8XUyS3yHD2OlB
        8DzAz8n1hwY8QRwy5V2H7YExFtAx
X-Google-Smtp-Source: ALg8bN6gx+svCaLKw2XmTMu6v/h1R6CZJAbsQx1p0e4pa09OMVETB3ctunlsti9KFYMdHwZuihmOmw==
X-Received: by 2002:a17:902:1122:: with SMTP id d31mr19906879pla.246.1547831735724;
        Fri, 18 Jan 2019 09:15:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x11sm16634523pfe.72.2019.01.18.09.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:35 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/30] hwmon: (sht15) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:49 -0800
Message-Id: <1547831700-15865-20-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/sht15.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index c878242f3486..39b41e35c2bf 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -677,9 +677,8 @@ static inline int sht15_calc_humid(struct sht15_data *data)
  * and heater_enable sysfs attributes.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t sht15_show_status(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
+static ssize_t sht15_status_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
 {
 	int ret;
 	struct sht15_data *data = dev_get_drvdata(dev);
@@ -700,7 +699,7 @@ static ssize_t sht15_show_status(struct device *dev,
  * Will be called on write access to heater_enable sysfs attribute.
  * Returns number of bytes actually decoded, negative errno on error.
  */
-static ssize_t sht15_store_heater(struct device *dev,
+static ssize_t sht15_status_store(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
@@ -734,9 +733,8 @@ static ssize_t sht15_store_heater(struct device *dev,
  * Will be called on read access to temp1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t sht15_show_temp(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buf)
+static ssize_t sht15_temp_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	int ret;
 	struct sht15_data *data = dev_get_drvdata(dev);
@@ -757,9 +755,8 @@ static ssize_t sht15_show_temp(struct device *dev,
  * Will be called on read access to humidity1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t sht15_show_humidity(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buf)
+static ssize_t sht15_humidity_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	int ret;
 	struct sht15_data *data = dev_get_drvdata(dev);
@@ -777,16 +774,13 @@ static ssize_t name_show(struct device *dev,
 	return sprintf(buf, "%s\n", pdev->name);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-			  sht15_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO,
-			  sht15_show_humidity, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, sht15_show_status, NULL,
-			  SHT15_STATUS_LOW_BATTERY);
-static SENSOR_DEVICE_ATTR(humidity1_fault, S_IRUGO, sht15_show_status, NULL,
-			  SHT15_STATUS_LOW_BATTERY);
-static SENSOR_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR, sht15_show_status,
-			  sht15_store_heater, SHT15_STATUS_HEATER);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, sht15_temp, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_input, sht15_humidity, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, sht15_status,
+			     SHT15_STATUS_LOW_BATTERY);
+static SENSOR_DEVICE_ATTR_RO(humidity1_fault, sht15_status,
+			     SHT15_STATUS_LOW_BATTERY);
+static SENSOR_DEVICE_ATTR_RW(heater_enable, sht15_status, SHT15_STATUS_HEATER);
 static DEVICE_ATTR_RO(name);
 static struct attribute *sht15_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

