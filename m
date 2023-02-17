Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4ACC05027
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Feb 2023 23:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjBQXSE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Feb 2023 18:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjBQXSC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Feb 2023 18:18:02 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D06AD36
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 15:17:51 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l11so10493109edb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 15:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=087cqXFpZYAUTq97/P5HwRHwyVdpKLtSueK0ukneM2o=;
        b=eiYrC8FtbN0RVLbuw5O3/3K1NDKGI29vDnM7/oPfIcakSo73sNdWRRTq7MFilS7hIl
         Y2vPaeP9mCVwME5h2SimWzOezBfGBHALqftYd3Rpca48XCXdMvEH+AEY+TdCAxaB5nbY
         D7CALmv44l8VaUu6TavdoHGpYfGARm740noGsdf5c1cxA0+K0mTB3gyJGj5H/vtdI+Vf
         P7393dPTHYM7S2/HDoYOJDxPbQHP/RGGpggYC5xdeV4qspXTf/kBS0VFyGhAcMlrLJOU
         D/N375wJy+mMCiaNFooCbENIbMiNxClKBZypMIsSoYarI1vtGyvdVc2a6RyBlXhkH+Dp
         LaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=087cqXFpZYAUTq97/P5HwRHwyVdpKLtSueK0ukneM2o=;
        b=Whszbp1HvR3hFaiGhjI+A4xvWo3P0Wu25hm1HiuQSYXoeGeRMwsU013mZ6iIYJuZpn
         je61xabSWXHAZmZUdwpMDzmTHzXPK4QxnI1xuKsfvu8hOi53BOYCMHtex4tQL3c1ZaYF
         5kUmqVX5zsb2iwopWOBDoT2AWZzmezBiZ3uVLwk+2eF8KMwLUBVFLGtRudFJS4Dzvahm
         0DPHVg/MNOVfeqQTGpd6sEAg+YnjZ9zrl6L9pQM0S9q8fwDdI83OPUSzx6GGJYUUdD/P
         Z6b+9oXJ6dMxi+/lXyMrD6Xbi1wbqnCJZi+da8b7Imz+X/e9bwlXHk4v45hsvzgAmCgc
         XnBg==
X-Gm-Message-State: AO0yUKVX3dZpGExVZ3Hz0h66C3qjjUCKD7b5Rj2IuVXADJvfodGuWtgp
        JtXI7euCjkohDgjsuwXCOEPhVt31fSuMqg==
X-Google-Smtp-Source: AK7set8Tru4qHXeoMhd91I/7yQItUarbjaFeG5ZqHuVXrQt0Dzxrs72glbgp89pVTjqyo1m5f2SwEA==
X-Received: by 2002:a17:907:6d03:b0:8b3:6da3:c788 with SMTP id sa3-20020a1709076d0300b008b36da3c788mr5329910ejc.51.1676675869874;
        Fri, 17 Feb 2023 15:17:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:4f9:c010:5d73::1])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b008b14cbb46e2sm2645096ejb.145.2023.02.17.15.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 15:17:49 -0800 (PST)
From:   Enrico Mioso <mrkiko.rs@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Enrico Mioso <mrkiko.rs@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH] net: phy: aquantia: clamp temperature value in aqr_hwmon_set
Date:   Sat, 18 Feb 2023 00:16:47 +0100
Message-Id: <20230217231647.968107-1-mrkiko.rs@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

React like otherdrivers do when an out-of-range value is passed from hwmon
core.

Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Russell King <linux@armlinux.org.uk>
---
I implemented this patch based on observing how other drivers are reacting,
and after experiencing the hwmon core passing -INT MAX. Based on a
cursory look at the hwmon code, I don't believe this to be a bug. If this is
instead the case, I hope I will be corrected and this patch rejected.
---
 drivers/net/phy/aquantia_hwmon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia_hwmon.c b/drivers/net/phy/aquantia_hwmon.c
index 19c4c280a6cd..6444055e720c 100644
--- a/drivers/net/phy/aquantia_hwmon.c
+++ b/drivers/net/phy/aquantia_hwmon.c
@@ -70,8 +70,7 @@ static int aqr_hwmon_set(struct phy_device *phydev, int reg, long value)
 {
 	int temp;
 
-	if (value >= 128000 || value < -128000)
-		return -ERANGE;
+	clamp_val(value, -128000, 128000);
 
 	temp = value * 256 / 1000;
 
-- 
2.39.2

