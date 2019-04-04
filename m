Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5CEC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADF552082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbmQzDvZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbfDDP65 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:57 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45265 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP65 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id bf11so1368796plb.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cr+u31P6Ma4si1hL5vR6Kdb2HRlulOSssndHD7P6FXs=;
        b=bbmQzDvZygvRIW16qsyQ2B5aX9493Y4EuTiR2yNtIxxkpQauS/99f8itEJSslCvLOn
         flx7CtwGI94snXaTW3KGL0AeLwGunhgastimFpZq3VOHMSlE49S9nTZ+g0r2a+x+gAN2
         e1+gfdH+a1yPNmG7EX1s/XwzPcE9/fjGBc2n3GlcLgmrD9PDKbtsg4eR1PVzrYJ7LMvy
         qFUAy6r6+T3d5W+6+BFhsTCr79bVqz4pbtj0dC52g3LhLvY66QezkA3nYmd/IfXlM8ko
         MK5md17bSXu7zGtrFGPasuGidVVLaHE26chjRjdHoToy+5/Fn7CWTy5QddcfNATUrcbO
         3eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Cr+u31P6Ma4si1hL5vR6Kdb2HRlulOSssndHD7P6FXs=;
        b=WW94lV8YY6lgxyt/KX+/noj1tItm6DLsgv5nu1PmnTjAw17grQHMejViqvf+pFFmdv
         Mn4SLLhPD5PizJPOpz7BKBwzNqquWhecnEbNcVFFvCxQ5L3PFeJad0IclI0rI2xfVNBg
         BLTVEpHnfaaEVTk8XIUXECBEbPtfMHjqICX+YIzS/eDD4babMnLhDCnu5rQt28vJnXPi
         UxNnKaXPyXz+BqTcXIg3FcB4b+v5zqlN0rAKU/o/9nmcjddVGjQr+Tghze1WnXSWz5hA
         wK77VVfy/PMkL7MBuEeSP1LyYqvhSoI15yC0KxuVrOJ+MPLT9BoTLTzQ95jeYCBM8Ncz
         gHdw==
X-Gm-Message-State: APjAAAVdDxhHhUOzH1ykuXTZJCsLgFPfKBs2M9R6SFr1apIFxYCCm4W5
        49n1ROtUx+KVD6MZd3OgxfYw8kWC
X-Google-Smtp-Source: APXvYqw7oB0423Q1Aet5qlbTQ4zKB5JWJQStlEZrt/WBg7KygctDWlIhQ0/QGjVmGljNcqJqZJGY+A==
X-Received: by 2002:a17:902:b282:: with SMTP id u2mr7305146plr.9.1554393536402;
        Thu, 04 Apr 2019 08:58:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r24sm8656987pfd.120.2019.04.04.08.58.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:55 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/24] hwmon: (ads7828) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:24 -0700
Message-Id: <1554393516-30316-12-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/ads7828.c:203:34: warning:
	‘ads7828_of_match’ defined but not used

Mark ads7828_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ads7828.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 12c56d3783ed..e6be617e3fb2 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -200,7 +200,7 @@ static const struct i2c_device_id ads7828_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ads7828_device_ids);
 
-static const struct of_device_id ads7828_of_match[] = {
+static const struct of_device_id __maybe_unused ads7828_of_match[] = {
 	{
 		.compatible = "ti,ads7828",
 		.data = (void *)ads7828
-- 
2.7.4

