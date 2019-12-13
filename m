Return-Path: <SRS0=7DvS=2D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25DFC3F68F
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Dec 2019 21:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CC12214AF
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Dec 2019 21:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNLTTwPD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMVj6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:39:58 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:34754 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLMVj5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Dec 2019 16:39:57 -0500
Received: by mail-pj1-f67.google.com with SMTP id j11so282540pjs.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Dec 2019 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=1MjWxv41IygsSrA+vrDsYPyCG7xe5ORyZSNjbnCMR6w=;
        b=lNLTTwPD8js9d6WRmJ0kp9VzQ02adV+7Bqhqorj2P9NBmmVig01WK0a+q7IJDjBVma
         7DuKY+gr/uwnm5LFKGtKnEFTEU6Q4OEQor0fGcVZL8s/r1boKT97B3fspW1qNNw9shs7
         YPlePGZ+B8mQ0tqYcr7+seHW2FK+QNUm/xWEu357QWLlr8oP5h5/5Br61m50K515f/fP
         TMqG5Ry4SmR07PTFaQl8ig7hbf/HNGbbYJ1GbTsOXJgfTpxHMOLo+BpZI+U72QCFenh7
         YpFCj+0IAVmRjvSIeDOW1oCMjWfAW8E6UYGC6f8gs7mohs0j05Ckv2iL4JtK+vV4Hzsk
         oMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=1MjWxv41IygsSrA+vrDsYPyCG7xe5ORyZSNjbnCMR6w=;
        b=pWKPlb4A3+UilyeofxQwz1Q1v0pNfVw4RJs1zi1VKJNmA2W12GPm8tj1Vi3UGkOhkc
         sphJBWygHr65GMnJyjr9S8dBbVGooCfxyQ3H6IWifKCE54MIfAiXdV1O4BRjop48FlSF
         1sC6g8iBIYpd8Ei8N0zpAeUbW3xben1YheZFdP2b8/N+1Tg3eLsLWm0wv5gpYWpY6hLO
         GocoYjP/AqvGPFzF9as2zlQIuMUQ/LQFU+qjfxlXf2bs6skq7VgSkj3RH7gXz9BJnC6s
         PDZp4lxSEpOiFiH/0YJpOM6PqFhAK0zKNsvD3HbZjB1zE+rwxFOsxEy1Se35sSCjdlyK
         /t6A==
X-Gm-Message-State: APjAAAVWZl8nKMaKxP/26r6htMeQ5XNLfBoMdbouE1z0NVnP25bJBLkJ
        gReM/0yDP/WC3OXrmpN2B8DwKkjL
X-Google-Smtp-Source: APXvYqwEF+z79R0wNsIxnFa7FqeENienB70h3CrWmIEUynl+CFauYbpIt34qz9sfXIRv7tU6pVhWsQ==
X-Received: by 2002:a17:90a:bc05:: with SMTP id w5mr1808164pjr.64.1576273196973;
        Fri, 13 Dec 2019 13:39:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v29sm11632094pgl.88.2019.12.13.13.39.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 13:39:56 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Add MAX20796 to devices supported by generic pmbus driver
Date:   Fri, 13 Dec 2019 13:39:53 -0800
Message-Id: <20191213213953.20644-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

MAX20796 is a dual-phase scalable integrated voltage regulator with
PMBus interface.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/pmbus.rst | 10 ++++++++++
 drivers/hwmon/pmbus/Kconfig   |  4 ++--
 drivers/hwmon/pmbus/pmbus.c   |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index abfb9dd4857d..f787984e88a9 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -63,6 +63,16 @@ Supported chips:
 
 	http://www.ti.com/lit/gpn/tps544c25
 
+  * Maxim MAX20796
+
+    Prefix: 'max20796'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+	Not published
+
   * Generic PMBus devices
 
     Prefix: 'pmbus'
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 48ae5a5419c5..76fe5488d5fb 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -20,8 +20,8 @@ config SENSORS_PMBUS
 	help
 	  If you say yes here you get hardware monitoring support for generic
 	  PMBus devices, including but not limited to ADP4000, BMR453, BMR454,
-	  MDT040, NCP4200, NCP4208, PDT003, PDT006, PDT012, TPS40400, TPS544B20,
-	  TPS544B25, TPS544C20, TPS544C25, and UDT020.
+	  MAX20796, MDT040, NCP4200, NCP4208, PDT003, PDT006, PDT012, TPS40400,
+	  TPS544B20, TPS544B25, TPS544C20, TPS544C25, and UDT020.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called pmbus.
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index c0bc43d01018..879aac6ed092 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -210,6 +210,7 @@ static const struct i2c_device_id pmbus_id[] = {
 	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
 	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
 	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
+	{"max20796", (kernel_ulong_t)&pmbus_info_one},
 	{"mdt040", (kernel_ulong_t)&pmbus_info_one},
 	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},
 	{"ncp4208", (kernel_ulong_t)&pmbus_info_one},
-- 
2.17.1

