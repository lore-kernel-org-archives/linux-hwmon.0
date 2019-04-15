Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44418C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11E6920848
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STDBbB2t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfDOU1Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:27:16 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43439 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbfDOU1Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:27:16 -0400
Received: by mail-pl1-f193.google.com with SMTP id n8so9116197plp.10
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 13:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=v0pJ5Fe5xluVVHgW35qWqJTLiD0HzL/HowXjarbOpd8=;
        b=STDBbB2t87O/k/5D4hsx1eg3cSDfqnjr5u6DXMCR3nxa0jn47yAUv+2Ccn4k4RvWuE
         OtwVEaImDtLvMVYGi+U0lTfdTLVr4SKlvZ/sSmpKvlbuTQ9jIkOZDZb0XxoudSMvuLye
         23T6fZwyUogMlWt/MXucJ6jwcdmMOh8umLRvdO9nkVtsKsbHMWkC1l3mWnAvq5f7n7oF
         Lmhgrz8zyeVhAdqFRQKpG0gqph2KanPJ4b2zsIQ4v0oZTnT5jbA41e5cAESaXbDCAESz
         psdQ65G+9qFU4/cEbgDGP7i6s7smTv8kmBEEirMH6XSX0qqD4Zq/6zSlLFCdBYWsRk4z
         VxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=v0pJ5Fe5xluVVHgW35qWqJTLiD0HzL/HowXjarbOpd8=;
        b=f0PvVBsicACbjfhDF6Ec6XwF+wtHAtBjw/OYJx8a9/KQv9ZRor9V5+ygtYsNDCRLaX
         ZWoDWJYHSZisAAFHI98STsi00j0cYV5Tmzz81QVwKnMsqh2VxwGVJhDIOv5oAb5GuYFj
         IgdYljS+9+xOCI3DuM6qsKKvJ6rQYFANzC38biNl8J7a+XmBaPyLU2Nz4H6nlUgHlKxf
         QZ64ZtzWjJukhIon4j6g0iMXUXVYIlSINgN8ncoUl+vfBIkZT6ycZh6PPxral+hwI0gD
         dgLgP3U4utz9bcRU64GPcWjd7Zz2Xotrel4S2Ck44/OjNX3DPbIEN8fS0Gc1TDADWueO
         6DFw==
X-Gm-Message-State: APjAAAXITgW6Tw0R/P4ZihD/8SapZ9+ULESSL+Kv2m6MbmXoSoTQ79rD
        IdRzvUnwPQJszit2M9/xEkWSAllT
X-Google-Smtp-Source: APXvYqwzlaRjCgzgOf76XBn+4WkiVwg0n0ZrRawTd/QFUeYstdsVPCcAjCydqazsPmdTcO7VXJDYmA==
X-Received: by 2002:a17:902:d211:: with SMTP id t17mr75169183ply.214.1555360035285;
        Mon, 15 Apr 2019 13:27:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h20sm76203715pfj.40.2019.04.15.13.27.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 13:27:13 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH] hwmon: Add support for samples attributes
Date:   Mon, 15 Apr 2019 13:27:12 -0700
Message-Id: <1555360032-31159-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for the new samples attributes to the hwmon core.

Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c |  5 +++++
 include/linux/hwmon.h | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c22dc1e07911..cd91510a5387 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -324,6 +324,11 @@ static const char * const hwmon_chip_attrs[] = {
 	[hwmon_chip_power_reset_history] = "power_reset_history",
 	[hwmon_chip_update_interval] = "update_interval",
 	[hwmon_chip_alarms] = "alarms",
+	[hwmon_chip_samples] = "samples",
+	[hwmon_chip_curr_samples] = "curr_samples",
+	[hwmon_chip_in_samples] = "in_samples",
+	[hwmon_chip_power_samples] = "power_samples",
+	[hwmon_chip_temp_samples] = "temp_samples",
 };
 
 static const char * const hwmon_temp_attr_templates[] = {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 7a8cc06a0d61..7b18a6150a11 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -40,6 +40,12 @@ enum hwmon_chip_attributes {
 	hwmon_chip_register_tz,
 	hwmon_chip_update_interval,
 	hwmon_chip_alarms,
+	hwmon_chip_samples,
+	hwmon_chip_curr_samples,
+	hwmon_chip_in_samples,
+	hwmon_chip_power_samples,
+	hwmon_chip_temp_samples,
+
 };
 
 #define HWMON_C_TEMP_RESET_HISTORY	BIT(hwmon_chip_temp_reset_history)
@@ -49,6 +55,11 @@ enum hwmon_chip_attributes {
 #define HWMON_C_REGISTER_TZ		BIT(hwmon_chip_register_tz)
 #define HWMON_C_UPDATE_INTERVAL		BIT(hwmon_chip_update_interval)
 #define HWMON_C_ALARMS			BIT(hwmon_chip_alarms)
+#define HWMON_C_SAMPLES			BIT(hwmon_chip_samples)
+#define HWMON_C_CURR_SAMPLES		BIT(hwmon_chip_curr_samples)
+#define HWMON_C_IN_SAMPLES		BIT(hwmon_chip_in_samples)
+#define HWMON_C_POWER_SAMPLES		BIT(hwmon_chip_power_samples)
+#define HWMON_C_TEMP_SAMPLES		BIT(hwmon_chip_temp_samples)
 
 enum hwmon_temp_attributes {
 	hwmon_temp_input = 0,
-- 
2.7.4

