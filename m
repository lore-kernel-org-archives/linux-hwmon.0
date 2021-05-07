Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A35C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72675613ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEGVZs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:25:48 -0400
Received: from mout.gmx.net ([212.227.15.18]:52353 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhEGVZr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 17:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620422671;
        bh=s/e+/0/neoS4yPRhwnYOVLWsTREaXhubwJPzHDve9K8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=fbD+70abqxrPG+ZC9mGGoiJ+756by2wCcYSxGrzvPf1MQx6jbpLLnLebbAeQBCsY3
         +0RY1xE1BoBOM0RMLbmco2lACuxDcCPSGlO7jWOebu3CwpvYUBCjKaPaq+7qlceivE
         nHxelwZBdr5Awgy0Xk6WZZjKNfbK6uDYJcIoACJ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.209.175]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N33Ed-1lX44I17aX-013MWk; Fri, 07 May 2021 23:24:31 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH 3/4] hwmon: (sch56xx-common) Use helper function
Date:   Fri,  7 May 2021 23:24:03 +0200
Message-Id: <20210507212404.6781-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210507212404.6781-1-W_Armin@gmx.de>
References: <20210507212404.6781-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZOnIqvfqD/+xhi8Dl+ndbDyOG6wXMl5kjWN82gqA/Ys8f2QLFXS
 QEYWoUCiN1FwxAvVX4RDHO05m6xnqz6AP4PmJUC07ZrF/hpWthsnpiAD5EqX9kHqSH1CIMS
 gOdCqb9Imf3J42QUNjTYWDZ4sCucc7GM7y3kPKegFsLgcy1kee1APwlrhCwPYAdanjasfAA
 hj+y8srm7cpEUn/9+kNIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tuxNSZvYQiI=:ze/r0hlz7fhcGU6K2BSvqI
 eP+rFbuR8O4myy32PnJhAZ4kxqLbiOVRMxqHE/P+AU8W9n3qcwtNvDUXXJSWx4woab8ZpROR+
 RasyKwMUixoCgX/CRNfDu8TCQk0OI61i894w15syXh2RCyuQt1p5eVv7h+W+8cwdU75ydURr/
 u6bhRK0NySDCWFncH2a2EstybJdgni3pkkKluFcOTfTY0RjGqNfH+2Mm7KJ2acxeTvmsVGd0b
 pVxnLks6+rWFTAMchHtiNDxn3lxAwqk9uGe4AlDqNs0SOUJrP7mvTQJPXQWtvN22xqmavnGbl
 D3ep8wPNZZDgcbbVsqf09RGPfQ1VPjd4kpUmGXm22YvAhGNQHlntMkmaoFKDXu8zufej5A23h
 wAkO/qGW64dbQsS0rItDcrpB+gH1ipp73Cr00eTT6pEmFtNorvtu3vh5BBs/c66Oj2O/RFmnQ
 YyXAOh/JGv/Oh6rNVKe8qE3nRQ6nrcreZfV1QDsU4HOpAb6tmW7/YU6ghn+Mk9o8qLGIY+fce
 b3N6myTLB9UVNyizILeRc7DPiFo1LtZIBKNRbZ1C3B+C3nYey66sZVgsWgcmAvymhrLjyvJ82
 SCylwXSyZOdacFVAuB4SWbEKstjp9oBOetvf0fNs1NMDS29DMyABLuGi9rpfXDk3bRCO5TKaa
 tiy3joob2jzxbrPCNqPVNnam2Koxhw65ByWab6+/9NaFdFBK7C/jTDUykapBYmr33snuN8zzS
 Cb6E0nOjvkY2ae1avu9fWOLRZVxd6QaSxN0BfOGVWECRTTUAKeje385k6lHRrsYmWseCTVz0O
 kt0F10Ee5JFTJBdVb8jbOh4fsFq4i7AEFSydm0yF6RCMjLB2SJrZ1tqgwyQsIqGsYXk0/wR3i
 aS16mBxDDvSXFBzztVAjLbuKFIJuTucIe3i4hp9NeDPu7qckzgQ6Hr9m+IT+r9aenmzTUWVMs
 eGuNVp6pXkQoGJuXLVdwLlatB5SiIVJVaiLeNgdFbbaSdxOYtAqnw8f00VmaIOXxekUl4LMWi
 5VhE8fGdGWIhcukYezN7KY2QkLk8f08z+t6jDjY1FpgtGCwRZfs1wmdntZc7rBCfrQLVhEi3d
 sPFddew6me3bBwISPn5wbGpLHi/fYppSptvTZCW8mjDCZzOB/6E0aswsuU7r6QrQYuvw6mpZV
 tIaF6EZWc3h1KnQ4c3HVlDNXAH+dVx6QLMgZako6I9cDr5+lKMP9LDhPjJcbQBKF4F82c=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use watchdog_set_nowayout() to process param
setting and change param type to bool.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch56xx-common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common=
.c
index 2d7bf017b2df..2273943960bf 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -20,8 +20,8 @@
 #include "sch56xx-common.h"

 /* Insmod parameters */
-static int nowayout =3D WATCHDOG_NOWAYOUT;
-module_param(nowayout, int, 0);
+static bool nowayout =3D WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defa=
ult=3D"
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");

@@ -420,8 +420,7 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_registe=
r(struct device *parent,
 	data->wddev.timeout =3D 60;
 	data->wddev.min_timeout =3D 1;
 	data->wddev.max_timeout =3D 255 * 60;
-	if (nowayout)
-		set_bit(WDOG_NO_WAY_OUT, &data->wddev.status);
+	watchdog_set_nowayout(&data->wddev, nowayout);
 	if (output_enable & SCH56XX_WDOG_OUTPUT_ENABLE)
 		set_bit(WDOG_ACTIVE, &data->wddev.status);

=2D-
2.20.1

