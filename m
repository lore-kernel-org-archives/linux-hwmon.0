Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAFBC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09C2861390
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhJUR5h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:37 -0400
Received: from mout.gmx.net ([212.227.15.15]:43707 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231842AbhJUR5g (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838903;
        bh=6FuQuYj16NdgIbX/lw2K6OzlybkRPbtSc2HFQNbFz6M=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AxKbJV2Ed0Bz/f+pFv/zG74OcYBGR8h73FocKzvXlT2C8sSjPgQfCgjYm134h43eG
         zFC8aMqNwJoRtLmU1scWPQTZSKccId8zAd2GVmdMvRnVZrOhdsPSrZaW+tUkWETiRg
         cpLPRuphyh2tCJKYagLos9q5jcJZ5yL2vwTHcRI0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M8QS2-1mZEYh2PNg-004PTx; Thu, 21 Oct 2021 19:55:03 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/5] hwmon: (dell-smm) Use strscpy_pad()
Date:   Thu, 21 Oct 2021 19:54:44 +0200
Message-Id: <20211021175447.5380-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021175447.5380-1-W_Armin@gmx.de>
References: <20211021175447.5380-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uxCblOLguGhSrsohqK3mjt+phttuXFW9nkTtaMisNHpEqE+6Ucr
 BDTjvYQ7qN2e3xppWvFvm4J5APioVEsROa6f0nTAGBajkM+Hy638tfmTfPbSNQ/LCuDYxEj
 Zi5n8nIbZNRtfhW5NbBs0AZ/rqduM8gZv4XPyBfntavpPvHYL+I1PJoOzTpiPzmGC/R5klU
 tkX8YgdIiYhmCMQfWm+Xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L0I1iPCmAqg=:+In+6yB9ZLAhykORSQNsYl
 3osJQkhBV0uMWskZNxMYdTr1RMVhqar9mireQH71bDhr3by6p8/TXP61zDmDrA7hb5PlQ0YZw
 TjciXjUe9+b6Z4kSLBc44OOut19WR3y0qeNshz5o/z/4G57zabjCrB9o8jzH2jNtFK9FMdQyF
 VigzarlHxVYlFAs7LjCZwggCbs3dhMkjQquTuR5pf8+jNLS8Qz6IHfbOOqSWt16U86cSynWRV
 ghMqhkXq9KuLe/W1S7dWm0AZmDorKPrYHOovQwnn7SHCNUzsb4w4OgW9LMxCi87R3YHf0KDiC
 DCh1gPhLgh2z3E8vXpmUGlaYffAyBl73jqZiHsZi1Y7W25AwIgywBNtrioWDRcYuYTSAyvvO2
 ER6tffCIAGDIXfoitJ/E7b+3L8FXRTz0w4l2Ft26950B78Q6XcX5urk38aA4QPzrLApJQ5G8K
 x8cKrSjE2yNjphK2ZSfXKW8z9urYSeg2G/jGBTlwMVUYO5Pit/Ur95QjAb6VTGaQhbtECT0AR
 P0/Sl8P2j3bUJgZVhW9WPlnMHevNaA2C6T8v6EIajUV/IEoLGdXlrbuXvqltceCaRh5XKebX1
 cGS2W18VIeOj6hIF7mImbyZKpTRfRwfC8RWwjIL4cT+s3qvfwUkatyWdVbJQrD6gH95ETjOys
 sBpumE4iZTBTPM/Rs97cNyr0H4/MyTYt0Q3MGmCl3qC70vFGIMxYiPuEqkxYXsTQNDgZflRyl
 CczDvi+p6GP+R8IjKmr0Jb2PJu/TOLCKoY9GsDpbGgDQ3OJ7gxSGatpUvlDU/ymcScR/8PT33
 AY/a1dIamoihG/iL0WrBxLTe5BwwiT8lJucVQEI2tUfyKBWMBV4yeFwPPTfghjGo+AaL1nIi6
 RN6fV9pyJNdx/C5PYy3iB/Ub6kCP8SWetA5kRcEy0pRdmWDUwdlJj/sjwTAP9ZJI/XsjGAmgG
 Sr+dIGWTjV8SY8BQHksF0gnzgiFWRb+lt5/u8KXFGH2nPZFu5xazcQ+9h9cVZpYdmEh25yGQI
 rEl47osL5Py6/6FClax/p/8mlUKpTBainBWi7TdtcaCkgKuVywAB+rHjf2LRMoPaW9yceVW7e
 xFrv0GcsHIrXNQ=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Using strscpy_pad() allows for fewer memory accesses
since memset() will not unconditionally zero-out
the whole buffer.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 9773d6c0477a..b0c591bb761a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/string.h>
 #include <linux/smp.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -472,8 +473,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_da=
ta *data, unsigned int cmd
 		if (restricted && !capable(CAP_SYS_ADMIN))
 			return -EPERM;

-		memset(buff, 0, sizeof(buff));
-		strscpy(buff, data->bios_machineid, sizeof(buff));
+		strscpy_pad(buff, data->bios_machineid, sizeof(buff));
 		break;

 	case I8K_FN_STATUS:
=2D-
2.20.1

