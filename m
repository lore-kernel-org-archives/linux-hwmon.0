Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDCBC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 20:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BDAF6124D
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 20:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhIWUM6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 16:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243037AbhIWUM6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 16:12:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099E3C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 13:11:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mTV3x-0002pI-C8; Thu, 23 Sep 2021 22:11:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mTV3t-0007Wk-IN; Thu, 23 Sep 2021 22:11:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mTV3t-0004jg-HS; Thu, 23 Sep 2021 22:11:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] hwmon: ltc2947: Properly handle errors when looking for the external clock
Date:   Thu, 23 Sep 2021 22:11:13 +0200
Message-Id: <20210923201113.398932-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=HJozn2Pw9VxQocmeJfdm4LvOU1pw0vKTR6PWVDY1h6s=; m=2b1YvCAun5FF3xo8KjFLCItckf2+jvmS6yQkvEJtp/0=; p=Yhp8gbXY66yMzqSmAbShiEVQtL08ZkRpTiJ0U5IN1tI=; g=34b6a1bc12c6c666d11cae8561cd5c1d9e0b3a1a
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFM31wACgkQwfwUeK3K7Anp8wf/XHM 6WYFvQDCfnQubn+sUNYaF3jXJUuhlv4D0euut3HzI14rVUaBloHawRgXxYBE+3NZw4buB1gdVkGfJ 1Id3NINhTheb8RTWpO+KlD4HTJCgIlfaB8wg6JuNMuLzul1Mo6Q8bTM4c9dqYESF/lsgaa2RNWd2K BqSd/ncOeXk9kY10ebcmBcqBWHL22F3gF0ncrzN6SsOk2L0xvkNE1M8WNbSlt8XvhF8T/crpQyq7e RTIiYyGiELmqIb/kNr7rtDjknzHuLx6sAxmdn9nFYkBilwnZPPLZSSLJ6Pj0Ft/NpNZzYjl/kaxNI YDXsBqhgRMicpV/FLV0tBnijsNsjnAA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The return value of devm_clk_get should in general be propagated to
upper layer. In this case the clk is optional, use the appropriate
wrapper instead of interpreting all errors as "The optional clk is not
available".

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/ltc2947-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index bb3f7749a0b0..5423466de697 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -989,8 +989,12 @@ static int ltc2947_setup(struct ltc2947_data *st)
 		return ret;
 
 	/* check external clock presence */
-	extclk = devm_clk_get(st->dev, NULL);
-	if (!IS_ERR(extclk)) {
+	extclk = devm_clk_get_optional(st->dev, NULL);
+	if (IS_ERR(extclk))
+		return dev_err_probe(st->dev, PTR_ERR(extclk),
+				     "Failed to get external clock\n");
+
+	if (extclk) {
 		unsigned long rate_hz;
 		u8 pre = 0, div, tbctl;
 		u64 aux;

base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
-- 
2.30.2

