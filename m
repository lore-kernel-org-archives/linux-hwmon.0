Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8437FC001DE
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jul 2023 08:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbjG1I1R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Jul 2023 04:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjG1I0M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jul 2023 04:26:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A07D4498
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jul 2023 01:25:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso3223968e87.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jul 2023 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690532730; x=1691137530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+/sikRBn/Qq/vhiRc3RFGPx8ZtUHA2efcREJGjKdqM=;
        b=a6wvT+HptneOSc+E4hHf1hdtSU8Ut4nKTvXZ+ldBeA3GKR3OCW4sBA+dpkeyDnLnXr
         3Y2DooqKud8CCL1CLCxaz1T0leNINHQroqb31w7CGsI8aVpui9SXzFUCGHS1WbI2TncQ
         E4CAE04FidMlyKcFY6gfqcHbXKgD1XcpC7LvnNeJKeMdO49e8DvkR5Pv1BVXlg3MpTS7
         ypDP2jAAowOrm+M9ZbzeN8KCaJEvP0lp6gQiMyh4/yXPYXGr7g4LcbiAN1Q7BnmByaew
         RzS87VhK07u9g2nk7VsP93D2jVs+4BGlToY4alPzwbIW+GiDHaYLTu3SwBbW2BQ0TVMT
         BheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532730; x=1691137530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+/sikRBn/Qq/vhiRc3RFGPx8ZtUHA2efcREJGjKdqM=;
        b=mBiqvMOFwiPzwteoOkRHk+9Odugw4bjESz+7DL/KrUtB6uwMmtUHCFWnRcDT8dcKo8
         TATB6G1l6YaKhfPOfE65+6oBvUh4fK8cex4bdEuWK4giMaHZ9lIobGcC7fHrOa9pW9RM
         t4HZ+9Z2xqtwfUMA6tH3303OWQfDrEoY7t1aiMe3UZDxLopNAWrU5RiPzfVQGXJGycj/
         hYulQh8Yn0m0YNdZQIbPGNDClbgwoBMCmJDls7qBTD/V7iqOEK6vJj+qRg/XDfj3m9O1
         VwlLr5V5I3z9HiT9UN29gJ6GPeHIdIOl+mdR+po2gomBp3S6Y1J+YQknOuIq0xxi8sfB
         M86w==
X-Gm-Message-State: ABy/qLYC03pwACO6iGlZ5w7BBpG6IRSIHeheoCW5VX/0sPPnq+VUBXK9
        Afr7MvZtSBWHbznQE9Z3SmDaZg==
X-Google-Smtp-Source: APBJJlFJYFpVrudkH9/gBxh+VLEkEr5aNzgri6auYrGP5Nlc2hAPg0rkZvqSL0hE90hcP9VbYUKDNw==
X-Received: by 2002:a19:711d:0:b0:4f8:5905:8e0a with SMTP id m29-20020a19711d000000b004f859058e0amr1025135lfc.6.1690532730535;
        Fri, 28 Jul 2023 01:25:30 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id w11-20020a1709064a0b00b0099bd0b5a2bcsm1753729eju.101.2023.07.28.01.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 01:25:30 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/mp2975) Fix PGOOD in READ_STATUS_WORD
Date:   Fri, 28 Jul 2023 10:25:26 +0200
Message-ID: <20230728082527.3531940-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

MPS returns PGOOD instead of PB_STATUS_POWER_GOOD_N.
Fix that in the read_word_data hook.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 28f33f4618fa..410b6eae6d02 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -297,6 +297,10 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
 	int ret;
 
 	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		ret ^= PB_STATUS_POWER_GOOD_N;
+		break;
 	case PMBUS_OT_FAULT_LIMIT:
 		ret = mp2975_read_word_helper(client, page, phase, reg,
 					      GENMASK(7, 0));

base-commit: a4bb1ce5b9e3ca403c04e20ebeae77fd6447cb11
-- 
2.41.0

