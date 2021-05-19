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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378AC43460
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F216660E08
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353716AbhESNbH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 09:31:07 -0400
Received: from mout.gmx.net ([212.227.17.21]:40037 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353724AbhESNbE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 09:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621430968;
        bh=4/ljCOdE+I1VICQb1TLHMJkok/Dqbw0P8Sqj81hRNDg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hYLusmx8YLr4EJDZOYdhjswtV60VZLnVOcyG9W3n1/KGyLu1ZUWgrlIpdEzE3wVbx
         +2KBXmLegs/Chv3qSgIfX933FYUyQN0nmrvIZ1R8BNFGjfs/L8W1ivRh2B/34K/6Gx
         fpeLh2txDrB+gEDmWvHOdKonZ7HpK5/RUJumCmg8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.149]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N5G9t-1lHpYD2fUD-011EHo; Wed, 19 May 2021 15:29:28 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 3/5] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Wed, 19 May 2021 15:29:08 +0200
Message-Id: <20210519132910.14453-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519132910.14453-1-W_Armin@gmx.de>
References: <20210519132910.14453-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:89Lo0N+pBQDeeAg9mr8ufE5c4sGjnieJMxwPCJss69o3l36dR6t
 5o18cEH3AomN2OK+BdlqLdsJmiXFxqZ85gg08sX/jI9IVCykR9sMhZwB4GIVuLuwXJE/LGw
 QfpRse4N5omgGp5QmB3Wnbe2Nzd1mBQAhLa1/PPMdOnIBHqRhl/tal+7UcieiwxAdmCLuSO
 1cHH3ZOYTlwgy/dwdB24Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7BF/2ivoS+k=:rouMNryU2SJvleYRVcApTp
 NXM0JSWdYX2kyBV31bZhEOq+if2y5XStFYvBJM1GAP+reQI4od0gyQjFCkp9n4KloLVhQrsW6
 9CXaSk8rP58PPD+P+nmrSpjzPSbdoAd8+3sWrTzea3sSx9Bs77+9ik+Wjnvfq+pkcmY8Ubrdq
 /GV/H0pJZgPp/hM2x2lZ3uk2wuRd3w9XDvg5CcPrmr0JX+71mFZj2dhWhkOv3DJ+Xs9VZmN9E
 OakB26XiwrrDeJbt4f9/IHFBzD7U4MBVMGxAjcB4dHAelKDzhg+Uoo323U/bUMGs3nJJpFpc+
 oNokBpIcx75e6tVbB2zHX6dL43iUiwz9vQcP8HbKjmDEn+NJ13FS9OVLaKZllV5fHMIjDvhQg
 Ys0W8UvTHRWFwgQ6yep6xkqfQUqzIIt8eVNy5RTUAU1GmPXtxubnfT5vAZpjUkPfwXtzvpZWy
 tnQxeBKNxrQu7Xel1iH4pBhmxiDLZ613Ip79rmHisvSdxG8bi5BXhxuR/3SrOJvhLx38Phtlk
 6DhpASYtjgvcc3eu5pGEf6R+dZOxqKFvnKcPEdq74ZxCI/5lMbKSTINrX3JQLt/ciVDSG+jxl
 HBwktc0i6kur7jeKQvI54FEDB4EPasSlrCCfXbbCjYCBC8799bfy28HkVQWlwrlRrtsqVnO1l
 GOl/ru9zza46ZvZoSa9KEJZsSU7hOo38MFhcij5BWw6nBhlUOwB3SHJYraH1ccJYu9rVM0wft
 3vzkMPP3UoFMmyRHMVAVntnp7W3qYd1mcekuJQm2D/Nen2RzUpa8ATmTad/TpU47QQdIIvdnH
 D11l3Ii4MUCUDNs368bVSLbqQUza4KAWS6mG5P9D2Tb9v7rYbRzUpsP88uB2xLw09h8WX7u3l
 D6c4IdmppihaSHGs4H9jWBDT8xtS+QS4SccyKtCAfLh4dphGFdM0O1mirWssDODE5q6ozCxZW
 jJDluY8+DznnjmsoXGE4NEVqtg7tbUC7L6ooTL3ZrEIm3K6eS58fuJDlaOSbEoIM1FGlu2Kzr
 AeGa22S8Xp8Drd1TYd9v+EodGuAjBHISSeEJtSERFiUtphUaUP3KvzLvZ3uzu5NgDX0WGh48r
 do3iM40Yfh0ftEYIGT1gJpWwjPx1OFuWjYSGfQ5tqKfPvP0nMHQIt3Poa1waGUzbhpQoCDuiB
 myQJQaRm6TTCXkKH87AQSL7ylJ8p5o9MPeYyKpxIPkfxTxAH1bEzb0rYnv0pZqEL0ui2k=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_add_action_or_reset() for calling i8k_exit_procfs()
so the remove() function in dell_smm_driver can be omitted.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index deba8819164d..ed2c42badf1a 100644
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

