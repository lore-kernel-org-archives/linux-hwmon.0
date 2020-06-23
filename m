Return-Path: <SRS0=cB4w=AE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AABC433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jun 2020 22:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAE6820888
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jun 2020 22:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohnfFuCi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387840AbgFWWPV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jun 2020 18:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387609AbgFWWPV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jun 2020 18:15:21 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E545BC061573
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2020 15:15:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a188so96855ybg.20
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2020 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qRMlJH1Uuw7Z2l9FlYbE1GYm8Q7568m+yPgI5PuYm+I=;
        b=ohnfFuCiG3/qAUh2hncsEai9UcdDRTrmj2d+LUBkYoyAaC4chUUimCW9C10iKL3Ypt
         vWVvTDtLOyoiYAEWNVYvlbH6HbDnp23VHo+l7Cg3C5tvRZvcRPqYbUnnL/lcepVEbKeL
         KcVrQ7EKXGecFGBFWdvmKL9WuEZuH2Zz1SRaIJJ3Hxfx02aIKOi+zba8qAOTlkgA96L4
         HvidAP04Te/Te4s/JgAHzApPo4Ofjuyyq8uhun8PXTsQMhSzHh6yRFgAe30AUBFMAkmZ
         JznHqab2QaiNKoDD/uPR+1pldmdn3d5gJWbONSMWLwdpcK1QrcjVoEwgPt5Vm+qoEtid
         4lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qRMlJH1Uuw7Z2l9FlYbE1GYm8Q7568m+yPgI5PuYm+I=;
        b=A/5qCk+EFmZnK1DOc5v7cMfVTYqmoNaXgDXNqMgt+uJ50+DkgVYn20Idx2GxGzyYdM
         js1OxA9eaPW9KGy80T0rN0pfyFeWuy5mmKPmVh4pCzUMnFmempdTP1b/EJQ7pdQQlgmO
         xaCcRUX5uGwlftzACAzvExID77K0jY2uea9NrIC3zs78u8WPEsRYBaqWs3EmqwFerEyT
         fzTJVxE2viIoXmKA8T2YJlm98+V2S0gm70bbwPRem0SqS+c73kGEUdfHOHIuvVuXeWLj
         LzBK1DgXgIIvUNHJ8zGfEdvU36CIPQsMsCHmMNGQiLXWPCAVD9shvqkfdcIsPOxW42Y9
         deDw==
X-Gm-Message-State: AOAM530I+jmDa0T4j5ipVD5oWWtcMK48pcvXtaWhILewgQ17DRDMluvQ
        OK7ecoata04gyYOXABdETXh6ap52l2benl1m
X-Google-Smtp-Source: ABdhPJwGyYjPnXfPWO/nS5Di83f24FKkz8fyiX7pScZtFdZh3irMDE5UsxkgLEJ6jc71R01NS0iwCLHShFEXXHlt
X-Received: by 2002:a25:2415:: with SMTP id k21mr40830266ybk.349.1592950520116;
 Tue, 23 Jun 2020 15:15:20 -0700 (PDT)
Date:   Tue, 23 Jun 2020 22:13:08 +0000
In-Reply-To: <Chu Lin <linchuyuan@google.com>
Message-Id: <20200623221305.198214-1-linchuyuan@google.com>
Mime-Version: 1.0
References: <Chu Lin <linchuyuan@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH] hwmon:max6697: Make sure the OVERT mask is set correctly
From:   Chu Lin <linchuyuan@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, Chu Lin <linchuyuan@google.com>,
        Jason Ling <jasonling@google.com>,
        Kais Belgaied <belgaied@google.com>,
        Zhongqi Li <zhongqil@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Per the datasheet for max6697, OVERT mask and ALERT mask is different.
For example, the 7th bit of OVERT is the local channel but for alert
mask, the 6th bit is the local channel. Therefore, we can't apply the
same mask for both reg. In addition to that, max6697 driver is suppose
to be compatibale with different models. I mannually went over all the
listed chip and made sure all the chip type has the same layout.

Testing;
    mask value of 0x9 should map to 0x44 for ALERT and 0x84 for OVERT.
I used iotool to read the reg value back to verify. I only tested this
change on max6581

Reference:
https://datasheets.maximintegrated.com/en/ds/MAX6581.pdf
https://datasheets.maximintegrated.com/en/ds/MAX6697.pdf
https://datasheets.maximintegrated.com/en/ds/MAX6699.pdf

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/max6697.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 743752a2467a..64122eb38060 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -38,8 +38,9 @@ static const u8 MAX6697_REG_CRIT[] = {
  * Map device tree / platform data register bit map to chip bit map.
  * Applies to alert register and over-temperature register.
  */
-#define MAX6697_MAP_BITS(reg)	((((reg) & 0x7e) >> 1) | \
+#define MAX6697_ALERT_MAP_BITS(reg)	((((reg) & 0x7e) >> 1) | \
 				 (((reg) & 0x01) << 6) | ((reg) & 0x80))
+#define MAX6697_OVERT_MAP_BITS(reg) (((reg) >> 1) | (((reg) & 0x01) << 7))
 
 #define MAX6697_REG_STAT(n)		(0x44 + (n))
 
@@ -562,12 +563,12 @@ static int max6697_init_chip(struct max6697_data *data,
 		return ret;
 
 	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_ALERT_MASK,
-					MAX6697_MAP_BITS(pdata->alert_mask));
+				MAX6697_ALERT_MAP_BITS(pdata->alert_mask));
 	if (ret < 0)
 		return ret;
 
 	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_OVERT_MASK,
-				MAX6697_MAP_BITS(pdata->over_temperature_mask));
+			MAX6697_OVERT_MAP_BITS(pdata->over_temperature_mask));
 	if (ret < 0)
 		return ret;
 
-- 
2.27.0.111.gc72c7da667-goog

