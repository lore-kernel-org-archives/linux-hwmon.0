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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0327BC4320A
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB9806103C
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhG1WQU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:16:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:52155 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232110AbhG1WQU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627510561;
        bh=DhSFe+P3rPaWUNqUAqEdNMpsMXOakE4UTWSA3BpWl8A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TwtDo0ElqIIcoCOe1E1mCTvRnfIX7kWJHX1DQy/7SQ8icep5XxWCSuLb12wJCb0/g
         QNW7tj8A6HD5t7bvB8OW43IgQxL7yuc7QJwgcDIk5HT1jWWVw4v2eVWXQBdCLFSDrT
         TpSyvZNAFVk3a9HhjhEVGSbfvibhrNQLhtPRYVRw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N8GQs-1nCfuD2IBE-014FfU; Thu, 29 Jul 2021 00:16:01 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v7 1/6] hwmon: (dell-smm-hwmon) Use platform device
Date:   Thu, 29 Jul 2021 00:15:52 +0200
Message-Id: <20210728221557.8891-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728221557.8891-1-W_Armin@gmx.de>
References: <20210728221557.8891-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aCWsbTmxBFo0PwNrHjMoCFnfcgZ/d97NpsrN4G/JONh5kzF31dV
 ShkU2W9R70RqkicQAJjimy71IHrB0pmAixKqxKkWndYMb+ju7bSz/ITLcJ5C5W+wqGndqfj
 VHrvYKCW58VxhiHHRW5WYs2EdFW7MuAXjgmMpaDnjrLmBM4pT+r2wXX0c0YMBvcKoDlJBgb
 9aP/rsyrtPQNuFR47ocGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5CWntbjaHhs=:xt1Fz+utgq1OsBMSzMlmPS
 +8j7sl50LccYCsEoyAJncobbG28DfjsfWCHShMe5Dn8y+B5rkMS2T1n95OyPTrj83B/h2odx3
 YLWPJnxyMRC2+n9f28vqWkMdzOzxr+NH5vvAM3qLQyvZ/nGhNg0916vUZlDAmy4TbXsAm5oQL
 zB49c0zjiAuepTavvVKXiGcT8Ugby56VWxr1ovSds1x5+tXtQeNrDAmSzVblsNi7kIKtJm2JU
 aNYhOO9bCxd+12oK4ap+UAc3XbPr6Y3BSCiDg3X5zikNaQrAX+sMaCGja8P51i0pbJQJGpyVn
 DjfCXcYRP/IHxr8qSrg/rEoNCBcab86alE1kAr56tdlAtoeoBcjn3VvDmweITyjmaqactMn/q
 IMpndy3VR69OFRdhmk+4M1gXx1Z8BZsDCoL7+b8QQW1D6HMYdUzEynW2QAtJairLKc7ybyCga
 2lbBk/Z2BxKkqjRXrUUK0PJJuHS7NdDIa0eqXqw326r2aKaQfUN6goaESQs6guKpwKxPnLvDJ
 kVs6VLdclNChi4MY76NqTa2IDoMO3jvqOoVn6yLylgx5O6lSE901WMBdUsZHZOoPCRbi8j5PS
 HqP05qH1+snZqVqsodQzPVSaTbjN/eXuZiJ01ckv4QyLU1bOK6CNanWusTG5YrkhGtY5PFOTS
 yO96ojMfhDUspKrm9/s0zY7im2THlaiNrIh6FtxQPRQjn14sNL70vi45QtSoas0goLOIjZyTO
 diwj8+oSN/Ha+Xm/7bR7K01V3Q2Pg3iOPSoX74ehB3EZM86JJi7p7zBEIoaz5rWibPFmv/jqt
 qevGgGBnrV2Wnm+RY1nB/c/FjT8DqkaWOnZtuSx184CVoAPV9alp8fG7hVhhuFi8DL3gGnQYX
 E/3pguH2/7Drk/V+McBz2rc9K98JwSD+iH4AiVDs3EhDiRd3WycLJcZSIw8HPZFwTBpHT3u8I
 lI/5TQu3Q7PA3pWY0X9vokEWtW7pUtnri5hrH9Lc9QHchdwupDNH1tXZ6RZxsZlT/jTrokVij
 EDNf9KGiTjR6RXxsgnEyDTn8dl68cuQQ0UftTf8BYHIwa+9C+CFFwWwMiLyhpVfxiKtKMZkk4
 J0xgDI2o3hKUTpydfr6meZ/V4tZosJpSLh1
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

