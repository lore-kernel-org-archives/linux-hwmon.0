Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA36C4743E
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 543CB6141E
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhFFTTv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 15:19:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:39111 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230344AbhFFTT2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 15:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623007042;
        bh=PZsPMxibvPq4tT9Bbcp0DPfijzbAJNrdlBbz800ARJY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jG4S8qA8o53uWV2GpQQow8KNlm1XifUo8iy0s1y+PXps21KYThtCu3dx1BtgLsgfZ
         mAm8SbQLO081IbJYpxQP5RA4aPCwCJXoHQ0zQ05nm7qnC6g+h+aKcN8JlpMS4FLJFN
         z6KLgCgp+/ZT1oBvau9U2N5Ogam1pWuhNWM7oGnw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.217.164]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhlGq-1lCUj33jzk-00dr3I; Sun, 06 Jun 2021 21:17:22 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Sun,  6 Jun 2021 21:16:27 +0200
Message-Id: <20210606191629.32245-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210606191629.32245-1-W_Armin@gmx.de>
References: <20210606191629.32245-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Me1qQ/bZ47lgBuWK7SPk7v8G429O5jz+AwGaSmbmPJfHiGXcSIx
 yxQZL3tRnu1+uc4ocT8/SjCjAiB0x+21QT6Pp63jHQf3HvkVW5izXujSLhlsgxDck4a8WKF
 IYHYKFXGQyOy+nM0MLxLcORWXHyMA1m8kcQuBL4QJ05VE5hmiRtIxReU9c51tAPeS0MCA1u
 AmC/U6GxObrQpKfkyCg3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Ytd8z+vCPo=:pZrL/i9R5CtZyUY4DuQkVs
 k2kdtZaUuRTIQvQ2wDhrL4OFcgh5C9Byy27ZMfmG/+TUndMds7xbEp1VKKSmAwzk+pEdNcDl4
 UjknnBntGWRMMYmEWs8F+pOT9mNH5+fp8DyBqHDTiRDGnwgD8WOnbkyrMn4LnVmexxfK2UKaq
 aEf0KPP99WiUOY0R8XoLOWsCNOIrB+wPEoiWHnByqxLqmxuW83cLqS40aEmV/LfI+PvmbLQqu
 7RzoctXzck1sYTHW0cpmIwMSZoV57o+vpQJfToY0cfOna60quyJ2PlLOYZHxDYlUEKxcn8emW
 fGLloYPBwIbp/npLmKpn+FLuzTEsTiIcoWvSpf1qa8MHmkk3j1JqAOBlXT76ZcA7PWhPXeL6U
 4OPSRnicZ4ERBrwcGzn0B9De6SSLvh2PMMcij5miRLqTLt5ssm/oUvr5Sh2WHAIUqj/jP55bh
 z1MyevDTwekVwTo0LFwUXjOFdiv81+pE9BYFwDTqfaqIsa2atyJlq7nbviC0LaWEZjCHnPFGx
 XFrjf2HkRdU8f+UNip3+cKPqZt/PSG6VZ1HPCyYeXf/ZU8FsUdxVBhHcU1IRaRgaarVO7K9nu
 TYDToQBfnF8eXHam7mRnFhffgjR+F/bGxtgb0bHy5TfQyOzItw+VXnxDHpXXoQJ1iH3TWRP3x
 UH7NqiB9jpNzlOegiQDH0H0T2gnyxTHIl6ogzP6VXN2t4RJFB0q1Tfgk2bFZ3D4uqhLk0N+tW
 zEqrjQ2SNuSbKUFwnDBysBBhYdQj/nAeGBvCK7qZHn+6N7ro4xX0ng+L9ZO/p3DoooN75BGlH
 EQCUn2ikj6Ryfs6pDH1cBXJgAvcEJSfGholZkSO9PtNCVtcI6f3PsSf0ewW421G+OREmEzbWV
 0btGT0niGiHJseWzWun1GNaAFIq3jff/xA3TesRt2UbinWEVZ0qcYWMshu1o7uBRMYBiVC/t7
 eg1zR2birqmMp+XMM5KjEaFfKr2F57TxrJRxiVCJnJu8+31lpUqWHw6B88wDBiL7GGU6cyjVW
 lGWjeTTd4OIsmUVGj2b77j4bsbLdHso8GP/TDWBftZeOeRupam7rie38xD5WYvmPNC20k8X34
 bftOzBbCMOKbcUEH6x0NyPMwPz/ozVLVGYv
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

