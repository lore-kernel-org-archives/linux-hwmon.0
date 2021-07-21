Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C11EC12002
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 19:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D2EB610F7
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 19:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhGUSpV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Jul 2021 14:45:21 -0400
Received: from mout.gmx.net ([212.227.15.18]:44595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230480AbhGUSpU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jul 2021 14:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1626895538;
        bh=dcrBClpRan1Ye4+0cOhzJWKTCgZhAAq1ZwV6S5zACAM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=fRByreJ5mppaKXWYZDBqRsSpdohAJ5mmPsu0i4BRaqV3z6LP8keQuVQb0+acZSAeG
         JMIQVaET+djPSE4OC0nOK1DIWXZ0zHS4IOo+WUYO4z8lT75qewwNJP+KKOhHoUDoSH
         n8p2HB1576jI6aX+esavptgsOu8r4SbA73ojwXxQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.182.54]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M1poA-1m45zW0x0S-002D1m; Wed, 21 Jul 2021 21:25:38 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
Date:   Wed, 21 Jul 2021 21:25:19 +0200
Message-Id: <20210721192519.28784-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d9HF+txI8Pgx/eiI5gWdK6THBWxN3mg0bsFeZeRLaquy+HPXC04
 CKoNKb6YhBeDB4GOkZI6nAZxRePylNk24GMib4iqoy8H6zX59HyXhWvReboqze69rqvxMnv
 M41dq1WPrkPkeP3XCQcvNPkgfl4xHaVMNI161YuvX93QA9D/CP589JriKD29mAEyyr2uNMX
 B1DHRSc/aEUbajS51nvaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xmzt2F9MfBU=:carSt70bcQG7FAXCJGM/w6
 vHFJ3MadHJMVOfiEPW8Eavd/dmfphbGA+vc5tIW0MmLF8j/z+RPWj7O0bd9NabKJ81llx9FEA
 wCPzAbPZY64XQppEweLhB5o3WaCrY4JaGJZUtEsAIAKR+SQ/o3kLBXgAmvmTDBDuPCcjpBCje
 /m4+qawiVdH1WxLTwO6dxXK5IVsxIkiV27nPrrPzcWbmChw1vu0mxwNpugt4StMHZzuwMcAe0
 oztUY5kSg73Aosl1fZCKE8w3BYPPKOjbVkLmE3eDV5bdDVcjLpgqglpxYPZXrTFtQoj7UW01j
 vKn5/p5WKBLer81nr2mUYV56RTYrjj09zKTGhG/qb1CgbAGEd3PARrS7ZLqyVjpVEjBo/sC68
 SLpgecxhIeqPRLjUM+RdxwIknq6HfXK98b0cy1dPkb0DptZkXChVR5cteFYnmRDV2I1qNWgjB
 dbPggo827gwgfmfgYa39CKvg8dKUO+yJANAURNzVAE8tIO4DysfT5+pG5rRvA090f9520qmRA
 cHQPJ0iqWUwPsFrItv923SaY3jSXk5NnXEYAkBytZOF2cjpvTjQZAg+Hr53brV//jQ6sVxrT4
 /KqoR/4tQPp1gyTgtfy7WS2YG+UIZuKfC4K1BhGc708hrkM/aR9mJQmKqEdjDMrv4aio46qrs
 jx+x/oXFmGGY8GOYZi1Y+ktNqiv+H/3LBCdfkLbIGye5cx1ya0X1Ad0/R2jWHxaYbap6ryeyG
 Fm7ufEhCIDB3AhwX2x4oT8EDPnNT8AyILAmtFaZqXE2PiUFcDIdGdUnMF8c39J8xtHrxc5wdw
 UajVcelhEPxeGZOc3RXzVwM6lz+KrzhZdoiEBGiG0vZv4oHKyGDH2aclyByvAjPk8Gp+jfqZW
 H+d/x+HHV04PXbaUa+aimMWQIsMZsAbgchF3JrFVVa39Yj1eFuiMeRTc97YJ7lPW3p/0apfXM
 GnT3iwP9j2gOnVvOYesffis5P6WbIUkF2MYWdeb58TUcMe9feHPzqXXjLlnNVKPK1Tdj0+YIj
 NfQ/Q4dBmVHpBNWQX2zWKfVP3HHnAHOLMMarhYvkcHth96U3ScPRbRt83fQWMLaeju4vdNGeD
 ChEZpDecW4jmUOklGDVE0idA59IPCjFnRhh
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use SIMPLE_DEV_PM_OPS() to also assign poweroff
and thaw callbacks. Remove the now obsolete checking
of CONFIG_PM too.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
changes in v2:
- remove last check of CONFIG_PM
=2D--
 drivers/hwmon/w83627ehf.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 19af84574324..3cea66c58c25 100644
=2D-- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -372,12 +372,10 @@ struct w83627ehf_data {
 	u8 temp3_val_only:1;
 	u8 have_vid:1;

-#ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
 	u8 vbat;
 	u8 fandiv1;
 	u8 fandiv2;
-#endif
 };

 struct w83627ehf_sio_data {
@@ -1946,8 +1944,7 @@ static int __init w83627ehf_probe(struct platform_de=
vice *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }

-#ifdef CONFIG_PM
-static int w83627ehf_suspend(struct device *dev)
+static int __maybe_unused w83627ehf_suspend(struct device *dev)
 {
 	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);

@@ -1958,7 +1955,7 @@ static int w83627ehf_suspend(struct device *dev)
 	return 0;
 }

-static int w83627ehf_resume(struct device *dev)
+static int __maybe_unused w83627ehf_resume(struct device *dev)
 {
 	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
 	int i;
@@ -2013,22 +2010,12 @@ static int w83627ehf_resume(struct device *dev)
 	return 0;
 }

-static const struct dev_pm_ops w83627ehf_dev_pm_ops =3D {
-	.suspend =3D w83627ehf_suspend,
-	.resume =3D w83627ehf_resume,
-	.freeze =3D w83627ehf_suspend,
-	.restore =3D w83627ehf_resume,
-};
-
-#define W83627EHF_DEV_PM_OPS	(&w83627ehf_dev_pm_ops)
-#else
-#define W83627EHF_DEV_PM_OPS	NULL
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627e=
hf_resume);

 static struct platform_driver w83627ehf_driver =3D {
 	.driver =3D {
 		.name	=3D DRVNAME,
-		.pm	=3D W83627EHF_DEV_PM_OPS,
+		.pm	=3D &w83627ehf_dev_pm_ops,
 	},
 };

=2D-
2.20.1

