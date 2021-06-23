Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AC8C49EA5
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A856128C
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFWVXh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:23:37 -0400
Received: from mout.gmx.net ([212.227.17.21]:52191 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFWVXh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 17:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624483255;
        bh=fno1fA+0keQwzzK9v/Ru4/C9g+Om8P+dCHByA/X0ohM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FEfHm+iK+x41WPEIiOaSNIqz5BxjsR2m3oZ3q7sXYmyClZx8kpeQnQrUKTIl7QZDA
         rOVv+sHMXMv9al5JqOsiWO5QY/2fVYszb64v8Npe1OvZX7F+da5rEfG65qjhJHDgvB
         RfCwnSsGBwr5nsmKrYytMlravdC7af2kXWe17dNY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.178]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGhuU-1m002f2UFe-00DrpZ; Wed, 23 Jun 2021 23:20:55 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v5 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Wed, 23 Jun 2021 23:20:23 +0200
Message-Id: <20210623212026.30799-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623212026.30799-1-W_Armin@gmx.de>
References: <20210623212026.30799-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n10uN+GZjdMFIKB4387mg3EUd1v372mioMlCp163SQhhve8dzuG
 IlU7hRRraAC24TysuBtuL3q61xEiwENTwStF+ODzFFeVZ/Qy5B3jVDmNM5k2Rz0MTdbybrU
 Xn3tlU8rCyL/t/Gl+sE8uCnJFFd7O7b6GOuYv+oCZMt9R5NEPArTuyY9jG7hGLKe4Djpl9K
 TeDpTATGVLs4WSmo38cMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5tLa4G6R+vM=:BxQMtSI7ceEmTbU4Fj4gSX
 6lzSly3n7KbE2AJKDbwsVpZv71UANodqo4pdF1JcJjJ6RNDa3/h7LphcIFj3ScE3ZErQuza1Z
 n26q5Aj/lwZPYx1r09sGMgKvRCfXlg3RYHgFHHmulh+Cl5GPBUF8cvDltLRtUuLgnH6H+KmC+
 GtFtW3oZrlCbnXsZLSX//2qQNzPo2xE1PuXyCT2peDZkVtiFxrAiPCYP28PrgnxNUJhKFoxki
 U/TUZx8ntrtvrjtlHxqOErTn+TddXLXSl4EJVDpSnqtICbWLMOYyqOLfM8796Wgzuy/che9Ln
 0gVDde3zvArdkQz435DjXgWQHYqduzLXxoxfAe48FSP/qDDcOFFL3A0/zN4OoQnrDEgnie14Q
 39tFhB0Ws/byXdBCwleZNdm4Fk/j5tCHhJ2FctAn7jMq3lC9HW7jiPAe0ldtAkuMrsN5c4auG
 klT0+UlFIb72B5LwPNCEsoD3xrtzAeE7zED8qGIr9SZUyEHHWQd4Q+7jscuLlpkcm5RGHU9EW
 YW4HXY4Hgu6tWtUs5YqQ55zM1G07V1aF7lAYGpRXc43wF8qFWEC05DmsP4TAsBwiHpiNyKBWP
 xqng6j1hHWxmBgp/nUU8mjp21Qm8dOU8cJ6YAbd8UFv3/KxljKwFSqNpIF2l8Plq184yca+Ma
 Jnud84XnZh4TVhz2FZHlJ8HkjPM/OqYPZek5YsQiTt56iRSCeNaLfqW8I+YDU7aSQYk1OCs04
 GxPk+X14RvMp7Jt24D0I3pAXsfwwgyF3QtNUfTbtbuf3r2rejYuhJdHZU7hkMbqdD7eAAr9lj
 vgCMS3YE5/nq1vsFDxXBP5+uQeHMCXM59TeD6vC50ubsY8l18Ys7VDFr0V4r/M8nDfRK4kVQ6
 qp/aNazi3Em9pR4AEqi9Zb35qYS8lxsRYW8uX20Hs7DkoPAq9qbC3PuHqM0ONgASdQHv8nUEx
 CgGyFtrY8/X4BvzlUevtDdz8ENsH2S4ANd1NO9pf7AxziaKXj2N41omASXava+V1SqekYgiHO
 XawRU5hlbDN0zyqGI78OInagPvxoBV5wexpuO4cUhYZU/vvTWnDjMFJfaqDdPaiqfhUfcmwK7
 8XlrbMGiSdVWzyLcYFal2yc3MK6xUH1Dkd0
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

