Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFA2C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 01:00:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357908AbiBEBAS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Feb 2022 20:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357357AbiBEBAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Feb 2022 20:00:17 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F30C06109E
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Feb 2022 17:00:12 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u14so15677386lfo.11
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Feb 2022 17:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=si0Fia9g0D120PrN53qtiA6sSZbnQFO0cQcmk0Of7b0=;
        b=LYY/ZrGPKX8QuNZv67mEw7rhWdw3p1jZNY+TVDl/GehDb/pxjwicdlqyVNsBhLA6In
         Rq//3taGQTG73Q1otdZ8gi9H3YOpcys5kWls2zzA+LbSGq8fKIjkz5znuFcfG3cshvOA
         Sep2nJ1jMBNcYVblLlUuD4xUOTxwJpibsO+sqZhjnMHQsYc2fkpmWkPP2G8w3xJGQT0V
         buVr2+++KZ+vKPmB8BrjHfa3yjKpthM2aYjq64ZvEIJ9El1rBf2AUGmGewGrD6fl7eZj
         W8uvQ0cX3K4z/9O5YnHjcrac1i/nLkbCek/uBA4gWnWnzD0lIW8dTPu2T0nE4T6C/Moj
         T0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=si0Fia9g0D120PrN53qtiA6sSZbnQFO0cQcmk0Of7b0=;
        b=1bg3yq7cG1qxayiiMHbJz/Cz/Ay9rbZLXsdSY8FCJ3yGtk1BwP2a3KNrTwvTOT2Wcz
         zYtvXWub/AFftFXJFCZPLvzMFugLywbS4z/IxUu7l6f31ZlxUvefWHeecofk5bWeSaZm
         fqXJm1Lu900ZV3sdR+P51mjZM8XfPxM3ub4kNCyMP4RpqsmMNWFFq92Jsn7+xKopSdSY
         qBldkQq9qzTM1hCHmriDZmlEE1qWlMn2QAvA6Wqmys/lfc/pUuh1uNGvhBfk9xyGmdD3
         J2JYP211oL/fU9suiQ8hl1sYKot/L9f2lVt75aGFbEybQ8R08DykIIgs+2UMpTrsMd/u
         r6+w==
X-Gm-Message-State: AOAM5331mpW+EP1J9B9hD7NG0XbFHC9eNIZE9qMvXQlBRSCJ8RaxepS/
        4dN1cLyZrqyYI3GunSA9CzSwaQ==
X-Google-Smtp-Source: ABdhPJyBWrwFLSAxEbrJOn0VxHDvSpzOc5p1CrzsNTaUOcADp5AWvoy0xCHvNmNdjFuIvcJk77XSPw==
X-Received: by 2002:ac2:523c:: with SMTP id i28mr1108257lfl.156.1644022810618;
        Fri, 04 Feb 2022 17:00:10 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x12sm516892lfr.23.2022.02.04.17.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 17:00:10 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hwmon: (ntc_thermistor) Underscore Samsung thermistor
Date:   Sat,  5 Feb 2022 01:58:04 +0100
Message-Id: <20220205005804.123245-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The sysfs does not like that we name the thermistor something
that contains a dash:

ntc-thermistor thermistor: hwmon: 'ssg1404-001221' is not a valid
name attribute, please fix

Fix it up by switching to an underscore.

Fixes: e13e979b2b3d ("hwmon: (ntc_thermistor) Add Samsung 1404-001221 NTC")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 414204f5704c..9c9e9f4ccb9e 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -59,7 +59,7 @@ static const struct platform_device_id ntc_thermistor_id[] = {
 	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
 	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
 	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
-	[NTC_SSG1404001221]   = { "ssg1404-001221",  TYPE_NCPXXWB473 },
+	[NTC_SSG1404001221]   = { "ssg1404_001221",  TYPE_NCPXXWB473 },
 	[NTC_LAST]            = { },
 };
 
-- 
2.34.1

