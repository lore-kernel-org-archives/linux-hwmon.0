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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2168AC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE313613EE
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhEHNQj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:16:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:47067 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230473AbhEHNQi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620479720;
        bh=kiPO4E25fg0A7YfrgUl5L7sc1tJhBRaKwNGg+wK0k2g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=g2wwEzJtiwVF1sVtt37Tt7X1UnCAkENMRusjdfCmgc1K1AKoDsJCJ/Uc0ApOZoR8C
         YS0DbACeMbg49trwnct1XnwSRbI0ElA6a1fyhT7laEsWz6uS9cBbxTyj0n1clApG9O
         yLDdF7ev6mOTtWytprQiGv4HWtxATPo4Pt1idTNY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.223.76]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDysg-1ln61k1Mv6-009xwf; Sat, 08 May 2021 15:15:20 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2 3/4] hwmon: (sch56xx-common) Use helper function
Date:   Sat,  8 May 2021 15:14:56 +0200
Message-Id: <20210508131457.12780-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508131457.12780-1-W_Armin@gmx.de>
References: <20210508131457.12780-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qad4vzhfeK8fg3ZQzFX0T37/u0zr2Zqb0HaFqpEuPaMjEg7pBKI
 VGDe38OfnHY6E1MkhQgCL0cbpy9zMBSHt3FGAGKdL3vgepvjeoh6J4w9sRFaGIfIhUcooye
 SrOC7+BJKaTjr71eM3sj77gPxCbrN3C+upxEoAgHIQIBwkyd9PmjZxcYkh0Nkk3iFHh1V4T
 qwpP3Ng/ZwmluAbNGlrog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UQZuk7bG4Aw=:BJ+ACVsnZxYHGoZDwEJIcv
 t9ye04bAjOAzlkiWPZYMkuvm57VijhUCKhNO0wiPJFyNHEo1wRNo9O0NfolDr0Wbog2SPQfL2
 v9xVl4XglwFTA9ZH/1qs7GWRBcacho0CapG39qmPQ9lAIrahIfy+9bLd+1pAiMA1u/nid2rmO
 X5DENbBg30uLiP/gzNS3Q0XVkAJw9KKM/v5oRutZ/vtUZaFZSq2PA+TZVC4nwqWqmiJAyNtY/
 UWp7vOG1hQydmoEQkb7BYfJc6fniplwJcwWo2AdeSSQVVgPcbtGvEn/gVZYqkcqujXXefoxlQ
 28SYk5oWpAYMGO5Kyryk+DFR8x/xUqEo7wCixpVBKPelgUUmDrmjPPRkAjfeNK7NOwgLHx8Lu
 4TCuj62+KXfxsPQ4O9piBqSLav1E4zjiaagPtFDnO41zvbLMoXJh81DADmLg3qmkP4Q6ajMRR
 5NuQ6ssKkybqNEWEh4iZZSFDswlz/K3iZXIVil3rbdrZPPofPDn3mo/phMf4hx23NZjXeLPjz
 e3tskSzoCnuHm/guz27UQu10voY/MMKusfQJ5maIPIttWoMYjX620IoMPlyE/1em5yNAoycWM
 lK0qGiK1+teOULxM4pH6VDPZEggD4un+fNJ7Hbq1SYdfXaxQWc0EdNu4X7BbWztEqK/zvfAcL
 TSIG5ywW7FsxUggQHX+v1b0UDCp7x8/k2/Ptd//NxHWHKp6ZT88PeBSywnSOJaK4nLttDBalb
 trPTkuhOohXdBWB4IjA5ZJe3y9aqpCwpvtHZkBqc+0WgWYvr6Njeq2t2X3Y2mGK5atZupwehm
 Q1ssxskPFQTs94wRYFmKevZDvTzUht4wEmCNJXtzzdwqtt57OEWZp0HQMkprktRBiJA1MSBhM
 42cypF2kfc5WuxaB7kYS9ynJHTSFb5CU9PmijMmWb6fk71iqpwHJ5mguh6msI9lTrNoefwoe2
 JSRjjJz8wYAHXMOZ7yceB5yTSSRMAwJ+fpMPEJEuk0fGcpoK2Pw1cf/JKrTVNoLdnVyIptpM7
 XjPwsLazD6F4C6a0LUGWZqT6f9OBU4WPxuxtW6hHGZaSGSeP1gCZONccYYNkuqoR4nxVpCUPX
 /LLn7/rLmFc40MMcapj3tptHEXHEPWF0o3o6aYgk9rH0vTxfO+DULy0wrnyhu205ypdTS4kKM
 HZdtMAJsjhk/E8YRJ+Bud3pRT0I/haHapH+/gbc6bn3/EFY8+Xze7NDYyoBWgRa/DoLIo=
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
index 0b3250fc57b8..180801f80118 100644
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

@@ -420,8 +420,7 @@ void sch56xx_watchdog_register(struct device *parent, =
u16 addr, u32 revision,
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

