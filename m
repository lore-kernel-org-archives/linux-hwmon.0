Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF05C0015E
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 12:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbjGYMu3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 08:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjGYMt7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 08:49:59 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7C9FB
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:49:58 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98377c5d53eso876956066b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690289397; x=1690894197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Puz3ztq+s5PMQIYSFqmtMplo+slwUgkmSW9O9rbzaQ=;
        b=hVigPGX//gTdtgmRuslLbiD1/zcY/J9BI9iISd0U4KzwumlLvSTCrKq4TVJCmKI5+Y
         gzNDIQRzCKFPphY9vbQsCB8Y0OcWy802EvA7wpSi8njOBNCZyNsNx/TovT71NWTTal0M
         6zJrn0OCpMUMog1LoXLLbfPPloeuSf5Cq8Uahs3w58Hu2gJWKIe3wuYNrb7kmA1Az+r8
         7FksdF0bC/1r8yXmfBqwolspgGX32xjGunx2VBJr1MCnDU3TgC0/DZjGxFrO0qaQHvOl
         5etfhfrRaDodt9q7a6NlRCuoNzeq16P4nKo/Z8ODRTBH31SSfxr53sAIi+ClzWSGRUMT
         jStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690289397; x=1690894197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Puz3ztq+s5PMQIYSFqmtMplo+slwUgkmSW9O9rbzaQ=;
        b=BOUH17CmnhGnu0bR7Q/2QLkY+4tFV76xgrZkAfSzzjPFRS2PflCz1pbMT6v63PRd7v
         4G2a5c3+m+UY+yMyJXozQJ8LIgC4X0Dq924zPm3wf3BnuValuKSxpBz+8rOJu6V2s6JR
         jM3moEeX4TZ5U/0NA7D5AiIh9zho3HnOfi4ljg3kkaMLmIG88ISN9YuvcbgAiNFAo2e+
         A7qO80q/k/eZk/rYTWN3E7w3IR8EO8COLoRbttalfuBQTVG2+wtaLnd6PaLQBCXCOD2f
         pTwFI7qmOwt3XyI46zyQ+9PU8EzuzC2dn5M3Pq4HJvRFyPFMU9slw4v/7wX9xO3D+mXm
         QbKQ==
X-Gm-Message-State: ABy/qLafamcueeUbPeefWwiMetM0OwuX7YoHuAx/6gxpJr00QS0HwgeG
        PX6lycXJgg+5S6FlW9DH8p5Tjriz/hidFbY6CzTadxTh
X-Google-Smtp-Source: APBJJlGLU28v87Y58xqBP2PjJL/KhzkfhRXDaTYlF8sJo7esBdIHBy1dZgN9EPWiJakxco6GyTlwTA==
X-Received: by 2002:a17:906:2d9:b0:973:d076:67ab with SMTP id 25-20020a17090602d900b00973d07667abmr12076828ejk.42.1690289396804;
        Tue, 25 Jul 2023 05:49:56 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id pk15-20020a170906d7af00b00997e8b6eaa1sm8133283ejb.41.2023.07.25.05.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 05:49:56 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pmbus_core: Refactor pmbus_is_enabled function
Date:   Tue, 25 Jul 2023 14:49:50 +0200
Message-ID: <20230725124954.3824954-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Refactor the pmbus_is_enabled() function to return the raw status
without any additional processing as its already done in
_pmbus_is_enabled function.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index fa06325f5a7c..42fb7286805b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2768,7 +2768,7 @@ static int __maybe_unused pmbus_is_enabled(struct device *dev, u8 page)
 	ret = _pmbus_is_enabled(dev, page);
 	mutex_unlock(&data->update_lock);
 
-	return !!(ret & PB_OPERATION_CONTROL_ON);
+	return ret;
 }
 
 #define to_dev_attr(_dev_attr) \

base-commit: 55612007f16b5d7b1fb83a7b0f5bb686829db7c7
-- 
2.41.0

