Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AA1C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Jul 2022 21:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiGLVsk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Jul 2022 17:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiGLVsi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jul 2022 17:48:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902C6E5C
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Jul 2022 14:48:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bp17so8282052lfb.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Jul 2022 14:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+gXQgD4K9MNbkySaTJpNx4ZNqwXAsV+5ltHETmwyZI=;
        b=Hw4TMVXVj05IVlldJaak7OcR1un7HzFQRvcOgrxfTNdKvb7e0jF9OZoYFe9KYNWbQx
         4kerIrUw7tPWvXFYjwSfpmOY7D25TzUK5kEQtbpGFn24Gkh6ufGfNiziXXyx+kybmDq4
         aDUYAOf60bc5KyfakdBH+l01rVX+8M/gTu2EXgqu2BHBmkEW6b+UZglNVXmr+wkSWPeS
         TSyF8tNSAnml1M259843E2UB/ZlXUwBlPMFT+EBfWQekAPFGi1SUgkSQln9Q1o2B5xCd
         XtQ2sieoRcMNiC5hu4KHWj+y0KMHEY6DLo3xX61eJMM9Ev32mStfg726q7cFz9rDpqm7
         8KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+gXQgD4K9MNbkySaTJpNx4ZNqwXAsV+5ltHETmwyZI=;
        b=t7oqNIRuI5EBRmxorizoJS4uPurQJsVZRF6wz6Vm4pTrfU13jHF0zPSZU+WJ8Hae7l
         /oTSZsTON9T5ISMGWHcN7G+SweT5fVCjrvyv781eZFijstUuHFVrZooiUKNdj9HxPnia
         cmf2NsGw/7lgUquFwEyzM8Fz9edL9b3MVIoTbLTCFgPC3l3zUThJsrukS/3C4Y6RxfGY
         +tsyWZXQCSIqf0Fdw6rC/8FL4dJVjXmLfeBC9jStPLK9Xv2lIFWLoVD/EIq5wdI4bTR/
         /sBOW7dd38MC4d96ljR/mZSI3ZVRGm2XOe7QU6ygLNg6j5xx/tASXwENlinkluNsIDWR
         SAxA==
X-Gm-Message-State: AJIora+SCIXSpDzNsLaJNIVeuLpnyCwDhMYVr7U3IQhFEENoZYasCcKV
        YVk4uC2hkP18o4HM8aNRKzyV8w==
X-Google-Smtp-Source: AGRyM1sBnAZfo6kFsUpKlve9iipPQc4R2saonYE3k+HO8Ynn+CTdZ9Bj3QTU4xl7+SVXNYTyyocRGg==
X-Received: by 2002:a05:6512:234b:b0:489:d0ae:3c1d with SMTP id p11-20020a056512234b00b00489d0ae3c1dmr59779lfu.282.1657662511941;
        Tue, 12 Jul 2022 14:48:31 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9f52000000b0025a72db0cf1sm2697974ljk.118.2022.07.12.14.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:48:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hwmon: drivetemp: Add module alias
Date:   Tue, 12 Jul 2022 23:46:24 +0200
Message-Id: <20220712214624.1845158-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding a MODULE_ALIAS() to drivetemp will make the driver easier
for modprobe to autoprobe.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/drivetemp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 1eb37106a220..5bac2b0fc7bb 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -621,3 +621,4 @@ module_exit(drivetemp_exit);
 MODULE_AUTHOR("Guenter Roeck <linus@roeck-us.net>");
 MODULE_DESCRIPTION("Hard drive temperature monitor");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:drivetemp");
-- 
2.36.1

