Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D803CD37B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240979AbjIRJAw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240871AbjIRJAN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:13 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30448120
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-0008IO-Bh; Mon, 18 Sep 2023 10:59:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-007B5g-Ev; Mon, 18 Sep 2023 10:59:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-002Z8g-5C; Mon, 18 Sep 2023 10:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alistair John Strachan <alistair@devzero.co.uk>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de,
        Support Opensource <support.opensource@diasemi.com>,
        Juerg Haefliger <juergh@proton.me>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Jim Cromie <jim.cromie@gmail.com>,
        Roger Lucas <vt8231@hiddenengine.co.uk>
Subject: [PATCH 00/24] hwmon: Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:27 +0200
Message-Id: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3696; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0qg1LIY8LgA/pHAYOArKY7iokZXC9btVFc+1gqdqWBw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAqs1pdzj3W25Ke1lArjAV9ICnLJqlffMWNT tQ2YWH+EiiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQKgAKCRCPgPtYfRL+ Tl6xCACAGjuBwzqoIFPHGMKzGcdb6nWzOQKdgNDddK4/klAcYp2ig+myrp7hC+rbC2SJlhdXJuA FrfEQWeGarF++CKyt5B7MLX73YcuY7FWrphJQGi1crBIe6PHJCCbLymAeTM0LFNgH4hAwJ+8OvA VCWjwTyxnyuUEbZAw5HcBhe8chYARbnSqNja4d1G59lnqAXkEew2q4AFS/3mNdQxh1UWOKwIMJe O8/+TywuiydlI1Yd5QIiKj8/DOKdthFPk0ckz5SDU3OCD6QhuaBP7E7OdYFTsrm093l9HAkDUWH fBAHwSNEIWgMyaEyoUH5H4+zvs3FegLu+OmyIJRTrBJIPL+4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

the first patch allows to compile test two drivers on !X86. The
remainder of the series converts all platform drivers below
drivers/hwmon to use remove_new. The motivation is to get rid of an
integer return code that is (mostly) ignored by the platform driver core
and error prone on the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply (or in case you don't like the COMPILE_TEST one), please apply the
remainder of this series anyhow.

Best regards
Uwe

Uwe Kleine-König (24):
  hwmon: (abitguru{,3}) Enable build testing on !X86
  hwmon: (abituguru) Convert to platform remove callback returning void
  hwmon: (abituguru3) Convert to platform remove callback returning void
  hwmon: (da9052-hwmon) Convert to platform remove callback returning
    void
  hwmon: (dme1737) Convert to platform remove callback returning void
  hwmon: (f71805f) Convert to platform remove callback returning void
  hwmon: (f71882fg) Convert to platform remove callback returning void
  hwmon: (i5k_amb) Convert to platform remove callback returning void
  hwmon: (max197) Convert to platform remove callback returning void
  hwmon: (mc13783-adc) Convert to platform remove callback returning
    void
  hwmon: (occ/p9_sbe) Convert to platform remove callback returning void
  hwmon: (pc87360) Convert to platform remove callback returning void
  hwmon: (pc87427) Convert to platform remove callback returning void
  hwmon: (sch5636) Convert to platform remove callback returning void
  hwmon: (sht15) Convert to platform remove callback returning void
  hwmon: (sis5595) Convert to platform remove callback returning void
  hwmon: (ultra45_env) Convert to platform remove callback returning
    void
  hwmon: (via-cputemp) Convert to platform remove callback returning
    void
  hwmon: (via686a) Convert to platform remove callback returning void
  hwmon: (vt1211) Convert to platform remove callback returning void
  hwmon: (vt8231) Convert to platform remove callback returning void
  hwmon: (w83627hf) Convert to platform remove callback returning void
  hwmon: (w83781d) Convert to platform remove callback returning void
  hwmon: (xgene-hwmon) Convert to platform remove callback returning
    void

 drivers/hwmon/Kconfig        | 4 ++--
 drivers/hwmon/abituguru.c    | 6 ++----
 drivers/hwmon/abituguru3.c   | 5 ++---
 drivers/hwmon/da9052-hwmon.c | 6 ++----
 drivers/hwmon/dme1737.c      | 6 ++----
 drivers/hwmon/f71805f.c      | 6 ++----
 drivers/hwmon/f71882fg.c     | 5 ++---
 drivers/hwmon/i5k_amb.c      | 5 ++---
 drivers/hwmon/max197.c       | 6 ++----
 drivers/hwmon/mc13783-adc.c  | 6 ++----
 drivers/hwmon/occ/p9_sbe.c   | 6 ++----
 drivers/hwmon/pc87360.c      | 6 ++----
 drivers/hwmon/pc87427.c      | 6 ++----
 drivers/hwmon/sch5636.c      | 6 ++----
 drivers/hwmon/sht15.c        | 6 ++----
 drivers/hwmon/sis5595.c      | 6 ++----
 drivers/hwmon/ultra45_env.c  | 6 ++----
 drivers/hwmon/via-cputemp.c  | 5 ++---
 drivers/hwmon/via686a.c      | 6 ++----
 drivers/hwmon/vt1211.c       | 6 ++----
 drivers/hwmon/vt8231.c       | 6 ++----
 drivers/hwmon/w83627hf.c     | 6 ++----
 drivers/hwmon/w83781d.c      | 7 ++-----
 drivers/hwmon/xgene-hwmon.c  | 6 ++----
 24 files changed, 48 insertions(+), 91 deletions(-)

base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
-- 
2.40.1

