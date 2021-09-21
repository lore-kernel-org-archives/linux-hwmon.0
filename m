Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86888C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 16:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A49D60295
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 16:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhIURAh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhIURAg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 13:00:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A95C061574;
        Tue, 21 Sep 2021 09:59:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k23-20020a17090a591700b001976d2db364so62877pji.2;
        Tue, 21 Sep 2021 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cyv9WxpugzKd5GkwE7TRT6t4efrtxh0SUwSIA+1Cwbo=;
        b=LnRDRPyEcFzMjlupfxe+D4BnTDmwSkLM+bWt24xSxXswM0rHWZuEI+65yasClqPPXC
         HFw/BgMyPvuGvuVZV3/mCtR1SlKuo4q7QjgtjPQ7s/puf+5BJK/JT1E3Os2sqOk0nvZz
         1CKs/xQ7QWu1kORyxcO6eig04zYogwQgRtaIHRgsdBrYVMWqM8qSm8mN7Nr3zmPaJ4gK
         0/VVwnPFrvqHPIKwPIXUJDt2qDQM6uOFiiHzOqzx92fuGCjEASRdv2DoAXZtUaZ/jQdy
         dZWQxJtPioTAXQOQ3uKp26RgVDXSLDxpm5PMX91V3fmUS39HxryO/yFy/twISDQP9tKX
         si+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cyv9WxpugzKd5GkwE7TRT6t4efrtxh0SUwSIA+1Cwbo=;
        b=Dl0fP/lSf2ZAkelCaDjRDReI9MLtZgPSFL18/+XAgyy7Oub2hzwU3UtWxFzNtutls0
         100gRopf7bCqqVINLundwZRey+p9RnHaWDoEuLsHbpBLnBRnSigefcDRTfolpLP8kWMH
         rxF6QHE0V7b33PRseFhp1c/WdfTWuuovgaar/AuGHZ3DXu1kvJ9vRJZWbwCx6O0+iJeb
         TEsGm1JPMqMo2Hx5tE+tMPTxgDwW7NgbA8pmaUapBjwIf6m/yPDu6A/5gTY0cU0qYuz6
         x4Mvv4D6v6O4WBU8PtWyLcDpuVsT3+YnZgIxa4UPQWl5ki+FwCRCWm/dpSq8i2TjHRWG
         mVrw==
X-Gm-Message-State: AOAM5317pFA8F+UfqrNPfQLarczRg0spy7aXK1uQEcJdJcnRF+S0de80
        OAIbSVXb4tS6GK2zO6RM3gI=
X-Google-Smtp-Source: ABdhPJx7n+R+s3qthQmc0YPteqNO+uGoYi4M/tiUfio842YPc/8S/R+E0hshurbFoSbkZPj+iSmKVA==
X-Received: by 2002:a17:90a:de94:: with SMTP id n20mr6469474pjv.48.1632243547839;
        Tue, 21 Sep 2021 09:59:07 -0700 (PDT)
Received: from ddawson.local ([2602:ae:1f2b:8500:aaa1:59ff:fe2b:a859])
        by smtp.gmail.com with ESMTPSA id m9sm17891854pfo.44.2021.09.21.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:59:07 -0700 (PDT)
Received: from distfiles.local ([::1] helo=ddawson.local)
        by ddawson.local with esmtp (Exim 4.94.2)
        (envelope-from <danielcdawson@gmail.com>)
        id 1mSj6k-000Cg4-TG; Tue, 21 Sep 2021 09:59:06 -0700
From:   Daniel Dawson <danielcdawson@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Dawson <danielcdawson@gmail.com>
Subject: [PATCH] Add another customer ID for NCT6683D sensor chip on some ASRock boards.
Date:   Tue, 21 Sep 2021 09:58:59 -0700
Message-Id: <20210921165859.48714-1-danielcdawson@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This value was found on a Z370M Pro4 rev. 1.01, with an
NCT6683D-T chip.

Signed-off-by: Daniel Dawson <danielcdawson@gmail.com>
---
 drivers/hwmon/nct6683.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 35f8635dc7f3..6a9f420e7d32 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -174,6 +174,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
 #define NCT6683_CUSTOMER_ID_MSI		0x201
 #define NCT6683_CUSTOMER_ID_ASROCK		0xe2c
+#define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1221,6 +1222,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK2:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
-- 
2.33.0

