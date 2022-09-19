Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AACCECAAD3
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 10:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiISKrI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiISKqq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 06:46:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5674527FF5
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 03:32:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4F-0007mC-RA; Mon, 19 Sep 2022 12:31:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4F-001e1f-VM; Mon, 19 Sep 2022 12:31:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaE4D-001w9R-DP; Mon, 19 Sep 2022 12:31:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jim Cromie <jim.cromie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH 0/2] hwmon: pc87360: Some cleanups
Date:   Mon, 19 Sep 2022 12:31:53 +0200
Message-Id: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ic+SgBr/8QGznmfMwBoXGptFx50alqN8vXt8kMI56KE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKEUPMdxBxXjuREqkEie+pBDP0qESfmoPDoXM92Eh nmGqLsCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyhFDwAKCRDB/BR4rcrsCQm3B/ 4xuOte6sviJ0fhgRRNgBakrPkZEpZsS1fSHfzdvCnyV2MbLI/oo4rNN08seTopxqdwbRWmFFBRtD1p EeeBDXspMeFxDErD5ogT24J1gc9gB2Qd2Ixjo92kUaG5NQutF64SPoH8X3pBM42FIBmDhBwEIP88/W lx883zV4x/z/6AajnVpF/gnpoLFtuTm7xQQVWQNpiX5P2eCbkdEA+bPmYPn2hQR54Kna+8FYP6S9cn DGPRSaBaUZuohQgAjGKGU3iCk5dkNDqwS9qHmVvTyA1Bba7cVuxLjPPpU48I0ATfEn7L/LiPjOyLmN Zya3eVwDq5x9L6TyJuivU/z7RA+c/G
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

compared to the goal (i.e. getting rid of some forward declarations) the
change is quite big. Also the diffstat is positive because I spent some
more empty lines than the original driver. Still I think its worthwhile
as it prevents errors like
https://lore.kernel.org/linux-i2c/20220916090802.261279-1-u.kleine-koenig@pengutronix.de
.

Note that the 2nd patch isn't checkpatch-clean, but the problems are all
"old", I didn't touch any function bodys, just shuffled them around.

Uwe Kleine-König (2):
  hwmon: pc87360: Introduce a #define for the driver name and use it
  hwmon: pc87360: Reorder symbols to get rid of a few forward
    declarations

 drivers/hwmon/pc87360.c | 1535 ++++++++++++++++++++-------------------
 1 file changed, 776 insertions(+), 759 deletions(-)


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

