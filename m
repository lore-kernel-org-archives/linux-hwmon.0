Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621D6C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 10:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DB7A60234
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 10:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhA3KkY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Jan 2021 05:40:24 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:57730 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231179AbhA3KkY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Jan 2021 05:40:24 -0500
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 10UAd7B7015772;
        Sat, 30 Jan 2021 13:39:12 +0300
Received: from oak.local (unknown [83.167.113.121])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 308AA508A;
        Sat, 30 Jan 2021 13:39:08 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-kernel@vger.kernel.org (open list)
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] hwmon: lm75: Add NXP LM75A to of_match list
Date:   Sat, 30 Jan 2021 13:38:22 +0300
Message-Id: <20210130103823.28914-1-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

NXP LM75A is compatible with original LM75A while it has improved
11-bit precision.

https://www.nxp.com/docs/en/data-sheet/LM75A.pdf

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/hwmon/lm75.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 3aa7f9454f57..37dc903ebf54 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -699,6 +699,10 @@ static const struct of_device_id __maybe_unused lm75_of_match[] = {
 		.compatible = "national,lm75b",
 		.data = (void *)lm75b
 	},
+	{
+		.compatible = "nxp,lm75a",
+		.data = (void *)lm75b
+	},
 	{
 		.compatible = "maxim,max6625",
 		.data = (void *)max6625
-- 
2.26.2

