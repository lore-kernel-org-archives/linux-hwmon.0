Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99C9C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 770BC2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNW32fRn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfDDP6q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39739 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbfDDP6p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:45 -0400
Received: by mail-pg1-f194.google.com with SMTP id k3so1454216pga.6
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjsIC/oIYB88FwEPy1E/ipQM+nFUvrNJNDi6Kxi4MWA=;
        b=VNW32fRnXcdoXWytTGjJ30FqdjpDGihUNlSWqDakaaR3qrUvKykhoba9HuAAGq0Bu+
         dYnIMZUKvirfpc2S9c4qpU0G4F/TerEbqG6ioWt7lFP98U57JmgWak0jooSyCbXTLcQw
         xUihC14UE97SPIeMBtRdEUX1sv5aKXXEzYy0N+cJ/RwcNlidNMOaSPD1o1Kw3hmgfymL
         rP/6pE+5qUS5AE2p+9a2NFM4ukHsDHB7DQE/TAG+MUC6O9rXoGuSEsWd7qQ1HCtl4bT7
         3ygFTi2ooOZ3JD+k/hvb8oLtzXfRDCSG97YaqdvziIY1WM10wvhAm7jPrVxmAE31JVmm
         6zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SjsIC/oIYB88FwEPy1E/ipQM+nFUvrNJNDi6Kxi4MWA=;
        b=j1UbCfY8IJIWBRrKTh8S47DhMcCB9bZG7HO9wQsjZm4R7F8nyt4rkVn3cXGOQulCEy
         vifyxKPQjjl1YJosLoWWsvhmdBNX0iPXCGyKO/QFfI3SsO/XyYy4LHISoX3LpyTJAOyM
         RKHV4HN5mzt7L0Vgck7yuvOHMZfVrZfeyTH1RGTuAI388L4/yb/ZWbzr48xDFoub5Uve
         WA88U7bHs9RemD3oy4ZHvRZasrhUfC48RLw6rs1hSMPakLXhHqFVc6cZVC/WijDtDOvd
         2Px1PoP8txj3JfG5d/dVRcyUc6Cc5Omt88s4kZxC3KJTJMnDzTcUte6kX4nK5bhcg+1B
         fTfg==
X-Gm-Message-State: APjAAAVCJZXd41hDQi8GYFtl/xGRzc4NUsMhYhcVeMAfel2lSsJ9uKcp
        d+uvW6oPLWg/NY25h4vvGn/7puCi
X-Google-Smtp-Source: APXvYqwj/CuClw0OJ7jr/F88v1F3/2aVEXfc2eWGAqJwvCDSVUm5VLQJWE8tV4sPLJvhVm+W+WhEog==
X-Received: by 2002:a63:e70c:: with SMTP id b12mr6348916pgi.399.1554393524106;
        Thu, 04 Apr 2019 08:58:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t190sm32436915pfb.33.2019.04.04.08.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:43 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/24] hwmon: (ltc4151) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:15 -0700
Message-Id: <1554393516-30316-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
References: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/ltc4151.c:211:34: warning:
	‘ltc4151_match’ defined but not used

Mark ltc4151_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4151.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index 76c6fda76d95..2b5cd37e6dc3 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -208,7 +208,7 @@ static const struct i2c_device_id ltc4151_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ltc4151_id);
 
-static const struct of_device_id ltc4151_match[] = {
+static const struct of_device_id __maybe_unused ltc4151_match[] = {
 	{ .compatible = "lltc,ltc4151" },
 	{},
 };
-- 
2.7.4

