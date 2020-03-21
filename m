Return-Path: <SRS0=g6XL=5G=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AD1C4332E
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Mar 2020 23:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E824120776
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Mar 2020 23:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgCUXra (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Mar 2020 19:47:30 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:38418 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728056AbgCUXra (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Mar 2020 19:47:30 -0400
Received: from crazyhorse.localnet (pool-72-76-134-26.nwrknj.fios.verizon.net [72.76.134.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mpagano@gentoo.org)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 6022C34F180;
        Sat, 21 Mar 2020 23:47:29 +0000 (UTC)
From:   Mike Pagano <mpagano@gentoo.org>
To:     linux-hwmon@vger.kernel.org
Cc:     etremblay@distech-controls.com
Subject: [PATCH 1/1] hwmon: (tmp513) Fix build issue by selecting CONFIG_REGMAP and CONFIG_REGMAP_I2C
Date:   Sat, 21 Mar 2020 19:47:26 -0400
Message-ID: <3553433.LZWGnKmheA@crazyhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver requires REGMAP and REGMAP_I2C to build.  Select both by default
in Kconfig. Reported at gentoo bugzilla: https://bugs.gentoo.org/710790

Reported-by: Phil Stracchino <phils@caerllewys.net>
Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 drivers/hwmon/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 47ac20aee06f..6edf8522447d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1769,6 +1769,8 @@ config SENSORS_TMP421
 config SENSORS_TMP513
     tristate "Texas Instruments TMP513 and compatibles"
     depends on I2C
+    select REGMAP
+    select REGMAP_I2C
     help
       If you say yes here you get support for Texas Instruments TMP512,
       and TMP513 temperature and power supply sensor chips.
-- 
2.24.1


