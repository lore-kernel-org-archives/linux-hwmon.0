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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A588C4320A
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D63461040
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhG1WQX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:16:23 -0400
Received: from mout.gmx.net ([212.227.15.15]:38239 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhG1WQX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627510564;
        bh=fno1fA+0keQwzzK9v/Ru4/C9g+Om8P+dCHByA/X0ohM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=R8e3YZXHzJZggMXIElxo2RYAaArqMRbD89Ek7M+3TMrNkbvzjWpMJVu/j6GA3Arom
         +EvDypXLzPpF/fI8tOdylS8HVuVGfsqQurUbGYOQJp5AL/5kySfPbOerV0Kz3Pxz7Q
         LCswRqB9CvLgbeFI/LsIc3aGIS+rMgEyzV6jXqPM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MKbkM-1mThaC1Ijc-00KzJ1; Thu, 29 Jul 2021 00:16:04 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v7 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Thu, 29 Jul 2021 00:15:54 +0200
Message-Id: <20210728221557.8891-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728221557.8891-1-W_Armin@gmx.de>
References: <20210728221557.8891-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QX11wyHZy4g3YRyyieTeUmk2eR+NS82HJO6BdDSkwjkHakQ1RZC
 V/jbBDKYRSYZ4suLjku7aLNGb9Epe6ual9GPu9e3pQw+EHkL1xipMnfoJuLINgKhtUi8/1Q
 5Bcji2tbKfOkD38UZtR2Le1i4xCl0yjrxDT4MKiffT8yqfxryH8UDzKF9+smynaRoRQY6qO
 OcVcUrBqu2Mo2JHRoYumA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WMMRVC+D0dM=:MS1N02MWWS3ppq0CH196lL
 QMno5gr1ElZnFXXRsFHEMdDYscHGPxVy84o1lxWpCev+yB6vAPfkfEJxb056y0226R5sgQ6tp
 BqV9P+rnXYuNgt8g3rQt/v0PZY9+w9D+mIFQoIkIbLMXrhrlXxoMnOsl2AVzkOPOuFWsHZw4I
 TiS2n+inCoSlDn7lPAzwqjAX2BYCe3mEnV/hAxmEBRLGmrczNapGmR1hgiII81oIZAkQRF/pi
 MjU2olKcNeIEvZ1dZN0828LK1HP4v6xxWXEbPI60407MbJA812k0wvdIE73NOR6JwJDnF/p6t
 RwKp8S0qXcmwxO8aYAmvfvjCsK5F+kJSCEC3mYsbWCas+9KbZMUpi+Z+rwATxgipnpm2ZiZRB
 3eHREF0/kBxtsAKuHf9GVVTQP0W/0/46aNf3bxeBaAsvrLjitpst4OPpJMzkKGg+2qxCJgBPh
 o7bxyAh9ynVZ8NLca5Cu3IkC43LKiLKzP29y1wijSwwz7ycZhNxO8Hv3/YAqhhfKS1LFzZcXd
 1NvUSOlCnvqDMAKPei4fsD8P2yu055lDNkuiIZD6PFOsVOUzJjK3SaXFNsKwmYxpaj+mBWkMX
 RgRkJpmtxo4RpzxwhKVur2tTGi77l8ivozQUnlssXL04BP5iuqE2pnVJfnYaTIINA+57KrmXi
 hYO1usK8ngzh3XkRmrSYWjjIdjG2Izob/9sHIAJansMsUnIjSGB5TetfIx24PrpDSUtCib1Wg
 jDyZdw3xPcnqJDTJiLYWA8iiyK3ShDX45clvjXDrACdH3BcCKUw1RBUA3YMxnmCfjXbXLu6Rs
 U1bB2JfldAgw+qPkMg05Efgyf48fiFuqZIQBH9RAflYbGqjL7wUPeWP0aUxSjNk0D2LQ9oZ5H
 JorwTSy5r6zA51frUilZkozRL+WL7VnQR9QQhGzKsUVXhUM9OMZ5i4NvknyDnbzseZKGErpzL
 fIg4ABhWMaXC4N6jFCRvB7kUeR7jENj6/ZiY0XNqIRV7C086mcX8/riTNZ7mP216ddajAqpa3
 6JROdDXXYIvrrcqE7+UgE6TTiHar/+qf+caBjTBhPtR7xZQ1KjO+wFG/0p3ZT/mIKQnxDBgJy
 zWl7a4QVFbV0yzWbuqFd6W7maEU/mT9aZe/
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_add_action_or_reset() for calling i8k_exit_procfs()
so the remove() function in dell_smm_driver can be omitted.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
Tested-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index c898d6bd6a18..da7040f2442e 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -605,24 +605,22 @@ static const struct proc_ops i8k_proc_ops =3D {
 	.proc_ioctl	=3D i8k_ioctl,
 };

-static void __init i8k_init_procfs(void)
+static void i8k_exit_procfs(void *param)
 {
-	/* Register the proc entry */
-	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+	remove_proc_entry("i8k", NULL);
 }

-static void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
-	remove_proc_entry("i8k", NULL);
+	/* Register the proc entry */
+	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+
+	devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
 }

 #else

-static inline void __init i8k_init_procfs(void)
-{
-}
-
-static inline void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
 }

@@ -1287,14 +1285,7 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 	if (ret)
 		return ret;

-	i8k_init_procfs();
-
-	return 0;
-}
-
-static int dell_smm_remove(struct platform_device *pdev)
-{
-	i8k_exit_procfs();
+	i8k_init_procfs(&pdev->dev);

 	return 0;
 }
@@ -1303,7 +1294,6 @@ static struct platform_driver dell_smm_driver =3D {
 	.driver		=3D {
 		.name	=3D KBUILD_MODNAME,
 	},
-	.remove		=3D dell_smm_remove,
 };

 static struct platform_device *dell_smm_device;
=2D-
2.20.1

