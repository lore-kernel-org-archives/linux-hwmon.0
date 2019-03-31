Return-Path: <SRS0=r2R4=SC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD6CC43381
	for <linux-hwmon@archiver.kernel.org>; Sun, 31 Mar 2019 18:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D605D2085A
	for <linux-hwmon@archiver.kernel.org>; Sun, 31 Mar 2019 18:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rg7bME44"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfCaSmW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 31 Mar 2019 14:42:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44111 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfCaSmW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 31 Mar 2019 14:42:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id g12so3344307pll.11
        for <linux-hwmon@vger.kernel.org>; Sun, 31 Mar 2019 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=AGu0ZkbwouEa57soADua9zr7Ek6fHdaWZP6WQ90UWGM=;
        b=Rg7bME44sShmTXEfTNRDNsRf/n5i0sxIAsuANRQSKJbBRO+ZDZH6+RgaJDaleIww0U
         P3uH4UYoiGbt6VtZtdFcB66kW3sYAf0sJ3zb1YmUStJ1MIt8v0ER8gA3PoYD34iRPwJw
         XxYDRNRSEFEHV/fMJ8bYGigA+Vhq1vhWFXub/T/bCB6UiJwZg0FK0uL4rLGAk0lmzKyt
         gXYJKEeH+OLM1pUElwM2IbjyDmrYUMIigbNKuawVgyDixtAs1k4dGYf81fwYtrxEa3QQ
         u4hZC6KA/QPFucIFUwni3CnOQMeX/zsLWRUFCSEQFWBNcSaJWUxefNpVt28NYHDnXhcc
         jsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=AGu0ZkbwouEa57soADua9zr7Ek6fHdaWZP6WQ90UWGM=;
        b=Vs9glLB3wKpQSWiDGlv+moMnNAzHpVFuOpA/e8mxs/XBFSqS9wZnAzO9vOTGetxBj+
         xL2ciRBoABqJ5PZLGF10BcWB/d3ggGjgz37rFt5FiGYpwtWsTYokK+2i83uZaDngRrBp
         uZ6ZrEw/OeS1uYJDgExyDIcTiZSMeGltmY/du3azyHL3BZTVNrbo7A26KCzMWrOwEVvB
         7ZzSWXznM+ROT/FlIWyUc2fGzTt7qwuujt6L/f/D0nYJgKPKOqaXpFjoRX24Fwma3KZ3
         P3c+kKpWhQgzWVt4S/VhsvxTQ0HtVIV19d/AhUEfoA09KU4E8wFfowJxh33ml6koq82U
         TtUw==
X-Gm-Message-State: APjAAAX7purxuGOMjUed8rdTNp7A2VSjAUYfBCQ5oOTjkpSXziu2L179
        EaDaC7i3m7LGKMRpOly/v1atp5L+
X-Google-Smtp-Source: APXvYqxw006EAmFR0dq12hmaM11hfLmG+dsxpnQEzpiQZq+304V6CXSM5BbdZs8WpxkpONPObxY3QQ==
X-Received: by 2002:a17:902:403:: with SMTP id 3mr60121926ple.48.1554057741487;
        Sun, 31 Mar 2019 11:42:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b6sm10048819pgl.49.2019.03.31.11.42.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Mar 2019 11:42:20 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Documentation: Add usage example for HWMON_CHANNEL_INFO
Date:   Sun, 31 Mar 2019 11:42:18 -0700
Message-Id: <1554057738-28343-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The new HWMON_CHANNEL_INFO macro simplifies the code, reduces the
likelihood of errors, and makes the code easier to read. Add a usage
example to help driver writers to actually use it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index 8bdefb41be30..f8e2ab5c21b9 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -207,6 +207,19 @@ static const struct hwmon_channel_info *lm75_info[] = {
 	NULL
 };
 
+The HWMON_CHANNEL_INFO() macro can and should be used when possible.
+With this macro, the above example can be simplified to
+
+static const struct hwmon_channel_info *lm75_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST),
+	NULL
+};
+
+The remaining declarations are as follows.
+
 static const struct hwmon_ops lm75_hwmon_ops = {
 	.is_visible = lm75_is_visible,
 	.read = lm75_read,
-- 
2.7.4

