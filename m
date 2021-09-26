Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3B7C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42EE560F4A
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhIZWMv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 18:12:51 -0400
Received: from mout.gmx.net ([212.227.15.18]:36125 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhIZWMq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 18:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
        s=badeba3b8450; t=1632694253;
        bh=Njlopxjblt3vt45EN3BXYKPdOFGjSx57MNpWT6zD1Q4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bLrB32o6Z62eqVimWgXCa/2fYqlccvkzs/eOJwFY0szw9Xh091Br+7De/JVq9OQjH
         KePwp81h0iQzGL66wPNMsk49zzpUq9bRx8CH/ntLx4767C8AMidu9naEX0ioWP0+Bg
         CHzSewjPhe7jzRmlkNrBRz++bvXIIg1w4GTUTwKw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mzhj9-1mhtvA0HR3-00vcAV; Mon, 27 Sep 2021 00:10:53 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (dell-smm) Remove unnecessary includes
Date:   Mon, 27 Sep 2021 00:10:44 +0200
Message-Id: <20210926221044.14327-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210926221044.14327-1-W_Armin@gmx.de>
References: <20210926221044.14327-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zt3MRNz7Owuw0iFCX3k2OnwfzSzWm2FMDF6JaN3D6fhWLkGoxiL
 Ba5rmj20/02dZSt5UMD26gzE23qv6gq+FSh1NTeCjc+FwEoTEykTQqQGaRdUYbzRSf3z4kd
 +3DUE9uWib/KTAS/pWZOEMWa2gj24H9lxNm6ryQ15GVm4vsrRKuAX+aFTPe0GMqfjXqwygJ
 DJAGqEB9BxcFqa6fdSK/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r2pFTtr6NLQ=:q7kQ+R5YlBJe0rbF074VFe
 jfLCREhtFu3lcNDbQBuwI3b50RyQ4i0IMXrdQxXcA6A9nN6bKLpY1dP2NCgjoTlHJqm/wkoBg
 B6QrAiMwWbLSXuF0+TrDXrpeNPHdX+RSB5IaB+59hM3V56jxpXpwZ11KwJxCoydJ2OrrzB2y8
 WvzfSF/J3v06LXA5E0oqzMn7Dnm4z4qKhk+BO6FJG/2YidVvfW/9875Bk5rNPicwf4mqRALdz
 9ldl3MfLkkk0qbjQa6r/NLpOiJ7nIxo5quw6QQnkGVDWtYDUjv2ZHFrTqQBxkpurVY7lj6QnE
 kfPqcxd0S7O6qDkcrxKASOPoSh2O92c90yPsBpV0HoICYcVanH/vawz3vNTwhqzzr9VH+77xP
 qUAya2mjtr5TuVBbnHp5AY+WkP8ULUfHYMtjdTkCqkYb2jA+fRsVYCjoIPkO5z+7omJnoMmNj
 slHpjaJ4wXRsxRgxaJossmO+56jOGhFjePBNtKxRnhZhUE0B7U0RWLJsn3XVgbSsj1zzL5O0p
 /BIZnz3BiMCZ8AGwgsNGfxTmj7Iusd495mfdkm8GG2kMnh9WW0sPQRw5EOBvbiOT0u8R/j2zD
 cj9dQBtOnFjr2N0CH9gm4xVaTUaoJGf0/KXmx9+kHDHlFSqBceNoYOzR/WvFd+jCXoIPwfEqY
 WxFFST/c441A9cCEocFdpwzljClcrnkZatSii5Qbo/4lthajR4+g1Z6pR7tG2poVgkJFiYJ7t
 JSoy4UxZZIO5eYDdmV/UN7FaMlAEsrHM75B5CVaz7aIqFnrDSM9HWGaIB/nbQGAb92SocTLPi
 ey84iUz974nBhoO4Yufq6/u94MWzAoY7+846jaj5XCzmmV5ysVlIkUcHyiDxILvsL9B+EO3ON
 SdFqbMRM4Fr1968C9bOs9686GrXkAPkykp1tunqs36juovS+csCGaCYD3yUJSL84pRNiC0OvH
 MXP7kqAw/XdrEz7Cgg6Jk3IfZmVtK5pwOF7P8+6VAik/xsJwBYfF9FOCSduhJk05bKeanrrDn
 1naDkHWivy1RiD6hrMOyLJdwwU91Yw30qQq2SpKDFeVfyBP6BSZQaM15zhINFoqjmhpX09ZXP
 bO6fqfj1vZpsZU=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

sched.h and io.h are not used anywhere in dell-smm-hwmon.c.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 476f2a74bd8c..af0d0d2b6e99 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -26,8 +26,6 @@
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
 #include <linux/uaccess.h>
-#include <linux/io.h>
-#include <linux/sched.h>
 #include <linux/ctype.h>
 #include <linux/smp.h>

=2D-
2.20.1

