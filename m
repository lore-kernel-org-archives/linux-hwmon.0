Return-Path: <SRS0=TjI3=5I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCBBC54FCE
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9FE520781
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgCWOuY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Mar 2020 10:50:24 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53768 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgCWOuY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Mar 2020 10:50:24 -0400
Received: from crow.localnet (pool-72-76-134-26.nwrknj.fios.verizon.net [72.76.134.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mpagano)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 4B99A34F76D;
        Mon, 23 Mar 2020 14:50:21 +0000 (UTC)
From:   Mike Pagano <mpagano@gentoo.org>
To:     linux-hwmon@vger.kernel.org
Cc:     etremblay@distech-controls.com
Subject: [RESUBMIT PATCH 1/1] hwmon: (tmp513) Fix build issue by selecting CONFIG_REGMAP_I2C
Date:   Mon, 23 Mar 2020 10:50:18 -0400
Message-ID: <3218661.LZWGnKmheA@crow>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the review, Guenter.
---

This driver requires REGMAP_I2C to build.  Select it by default in Kconfig. 
Reported at gentoo bugzilla: https://bugs.gentoo.org/710790

Reported-by: Phil Stracchino <phils@caerllewys.net>
Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 47ac20aee06f..530b4f29ba85 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1769,6 +1769,7 @@ config SENSORS_TMP421
 config SENSORS_TMP513
  tristate "Texas Instruments TMP513 and compatibles"
  depends on I2C
+ select REGMAP_I2C
  help
    If you say yes here you get support for Texas Instruments TMP512,
    and TMP513 temperature and power supply sensor chips.
-- 
2.24.1


