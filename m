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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1320BC4320A
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE55A61019
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhG1UwZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:52:25 -0400
Received: from mout.gmx.net ([212.227.17.21]:42247 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231760AbhG1UwM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505513;
        bh=fno1fA+0keQwzzK9v/Ru4/C9g+Om8P+dCHByA/X0ohM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jM4NwtxYVSvzPJGvEnJeu61QBQoNh5RiETBJYbZwYnyqfSGbsWWTolkceUzkj55sa
         QC0zM7uFAa0CMNQuqE0e6MBbCWYgBZbkMVsJ1yE/mPvTrSc5Po9FRAqT3tr65qhbgw
         QLBoVx9yJr65Dy8FnTbLkK6lhj0aJbvli06XHLxM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mj8mb-1mn9Uy0GYP-00f8Ql; Wed, 28 Jul 2021 22:51:53 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Wed, 28 Jul 2021 22:51:39 +0200
Message-Id: <20210728205142.8959-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
References: <20210728205142.8959-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H47yGfgAR+PR/XAz+c2beax0eX0kseNj7phbrX2w/S5VufMstI5
 PVm/HFb7usNsCDRInNHTuFnpdvcz+unqQbJTr2EKby7IXv8fAiZ65EVRtsAGxkLTAdCL4Zm
 wEhLA6GUC1Fsr8eHraWCwACygeydBr9fGLDmCpynuKq+8Su9yubl6q3J493OkIrCNOvklyl
 lcBMzwRnWMtpZKq6Jk3lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6kO1dmOYEcg=:cbConAfSnQdUgT4hACCfKe
 +PkN8zqpQidZB0LgifgqGFBZS/OCzBzyHozlAgGxOGEzoYIA7cEirHkaHNaSsoN5I/VeEt51i
 IjL6+XLm//Ta9ZcsTplw3fKX5E+eiq4VIAiXF6VXU1EEJaXdGw3ElgLH2uK+x88dFehjef3tD
 N0uceBpzFZQNkBTDaXhfwy65qbasWQ6CWRgreQW4a2xMUrgogLL0uhZBAOvPOPEhWMgLc2JOC
 EFui9hFo7tTOT4TItWnTxRW3uv+THV08oNiF14mzBJsdjR011DdwAIgggY0/u0EnUj6qxTVzQ
 QvJLerM1WaQwGvlrusoggTz2OoZT8AINghc1CcCVcvfQe7wsOhOS8zzvtHYYLFC7gjiBu+rMa
 lq9IiJ4c3tlxfCXIepMyoPdQGxox4Cs2noakc1C4FFKHvfAzhEfkd0oSfT/ogrI9T+oV8UX3o
 4cHeDWVXTY5C7D2byLui2UZEY/twNgrPUe4ha4Xmg/OW6mjPzm2fQOKwA2Zso6mkdK0aWKDO+
 1H7Tm/bN45WQL/BBbnm7eAiTs3oib1REJI1J7tMRTpvfr6eGfspVDWSG4KnkE4HyKO4oSwLYC
 W23o7Ug36d8AI8IaleE+AqYhl7TOwHGzOx4pnb9ME5SFa8xIMxEDB3Z8f5URcL/rDwzAej/6F
 8jp8KIfs5jN6d+9nAk76e7NKU5FPmJVvvj6Y6/gmwfz60PEhlxX18k1Q4+SRx3uHB5spbjPb8
 CYjv+NFtPVSPMpWzYd3xFNNVrB+5IBu6MxJPl+Ty+Q6Z61ZXQ+w5VBSRPSwNYBusxNepem1f2
 5NyIn7FODMZkFlE2T9cDvGbHnQIVPcNEjXgNONpIO0KHpH5AQlcYqLxpYyYspJe/5ISLYWBfX
 TZBRUcyADJvsiWUPMOQlzG7DaeBnCKaH848d0cksZSiZJm7bJ2ieP6ksO9b5G0/5xTelP1D6o
 XMHmGtTInv//KfnR1cZIcMqAigVLd+ms/yzAA07ledTAwMtaC/jSY8eYwR3cUnDxn0aBHRL4O
 FF5+WjdonGe5UA7XJPpD2mhxTlS+tw+QsmDmwMN+PFcyeRLIAj8A86F2j9lb0nUAGS4K4PLgX
 bKaLVwx5LmmoRUB/o5uLWD5KXJMr4VE/mJQ
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

