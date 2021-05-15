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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F34C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CACF46135F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbhEOSfv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 May 2021 14:35:51 -0400
Received: from mout.gmx.net ([212.227.17.22]:44417 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234129AbhEOSfv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 May 2021 14:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621103661;
        bh=Dh1HU2MdA+gtF4CNqSTD69H2JwWYXx90rbg56VXs4t4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jAYp6M2HUfMKC0dl6AJPAKJ/n3D2FK96tPhLBUEuHJkX/5YTnfO8MtHd6HscUSO8G
         GRZtsYB4Ph1WNyU5U+Z7tRdSmE2BhWXx2iCfqKDWkMg0/VMvJgCZu247KIqUQV2hx4
         SYFrpCgJ8wEgEER+VHsbCNzfoMboVV6SCQUDNoVc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.97.49]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1lyqlk14A9-00YS43; Sat, 15
 May 2021 20:34:21 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [RFC 1/3] hwmon: (dell-smm-hwmon) Use platform device
Date:   Sat, 15 May 2021 20:34:07 +0200
Message-Id: <20210515183409.682-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210515183409.682-1-W_Armin@gmx.de>
References: <20210515183409.682-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rJSNanD7SfvVDSryuYW0qA1Stxoe9bDgGtK3RCsmcDHmlsDtWF1
 4zMPjCjfOtOSxgsgdgm11RFcjSXm5bF0WzHdUO0MZvMbCsIUXcQYXoW22Q3QNTJ3TBOWvYa
 iGq+wGuBw7WwHK7W+H3D/9sxZDLUM4sxyyA3X0aNLo5YrQ7Bk1j2x30CRZxecfBziHr2BUn
 PFwgRwZboob1geDO2VEQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GXPtlEChAQ4=:+6miaxXnWjniv9PXq6G7e0
 6/mcBJlpHnU06WgBj28W9iWlz58fA7I/vldzVt5Btf8o6vnTQa+a/xvnN/1RxRp2ksBe9KOLj
 peIZGkSFEAR+RASV8ifhxPI5Zv1hdA7hlRif06Jcd8I71ifeQe0IOZ69wp/BMsdGaiBgBhuFM
 QIG/JBhwU11mwJ90wsxi94Mn54WfOGQxgNdHGav0LtuoKSJ48zQTExIuYi5RH+LB84vIcRLjk
 JTdfw1AAEeyVKRbUPSSOU8fK2YSvFIz+47+Z6Ne9Ceh+0p9YfC5aseOiOiSyig8j1d93yJbcs
 3gWDL9lAlqCVJs2pWCna67S6mOeK2D2ht4yIhJk0v9D0hW5gsqt2l8wXzq6q/DRRJsgD1ht58
 9LB1qgalWZ+3A7y1FltpCfCZaXUtnsvlYkwbcJZId/C6i7UrFsOkB4EbgauU5GRkLzsQXhhgi
 lFpgmresAxaDk4G24n54RWL51rkwNwUQB+oWup60PMp/hWM1I1iaK5eou4isZXHipG+86NKzg
 Jr8XhewIG/sDGpSryhzDECt0ViaXuivaZ6uwuDNH3QcWUFO5YH9TbHhhWWxI0qtGVUFy4ivgu
 WE9FwamZ1Jz1+oIW4gzw+laANv3yZBAcg2aG1pPF3lC9UKcwilSbFAHjSyZWz4qccE52uvBUf
 sYK2z6MUTiwH8f7fzIK/fq+1Qc2QwLUtgqFYJ/KztgmixCnPnU6VX6MzJTob0qYgCplQPhQMw
 ebMkRkelhEjYHDNcFt1tpMB0bCLl/aE24SXNrZtMnDtYk8Vs6UtsOVaKAqkp2WV2aRPdVbwln
 yNEdR+KYw/NSoVZuAcKv2pk8u4uf23caIyV0NXmtMzL8i3u3m8PTtVKq4cvSeGIYRmrF7WOLD
 wc3Kuc89sQgyorjVGis0cAZF0Gj4HcND761FKV/8Uzel15CyBSTT5oqDiV7LpmN8QdFYiDoEB
 o5uaUfE5J6n0y+SIGh5zr3Xt3icwuTQ0k6W7qeT9xT+ZJd92EsDFzjqOvcbs3YHlwzPPCWBfT
 Iie4rJ3kYegqgjybXEcFC3YzvluMZ9kOZG5l6Ed6fByovmi2Zo83RT4BOgdmszLnc1D9YsysW
 wlx4qQkrxL5ATE4NUccBkLET90AAiPEoPLP8JpKvcskg6hg8cI/Go/yDXX3YcbP9jJ96MpHmd
 mNJWAnryph7OBBDOGjS1U2BzCimb1foIZKV+L5Ic1BTOf0WjJadDYDoMAPtgw5NcxonNg=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Register a platform device for usage with
devm_hwmon_device_register_with_groups.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 70 ++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f2221ca0aa7b..006d435a6e78 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -14,7 +14,9 @@

 #include <linux/cpu.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/proc_fs.h>
@@ -896,7 +898,7 @@ static const struct attribute_group i8k_group =3D {
 };
 __ATTRIBUTE_GROUPS(i8k);

-static int __init i8k_init_hwmon(void)
+static int __init dell_smm_init_hwmon(struct device *dev)
 {
 	int err;

@@ -956,15 +958,9 @@ static int __init i8k_init_hwmon(void)
 	if (err >=3D 0)
 		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;

-	i8k_hwmon_dev =3D hwmon_device_register_with_groups(NULL, "dell_smm",
-							  NULL, i8k_groups);
-	if (IS_ERR(i8k_hwmon_dev)) {
-		err =3D PTR_ERR(i8k_hwmon_dev);
-		i8k_hwmon_dev =3D NULL;
-		pr_err("hwmon registration failed (%d)\n", err);
-		return err;
-	}
-	return 0;
+	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_smm"=
, NULL, i8k_groups);
+
+	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
 }

 struct i8k_config_data {
@@ -1221,10 +1217,39 @@ static struct dmi_system_id i8k_whitelist_fan_cont=
rol[] __initdata =3D {
 	{ }
 };

+static int __init dell_smm_probe(struct platform_device *pdev)
+{
+	int err;
+
+	err =3D dell_smm_init_hwmon(&pdev->dev);
+	if (err)
+		return err;
+
+	i8k_init_procfs();
+
+	return 0;
+}
+
+static int dell_smm_remove(struct platform_device *pdev)
+{
+	i8k_exit_procfs();
+
+	return 0;
+}
+
+static struct platform_driver dell_smm_driver =3D {
+	.driver		=3D {
+		.name	=3D KBUILD_MODNAME,
+	},
+	.remove		=3D dell_smm_remove,
+};
+
+static struct platform_device *dell_smm_device;
+
 /*
  * Probe for the presence of a supported laptop.
  */
-static int __init i8k_probe(void)
+static int __init i8k_init(void)
 {
 	const struct dmi_system_id *id, *fan_control;
 	int fan, ret;
@@ -1313,29 +1338,16 @@ static int __init i8k_probe(void)
 		i8k_fan_mult =3D fan_mult;
 	}

-	return 0;
-}
-
-static int __init i8k_init(void)
-{
-	int err;
-
-	/* Are we running on an supported laptop? */
-	if (i8k_probe())
-		return -ENODEV;
-
-	err =3D i8k_init_hwmon();
-	if (err)
-		return err;
+	dell_smm_device =3D platform_create_bundle(&dell_smm_driver, dell_smm_pr=
obe, NULL, 0, NULL,
+						 0);

-	i8k_init_procfs();
-	return 0;
+	return PTR_ERR_OR_ZERO(dell_smm_device);
 }

 static void __exit i8k_exit(void)
 {
-	hwmon_device_unregister(i8k_hwmon_dev);
-	i8k_exit_procfs();
+	platform_device_unregister(dell_smm_device);
+	platform_driver_unregister(&dell_smm_driver);
 }

 module_init(i8k_init);
=2D-
2.20.1

