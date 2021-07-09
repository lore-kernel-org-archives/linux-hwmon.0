Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2D7C07E99
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60E5613B7
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhGISsP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:48:15 -0400
Received: from mout.gmx.net ([212.227.17.22]:56805 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230129AbhGISsO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Jul 2021 14:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1625856316;
        bh=qXmLFM8Vc7mghqmZtcQPTuBtbivBqqPwG+BFTUVKu4I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bMlVABXc6N6owUZiC1AGPW4NhSZs7O1Ql754qQy7HkSKH77P6dFTqRz1cyG1P+HlQ
         EspkgjZis/a2WdBcC+yXpZdJ1SVZIH8wO/PgB0PJvZ8YUVNMYuLVLwk0bHPQLBpxsu
         AilrsyOm4UgM62Q9f2lkssPiczJAimnrAS6ZspP0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.181.110]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgvrB-1lW8yf1Mkf-00hKRk; Fri, 09 Jul 2021 20:45:16 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (w83627ehf) Remove w83627ehf_remove()
Date:   Fri,  9 Jul 2021 20:45:00 +0200
Message-Id: <20210709184501.6546-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709184501.6546-1-W_Armin@gmx.de>
References: <20210709184501.6546-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yuAfjSpuC/YcdjPHLTkzrqoykPrKTjcgRBPDASJdHx7pJibwfV9
 /7UGomFYFMzuR2XbHUTC0S5CcG6c/OnnIq5rkQUBs/1Ix21+z2n5lwW8akoUuD5LKIjarAN
 BbTgmka5xyv+CZna6n/FtYO+ksDCjVeBm4ZpruPf11vpbHrUu0Y9zJTD92daDtBlladKnuD
 vyjqamAd+QPEBVlDD+QqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZTeBKDttopk=:lylYpCZO/D+6PGVwZVoxhY
 4RTu+7qVDXgGx0rrfWgKiApNvfuUtq0jyqHmNakw/w/60V6YAy6hRfXsfuJtyDsbBtyPTVpAm
 /sBN9fH6ZBgGkprXpwLsNRaZ14BNqA8lvJoRUwfbBbRDxWmKBQQctlQS2xCa/AmL1NxvKm7X8
 bAPH7De6FvWh0rm/FtOzw3G2srnFDlS6UQiuS72GnMmiIzAg7qWZVF9Xr4CvMFQTlbHkS1fTV
 yH4gVGnwQxhQ8zycBgMHsPHJJwa4+r16rJZYRKarbHOYPAmEuG+rwZu0GbvFYb7A8tLCH6dTv
 Oh3nSgkz8hbyeUwy0LHJHw1z4LcVlg0TaEPfw6lDLtAN2RhrcrgEEYrMeOp3Mk3J9i0od+CiP
 LaOO1ILyu9q/MrPu6tkTJVzzeACgcdhHOXW0w62sR2sHOpKY7BKzDCTVK0u/f6W7IzLxEx/cI
 +06NrUZf3Of6ikhpJW21lQLyqexUwwko4ke0uY622gZ8baUrmeQk2sHuXQ1Jv38NrZJUzODOP
 ZINPAuHU7merOoJ8XQLTXipsFk8ai/rMWaggA1gdSDiJyWPe/ysNEokbp5inwG7b03DzRdVio
 rOEPzyYkHxfg1q+kIs0w8R+lp0n2ABZRGpKbG3Ag8iYwrCnxGrqq54ECiW8spzrwcWzJaP3Aw
 JzPuOY7aRWjA8RpIa7i0ofDxH3cIsUpbdWwxrkLgqRhyLg6q7gAfwFaWjZV3ZOI+Yto2CqPD0
 P00xl3D/DO+SjjQWxQtETvR5AhoH3lkLJrpmYSeaw5pHdGamw9fSHhFH+F/Q1zMo9WHzK/VxM
 iJTud0zWcfWQEH1nSqtF8+yfL3NXwOMluJx26zYG0WwK9cn/po8ea2/e4YxUOdLkRICwi+DBM
 iKkEtR+xOdduEqOCXRMgC2txK8DkDki+FbAd+dpWG+qVW0X4fnQqeQs+X209AQ/OCj6Xuojrz
 YTJSTgzkLQ9HTth9Jt1zA8+Oykb57IpyvkhH1kCiaHHfm2S9veyuyN/L/7tdRcfBFd0comqv6
 fsLBjOzK/fE81HyFcUfJsxSef6mVq3c34slkFL7rWQ3oPv+wsSq54AoWARzNUla5il6znbMF0
 momAhKCpH3WOnbfjsWl0mBw8t3t3ZCvu2Rc
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Using devm_request_region() allows us to omit
w83627ehf_remove() and also simplifies error
handling during probe.
Also fixed a checkpatch issue.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/w83627ehf.c | 42 +++++++--------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 16aed90ca2ec..19af84574324 100644
=2D-- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1705,20 +1705,12 @@ static int __init w83627ehf_probe(struct platform_=
device *pdev)
 	struct device *hwmon_dev;

 	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
-	if (!request_region(res->start, IOREGION_LENGTH, DRVNAME)) {
-		err =3D -EBUSY;
-		dev_err(dev, "Failed to request region 0x%lx-0x%lx\n",
-			(unsigned long)res->start,
-			(unsigned long)res->start + IOREGION_LENGTH - 1);
-		goto exit;
-	}
+	if (!devm_request_region(dev, res->start, IOREGION_LENGTH, DRVNAME))
+		return -EBUSY;

-	data =3D devm_kzalloc(&pdev->dev, sizeof(struct w83627ehf_data),
-			    GFP_KERNEL);
-	if (!data) {
-		err =3D -ENOMEM;
-		goto exit_release;
-	}
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;

 	data->addr =3D res->start;
 	mutex_init(&data->lock);
@@ -1882,7 +1874,7 @@ static int __init w83627ehf_probe(struct platform_de=
vice *pdev)

 	err =3D superio_enter(sio_data->sioreg);
 	if (err)
-		goto exit_release;
+		return err;

 	/* Read VID value */
 	if (sio_data->kind =3D=3D w83667hg || sio_data->kind =3D=3D w83667hg_b) =
{
@@ -1951,26 +1943,7 @@ static int __init w83627ehf_probe(struct platform_d=
evice *pdev)
 							 data,
 							 &w83627ehf_chip_info,
 							 w83627ehf_groups);
-	if (IS_ERR(hwmon_dev)) {
-		err =3D PTR_ERR(hwmon_dev);
-		goto exit_release;
-	}
-
-	return 0;
-
-exit_release:
-	release_region(res->start, IOREGION_LENGTH);
-exit:
-	return err;
-}
-
-static int w83627ehf_remove(struct platform_device *pdev)
-{
-	struct w83627ehf_data *data =3D platform_get_drvdata(pdev);
-
-	release_region(data->addr, IOREGION_LENGTH);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }

 #ifdef CONFIG_PM
@@ -2057,7 +2030,6 @@ static struct platform_driver w83627ehf_driver =3D {
 		.name	=3D DRVNAME,
 		.pm	=3D W83627EHF_DEV_PM_OPS,
 	},
-	.remove		=3D w83627ehf_remove,
 };

 /* w83627ehf_find() looks for a '627 in the Super-I/O config space */
=2D-
2.20.1

