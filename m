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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5ABC4743D
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 010F26124B
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFFTTv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 15:19:51 -0400
Received: from mout.gmx.net ([212.227.17.22]:53569 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhFFTTW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 15:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623007034;
        bh=DhSFe+P3rPaWUNqUAqEdNMpsMXOakE4UTWSA3BpWl8A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MknIgDWWUoC4S0ymwv6Sa0nF0ThY1ZTybj4IfVaQdsgE6XSEU0VhJplCxrnqbrlCI
         7XVIk8xIGm/gcSMVqyqZduLW5PUNTiv5QsuYLEODH9rSjXjPaZl9t/lQ45L/u8Rj1W
         2E8g/fdG1bcMdjZEo60r21I/YMW/kdcfRLxq8neM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.217.164]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2f9b-1lmvjR0V6V-004F2e; Sun, 06 Jun 2021 21:17:14 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 1/6] hwmon: (dell-smm-hwmon) Use platform device
Date:   Sun,  6 Jun 2021 21:16:25 +0200
Message-Id: <20210606191629.32245-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210606191629.32245-1-W_Armin@gmx.de>
References: <20210606191629.32245-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tJEqpUT1jwCyaaOVTnP7juoGLYRsIYcpTXyKObNtj5XbzsrTO46
 2kyttEXXwZKhvEmMFtBj7tq7Br6z1P9PLe5/31MiUuQH1eKJMZO8+NIzd4djGLW5L42tre6
 OLdlbKWArLDIY8XrwzvJlilKG1QsGqf9QXVulHY1cNdRfkd45c3S73xxrYAwxo/zYUxZEpg
 T7OUTtYZteFq49krTlTXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+3ZYpdUHw4k=:h+6ZfcRh0gtjtz1tLFbGN2
 nBHwLqD/cY+fRyXjbxsCtg6OIjI696tla52gRSJ01pFlk+tXsz2YcN0cnbFi7QciL+KgjhDHY
 nkQm+NQ453r5pggtaSaN5XUFwRwR62cqXpVdRM1j8v+58eGWp3i7Ygy8/cS1+POgMKkq9K36f
 nsbPyeMJVHtOGxaQqqYYLoPGjmje4lPiX/zYcz4MwSR5o4nohq3n1ryX3ohQz+ei5eNNzp57O
 QPj3gnnDmPP/z1I9ZCctZFfxf50b4/XLpnMkEuIsQnTr166QtB6SFHUu+Ov3oG1sH+8LsPcZF
 pzE4NqEuyV3ZAsXmJA36W6bl5EVf+6JVq89L8yg5pzPaL7RyKTv2CiCt7newEJNtzHT+Xl7bE
 u4jrP/rS12gGD+U9zuOH6fR+p1hgtdNR1t2BwOTbW+w5SNWJHzBf6JoSyxi5yFjehZCPUedhw
 XD4ULt6ay6/Pf1V5OoXslRAn58vg8tcGMJDUKdBEMqwhxYJmCTn6HKkTj/Zaya6COnITMGyX6
 DpqBC2/L48PNWzdw9y/591zgV9OdKphg7/6HnfqaPGb3P7Bf1kXDyrMfa2/gshdX0HVSyc5+k
 fRnfsuHJL5OFV36j19NXz7/ykGZndxYKkgpG+TripcrzsTcnCSfoMP3Hgkp3Tvi56EevGBVUE
 UFRPQ78poaYgvANWkWEgu2VGNJHYppueWpuNI/1+k+RBFEXUFAcprtlSAQf/k1K9rMiN2DuQ4
 xp5Cz43C3ZmdAS4W9N8uLX27zT28Qm5vR/QWt1ZrxYk9CADc+7LSCr/XJE/4dGhEKifjio4Tx
 SWlJj1PtnXH1R99k4ihiXSwpLtoetwD07EOjoL8GfRIaVsqUlNn1lsqbcz173mZ57V5pX6gQf
 dDgVadLVqfsAAwUl4IqA8fUA82oWZJbrG8ewd/Zsqax9BCTa+RYmt/FkT9kPamZQkR9V3wEBW
 Q55Sldz9eQ5TMJRpB2HjMMpmve6wU9LfVNkJcSsfb6n8/mf/EHcHPIUh3wBd2tjFxbdoKPex8
 Vo7XoA3Red1g1IZSLLhRbuBRNbmDhnkERCDPxS6W+hM2y9X7/YyIck5xQFvN10TijcxhNL4DC
 eIFZJE7LZ79i2FpqB1k7niONqnC9qGvjl8W
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

