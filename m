Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA176C433E6
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Feb 2021 15:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 575B564EC4
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Feb 2021 15:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhBXPqr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Feb 2021 10:46:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235862AbhBXOqt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Feb 2021 09:46:49 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4DBC0617A7
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Feb 2021 06:42:40 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id 7so2143184wrz.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Feb 2021 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EgUEnyJu/P3709V222xt9PUcmOUvMnUAFsY0bMwnwt8=;
        b=eL6+4Xb1pR/CPkBOwcJnNsjuIt00pQ1rGiBu5DnyjFAKDikmDdWGVspex8LNluYyK5
         RlRkVeKiJwToE3Tc6NvinhMotYLrZoRuqa7XlYdGA/jqeJa66w3IAgSnSgithdBOZ5P0
         IuBP+S3s70OiyuAgClsdvDkDq+mfPQhHdsd6cgrPL08qB47aGd88bQxPDzH9Uy2YxKx6
         pbmHFlhzGP7LECKn9J8iA0PZpmpAn1fRDfm/kPLiFNmLHsBEDuBwhGMWt867qN29kiGw
         lI/fPHMR4Xz5uXoC5wKbltFUAx/LdwxHAt3Mj9RaX53blgUuo1PpyxJLP40/QO4Bqkv/
         TUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EgUEnyJu/P3709V222xt9PUcmOUvMnUAFsY0bMwnwt8=;
        b=Wz4aDheq3R3pl5ZvJqekKCdUVFaKSQ9FinXyZDjO0ZFM0POupjgNQD8S2ZgCawGy3w
         sGr0n9fuKJz8O53x5uyFG4dRLCr6tOYekoYmXquPVBE//1ClxoiTNhU9Uq8G3rCwhVx/
         Fe4AfdUwaggotXw0uPksAjAJ6eB4of2gQQlWizSBA0wMekRh6QgkwocfR60Xw2GM7xYQ
         XVWoYqzJ/Ylw4Hc0w8tO9+Jv4DMyxQVtElJkyg1KxMsxK0Z2grUjrdCzY00ZG8r2nPUK
         Y/Xk/Xo+ckgWJMSbV3NYAd92MmmqC10MRQvnB4nLjrh6AucmaMBr0HLIYWY1J+HFV9TS
         3caQ==
X-Gm-Message-State: AOAM532d7Vtk3vWB0M0OMid68QeRPRDdWGb3hwyM9FjvXO4l44q4faWh
        6Sg8LETWa6QOEU0e7sjFmjRb3A==
X-Google-Smtp-Source: ABdhPJy6oa0zxrD392i6w4EiM4SUJqNf2xFVfiqJEZ3cqLJqPenbPKYlB587VlgqsGQlXKDEaP3Zsw==
X-Received: by 2002:adf:d088:: with SMTP id y8mr30526431wrh.101.1614177758831;
        Wed, 24 Feb 2021 06:42:38 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-157-252.adsl.proxad.net. [82.252.157.252])
        by smtp.gmail.com with ESMTPSA id p3sm4170669wro.55.2021.02.24.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 06:42:38 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING)
Subject: [PATCH v2 5/9] hwmon/drivers/mr75203: Use HZ macros
Date:   Wed, 24 Feb 2021 15:42:15 +0100
Message-Id: <20210224144222.23762-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224144222.23762-1-daniel.lezcano@linaro.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

HZ unit conversion macros are available in units.h, use them and
remove the duplicate definition.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Christian Eggers <ceggers@arri.de>
---
 drivers/hwmon/mr75203.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 18da5a25e89a..868243dba1ee 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/units.h>
 
 /* PVT Common register */
 #define PVT_IP_CONFIG	0x04
@@ -37,7 +38,6 @@
 #define CLK_SYNTH_EN		BIT(24)
 #define CLK_SYS_CYCLES_MAX	514
 #define CLK_SYS_CYCLES_MIN	2
-#define HZ_PER_MHZ		1000000L
 
 #define SDIF_DISABLE	0x04
 
-- 
2.17.1

