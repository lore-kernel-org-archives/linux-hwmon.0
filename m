Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA13C77B61
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 15:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240591AbjDGPCh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 11:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbjDGPCO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 11:02:14 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8436B745
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 08:01:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id jw24so8978582ejc.3
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680879685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GsW0sBmCGPIKi4ldnuiVceYA0T8GNC0mMQclPw5Yuc=;
        b=SVAOqSpYUGg+ycC7+a+b7gK9ANWd39GdaJIxR+0wlqJafKFgOyaPrxUGqg0+O1H3R2
         Hq5hE05D37A+QIktWpUwrTn//N2YzCg5/8ZqxN+EkoLl2fG2BvhUJpY8XYHwj+wPukXR
         SN4TU+LBiRrouHEEsUdS7+JXQIWW3TcrXwfSvVuVw17KC6EvAZCNhOJWQLNWIkosKvdu
         fep6yC1MhWEOCbC6iJnVcYHY2T51Pyw86cmVOZ9CtEfjyZmuH/c83BhOsVVHuhnJWNFZ
         l3g7yjIiaV+3krQ2AGpSkAinCu+i1YSMzWDYh/wROq181NTkUO2v9dkuim85QtbMytXf
         tqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680879685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GsW0sBmCGPIKi4ldnuiVceYA0T8GNC0mMQclPw5Yuc=;
        b=Jp0bzDCkAHWzAo424NvlH/hhYgPK5W6ON9tupiiUAvgCYnqDzi0DNjP0QTNT4zV0lD
         qc+3sPDaaptHoucWyFmJqYSTw4kOjgmG5LS+Ly0s+QGipKO0i3YmKK797WyZ1nZxlNYj
         TWGQVj9ESCh+NP82C88LHK0ZHVJEuULuBfZSwYtrn51roRaRKNNVRFJOnZmg+2z0GIgn
         vRea/iNA0aF0U/6BAW9X8zA1AnMxG09skHP8hXZYs/602zvOS3rbGusQJzs1bFCZDYo6
         eGeLkctmrHYqiLTmBbxYklKVOlJKCUhtLQmFbFMv0YD3Hk/9Ev5xya3bLT5B6GM01LJG
         ke8Q==
X-Gm-Message-State: AAQBX9fpFvNG2wL0SF08A0lbdzPJ3RSSJ9MbjF5fYTrWUpbAI0vzWANL
        rF+rmS/ztL2gpcxf6j959NBWZQkv9gyT3zR1TO0=
X-Google-Smtp-Source: AKy350bmqzFCrsiSFpiUC9iuHlbqOA+CLNisE5dPc18hHHA2B7zXpA3byBEqZlnTbRSSY2TIIAFKCg==
X-Received: by 2002:a17:906:3ad3:b0:84d:4e4f:1f85 with SMTP id z19-20020a1709063ad300b0084d4e4f1f85mr2250057ejd.59.1680879685362;
        Fri, 07 Apr 2023 08:01:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id ck23-20020a170906c45700b008ca52f7fbcbsm2144907ejb.1.2023.04.07.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 08:01:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] w1: therm: constify pointers to hwmon_channel_info
Date:   Fri,  7 Apr 2023 17:01:21 +0200
Message-Id: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on hwmon core patch:
https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/

Therefore I propose this should also go via hwmon tree.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/w1/slaves/w1_therm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 067692626cf0..1385cd142c61 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -454,7 +454,7 @@ static const struct hwmon_channel_info w1_temp = {
 	.config = w1_temp_config,
 };
 
-static const struct hwmon_channel_info *w1_info[] = {
+static const struct hwmon_channel_info * const w1_info[] = {
 	&w1_temp,
 	NULL
 };
-- 
2.34.1

