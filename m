Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751DAC6FA92
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Sep 2022 21:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiIJVYW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Sep 2022 17:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiIJVXf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Sep 2022 17:23:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EFB9593;
        Sat, 10 Sep 2022 14:19:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3AF09CE0AF1;
        Sat, 10 Sep 2022 21:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DDDC433D7;
        Sat, 10 Sep 2022 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844718;
        bh=R4IQiGoPF8Cgcu2LQQvPc9f/JuwxAP5+AAxE3FbmNaw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I08/xC5in6ZS+z02DqnNJSPJTzEM9Gkjo4TIyE/8xH39SJ17htNlfGUANXJM3yEvU
         GZo0iWTFG7eJ1+aQVCUcBb8oR1QUuECpoHR9Jileitv/VDcrGHZLV31g41xIEOz3t+
         pndjvtNjG4tBZM1AeA4hD9koB3D17aXgwynHiIp8QpNA5rjpqyG03RjkrGF/lPip1r
         VtUIGdSgfG0u09UEdt7FfuFj2lrouGVbMn9zhgBZj3AJ7uHZFQ5ru+aFCqISA7ee/h
         oelY4PWcPiN8smKHP+XTZ0anJzTqZBtF3tzxVXsagJnbaML8FKWRtqCfXnkvSi69d3
         mt38FX0weNaDQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/14] hwmon: (pmbus) Use dev_err_probe() to filter -EPROBE_DEFER error messages
Date:   Sat, 10 Sep 2022 17:18:21 -0400
Message-Id: <20220910211832.70579-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211832.70579-1-sashal@kernel.org>
References: <20220910211832.70579-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 09e52d17b72d3a4bf6951a90ccd8c97fae04e5cf ]

devm_regulator_register() can return -EPROBE_DEFER, so better use
dev_err_probe() instead of dev_err(), it is less verbose in such a case.

It is also more informative, which can't hurt.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/3adf1cea6e32e54c0f71f4604b4e98d992beaa71.1660741419.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/pmbus/pmbus_core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 117e3ce9c76ad..6d8ace96b0a73 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2322,11 +2322,10 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 
 		rdev = devm_regulator_register(dev, &info->reg_desc[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(dev, "Failed to register %s regulator\n",
-				info->reg_desc[i].name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register %s regulator\n",
+					     info->reg_desc[i].name);
 	}
 
 	return 0;
-- 
2.35.1

