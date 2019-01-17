Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31578C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3B7A20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgkbrG+N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfAQVOB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:01 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37052 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbfAQVOB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:01 -0500
Received: by mail-pf1-f193.google.com with SMTP id y126so5433239pfb.4
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XzmEbjJ9SrLOSfx72f+gzjC2ZZN3Tm0oTCEI/4/BANk=;
        b=NgkbrG+NQvMG3e7etpzZYxopi1CRYA/1fRBwhNWZd33Xi4szzuVS+uThLF4YlQb4M5
         6bZ+xcKBQE3TDV9Sf7DuxmW2W9QWdYTbPU5PccBj9nwaC1hVKuiyd2VkgI32F+IlP046
         lzX7YIzN2mEXE5IAEIZDjK+JC6Z5/xelSPqjm/nl0gTxXe2iNKSC+Qe6dPfctcEX+VuY
         ACXDW5AmFI4zSVtk3a8mfsL2+aZiVNElhFQ1z3EoQpEL+cNiW6+0WTa/etg+wE0BdHD0
         1GUh438BMSmEX09aAfvRoHjOb1BZO7vmZez8n70KBEM3CbncdviIggp8BFfqo6cMHCBh
         jeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XzmEbjJ9SrLOSfx72f+gzjC2ZZN3Tm0oTCEI/4/BANk=;
        b=pELd+9QGH3G1iM9wFDCC8Qa5UQw4d2pur2DFWYubzRmtRHQSeCMFoX8tgPZkZh9g9I
         ip1KEa2X3lfs4GWLqE1xL3Od7IwG5cez3ryj3qTUmw24Gh3KpqBMICreoUqpcALrpLwn
         OYx+fP07xEEAxg2AYejn7cMJd3RzqK/VCQ3pTvglBPgu5M+UF+w8ThPjjh645QPZTcBx
         5WKn6x6o37kFgeNUva9TLdnNDZTbbc112L3x1AqsYCskvAgzpiXGs3mfwQLL+DZfaeSb
         KfU9rM76Ft/rTpILUz/O8U9hn5pAAFx0Lexq7tMxhxja3GbwLIkcaBUDbNSq1c1XXJdn
         /Cnw==
X-Gm-Message-State: AJcUukfK4J10e4mTl4h6CrnfeuciHPM9izhIRYmwgrWGNgN9rgX38/bD
        9102Yyb/u2vkmDvBUORcweqGzTLW
X-Google-Smtp-Source: ALg8bN7xNo/2EZqppvXKBNtLU2wo2iMKud+KyVUPuZLZNypeib+tIvNOKbbhoS1P1C3qgU0AXhx6kQ==
X-Received: by 2002:a63:2d82:: with SMTP id t124mr14875594pgt.260.1547759640118;
        Thu, 17 Jan 2019 13:14:00 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i2sm4063895pfi.66.2019.01.17.13.13.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:13:59 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/29] hwmon: (hih6130) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:24 -0800
Message-Id: <1547759629-23007-5-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/hih6130.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index de1b50ddc740..d167fcfec765 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -171,7 +171,7 @@ static int hih6130_update_measurements(struct device *dev)
  * Will be called on read access to temp1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t hih6130_show_temperature(struct device *dev,
+static ssize_t hih6130_temperature_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
@@ -193,7 +193,7 @@ static ssize_t hih6130_show_temperature(struct device *dev,
  * Will be called on read access to humidity1_input sysfs attribute.
  * Returns number of bytes written into buffer, negative errno on error.
  */
-static ssize_t hih6130_show_humidity(struct device *dev,
+static ssize_t hih6130_humidity_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
 	struct hih6130 *hih6130 = dev_get_drvdata(dev);
@@ -206,10 +206,8 @@ static ssize_t hih6130_show_humidity(struct device *dev,
 }
 
 /* sysfs attributes */
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, hih6130_show_temperature,
-	NULL, 0);
-static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, hih6130_show_humidity,
-	NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, hih6130_temperature, 0);
+static SENSOR_DEVICE_ATTR_RO(humidity1_input, hih6130_humidity, 0);
 
 static struct attribute *hih6130_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

