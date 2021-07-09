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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F038C07E9B
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 124CA613B7
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhGISsN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:48:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:53069 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhGISsM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Jul 2021 14:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1625856315;
        bh=9LcQpp3m/ahJecdV0AqlluddWgR2Iqf01zcdksGKoUc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a+qKKTTQePnTwOj1h4gtNO8xF5mucFYY1+vOoPFeD5lC1Y5zU96WPbrAHr9SjouX+
         RXhATML/T/LpvuSuRgcWyHqF33rVsVETiIC0/jfXU2TD/QdWe66jwT8fezIx5DFei3
         T+tPfrdhMo8PyC8cae7R2jjLOzdqsMWrBOzbWHQU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.181.110]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mqb1c-1lOD183QYa-00mZOs; Fri, 09 Jul 2021 20:45:14 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (w83627ehf) Use platform_create_bundle
Date:   Fri,  9 Jul 2021 20:44:59 +0200
Message-Id: <20210709184501.6546-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709184501.6546-1-W_Armin@gmx.de>
References: <20210709184501.6546-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mmeigJTo1DgUToqxfEjzd3hB/fLZvhNU+c/6VrP02ycb+hWb79m
 Dj4VvzSSHsMMsZsspE1BIx5KlhEfxNTvtZAQZJrXh0l74ARYTObgU3VfxPYM/kh/VQo0gIX
 xZI1K+CTSQJBE1BGpQ5gjAqGZywXjirTdkTU9lgCWb7uLTskcasurmVA8RPNicsFr6PzPo1
 EJ8C9DzuJJeUA1Vmh4Z9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vuRYiIHDh0Q=:A5MBgr6EcDVwQezMEY5sMM
 LJ8ssweqU29rBdK37UpGk1l3+J/4tTPfi1ccGzKdiCMZesz4zyI3CKtip3t9L5N+46p+QI63E
 eG4PxaCds0XMBNDE2BWXCwfX9r2wD2P86Oxrv/ytP2jllYmCQsaP6fsD+KGJODcK9I/FFhkZm
 Rqc2A0UFO9PfNk0hsLoBJFWCbHLGjME9wTOqf0BZws2zSuTiBNbA0ZUg4UJ/MNTvS4YCDeIT1
 ndI4n/SSUGkcgWKAtIcYr0FLhfli4rdmO+F6h00nltKkpf4fP/iRQthCGTzsJGyE1TL5oJ3DA
 zRjIMN6ncbOSNLdzmeGwlUYEyOzN4dpRSP+87YawGgSOeCmG1LeUYPt/zMNc/ODWS4kzoqqaF
 DkwTETWpK2JI2qYokyUXs4JWfmsVrdOqk7gva3T7tezFDUOU2BRsEaMl6ovoUPQqReiA93RxP
 702nTbl6RCqTYVWAAksE35vLDVts670l0lX2E1/ZeuBU8uUByf3e6wWYSVTMEvuFVj9NMXGXu
 J1fOWqO66Cgh2fTwmZaQUTBLIUqzCiJA3esuYBWvWA0hseqPk4CE1MMUTeYxG7CeVAlA7iJbw
 YFOpH9xDHvZba3ZSVknnrMPwbV8HJ3iqOAvKW51WezUarPMaHKMkqyV64YKhasFpG7Lf1oVmO
 VajONqNm6c/GWmGCuQs6tSsspoVkf8hYQa0XHIualRpsNZE/A4D2sncQZT49AI2ahJnUyJqcA
 Y015pTn41Od1/GU0vXnoR70u8wiyT0oDJA/Ndk8jsoZEIje8DWTj2PXxwckOoH9EY6WnFoqLo
 5PhSXPNT+BiO5uMkLWJSUCqj8/5Ovr10CYMxs7DGtsNYjtcfMnV7YShJeiX+gVF9uxi9gb4QS
 SJCC3VQw2+XEwIeNncDq+iHeIucWrO+ClTW+YQKqf55HA0X6QVsoUuVQkHwa12pBYrQ3E4SCY
 ln4fNYr/258ZpKiAmmtECs6XYOEZOm9nCSCSnIAVIuRKb6/DPkbePEU+gFRwVQVJY4THWSoBF
 S+4IQfey+3bKlvhf8iIz1QtEABo4E8sm926jGAtyXwgrXvc48lmcoH/I1aNJDXnPpcLXdUie1
 iy+oGsblhUcgFjta+3R5H7xvL/JHhfFHz76
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Using platform_create_bundle() simplifies the module
init code and allows w83627ehf_probe() to be marked
as __init, lowering the runtime memory footprint.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/w83627ehf.c | 57 +++++++--------------------------------
 1 file changed, 10 insertions(+), 47 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 8618aaf32350..16aed90ca2ec 100644
=2D-- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1694,7 +1694,7 @@ static const struct hwmon_chip_info w83627ehf_chip_i=
nfo =3D {
 	.info =3D w83627ehf_info,
 };

-static int w83627ehf_probe(struct platform_device *pdev)
+static int __init w83627ehf_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
 	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
@@ -2057,7 +2057,6 @@ static struct platform_driver w83627ehf_driver =3D {
 		.name	=3D DRVNAME,
 		.pm	=3D W83627EHF_DEV_PM_OPS,
 	},
-	.probe		=3D w83627ehf_probe,
 	.remove		=3D w83627ehf_remove,
 };

@@ -2150,8 +2149,7 @@ static int __init w83627ehf_find(int sioaddr, unsign=
ed short *addr,
 /*
  * when Super-I/O functions move to a separate file, the Super-I/O
  * bus will manage the lifetime of the device and this module will only k=
eep
- * track of the w83627ehf driver. But since we platform_device_alloc(), w=
e
- * must keep track of the device
+ * track of the w83627ehf driver.
  */
 static struct platform_device *pdev;

@@ -2159,7 +2157,10 @@ static int __init sensors_w83627ehf_init(void)
 {
 	int err;
 	unsigned short address;
-	struct resource res;
+	struct resource res =3D {
+		.name	=3D DRVNAME,
+		.flags	=3D IORESOURCE_IO,
+	};
 	struct w83627ehf_sio_data sio_data;

 	/*
@@ -2173,55 +2174,17 @@ static int __init sensors_w83627ehf_init(void)
 	    w83627ehf_find(0x4e, &address, &sio_data))
 		return -ENODEV;

-	err =3D platform_driver_register(&w83627ehf_driver);
-	if (err)
-		goto exit;
-
-	pdev =3D platform_device_alloc(DRVNAME, address);
-	if (!pdev) {
-		err =3D -ENOMEM;
-		pr_err("Device allocation failed\n");
-		goto exit_unregister;
-	}
-
-	err =3D platform_device_add_data(pdev, &sio_data,
-				       sizeof(struct w83627ehf_sio_data));
-	if (err) {
-		pr_err("Platform data allocation failed\n");
-		goto exit_device_put;
-	}
-
-	memset(&res, 0, sizeof(res));
-	res.name =3D DRVNAME;
 	res.start =3D address + IOREGION_OFFSET;
 	res.end =3D address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
-	res.flags =3D IORESOURCE_IO;

 	err =3D acpi_check_resource_conflict(&res);
 	if (err)
-		goto exit_device_put;
+		return err;

-	err =3D platform_device_add_resources(pdev, &res, 1);
-	if (err) {
-		pr_err("Device resource addition failed (%d)\n", err);
-		goto exit_device_put;
-	}
+	pdev =3D platform_create_bundle(&w83627ehf_driver, w83627ehf_probe, &res=
, 1, &sio_data,
+				      sizeof(struct w83627ehf_sio_data));

-	/* platform_device_add calls probe() */
-	err =3D platform_device_add(pdev);
-	if (err) {
-		pr_err("Device addition failed (%d)\n", err);
-		goto exit_device_put;
-	}
-
-	return 0;
-
-exit_device_put:
-	platform_device_put(pdev);
-exit_unregister:
-	platform_driver_unregister(&w83627ehf_driver);
-exit:
-	return err;
+	return PTR_ERR_OR_ZERO(pdev);
 }

 static void __exit sensors_w83627ehf_exit(void)
=2D-
2.20.1

