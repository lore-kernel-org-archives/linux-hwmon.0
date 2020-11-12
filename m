Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD4AC55ABD
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6183B22227
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HozFs56g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgKLJ5Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 04:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbgKLJ5W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 04:57:22 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF32C0617A7
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so4886318wmb.5
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6ib08VylLIp887er2WbX87dWDQQ8h8dYFMZ3eQ9PN0=;
        b=HozFs56gVtlvUaDwoQA81mhz9YzNKLovfrSxS1XWtah2rX6VfmUp1ZUWTMRla3xD2i
         Pw+gxhVyl9GlrbPDxC8stpfmdY7uoFYVCm4L591Fd+IXg94+wgowahNcONoxko73NRHV
         D6BR89TsbqbJBhCGAzq0t5rAQcS8KWc8zO+x6EGhZbz9vdzcNG1d0Cl1EfODQ5i/+6I7
         kf8gIi3UYKhYCg6Ry+0Br9F4ej/cyswIMqHHYtfwI5CY4jdAvx0GgCrP3gXaiyZoOIWi
         bJ/JS80piWvCAGfgHlaNH6J7PmlnZyS+OKbZENwc0LyWMoIxlYDK4MIRt8rXhIZ522oM
         bjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6ib08VylLIp887er2WbX87dWDQQ8h8dYFMZ3eQ9PN0=;
        b=Ta18sEUblaH123jJPNaqHtnnlBVZcF8XtIL0rj7agJ0YW4U2F7V74otLuNDTHbQqDA
         EJdiHH+eZr28+fjAj4FJGx93tFlkvcto3BTVXDrhM5gJYAzSv+b4+jlCUznf23yGvpSg
         mfAKBSwbSD8NGb/A8M9wXJvaBJV5kGoPMfdU3w3SaSEDj/HtYgIJOQXXL79OTp0qSy1m
         B0hI8+1FcT+F4vSQzLBjPTEqVqkDTmS3EjGGtrekZdMHeV9agYTxtOwPTCKWJApiruEe
         +E/+l3rQmhwCUklJ5qC+VR1S0qGhDVQMAxL1WhqBSLhdVZKjQKquhAH79kzUfpy/yTxN
         7fdQ==
X-Gm-Message-State: AOAM530lRu/TdWt3+A9xuiarYiJTaB1MZkHWIWqcw4TfskOGopETtn8I
        CJtZgKxLuesJ99I8la5y8wOdQw==
X-Google-Smtp-Source: ABdhPJwU2CNaJeLuqmB3l3aFxSictglV1OWNtzh7++8qhkJnEj9D7RaSDvUaMSjTCYQwifUc5RUDBg==
X-Received: by 2002:a1c:4d4:: with SMTP id 203mr8903096wme.153.1605175040398;
        Thu, 12 Nov 2020 01:57:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n15sm6138792wrq.48.2020.11.12.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:57:19 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 2/3] hwmon: ina3221: Demote seemingly unintentional kerneldoc header
Date:   Thu, 12 Nov 2020 09:57:14 +0000
Message-Id: <20201112095715.1993117-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112095715.1993117-1-lee.jones@linaro.org>
References: <20201112095715.1993117-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

 drivers/hwmon/ina3221.c:152: warning: Function parameter or member 'ina' not described in 'ina3221_summation_shunt_resistor'

Cc: "Andrew F. Davis" <afd@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hwmon/ina3221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 41fb17e0d6416..72cfdc007e609 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -139,7 +139,7 @@ static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 	       (ina->reg_config & INA3221_CONFIG_CHx_EN(channel));
 }
 
-/**
+/*
  * Helper function to return the resistor value for current summation.
  *
  * There is a condition to calculate current summation -- all the shunt
-- 
2.25.1

