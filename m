Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BA0C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Dec 2021 14:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243360AbhLOObk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Dec 2021 09:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbhLOObj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Dec 2021 09:31:39 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67992C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Dec 2021 06:31:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u3so43556410lfl.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Dec 2021 06:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rg9HFuWiturti9t8bBPlcGbJSB4NLEgjhoT3TDk5EKU=;
        b=k6e7EypRwQU4C2qrJKPjtfRDe+Vp0tfe/mZuA9+igVuBZCFLY1u4vFMq6+9wa90Zt6
         37u4HrBrpVPx0nWXohfvBxCb3umgNJo/skDvG+jovLBDFK/6EYdVVzF+mANqRZeCGTFT
         ePhppntNsCZgpb3jbZyoqC7Qvsh9EoCpg70LA9lZKVuC+0gE08bOrD6uWAmZCykiT5ZE
         4izhOCIxCEtoOE4r1YXXeqkkaB9wYKAKzHm5L7LL8e5/qgje6TxZln0aIMORkma8NrQA
         PRegbHWcHSKdE6gBc2ZVpZw/BCyAUwHdxJGf7oBLrrO+SV0ZJy+xKABSf6kqoV2eyFSm
         5HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rg9HFuWiturti9t8bBPlcGbJSB4NLEgjhoT3TDk5EKU=;
        b=cxPBCT2j2fx1vf/eLzu4giku+4/WpFQYmmFxKyCxWKkF2w/IW3rFTo/fntfqOcBhNH
         YDCp9pbi63d3i9yPWRTxGoo5E+lxiXOi4IkWAp9xqifhaVLsl/CYYEk42FshgFk19aC3
         BdSw85WmmJ8Xd+GILZleJ29NQ0fshmSAq8RQs+yWTP/iFH9gXBl2C7EZzxpKoty/Vy/H
         nHB3AkymEmkaH1B5m26SmOUkLpfMpg7hkqg+3jJGUM03EUuwvCHshz9Y7SDmZvePguOt
         R4wYsLcJrKVTqsXiggoCKfWlca/AvGWaqOhpk2zVHAPduIqm/3SadLOWHqIo9nZ80+kk
         nxHg==
X-Gm-Message-State: AOAM533uJHhgYduW/sTwEZuAryT950yHycTk2kdPzJBAfXgwUYpQtpC8
        SCQVT7zEKW5d0RHUl1V6Ua0y0yTiIA4SbA==
X-Google-Smtp-Source: ABdhPJzodkpRLeCN7F5bZ66PlLnmgnCbnnssfsQJXvbwF8XLaNTaQWKPp3vR1XsVNS+PnhkbmChhFA==
X-Received: by 2002:a05:6512:3053:: with SMTP id b19mr10093445lfb.276.1639578697612;
        Wed, 15 Dec 2021 06:31:37 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e17sm346337lfq.102.2021.12.15.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 06:31:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH] hwmon: (ntc_thermistor): Drop OF dependency
Date:   Wed, 15 Dec 2021 15:29:33 +0100
Message-Id: <20211215142933.1409324-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The driver has been augmented to just use device properties
so the OF dependency can be dropped.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e491e8f354bb..f4938f123815 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1415,7 +1415,6 @@ config SENSORS_PC87427
 
 config SENSORS_NTC_THERMISTOR
 	tristate "NTC thermistor support"
-	depends on OF
 	depends on IIO
 	depends on THERMAL || !THERMAL_OF
 	help
-- 
2.31.1

