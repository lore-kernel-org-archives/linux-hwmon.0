Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD60AEB64DD
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Aug 2023 14:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbjHCOod (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Aug 2023 10:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbjHCOoY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Aug 2023 10:44:24 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FA3423B
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Aug 2023 07:44:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977e0fbd742so143518966b.2
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Aug 2023 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1691073847; x=1691678647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r+9XHSegFpPDIn73xAFAT26b/ix75Yh9T7lUlxBALs=;
        b=FaOC8x9foorB/DO/xUejSHl7q5/x/eaarUpwmM866XgP3aUu+ZqAG+lPd0XBHXK6jL
         A2biSOSS/ai/aDzO7o4atvi46CkL55u+zOn5zjpp/aNbfETdAGwvvwM0M7LXDVBqbM2n
         J4FDJlX/KAVK/g972SkegOgBw4wBnE7MKzIK+v9ga+z+OifTG9SADRwui82BXBzsaSre
         ZzfPzodjb5FCRfiWIrmreD9oX+vFTz7nG6NkSC7E6Su7pTjfkDUy2BlceHYefsWTUz7b
         FQERfBJJoa/Lz+y1Z0R2x0+O80RX6wxYdowCIcPhjJrAEwEXH33WejD6GmnLB2JWRgZf
         ymOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691073847; x=1691678647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r+9XHSegFpPDIn73xAFAT26b/ix75Yh9T7lUlxBALs=;
        b=E6OQAOnswcSkvYCBbjK1hefo50Ier/rT+vhuH4Tp/d6tvmNz8bCgl0rvbRhiqh8jFv
         +ljQn/JG9wi1Tl32+HRSlnyEhl413DQluqCcw1AYCcl7lwUIMkX47FuZ5AQ83xnjEsRL
         G9pUa5wIIsKQa+zWQhk7aX0uJangkFkFMyP1yu26ez/a/PDL1bJnrMOpHg7kz5AhI+nJ
         oN2DiFrz9fgfW5/76iCeAXsKoOD9sxinvMNO2j/dOK/PIdnYKyv+bg11oH3rQ6ha9wBa
         ZidbiWkYntHJVpa+yM6rLoYIvYLzAaaXjSIzFLy99Xp2iqZggO9trwZiUSgIlmVjRTqt
         z6Rw==
X-Gm-Message-State: ABy/qLYj5uFtqHrQLBoPbL+4IIqeEbEMoVELExdEvJt+gsEg3VQS/iVJ
        m+2bDUg7/AlBUhcrydbFc2I97Q==
X-Google-Smtp-Source: APBJJlH1vFggjc1HEMg1YK1GUi5k2ulIewhgqw/1pZ4nEJmwY8skVAKd+7C/ZYk27qxLRyS5V/xurw==
X-Received: by 2002:a17:906:53d3:b0:99b:d9f3:9a98 with SMTP id p19-20020a17090653d300b0099bd9f39a98mr7885996ejo.74.1691073846843;
        Thu, 03 Aug 2023 07:44:06 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709064f1a00b0099bd86f9248sm10629859eju.63.2023.08.03.07.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:44:06 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        krzysztof.kozlowski+dt@linaro.org, Jean Delvare <jdelvare@suse.com>
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (max6639) Add compatible string
Date:   Thu,  3 Aug 2023 16:44:00 +0200
Message-ID: <20230803144401.1151065-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
References: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use maxim,max6639 as compatible string for the driver.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V3:
- None
Changes in V2:
- None, Updated DT patch
---
 drivers/hwmon/max6639.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index caf527154fca..aa7f21ab2395 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -618,11 +618,17 @@ MODULE_DEVICE_TABLE(i2c, max6639_id);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
 
+static const struct of_device_id max6639_of_match[] = {
+	{ .compatible = "maxim,max6639", },
+	{ },
+};
+
 static struct i2c_driver max6639_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		   .name = "max6639",
 		   .pm = pm_sleep_ptr(&max6639_pm_ops),
+		   .of_match_table = max6639_of_match,
 		   },
 	.probe = max6639_probe,
 	.id_table = max6639_id,
-- 
2.41.0

