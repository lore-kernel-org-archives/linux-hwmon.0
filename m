Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900DDEB64D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 06:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjF0GuB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 02:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjF0GuA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 02:50:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734DD9F
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 23:49:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2WO-0006Qv-H3; Tue, 27 Jun 2023 08:49:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2WM-00ANnQ-T1; Tue, 27 Jun 2023 08:49:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2WM-000AWX-7N; Tue, 27 Jun 2023 08:49:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] hwmon: (pmbus) Update documentation to not use .probe_new() any more
Date:   Tue, 27 Jun 2023 08:49:48 +0200
Message-Id: <20230627064948.593804-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SZw5PU4M0iWanAtpD/fUEylciMSdjcA9jXuzremm0tQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmoaL4DoVwIJDtUjDtfQ10LNQVN+SHA6vF6Tcj THua8i1cc+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJqGiwAKCRCPgPtYfRL+ TgeqCACX9PA8fxNxxo24ZZa4jNfnusspqHfgPeJwcqNo1kYnXKP6Q9KmRfMlov+gNZVBU0Jd91U HS23H9LDvyaEh6eosowG2sT916T/7CNkk8GQDiGYVfEWiWC7qzdw+YaB8rHLvHT9/zMGQFksNHE Y5RYXGP9RyXaCLVedL97xw9kbbcDYnICfXpQGRbLa/7jdTQh4F/2+dplCD6wnlJ03pgvIT5i0LL WQdil3JF0GjvoFpLmAIwvSFwBXhWAZFknwOZeOvjDSck6WveZOdpYaztUwB1lPzscuUacDT1DPt sxj+ei6UglENh2VFO2QOud2GIuhTZmz+rKYSW9E4ylL06wjN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
parameter") .probe() is the recommended callback to implement an i2c
driver (again). Reflect this in the documentation and don't mention
.probe_new() which will be dropped soon.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was part of a patch dropping .probe_new() before (see
https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de).

However this change makes already sense without dropping .probe_new, so
here it comes as a separate patch.

Best regards
Uwe

 Documentation/hwmon/pmbus.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index 7ecfec6ca2db..eb1569bfa676 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -163,7 +163,7 @@ Emerson DS1200 power modules might look as follows::
 	.driver = {
 		   .name = "ds1200",
 		   },
-	.probe_new = ds1200_probe,
+	.probe = ds1200_probe,
 	.id_table = ds1200_id,
   };
 

base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
-- 
2.39.2

