Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06135C47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7882613D2
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhEZPmC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhEZPmA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:00 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53507C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:29 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t24so1919839oiw.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tE7T5ILApC5dfgDC4MmLEMVtvGXvgam3HPuiam11UME=;
        b=OLVHW15Khi36CykkB4WjRQch4cVZMtHWU0Lfyd0MbxWFo0aXMxxMYTIlovApAxTTsB
         IfeJBOWPq9JBLLq7eaCZDNErHWWvQdk0FZSL+9qMapwmIXRUTjQNu2OcR+0b2I8/rRHf
         Sl2TPwEGwkJQ50Jr4648HvryjWbx17JniZCdBRUsj5sGEQPBN+kQLRmRV5zmGacLnYoo
         L6E+uTEXCqpWIdcPTaXhUIPqLBJq45BBzN4TeZOdUPx0Y8zLMOBJh8WhD/ex7/NKV02z
         BN3VWStFgBhH2zV3/Z/8If68d8Bc9qLasCMhA4f/MjOeNzUquTm4AIRYhprF5QOkB/9S
         shHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tE7T5ILApC5dfgDC4MmLEMVtvGXvgam3HPuiam11UME=;
        b=sQzfwBPmszRq5fzb9GxLbjdzNiilHKJt6HgadJlWRRZvoel9H6sfJDK5OmZr2vqxJ0
         4CksjdllP3JlyAq+Mas2pvsNllFLQEcllp+A0CwmPcwo762DiyuEaI0bdL/Qkd4/2RVw
         cE6m8EerLonBZWGVa+jJZ2Cpr4vua5kQslrfwiXm4JcokvM9N2IGB66VqT+02sREsp0J
         uURad4I+/5fGjgC8r1i4hUhhzDSDCXYghyn9OTHFfQUD0jQo5/wAi8cdHyHqrSAxRDUx
         +Fm6kgZnF/KHk1RFMaWjXVlGgotkMk3glkEpmm7xU12U8hbAE2o+M5wG9WrXfUGMgfhI
         BIeA==
X-Gm-Message-State: AOAM533QicJwfgIXd6B/Lny+hpBitPgeIliFeMGsvSsE96AMxTLph1ac
        B7ceD8zoMkguDr8XSqZDS/5mSdRctXo=
X-Google-Smtp-Source: ABdhPJx1GbdJgdeU4jaeQJjGjij4xDECN2WVq44NKgauJP+OdyDryYNgkxnMVwxqx6q/jYI31Sxeng==
X-Received: by 2002:aca:e142:: with SMTP id y63mr2364756oig.57.1622043628326;
        Wed, 26 May 2021 08:40:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20sm4065741oot.29.2021.05.26.08.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/7] hwmon: (max31790) Fix fan speed reporting for fan7..12
Date:   Wed, 26 May 2021 08:40:16 -0700
Message-Id: <20210526154022.3223012-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fans 7..12 do not have their own set of configuration registers.
So far the code ignored that and read beyond the end of the configuration
register range to get the tachometer period. This resulted in more or less
random fan speed values for those fans.

The datasheet is quite vague when it comes to defining the tachometer
period for fans 7..12. Experiments confirm that the period is the same
for both fans associated with a given set of configuration registers.

Fixes: 54187ff9d766 ("hwmon: (max31790) Convert to use new hwmon registration API")
Fixes: 195a4b4298a7 ("hwmon: Driver for Maxim MAX31790")
Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31790.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 86e6c71db685..f6d4fc0a2f13 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -170,7 +170,7 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 
 	switch (attr) {
 	case hwmon_fan_input:
-		sr = get_tach_period(data->fan_dynamics[channel]);
+		sr = get_tach_period(data->fan_dynamics[channel % NR_CHANNEL]);
 		rpm = RPM_FROM_REG(data->tach[channel], sr);
 		*val = rpm;
 		return 0;
-- 
2.25.1

