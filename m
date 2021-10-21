Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA613C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3B1861929
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhJUR5i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:38 -0400
Received: from mout.gmx.net ([212.227.15.18]:54961 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231396AbhJUR5h (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838905;
        bh=P5BZx8ckD0FBJeT759FTzHUfCFpqVzUVIc8iCkJsyDQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XfuwQQ5uLixDScplv7ElAgR29HurDS3wHsXvXeVP2SYxHcURl5CZ6apo4wB27+1bt
         BHlPKS2F2FMdtm2OY98XQpr6rdvuTxHVkMM4/3E5ZwhhE/q6orPpM6KbchJ3V3qst+
         CFoXljnnUy+os6acM6gHRhwpuJ/6NRDb61WWb76o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDhlV-1mWA9e06P1-00Am8X; Thu, 21 Oct 2021 19:55:05 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 3/5] hwmon: (dell-smm) Return -ENOIOCTLCMD instead of -EINVAL
Date:   Thu, 21 Oct 2021 19:54:45 +0200
Message-Id: <20211021175447.5380-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021175447.5380-1-W_Armin@gmx.de>
References: <20211021175447.5380-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bR3yyN/vMo5SH7ua0/jsm29b0ThcjizrSGeeF7n0J5fz1wJxjP4
 N9uGO9VjbhXQCZkOxp+3pNNjnfpIuqiXoEjZ9h8RT9wtrcqimUY9oSwRSZLlUUw+/6aDyRu
 uClpLUY3uoHZNIWXURP/KEt5kknpQGI6inFU9Ke+ubovta2tmldZ/qB7C6IKm3HqfSz2bmY
 88V01RCMn1HjLpdQjEbRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ju+sBgrS718=:uAYx12wbftYBBWGeEUZRy2
 1zbIwYHsX4jjVZPsEwqGvdwWvfi2P61N4oijoOjpH56esHJm78HooI2nQPGEayFRZdrNtLNS4
 2VsVfjxyo1GoyQoTRZebGgDDAV+V8cftXFpqsYxIUIAHHkIf0h6mU/lZRkvA3AROMry2+eHOr
 ts1Zx0kMSGKdb5wJJW6tP4Hk/Q9OGrTmdEwKRvGLTn7mxsXJHK+m1oOGLenVhN7KTH7xLmDBJ
 tQHU5c+Yk2zDwVtoNc3ORCliuwx2tnp0FlaXzXaiUz+DuIkoF252JLjbo+zsEhkc8C5u4XGGw
 +/UwZvlv72RCoGNOMcHTzn6mvIXi5CxkwgMhnNOxLnZAzRLEYjZ5USQyl7H9ZqsAB7wNrTf3V
 Oj4749uCrX92DhBbrwcrI1D2J3KMGqvlBHLgGhfYaNJ11izoJciqUO0AlI9lEOAKrWP2vcvEn
 NWgUArDOBmFsdC2LS6PDX+sphlp9QSODZtYXjgpdyDol4R6Xo+X18JgJKEJf+jgRX5QLJKEf+
 N1lyxbumQQFw95VG28GrmSG87+AzUNL5Ir5XJYZ4Zu7rCOT/Ys1ijPJe+TIVQ8pflLEfc83Ti
 R1OSINs8U1uIuq/g448Z5Pdn5SPJMuuW0JB5nL1tC7lSnduQ4XTTlTMvh551m6jd3vM/i0gdx
 ZDru4bY7zhAn/aDsXLOjoJMPF6htcOO8lgQRtL3UKp1nmFXr04jFrXh0dJFOyTz3bulo3R0ai
 S77jfyx/Rh1plADhWFR3HrdCscr541GvWMk7O9FSs+VvVBAKHFc7umo/gwzNuVDNydAJELEeC
 8w+FIwpFVaNO+qI4edfdW6EZWZxSWqxvePYEi7tZ3A6JXQGMB3DCWbcXPfTzNi7b2p/iBcJd3
 6iwqYUTTdB6b9do/uqkNxGbJSoHevVq8AFie+RurumSUfjbnLaD2sDaNTacrfC25/n1ERFejA
 9rEeq2LVS4io9H08DR16jdNlUWkUB3IbGxhfuFHi/h0ogl96k/bwgRBcfWENKmIFx3hcItVEK
 OKiCDwCPijhIiA6uJ/rLh8aNM2c9JvTwwRFfmGN0e3tkAQUe1yLB/UoUE9HphB7JaANtfaGRF
 gbKFaNpeKpOxwo=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Returning -ENOIOCTLCMD gives the callers a better
hint of what went wrong and is the recommended
behavior.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index b0c591bb761a..5f0338b4a717 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -516,7 +517,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_da=
ta *data, unsigned int cmd
 		break;

 	default:
-		return -EINVAL;
+		return -ENOIOCTLCMD;
 	}

 	if (val < 0)
=2D-
2.20.1

