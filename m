Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1786C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245049AbhLWUwf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350278AbhLWUwe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:34 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB24C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:34 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id g79-20020a9d12d5000000b0058f08f31338so8435034otg.2
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uTnAjLckGpBueAzalDkRmoVS0oMzpyXWbjfmTlij8G0=;
        b=iqsoyhZ0AA5y7PdVfXVEx5LtIG9B2vwOKoTD5HE79dgod8OvMrJS+NdVM1gMfqMRLF
         WK5j1Hm80jLMJnd4Uf4ov3ay5xwap0EEIKPpLJzdEQXCA9YOQmZq1vryWx0PpAjk13/r
         vCILWetGmvXhNgiN6fWhEFwBgDzXCEBDvz4e6izUIm2MS8tCRVg2c26/jNSDJQA2h4iI
         zI8r2D13+7aXU1N8m9tFSJKfJkntDQnEhmgSuvkehGz2OYEzBO1Vny31vAlUma74WK9t
         wJa9iVoPk2r6AdrOplRFQbsLQ12RIwZx5Sb6H1Gl9P7hT6b7e2fCGY0MwbhcwFSob4ZL
         PXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uTnAjLckGpBueAzalDkRmoVS0oMzpyXWbjfmTlij8G0=;
        b=R3XrRRAlzuElcSlet9MzDapQdDj0g27vPjUABGsrK+H84oBXqkDjz5oLas+vBgU+U7
         wd3gc2oX6WbxxTA20YUc0ClUbFVk+fHz5R5B4HE3UWBTwS83ACJkAmYrjfPeMVvrMJ1T
         uumNpJPqi3vvF1BkotAzpv3IM+07sdmTm0XD6Kms+OWzFaEBZFOf/z7uId/JAbG755KH
         k1HKt+dUYSddHVYxZO0T3EUaPzQaEk8/BxEJB8g1ief+uWwufarYiZt5wnSKjW7yCwoM
         6CL4OfwV5ep0YuTnq2ftFp3y9WD2GxVs1vWX9ObzwVfq/otUUIfTIR86w4fODFIP6R+7
         RYFw==
X-Gm-Message-State: AOAM532RxfUFTlJAsvB/yrAXQEQxL1JZCegH3fl/WLxBUBSAjAauMpPB
        wUsi2AK816WOXxFq605Hg726hhcfIL4=
X-Google-Smtp-Source: ABdhPJyKKViwsUmnn5KVBAmpsBiefckaiuzO7Nou/XyBEnf9/b0//MQMXuWU9zuWSl+ni4l7cay8wg==
X-Received: by 2002:a9d:7443:: with SMTP id p3mr2560742otk.331.1640292753576;
        Thu, 23 Dec 2021 12:52:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1sm1049548oog.26.2021.12.23.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 6/6] hwmon: (adt7x10) Use hwmon_notify_event
Date:   Thu, 23 Dec 2021 12:52:19 -0800
Message-Id: <20211223205219.2184104-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cosmin Tanislav <cosmin.tanislav@analog.com>

The hwmon subsystem provides means of notifying userspace
about events. Use it.

Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Link: https://lore.kernel.org/r/20211221215841.2641417-8-demonsingur@gmail.com
[groeck: Pass hwmon device to interrupt handler]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7x10.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index ea8cd918bc22..ce54bffab2ec 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -87,11 +87,11 @@ static irqreturn_t adt7x10_irq_handler(int irq, void *private)
 		return IRQ_HANDLED;
 
 	if (status & ADT7X10_STAT_T_HIGH)
-		sysfs_notify(&dev->kobj, NULL, "temp1_max_alarm");
+		hwmon_notify_event(dev, hwmon_temp, hwmon_temp_max_alarm, 0);
 	if (status & ADT7X10_STAT_T_LOW)
-		sysfs_notify(&dev->kobj, NULL, "temp1_min_alarm");
+		hwmon_notify_event(dev, hwmon_temp, hwmon_temp_min_alarm, 0);
 	if (status & ADT7X10_STAT_T_CRIT)
-		sysfs_notify(&dev->kobj, NULL, "temp1_crit_alarm");
+		hwmon_notify_event(dev, hwmon_temp, hwmon_temp_crit_alarm, 0);
 
 	return IRQ_HANDLED;
 }
@@ -388,7 +388,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 						adt7x10_irq_handler,
 						IRQF_TRIGGER_FALLING |
 						IRQF_ONESHOT,
-						dev_name(dev), dev);
+						dev_name(dev), hdev);
 		if (ret)
 			return ret;
 	}
-- 
2.33.0

