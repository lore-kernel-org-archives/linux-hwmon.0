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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF21FC4708F
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C582B613B6
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhE2GlK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:10 -0400
Received: from mout.gmx.net ([212.227.15.18]:41641 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhE2GlJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270356;
        bh=DhSFe+P3rPaWUNqUAqEdNMpsMXOakE4UTWSA3BpWl8A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Pt9BAWCxdHn8shH4pxvybxtAZq1cRmOq/i85km8D5UCcGKSfzQ4WThw92kfRxOcz2
         M/uULNRj6xeMVHVH2qfz2+B5ARz5jNnCtfODMTjj0qckhxISFWDMnm9vmwhGmmSDwy
         iaAzMkC7e1MN1EaJlT+iP4ot8cuPerOo+Ebfr3kE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtfJd-1lYfCG2yGF-00vB0z; Sat, 29
 May 2021 08:39:15 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/6] hwmon: (dell-smm-hwmon) Use platform device
Date:   Sat, 29 May 2021 08:38:52 +0200
Message-Id: <20210529063857.10177-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529063857.10177-1-W_Armin@gmx.de>
References: <20210529063857.10177-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NWIgW15W91p0eg5aOiOJq7W8IEKvnVaklZx4caoVgLDNbHc0fNY
 HxNwhyP0XTGrj9j6Tfa3SOw85PPBg2XIzb12hUlszXLpQvfncB1pDiMb6ng4BpDm8iN3gU/
 Iye3a3NP6/bnc13EAFDLJLweGG9vxFM2ZppcH6bCJblr61wG8ELja2PZ4FG8XzgwFbc0Y/9
 NnkBNKcUZ4PWZOe/hjklg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cu5XRZECwZI=:9lST2X4bxI5PEazxzhN4jb
 J6rRN0dsNXO6AKHjvJH4tv22J/KoWEcrUmrHcT5rWonFO3DNlKcmCf6DRhwvrOZbktoIuoSwX
 zlqWwniTFXrqXk2vqeKZAg29pY+1fSyhU3Es+hSJh4VzCXtYjXKzOi1u3NjDvyOx6RWAa1N1X
 OzpDR6JECtbLLy+kJwqiAHcYkNtQHXc7h6Q1dgQKgpB7xYu05sra6h1ZIqObUQXUfTKtm6hog
 gslR1wb+Ajc6bBf/tqdNk1dX3g0z8ucl5EDMxDwZtyU8ykUEDpNSaWpJP0BoePlKVs6XC5Hs2
 XBh55PHgYr12KEGkxal3uBcBnlEAI+oPNHVVQu4BmPYLVw4QRCNduGrFb1wFY8XUC66Zi3TdE
 swjMFOVX+yD4p4I9+6kpxlQdlxbSp1ICdjMUw0CuFjRvxQ2xGes/dEGlgarLOYpKyU6HE4Llg
 cZwJDQFen4YTOj9orSHGL5uK0Hc6tqPwIumnsCkOHXPzPdHgiqToeGE/sN2l6VDhW8lUTnb6m
 1O7Ore4/kZR0vuaIWmYool2Qp1W0nGe/H81FR/lmKvV/2fDyBQS1epUJLKhaJUOfvF8eUK2G9
 RM4JzbstkR/IMEIiFollsuJpI3P4J36333I7V63U/Z+HG61Afrh1Bygfmw7IvdOfL9n7qTGxT
 RoPTSncsiI5eQvThTsOJmNOy3gWtOKAGkkfWHezcDh44i4SKVd3nPhm8gLayfXhIbuwKvXLIR
 +rot+mAbDHDrnR8n3SZxe6BgntRyjP4rZ5jhF4sFpAqqgvlQPHHVbC49rDjSks9XLZ1xEtqRA
 nt2FHmO9ZpL4vUPgwMAxuw+mbkYhjG+FVftQwQUjILuczoDnkOdwhzbXAPxYuV08Hjq9QZJ/c
 tDe6X4mOoFgE5VtD+0NhmKme0cSp9JcMvi9/bQCcRUzpc5hbFvIsKy43XMyzskN5fFRQalJkB
 4oOrywd3nXoYdKU/UcgLElXYlbaH26THmi3XZXTHWXh69IcgrfJqrUEMNO5oXOq6kafVyg7ef
 NnkOZeRr+2Hu2UP9tcYngb2fQMR5zxaMF7sAxlI+AphpdrvUYnyDLOOVK3+F6uVdpEZmV/f1N
 A+DdM39JBOSdTbIDqeJnZm5LGoj8bNt2S8k
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Register a platform device for usage with
devm_hwmon_device_register_with_groups since
the platform device is necessary for future
changes.
Also fix some checkpatch warnings.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 113 ++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 51 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f2221ca0aa7b..f06873413aea 100644
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
@@ -1221,28 +1217,11 @@ static struct dmi_system_id i8k_whitelist_fan_cont=
rol[] __initdata =3D {
 	{ }
 };

-/*
- * Probe for the presence of a supported laptop.
- */
-static int __init i8k_probe(void)
+static int __init dell_smm_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *id, *fan_control;
 	int fan, ret;

-	/*
-	 * Get DMI information
-	 */
-	if (!dmi_check_system(i8k_dmi_table)) {
-		if (!ignore_dmi && !force)
-			return -ENODEV;
-
-		pr_info("not running on a supported Dell system.\n");
-		pr_info("vendor=3D%s, model=3D%s, version=3D%s\n",
-			i8k_get_dmi_data(DMI_SYS_VENDOR),
-			i8k_get_dmi_data(DMI_PRODUCT_NAME),
-			i8k_get_dmi_data(DMI_BIOS_VERSION));
-	}
-
 	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
 		pr_warn("broken Dell BIOS detected, disallow fan support\n");
 		if (!force)
@@ -1255,21 +1234,11 @@ static int __init i8k_probe(void)
 			disallow_fan_type_call =3D true;
 	}

-	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
+	strscpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
 		sizeof(bios_version));
-	strlcpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
+	strscpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
 		sizeof(bios_machineid));

-	/*
-	 * Get SMM Dell signature
-	 */
-	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
-	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
-		pr_err("unable to get SMM Dell signature\n");
-		if (!force)
-			return -ENODEV;
-	}
-
 	/*
 	 * Set fan multiplier and maximal fan speed from dmi config
 	 * Values specified in module parameters override values from dmi
@@ -1277,6 +1246,7 @@ static int __init i8k_probe(void)
 	id =3D dmi_first_match(i8k_dmi_table);
 	if (id && id->driver_data) {
 		const struct i8k_config_data *conf =3D id->driver_data;
+
 		if (!fan_mult && conf->fan_mult)
 			fan_mult =3D conf->fan_mult;
 		if (!fan_max && conf->fan_max)
@@ -1313,29 +1283,70 @@ static int __init i8k_probe(void)
 		i8k_fan_mult =3D fan_mult;
 	}

+	ret =3D dell_smm_init_hwmon(&pdev->dev);
+	if (ret)
+		return ret;
+
+	i8k_init_procfs();
+
 	return 0;
 }

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
+/*
+ * Probe for the presence of a supported laptop.
+ */
 static int __init i8k_init(void)
 {
-	int err;
+	/*
+	 * Get DMI information
+	 */
+	if (!dmi_check_system(i8k_dmi_table)) {
+		if (!ignore_dmi && !force)
+			return -ENODEV;

-	/* Are we running on an supported laptop? */
-	if (i8k_probe())
-		return -ENODEV;
+		pr_info("not running on a supported Dell system.\n");
+		pr_info("vendor=3D%s, model=3D%s, version=3D%s\n",
+			i8k_get_dmi_data(DMI_SYS_VENDOR),
+			i8k_get_dmi_data(DMI_PRODUCT_NAME),
+			i8k_get_dmi_data(DMI_BIOS_VERSION));
+	}

-	err =3D i8k_init_hwmon();
-	if (err)
-		return err;
+	/*
+	 * Get SMM Dell signature
+	 */
+	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
+	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
+		pr_err("unable to get SMM Dell signature\n");
+		if (!force)
+			return -ENODEV;
+	}

-	i8k_init_procfs();
-	return 0;
+	dell_smm_device =3D platform_create_bundle(&dell_smm_driver, dell_smm_pr=
obe, NULL, 0, NULL,
+						 0);
+
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

