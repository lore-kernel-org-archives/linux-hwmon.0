Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F03C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Nov 2021 02:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbhKYCzk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235479AbhKYCxi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Nov 2021 21:53:38 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3FBC0698D5
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:57 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id l9so9395914ljq.5
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ISanM5Ms5QyPXFSs3B16gTrLvoGEzuF9zx/zlV2+gAA=;
        b=WLKjSj6HPpOqTWAbcRFrg0zIOcCQ+OlTNtiUCvLzSaTbunzU/tcNPqnJq2cRpzkn1z
         aEFjkRoFfoBVghp7tijrGib6SQDt01oT/i3MwRUkmR2+Xc7PsvCucpBi42TICxHPBRuv
         Q+S7wm5M9r0WButUxGGVM5GxzOGV9HNG/ftbS78p6FNaSKYShVZ6sU3/S3m0pOGocy7W
         nSJM/U+i6RI/ojewpLeYb31N/oG9SCL3S3zFNNKsotgWW4GV9nGtquGaNjLssw4C979L
         8E6oA7B7xLX62l2oTIi5C7dM+S9mT95YkGKZlVai52nP9jsjv433KVfHGZt4v3oV/F+1
         rb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ISanM5Ms5QyPXFSs3B16gTrLvoGEzuF9zx/zlV2+gAA=;
        b=N0DAC++pgxJBoKfMFF3B6squTw7EITZsWsPZS62ctrsUw0UlBeC3qJJxIyKAeknWXd
         r6Je+YaXbBESpJrRIUB7wxDTIVlRCJOwybseV/U45xfTMdid9UEhRbUu78mUjtXLJfHw
         DjP9FzrI9MGhhJXPJJe/BkJt7EEjOxOGc66+FjUq+c42+EB5+EivvKTPlesRnYnqZBaJ
         UkCvldN8tJVtrdqjq6UL4bprVlzI0i0AGERCJk2BKRgU1yUZ/X2Q8vxaP8okqoodiQj8
         TsuUhFL23Y5NKRBWUA7kt90GYCdRXRYDlZlNwskQDK8CVBjQMxGppcGXoaTpdSGD/T3l
         cjiQ==
X-Gm-Message-State: AOAM532kX88nEr7kq81Ir3wQ5AqWZxFNuUAZcNoDj8bhfru7p0faxQky
        KeLulp4g0dcLooxFtPQ7E7Qv5Q==
X-Google-Smtp-Source: ABdhPJx9La+8uLY0HFFj2ZJR9WJG3qEC4VmBHhsEEst4ujp2wA6onL/rBvrMfg8P0R/dqJUjrV5sZg==
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr21231089lje.383.1637806255405;
        Wed, 24 Nov 2021 18:10:55 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m3sm132507lji.112.2021.11.24.18.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:10:54 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 2/4] hwmon: (ntc_thermistor) Drop get_ohm()
Date:   Thu, 25 Nov 2021 03:08:39 +0100
Message-Id: <20211125020841.3616359-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125020841.3616359-1-linus.walleij@linaro.org>
References: <20211125020841.3616359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Nothing in the kernel (this driver) is using the callback to
read ohms directly. We always read a voltage and convert it
to a resistance. Drop this callback.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 034ef55d0706..8a78e899fa12 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -28,10 +28,6 @@ enum ntc_thermistor_type {
 
 struct ntc_thermistor_platform_data {
 	/*
-	 * One (not both) of read_uV and read_ohm should be provided and only
-	 * one of the two should be provided.
-	 * Both functions should return negative value for an error case.
-	 *
 	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required to use
 	 * read_uV()
 	 *
@@ -50,8 +46,6 @@ struct ntc_thermistor_platform_data {
 	unsigned int pulldown_ohm;
 	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
 	struct iio_channel *chan;
-
-	int (*read_ohm)(void);
 };
 
 struct ntc_compensation {
@@ -600,9 +594,6 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 {
 	int read_uv;
 
-	if (data->pdata->read_ohm)
-		return data->pdata->read_ohm();
-
 	if (data->pdata->read_uv) {
 		read_uv = data->pdata->read_uv(data->pdata);
 		if (read_uv < 0)
@@ -690,19 +681,11 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* Either one of the two is required. */
-	if (!pdata->read_uv && !pdata->read_ohm) {
-		dev_err(dev,
-			"Both read_uv and read_ohm missing. Need either one of the two.\n");
+	if (!pdata->read_uv) {
+		dev_err(dev, "read_uv missing\n");
 		return -EINVAL;
 	}
 
-	if (pdata->read_uv && pdata->read_ohm) {
-		dev_warn(dev,
-			 "Only one of read_uv and read_ohm is needed; ignoring read_uv.\n");
-		pdata->read_uv = NULL;
-	}
-
 	if (pdata->read_uv && (pdata->pullup_uv == 0 ||
 				(pdata->pullup_ohm == 0 && pdata->connect ==
 				 NTC_CONNECTED_GROUND) ||
-- 
2.31.1

