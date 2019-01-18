Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA2FC5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F03A20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQPNiH2u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfARRPy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:54 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41330 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:54 -0500
Received: by mail-pl1-f194.google.com with SMTP id u6so6609262plm.8
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EV45uyc9TsvWye0Bp8LUNxEOm9lwu5WjN2PocqCIQos=;
        b=qQPNiH2uGig6Vdg4Q+HAp9laeLaGmCU4IoxUHouHOT3KM1Rlt7VTYYeP/CpVe7LT00
         B3PkSgv1AcPa6Zdl3YDiZqx+tBIEOXHR7asq/Kid9tJO+UWOPlupyuw0dunp7aGwbzp4
         NOiRunMMrpfXrh5xczjGoFNZ+WnPDcBQgKAK+pGvS49HaQ58OZ/6Mf3DbCvDyUDjk3CK
         025LWKQC92BXAz4/f8nzjfd4/xH+VJ/QBn03l3JJNzc3x3p2G373VycZHLoPWCO7Uv09
         oNJFIynMDuA5qJ25PGli/zhvQg8mWjHvR/qIZXkdTI2aOsSCTifFAFOHoUR1+VZcSg4m
         QKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EV45uyc9TsvWye0Bp8LUNxEOm9lwu5WjN2PocqCIQos=;
        b=tD4XmvK9hoQKkoVt+EiJnhMZ1CP2y5g7Buw5VJyDMtPZDYfcGOQCNXHgOuafOqw6Wm
         trUZwSSlDww4zump//djlF6PPNVrr3EiCN/hjS0BnMDogZcY5AZYroTqPpl/DABiT7FF
         upVd7TxkNruFffbnQ+o3gBpHhAA0cAZ/zmGCEiVuo2QJh9fLWlKZAv8nt8MwwvEPaCd/
         XSjSuyOcglFd1j5q5GopwRzU/laUTF83iUgDZunNfcXQcBms36/8xlxEMcQoCKMLfpRC
         32+iCrOE8iDi/Ys3+QrRy15IfkYzrJ+ItSQlR4hCL1nE/7irgr3leU2YNhJr7PksvKli
         PsPQ==
X-Gm-Message-State: AJcUukfiZO1AfO5eMtGyUt0maHV/qNQ6xTUDiXSQwtrk/iUEsXjiTZXv
        ANPyNHWGeSbed1r1lQnYvmpUpHUZ
X-Google-Smtp-Source: ALg8bN7eepUdp31BJINuiMmqlHEBnhT096NXjIoo1K21VBRxWDODCelwxlm+XtMKG3vOdz4ls5blSQ==
X-Received: by 2002:a17:902:d911:: with SMTP id c17mr20521619plz.151.1547831752801;
        Fri, 18 Jan 2019 09:15:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9sm6260864pfi.86.2019.01.18.09.15.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:52 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 30/30] hwmon: (via-cputemp) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:15:00 -0800
Message-Id: <1547831700-15865-31-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/via-cputemp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index 0e81f287d305..cb94e4880014 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -60,8 +60,8 @@ struct via_cputemp_data {
  * Sysfs stuff
  */
 
-static ssize_t show_name(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	int ret;
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -74,8 +74,8 @@ static ssize_t show_name(struct device *dev, struct device_attribute
 	return ret;
 }
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct via_cputemp_data *data = dev_get_drvdata(dev);
 	u32 eax, edx;
@@ -102,10 +102,9 @@ static ssize_t cpu0_vid_show(struct device *dev,
 	return sprintf(buf, "%d\n", vid_from_reg(~edx & 0x7f, data->vrm));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL,
-			  SHOW_TEMP);
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_name, NULL, SHOW_LABEL);
-static SENSOR_DEVICE_ATTR(name, S_IRUGO, show_name, NULL, SHOW_NAME);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, SHOW_TEMP);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, name, SHOW_LABEL);
+static SENSOR_DEVICE_ATTR_RO(name, name, SHOW_NAME);
 
 static struct attribute *via_cputemp_attributes[] = {
 	&sensor_dev_attr_name.dev_attr.attr,
-- 
2.7.4

