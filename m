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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B437DC47087
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91D59613F0
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbhE1RjS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:39:18 -0400
Received: from mout.gmx.net ([212.227.17.21]:48527 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhE1RjR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622223446;
        bh=9ioOuZHrB615DINpZx/84r2gsWltQRh6q331stYqAwI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=JwjAjrdE5TbgGJHZQk2LQYFEljmUnNH85C7kNxgqvEJM45YwwpTcadzO12Ud8t4KS
         nNL7z6xNDgbiuipxEDFdeDYxJf++J58DHrRYDuVXMRo0RtoluDlg1zZ3P1WShywaPr
         /m2RIyTDOB39LF7DGIqlQ5x9F7NR7pvpzsZEIQwk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.180.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MnJlc-1l5tUg2RLo-00jIBh; Fri, 28 May 2021 19:37:26 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/6] hwmon: (dell-smm-hwmon) Use platform device
Date:   Fri, 28 May 2021 19:37:11 +0200
Message-Id: <20210528173716.10975-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528173716.10975-1-W_Armin@gmx.de>
References: <20210528173716.10975-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O/40oL73SdctKgwtTTXJ5N4p+v9Bv4nAB0yd+fj2N+597308Gu8
 ym/8xfE0vR0nAU2DfO+mWAUgHLH9AngxxIqFu4Kw8YM9PoJjaNshUHSVNV1JxttdKZ8KDD0
 Fi4yu3MuMfkq3D9OlSdtBiUPtEexwe4iQd/NB2miKUZajVSsp4Xn6hXo1ClPSkCtPgE609A
 ZkWTU5aHIvrRhK1sEw85w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:978+MGNXm7E=:q4N0BpKY91/5SgZh+iyVkA
 GMyfnUpsK29vtabx17wUn9MSOA8SW9ItQFbJYrdQwcS2ngSwGbd4frkOaWqOgbMBg64l7KDNa
 bP3ZTVz3J1RFw9pmazGWzJfW2oY+tg9+Sxe76KXcaXLmCnape4T9zQ8GdBGVE2VY3F1JFtgw4
 ruRjxHtdoZfMoEsB4gTGvEEYwz7eI0kxvZ3+eNnxoFRLGWalXq08Y1kd6iFKByZGiTrynsXRB
 DFkDKCxJ29DxNZ6Wr4t98TPRKWebYUGF7wiXQ8RcQMHjKrxqTRTyKgqVF19Ly4xhdFWgK2rql
 22n1Cv03ys4tM9DZf37QEwkj9UdB9/lHj9BKzehjCrA+oRbc0r5/ppn3do22FPVUueXF5G1HR
 28SHsWr12wFVCthSFJdgMW4HprkCaSxRdQe5suPD7WAZBe9w9J7LHcfi3MB2Cbld35fEroZOy
 lG9DBX1iOk80TZv+GSyLo0D3axq9fpwalkICzNesJ+YubUdGzervxPueJ032mwRhcby1JiQe5
 INacKCxPa8A152+YLNouHlH8hMJHTJlkit7yxAPQqP59VN5IW5laV02pV4ngh2BE53z1muoq8
 Lf6mUfKXMhMD3rRUJKM3U2/M+ugdIOnIB05wis/YBInLjw6eseL1+bQ+9WsQFT4gIusWY0b7p
 MpPuWkzGSSmqv/ZPt7wfpvXmb+GMKhonTflaAG7ud60x73gL3dQpxCGhuc+JdD/go4YUaEo5O
 IwnUFmPotOSqkTuLDshsw+VMjW70IjhPm9rJ1HB7qSJopkKaXJXO8ousyEkjYpkbF3H/+eCfF
 HFp3iElrzjdxkkrnlbnTLMURv6Ud/9+j/4g8lPUhUGwB1CdEPtXrO602vbSs6iDSSvAqHiJF5
 2ITtG8Wse9Z8TDuIt1YOiZOE92mL8QISUpIjxsl32IMi5pzMi7tBJJju/KvUQITOiZXOvCpp8
 92FfiSmEv4dt0+odvhUkI461e2b5Kct4uKdgwGDngvU6K0QNbkr/k5NwrqsYicCQyye+to4xW
 EmVzHhwDonDIwk1h05Hcn0Vs1FX3eTSrsud8RstHkYE251KsXFVMTgRJ9nvk0YLaUfw/8iLom
 ma294I9xVZY2oZQKCH0Rn3NyL+i1+ajYhhAGnYKdN4n60HgIkSngrbLPcXthdv1kxkfk+PGaa
 ka2YSOpj+f1vUjnNo593rJTdm5RhfOHnmypFw6A9pJu4KY0/zK4onjTwCTJWxfKat7qGs=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Register a platform device for usage with
devm_hwmon_device_register_with_groups.
Also the platform device is necessary for
future changes.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 115 ++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 52 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f2221ca0aa7b..2038f2a50e11 100644
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
@@ -1277,13 +1246,14 @@ static int __init i8k_probe(void)
 	id =3D dmi_first_match(i8k_dmi_table);
 	if (id && id->driver_data) {
 		const struct i8k_config_data *conf =3D id->driver_data;
+
 		if (!fan_mult && conf->fan_mult)
 			fan_mult =3D conf->fan_mult;
 		if (!fan_max && conf->fan_max)
 			fan_max =3D conf->fan_max;
 	}

-	i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
+	i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH; /* Must not be 0 */
 	i8k_pwm_mult =3D DIV_ROUND_UP(255, i8k_fan_max);

 	fan_control =3D dmi_first_match(i8k_whitelist_fan_control);
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

