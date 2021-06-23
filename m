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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0178DC48BC2
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6C66128D
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWVXf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:23:35 -0400
Received: from mout.gmx.net ([212.227.17.20]:42345 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhFWVXe (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 17:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624483252;
        bh=DhSFe+P3rPaWUNqUAqEdNMpsMXOakE4UTWSA3BpWl8A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QW5jSaXOzrR4fN6kNKFBM13XwacvNGD6XRveMVjFjpuyb+4jWIHhjvXp5Kklh80if
         KzZdCoFiJsaMofgqvECzzy748ZLhLh3HI5E5KmrVjE3oZb/t8Mb2nFKV+O0pcpYEMr
         M4pN4ze1NYNkoOURG7ORuMlyeA/jpd541S9WFjaU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.178]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MDhlf-1m5CZn0rQ7-00AnhN; Wed, 23 Jun 2021 23:20:52 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v5 1/6] hwmon: (dell-smm-hwmon) Use platform device
Date:   Wed, 23 Jun 2021 23:20:21 +0200
Message-Id: <20210623212026.30799-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623212026.30799-1-W_Armin@gmx.de>
References: <20210623212026.30799-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IYgGoj+jXgbmB0C5IsyWiHZyLFTeYb7t88b90e2xqKiwgOYLxhk
 CNoTRc/z7wbU6dK+ktRVV10Qr2PKkDzXwhsOBQIU3Wn82sHULstSbGYM8mM/IRg2/11PZb3
 8y0m+LFc0QdCdmCfLDoWBGBrm/Q/zqGX3+dG5A1yXF2s6T5e7J1SchNaBHdo+kjAFXQhvm/
 cULQk875zzXYVYL76G7/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ud7m2Qbazdg=:q1+vsarDpEp9poUvgaS8xC
 0gq7cyX3t101wRTzgMYhFqxlvNJFQTaXrf9ZN7xThpEfgys/6pHvXF0sCBCbEaNZ+GkRR6Nfp
 GjOx0Xjo6QTIQ/gxtgV5wfIMxifu+0G6b6rY8hK6e54tpWjNIRch2KvCIFP+s0SPyd1Nsa6Uh
 eQc5oQfxTric+qSe7qbMdpEAeirMz0pJEB92NHRxKHkvV21RF5wAmlDlyxOcFTRMPJpWDuRyo
 Vk3Vrpe1e013qxi8no+t3B1c2LFHV2kgXw8puiMCzgirRiep4MCHfmckGnGGMVH4GCXGE6Npu
 CQAGWBmG7h38+Qq54BtThlASTEszSsqk2xxdZfE3kNr7aP8uMjqVTcDfMva7LRWON1BoljKT4
 46rCiHhqxXpGzuk7lxKvI1rCBQWDLKkslXmeJWQUMdt6LU2ZhCBMSdC+RufLW/YKmLY/s66Fi
 Agsjaio8qM4pVE2rEFo8a1RMBrnZ88Pl+Si+2F9H6GRfNNOd5Og/RiYASkiuvRewPDqP/ugH7
 h7QMnr7+psjxOdVuo+6xf6MuUvblOp2j2qxZryTG2pwuhdQhmoeDqFHansGo1aiLj+vEEhVqU
 GkIQK7YTZ/B0M63oyz0rx/z8FGPs28R2ULiaX+nMh1wPaIN0i+3TiRTrW3B4Xwykw3jezJK5x
 2rIhxMcI0cAvb8COu0NFHemNMKyTIqOkUI7CQ6NCFWChoBN+P94oBoQOerHu6Sd7Ofx9GicOA
 g/QgmVKktK7n9ZipXxrpxuez3FnKQSoo8+X7Tdokjo6FPj1wFvhBxfOlYBYB+SP5fZhfpxW37
 8JziuvH0Ri8Fk9wjKJ70zCfwigWxLBidKRHzomIeBDDAG5vfRvozkufIepnu+hA28mEIFB3nI
 mCYPx1mz0WfwEAPTTfQ/PO4AXnm+Ac1faPFGYhUWOR34cT7hOdX1njl7mbMOO+GcMOnEE86yy
 cldI9T7/PlAI6oD3NDbUfA9aPc0NMzMiSbiVF/fl4I5p5aWmwgDL+FLlz6L6uW/PjT/NentcE
 J6oJT9V6znV95xmir1q8geG5UXj3YnjUeL0EtNLw3fjtEF0xiISjMFOD91Q3yNuZGdf+hXBRz
 tX7ZRkujng3jBDxC5rjr3gffPpRsO+E8fZV
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

