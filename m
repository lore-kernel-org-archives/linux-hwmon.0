Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F320EC5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2A2220850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5OlF24w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfARRPw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45038 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id u6so6887228pfh.11
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ajpNJFjZTXexTnTSjbPyf9fTd5FQVbZG8k4iYDhxbQg=;
        b=g5OlF24wFz3z4kV0uGIj+UYpd2nusWpxdM9efE92WYT8KZG0ndW86HMDsBG9GjzhK0
         cYnTGBQ308b/wuQyQuGOHjrNcbALs60LU/N1tYGs2U98UZjjRDYPUrxII6LCcCTnC4n7
         2WVbwRpi+pS0hA4j0Jz1dbuSvEyXEus4Rdeo75XtBKn+9RkOILKS9MR9cbg0p2fzfFpe
         kMO5b3i2ard22e2sA+gfvP5Qp44vYgrGyT6wt9tcbS0FBEUgQXiV1yL5DU67EWAjxFH1
         4eelSA1flpxZkmssnatSYWUy5beDjOuih/MGIboecIHT0EPkki25hHcgGoQxiI/NAZEK
         Z0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ajpNJFjZTXexTnTSjbPyf9fTd5FQVbZG8k4iYDhxbQg=;
        b=T8Fj37XEVDFn8AZ0SSiYK4X68S9NfZUGgDLVTcouqzcugcPEhwv1aeTcf44PcltfmH
         m+OjAMMOYratZRltIAuzdjLWJ5e2KAA+p8hbANo4ldkLVJWr7ZlSzsVyghtyW/htS1Hl
         d9rZOVvT1HNX2hv5T7hu3wBWR6rVtQxQ5NUALJ4QY5m6EZ6bC5Ju7G1BsiESq8UGHMSX
         04m6SCjGdnrzEl7yUa1fld1i6JuQSthcETb2kQMSMQOONZN1BFvAUns+Rt98vuj82YMd
         SrMhyAAT0QCyV9HtfLOThBN8kb6a8p5+AIrL3tMbcBK+gGQ7+vtBSwzPGid8PQGh6HUH
         rQCA==
X-Gm-Message-State: AJcUukfeSVh4ZFmdPU9TJz+VMJrLiqyQdai/Bi4vAAVF/+sm0lbDwXLO
        38Ukfg0yJ+xMw9Pi+v8szJhBVYS1
X-Google-Smtp-Source: ALg8bN5QvyDRhlEbU/m89Gzw0fetY1gC+gHtkCa93rW8psnzyf0ocgjK7pAT1vlt/LhmFVI9WjxZHQ==
X-Received: by 2002:a63:6442:: with SMTP id y63mr18372792pgb.450.1547831751260;
        Fri, 18 Jan 2019 09:15:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o4sm16393910pgs.12.2019.01.18.09.15.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:50 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:59 -0800
Message-Id: <1547831700-15865-30-git-send-email-linux@roeck-us.net>
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/vexpress-hwmon.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/vexpress-hwmon.c b/drivers/hwmon/vexpress-hwmon.c
index 8ba419d343f8..0b84adb5e88e 100644
--- a/drivers/hwmon/vexpress-hwmon.c
+++ b/drivers/hwmon/vexpress-hwmon.c
@@ -92,9 +92,8 @@ struct vexpress_hwmon_type {
 };
 
 #if !defined(CONFIG_REGULATOR_VEXPRESS)
-static DEVICE_ATTR(in1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, vexpress_hwmon_u32_show,
-		NULL, 1000);
+static DEVICE_ATTR(in1_label, 0444, vexpress_hwmon_label_show, NULL);
+static SENSOR_DEVICE_ATTR_RO(in1_input, vexpress_hwmon_u32, 1000);
 static struct attribute *vexpress_hwmon_attrs_volt[] = {
 	&dev_attr_in1_label.attr,
 	&sensor_dev_attr_in1_input.dev_attr.attr,
@@ -113,9 +112,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_volt = {
 };
 #endif
 
-static DEVICE_ATTR(curr1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, vexpress_hwmon_u32_show,
-		NULL, 1000);
+static DEVICE_ATTR(curr1_label, 0444, vexpress_hwmon_label_show, NULL);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, vexpress_hwmon_u32, 1000);
 static struct attribute *vexpress_hwmon_attrs_amp[] = {
 	&dev_attr_curr1_label.attr,
 	&sensor_dev_attr_curr1_input.dev_attr.attr,
@@ -133,9 +131,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_amp = {
 	},
 };
 
-static DEVICE_ATTR(temp1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, vexpress_hwmon_u32_show,
-		NULL, 1000);
+static DEVICE_ATTR(temp1_label, 0444, vexpress_hwmon_label_show, NULL);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, vexpress_hwmon_u32, 1000);
 static struct attribute *vexpress_hwmon_attrs_temp[] = {
 	&dev_attr_temp1_label.attr,
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -153,9 +150,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_temp = {
 	},
 };
 
-static DEVICE_ATTR(power1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, vexpress_hwmon_u32_show,
-		NULL, 1);
+static DEVICE_ATTR(power1_label, 0444, vexpress_hwmon_label_show, NULL);
+static SENSOR_DEVICE_ATTR_RO(power1_input, vexpress_hwmon_u32, 1);
 static struct attribute *vexpress_hwmon_attrs_power[] = {
 	&dev_attr_power1_label.attr,
 	&sensor_dev_attr_power1_input.dev_attr.attr,
@@ -173,9 +169,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_power = {
 	},
 };
 
-static DEVICE_ATTR(energy1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
-static SENSOR_DEVICE_ATTR(energy1_input, S_IRUGO, vexpress_hwmon_u64_show,
-		NULL, 1);
+static DEVICE_ATTR(energy1_label, 0444, vexpress_hwmon_label_show, NULL);
+static SENSOR_DEVICE_ATTR_RO(energy1_input, vexpress_hwmon_u64, 1);
 static struct attribute *vexpress_hwmon_attrs_energy[] = {
 	&dev_attr_energy1_label.attr,
 	&sensor_dev_attr_energy1_input.dev_attr.attr,
-- 
2.7.4

