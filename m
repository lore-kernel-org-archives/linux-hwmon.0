Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39290C5ACD6
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1053E20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjH58/sw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfARRPY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:24 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37222 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:24 -0500
Received: by mail-pg1-f194.google.com with SMTP id c25so6347321pgb.4
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZAGofbRu4lGKOpasB8I+m0BlfYmWQRRsweFj5p7jZX0=;
        b=kjH58/swdbVw/bj0REOtBqRrfKUmDz1UsmRtPaBOUhHxRK73w+qeD/XelAWQt2hRYh
         eZFNg3+m6lZ4StjK1mX1L5UNqfqjjbBVkRtPltoOnTvEnSt5WdosDxbb10ze4Gjgg/df
         u7OUdOPHqPmp8ONq+Lb7zJNxdhJuTFukAvoussE2edt9jITwHz2m0CwwFQNeHzdXbicL
         /YeF72BdVd1U8Ziy0xIQKMF7M785u0H32uLStRk22VULMjooBSq6lfv02N9TNZStTXFl
         cXbgjqHm7IThkUPxlWcaX7gI32uN6fDqVANaVQWoygMsv7f224afKwOsE3EdN64INTTb
         DWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ZAGofbRu4lGKOpasB8I+m0BlfYmWQRRsweFj5p7jZX0=;
        b=bI4xDAQCtQvFrMBJdCH+lhQjIKe6tnMp7XFvN+dwDSspjOAM6gcCS2mbqFFkFZjSUQ
         8Vlys7YtkmXDfcIaBmCpFjGkOkZGVhjv20StSEM42S3vjPJx1MMWSRxMrO41IUdWemSL
         vjshV14jGvvUmU2mnUdD4h6tZ0MGjx5zibLhyijcnubX2IaFtQGNU0AE35DcAJVlcchH
         bXOFXIjhDz+1ZskDXmvK/R+XA6ws2CvcnpcXUr/XLNKI4P6ITkfyZWzibmtyN3tpJ1xi
         U+PZr5GO4Rga6QfH3LSqSr7GVDkbuLnKsdFaIwqkJGMbtdJptYFXZswZUcZr+frMxZ7s
         Lt9g==
X-Gm-Message-State: AJcUukdyXLfGyupYAQ20wskqasSunPmW94PsGmxRSApfss5FBaVN/85K
        D72ICvrHEEosacQmvBz18FhQ3tmJ
X-Google-Smtp-Source: ALg8bN7LVqr1gMkogFC8r2dCPn8gIOetaqKbxmJmrusceqohP8+OlNnIiuQ3vMfOCIFeBWMAdds+Ag==
X-Received: by 2002:a63:5c41:: with SMTP id n1mr17852953pgm.1.1547831723045;
        Fri, 18 Jan 2019 09:15:23 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t13sm5912790pgr.42.2019.01.18.09.15.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:22 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/30] hwmon: (nsa320-hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:41 -0800
Message-Id: <1547831700-15865-12-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/nsa320-hwmon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
index 5a16109cdea8..f952f803faeb 100644
--- a/drivers/hwmon/nsa320-hwmon.c
+++ b/drivers/hwmon/nsa320-hwmon.c
@@ -114,8 +114,8 @@ static s32 nsa320_hwmon_update(struct device *dev)
 	return mcu_data;
 }
 
-static ssize_t show_label(struct device *dev,
-			  struct device_attribute *attr, char *buf)
+static ssize_t label_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int channel = to_sensor_dev_attr(attr)->index;
 
@@ -144,9 +144,9 @@ static ssize_t fan1_input_show(struct device *dev,
 	return sprintf(buf, "%d\n", ((mcu_data & 0xff0000) >> 16) * 100);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_label, NULL, NSA320_TEMP);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, label, NSA320_TEMP);
 static DEVICE_ATTR_RO(temp1_input);
-static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, show_label, NULL, NSA320_FAN);
+static SENSOR_DEVICE_ATTR_RO(fan1_label, label, NSA320_FAN);
 static DEVICE_ATTR_RO(fan1_input);
 
 static struct attribute *nsa320_attrs[] = {
-- 
2.7.4

