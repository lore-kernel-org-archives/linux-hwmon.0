Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8880CC63777
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 00:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FEBC20706
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 00:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R88iTfRV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgLAAcC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Nov 2020 19:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLAAcC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Nov 2020 19:32:02 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439B7C0613CF
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Nov 2020 16:31:22 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id y7so21092407lji.8
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Nov 2020 16:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/bKBturRyIf9vMXnB4V35qfxrB0eSEPoc0/x0nF2eU=;
        b=R88iTfRVb4F7Pq1bsAQjgSL7Jfetnmbut1dZQgSQmn8Wk3qzqs4NVHIsDq3ul55xxY
         deQC7k6sMchjPYAf9ZKrsLgbOILTiNNoE5dl3uaCLcZuGyIXPnfYZc4IAuN4Ex915pJQ
         QiLLylgjJihakVxmX0udSjcclnJfbkvM+LvAayR22ITiBsvUgOjGhOKNUi0/Z4WAdpKB
         lXbRBeOzk7tDn+nlOY7TDuvR0ORhz0mwN5bQ01qVKb8NROkmx9OLuxbNMW2PTIo9PQGV
         kbAN/qZ4y+AKdDqbQSOSK0M0wdCvuGHkgilFf+AJ+fJn0An6OX8pfCCidAuEdfKDu8kw
         es3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/bKBturRyIf9vMXnB4V35qfxrB0eSEPoc0/x0nF2eU=;
        b=nytMMwLbA8X4+qIW2gnHQEPPZ6D+Mb2TliUWbYZnaGzAvaK3FeLWUeAZ/Rb9k8lTpY
         nkyuAbYaIwp1nSoFe+0rXw4v2ObIq+1rrpDJA81/ip8UI0a2S1WKHfKJdT3LrmPXhN/u
         z9RjjgF82/FI2qDNog7oStIQ53SSOsFkqaCBEoSLE7nVTM0mgcHuN88JgrxEcyAp777b
         2P1y//tyXvWGpXfnbjokmKOt2/oZKwaLlgGcyhTkh2FkRTQ6Y5cALAGM2yHeJ3JZh1/a
         cRHg9TaIeSTs+0ZeVpfpy0N87PZ9NnPRhAAuutitj5Nsskf/iNJlNE6xhbot7hcu3mmv
         QHsQ==
X-Gm-Message-State: AOAM530ylDzkGAgwxM06odVOubsxwXnvbQdqINfSdpm8XzVtsPElfnbu
        HWdEur6kt9bleN2oIYUv8j8Ynw==
X-Google-Smtp-Source: ABdhPJzidyDJ/SYMmPFhPBtHSfz2wcKljDTL5MCm/DZKMEPBh4dSfw4K/awKjb+x64TjviAtHEW/sA==
X-Received: by 2002:a2e:878c:: with SMTP id n12mr91604lji.319.1606782680750;
        Mon, 30 Nov 2020 16:31:20 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id f10sm24868ljf.26.2020.11.30.16.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:31:20 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     b.zolnierkie@samsung.com, jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] drivers: hwmon: pwm-fan: fix warning unused variable 'ctx'
Date:   Tue,  1 Dec 2020 01:31:18 +0100
Message-Id: <20201201003118.2219422-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When building hwmon/pwm-fan the following unused-variable warning shows
up:

/tmp/drivers/hwmon/pwm-fan.c: In function ‘pwm_fan_is_visible’:
/tmp/drivers/hwmon/pwm-fan.c:167:22: warning: unused variable ‘ctx’ [-Wunused-variable]

Remove the unneeded variable declaration 'ctx'.

Fixes: 439ed83acc19 ("hwmon: (pwm-fan) Convert to hwmon_device_register_with_info API")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/hwmon/pwm-fan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 57b574837b58..777439f48c14 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -164,8 +164,6 @@ static umode_t pwm_fan_is_visible(const void *data,
 				  enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
-	struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
-
 	switch (type) {
 	case hwmon_pwm:
 		return 0644;
-- 
2.29.2

