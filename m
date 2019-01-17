Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE838C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD00420855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/LqK1iO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfAQVOk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:40 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36156 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:40 -0500
Received: by mail-pg1-f194.google.com with SMTP id n2so4993097pgm.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fgg8ElksAUz6o7+3MKUeeOC3fL7mL4X436Su2V32LBc=;
        b=n/LqK1iOKOi9eH8/GNZCdmQiBGIqVWBdc3d8V0QbZbQcrDZxis2CAV/AKuVrVZOreT
         5pr+rb8LOHxOAVKEb3aZDy4+U3AatZRhpE50doP7POm7m9TGjRDqR/XhJA+czDboMVA5
         RBclYjpbDAwxXFaCqlcKsPCRTQJ7K5Ku0pn1pGaGDRP9Nq1fc0JPahzud1fjLgjxlflF
         8RTAeKwnu7B97EXVF6nBxH3nHyWihVrjU1XldB/lkoyxZ6NQ7w+bTffTDEvT6Hf2AJ4Q
         DGsIgnDlU0aCo0ILKexJ8zG1Ty4+9uqzqSyp68nnX/nOTOZ8eZFT8KsB8i0yQhA9gdO7
         DXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Fgg8ElksAUz6o7+3MKUeeOC3fL7mL4X436Su2V32LBc=;
        b=DDcNH/ZwkiQ3uXqLo49jC3hrqOKET9ir8jEa2MgjHudZVrsh98mtbsaVsHIbWPfYK+
         MgguiQ/dCTEPaZ6f/XsOr2CiRYQPK4JQxTYlaljLD31qqv3KYTCip30RZGIECjtGeXox
         V3OZ1pGdrqKY8dGonAYGxR45qnXDTGgNuzwWrAkz8+0Ep12w17V6GSMGfGv7phrToMre
         5t8BvcG7amnxgubzAGmjSpMmCLGwW9KsisJoFVA8NWs3QeSIOxZMoUGy0bBLm+jSZLA2
         BVboXYcypX0DONGT979E4ZpQheebaqmRMN9wEUvAuHO4kGwGQb/Pby798VALfpfNnGWD
         XpHQ==
X-Gm-Message-State: AJcUukdhtbXajsoLH2snPvXXewx8JVt9QJdt0ytw3R9JpXZNTxF6+R5a
        TVuvjIsMTKJTxSYIeqEwbiOosOVp
X-Google-Smtp-Source: ALg8bN4ETtDj153wV/ZTaMS//1ZD5qK4qAkuNMZcUIG6Kw++DDfQivV61DG+N0mbD/XGSEQOkJ5epw==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr16325915pfo.225.1547759679292;
        Thu, 17 Jan 2019 13:14:39 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f32sm3168606pgf.80.2019.01.17.13.14.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:38 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 27/29] hwmon: (ltc4151) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:47 -0800
Message-Id: <1547759629-23007-28-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ltc4151.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index b904cb547ffb..76c6fda76d95 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -131,7 +131,7 @@ static int ltc4151_get_value(struct ltc4151_data *data, u8 reg)
 	return val;
 }
 
-static ssize_t ltc4151_show_value(struct device *dev,
+static ssize_t ltc4151_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -148,14 +148,11 @@ static ssize_t ltc4151_show_value(struct device *dev,
 /*
  * Input voltages.
  */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4151_show_value, NULL,
-			  LTC4151_VIN_H);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4151_show_value, NULL,
-			  LTC4151_ADIN_H);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc4151_value, LTC4151_VIN_H);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc4151_value, LTC4151_ADIN_H);
 
 /* Currents (via sense resistor) */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4151_show_value, NULL,
-			  LTC4151_SENSE_H);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc4151_value, LTC4151_SENSE_H);
 
 /*
  * Finally, construct an array of pointers to members of the above objects,
-- 
2.7.4

