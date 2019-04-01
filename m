Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E78C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 17:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBADB20830
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 17:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsVEu1Lv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbfDARjG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 13:39:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:47096 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388397AbfDARjE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 13:39:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so5106942pgv.13
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=n1UwllrXResG9gS5pcVZ7fILwLbEGntVOCCV1EeMzPc=;
        b=RsVEu1LvJPo/hyuI7O8F3zESRDh0btrg61vRD0xJDooiW8Xwe6Yk+Nnl8vtxu4XqE6
         J5b6N6FwMIgLhlbRCGP6HPwQps7tEmIQqJS4QEBPsIqFPbmGPwbh6xb2GRlV2PT/7DNT
         +nVQ8MGrsYGkkgL86lJUTER7BPz9fwItYrsIjAivb9MeN9/npqZNt5kMPZPS4eVg19/L
         yi0DjY6MJCbqDyyolymRUpPcIkpRp4T+RRtIDozvdtdtyA6IVpk0o8WvxzsjgvQMWA8s
         Z1vwdxORYta0BlfNCxzspE0xnKl6L7OC2oMmmiCamI+WJrZQC1w+Ujsqm9KFCYL1TwaB
         f08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=n1UwllrXResG9gS5pcVZ7fILwLbEGntVOCCV1EeMzPc=;
        b=ugqvzWqPK9aDAHRaXUcn81BtPPMuCnh+MpeoWoPwkfJ0r02rEGSbYUhMGH9/jKRkn1
         qGyfOnc1eU1WQn4sxzlj/cenQI2bTm744qJhSzemu9X2Yrg4nOL9YNJSFQeiPejlO6sc
         qYCoySVD456z3HpLhgrxuXL/pU/UB6nE3GiOjh5pQuF/aWcquCjrRHRW1mOfeTigJKJu
         mnlV7V+H+Eo6JoiQVUXnjw/X0lnyz5VesWN2TrFDsEacftprTnlNrMm9tBTD2D+EaA3w
         06ajTm84irPbn+SQWMprlFM8lGDqi2SFDcAKhhizrAOg8yfjgu1HYVugzevHvuFFL8wT
         N/uA==
X-Gm-Message-State: APjAAAXY04B3Z5P8fdQ7HzQ5orAgVF7LAyZ5o3Nyaf05dOkYY4jp0e0P
        rDmABkswHClTjhw/92BI6u0m4iXS
X-Google-Smtp-Source: APXvYqzxMQdH/G2aqhP3vYg5NWOPVX66SVLtBnUfSSE/UlHVHPHywViBzcwJx9JgB0QKW7Dn9oeRMQ==
X-Received: by 2002:a63:330e:: with SMTP id z14mr14108388pgz.4.1554140343689;
        Mon, 01 Apr 2019 10:39:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 17sm14420803pgt.0.2019.04.01.10.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 10:39:02 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jz4740) Use devm_platform_ioremap_resource
Date:   Mon,  1 Apr 2019 10:38:59 -0700
Message-Id: <1554140339-12082-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The new helper devm_platform_ioremap_resource() wraps
platform_get_resource() and devm_ioremap_resource() together.
Use it to simplify the code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jz4740-hwmon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
index 2d40a2e771d7..7d5947595b45 100644
--- a/drivers/hwmon/jz4740-hwmon.c
+++ b/drivers/hwmon/jz4740-hwmon.c
@@ -94,7 +94,6 @@ static int jz4740_hwmon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct jz4740_hwmon *hwmon;
 	struct device *hwmon_dev;
-	struct resource *mem;
 
 	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
@@ -109,8 +108,7 @@ static int jz4740_hwmon_probe(struct platform_device *pdev)
 		return hwmon->irq;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hwmon->base = devm_ioremap_resource(&pdev->dev, mem);
+	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hwmon->base))
 		return PTR_ERR(hwmon->base);
 
-- 
2.7.4

