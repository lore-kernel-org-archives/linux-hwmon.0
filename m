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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BC0C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BBEC613EE
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhEHNQd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:16:33 -0400
Received: from mout.gmx.net ([212.227.15.15]:48607 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhEHNQc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620479715;
        bh=nJPCrfzp9weQNf8S+cmL0fOeRc8N+G79gA6rNCRyytw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=O3wCXYKwzNsRS2atk+WF1XkHjyeRzyJ6ejrJVCz9yVK+cu+zl2frWn0ReLtGg86+b
         3l3Awf2MOPMvikYXwqHCs8Fpsx+KxnXTgMJZpveTbxpmX/wxSLfe5GkL5rKmnWaQkL
         0XHXLwcqJ1pygK6szJw4UBSMv72DaRadzQlyJQaw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.223.76]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MxDkw-1lLVVK33SS-00xbMR; Sat, 08 May 2021 15:15:14 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2 1/4] hwmon: (sch56xx) Use devres functions for watchdog
Date:   Sat,  8 May 2021 15:14:54 +0200
Message-Id: <20210508131457.12780-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508131457.12780-1-W_Armin@gmx.de>
References: <20210508131457.12780-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C/TOmwHG6Tox6yVnyXkLz+4qWNAX9bnt/uvS9YoxLm1MKr1OKjQ
 p/njc669YXMThDrMFsjf+FMCWu3z1EfwDt5/eCM53O2SsAmz8lAfCft8jzpUaG/YrzQO5Gv
 cUDbmmRPfVCL2aBntheL06RGhX+oz5pz714dPUEe8jurPysngeXOQM7HyGVmg2Qpx3iEiHf
 vCwYq/xf6uR7/v7Yt5AwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wxXzi9XXq3Q=:kNq9rlAGbEEQJvQRqN/ci4
 rwbEb93c9D4b+w/cw4GlSA4Da6VWNej5KoHXSJPnlqq9tF3Izol2Uxisxojru6d9f4QoiuNsf
 /o4cRnKcZsfWRB/7ojFuZ25GwP2x3APCl4MlBOAmg9oOtYX8rASqVdlV2B0NDOy4OVoUehJmC
 4lnQ6swaAItFwotJRuKzVXaZHF0H0Qk+2OZFLFA2w40FRLUvH6rjr7iLJMtiML1kWDoFb348X
 XHMiq9nJB5cE+vTJuQC19OLJ7NPhi3k+RacIyyh9VJJ3uAyNyn5vjU6XT1MJyT26tuBQ8pF9o
 XU2N3NNyKiiw2Fct6CF1+Zg07HMeJ7SsVYf/ONJ/dl6wwVk1G8RdTpjD4e98lplx5J6rYmQIQ
 BYGYf23pdRnh5t9gxfC3vTHrcQcofrSy+27n8xPd6Hq8oQG8sjk1jZEv/i++8Nt6qZaHJu2it
 f9WLnGkHVJfbFdh1rGwNPguYPUzTTQoE1MQ4IQxQzVRpeReVl5fR0/T6jjzO0gto2UUqJ2ssT
 yvIdRnHReY7kOWRFZ/7vxx9qJKw0Y/IndyVAYSWGLja2VVkcrKLWH/0G0o4jBkwqo1n7IGbVI
 Nw++gbD7Raqe6hwzt6KHtbheHEt55AgUiPuEpdTs3tCunUZmzr2CXRh+28t9yRbMIBtPoKYHk
 edDVKgeivnm32KEXVzmhNlR3/bmQLvquevVt4qXKLAc+ZxsN08AwDgdby4C5rGTrlbxPOFYrQ
 3h7+tpM6W/WKgZsSzQryn2dTLqol3OyqJr92kVfhWdfULo553SmuR9HxcAkTLFjbaGAyRFoUw
 DNeirXytBuFuaFUxcohl+9M+ogt2R53D4d8daZ1LqG3BzHntgP2Qt006b3JTmSz5AXljGv5bZ
 N8coZrXEF4e9GCk2fWlaoB996mHmKLRtKFtm5zTFHh0Ju5Zpvun6/w4k7nD6cL0jbXqyxqyUD
 7e01kcw73ak8Hilz/Hbxus2Qo0wwcM2OrECbQGEB9w4kDf37UmjRQtPGaNReKmMO38bwvzfmC
 0ywapim6iDD4FWpVXsUk62X5HZJr9aFSqRc6rS1Kl0l10Dkvv/SLpFyhmehKK+7hcwmYkAgfn
 2xkQByOUEBhDyq63bTNHZ7VxNxmzPVe9/epBWNgG91D0VNGPe2W42AwK1Z75RGcdGQzCwViIQ
 cp+YEs15OQDWXpTLtMPtkVAcGgJMNjjwY7TopV6QyFsiZoby/b1BxBVGWtVBz6pbSBmmY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_kzalloc()/devm_watchdog_register() for
watchdog registration since it allows us to remove
the sch56xx_watchdog_data struct from the drivers
own data structs.
Remove sch56xx_watchdog_unregister since devres
takes care of that now.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch5627.c        | 18 +++---------------
 drivers/hwmon/sch5636.c        |  9 ++-------
 drivers/hwmon/sch56xx-common.c | 28 ++++++++++------------------
 drivers/hwmon/sch56xx-common.h |  4 ++--
 4 files changed, 17 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 4324a5dbc968..8f1b569c69e7 100644
=2D-- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -64,7 +64,6 @@ static const char * const SCH5627_IN_LABELS[SCH5627_NO_I=
N] =3D {

 struct sch5627_data {
 	unsigned short addr;
-	struct sch56xx_watchdog_data *watchdog;
 	u8 control;
 	u8 temp_max[SCH5627_NO_TEMPS];
 	u8 temp_crit[SCH5627_NO_TEMPS];
@@ -357,16 +356,6 @@ static const struct hwmon_chip_info sch5627_chip_info=
 =3D {
 	.info =3D sch5627_info,
 };

-static int sch5627_remove(struct platform_device *pdev)
-{
-	struct sch5627_data *data =3D platform_get_drvdata(pdev);
-
-	if (data->watchdog)
-		sch56xx_watchdog_unregister(data->watchdog);
-
-	return 0;
-}
-
 static int sch5627_probe(struct platform_device *pdev)
 {
 	struct sch5627_data *data;
@@ -460,9 +449,9 @@ static int sch5627_probe(struct platform_device *pdev)
 		return PTR_ERR(hwmon_dev);

 	/* Note failing to register the watchdog is not a fatal error */
-	data->watchdog =3D sch56xx_watchdog_register(&pdev->dev, data->addr,
-			(build_code << 24) | (build_id << 8) | hwmon_rev,
-			&data->update_lock, 1);
+	sch56xx_watchdog_register(&pdev->dev, data->addr,
+				  (build_code << 24) | (build_id << 8) | hwmon_rev,
+				  &data->update_lock, 1);

 	return 0;
 }
@@ -472,7 +461,6 @@ static struct platform_driver sch5627_driver =3D {
 		.name	=3D DRVNAME,
 	},
 	.probe		=3D sch5627_probe,
-	.remove		=3D sch5627_remove,
 };

 module_platform_driver(sch5627_driver);
diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index 5683a38740f6..a5cd4de36575 100644
=2D-- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -54,7 +54,6 @@ static const u16 SCH5636_REG_FAN_VAL[SCH5636_NO_FANS] =
=3D {
 struct sch5636_data {
 	unsigned short addr;
 	struct device *hwmon_dev;
-	struct sch56xx_watchdog_data *watchdog;

 	struct mutex update_lock;
 	char valid;			/* !=3D0 if following fields are valid */
@@ -372,9 +371,6 @@ static int sch5636_remove(struct platform_device *pdev=
)
 	struct sch5636_data *data =3D platform_get_drvdata(pdev);
 	int i;

-	if (data->watchdog)
-		sch56xx_watchdog_unregister(data->watchdog);
-
 	if (data->hwmon_dev)
 		hwmon_device_unregister(data->hwmon_dev);

@@ -495,9 +491,8 @@ static int sch5636_probe(struct platform_device *pdev)
 	}

 	/* Note failing to register the watchdog is not a fatal error */
-	data->watchdog =3D sch56xx_watchdog_register(&pdev->dev, data->addr,
-					(revision[0] << 8) | revision[1],
-					&data->update_lock, 0);
+	sch56xx_watchdog_register(&pdev->dev, data->addr, (revision[0] << 8) | r=
evision[1],
+				  &data->update_lock, 0);

 	return 0;

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common=
.c
index 6c84780e358e..2db3456ba6f1 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -378,8 +378,8 @@ static const struct watchdog_ops watchdog_ops =3D {
 	.set_timeout	=3D watchdog_set_timeout,
 };

-struct sch56xx_watchdog_data *sch56xx_watchdog_register(struct device *pa=
rent,
-	u16 addr, u32 revision, struct mutex *io_lock, int check_enabled)
+void sch56xx_watchdog_register(struct device *parent, u16 addr, u32 revis=
ion,
+			       struct mutex *io_lock, int check_enabled)
 {
 	struct sch56xx_watchdog_data *data;
 	int err, control, output_enable;
@@ -393,17 +393,17 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_regis=
ter(struct device *parent,
 	mutex_unlock(io_lock);

 	if (control < 0)
-		return NULL;
+		return;
 	if (output_enable < 0)
-		return NULL;
+		return;
 	if (check_enabled && !(output_enable & SCH56XX_WDOG_OUTPUT_ENABLE)) {
 		pr_warn("Watchdog not enabled by BIOS, not registering\n");
-		return NULL;
+		return;
 	}

-	data =3D kzalloc(sizeof(struct sch56xx_watchdog_data), GFP_KERNEL);
+	data =3D devm_kzalloc(parent, sizeof(struct sch56xx_watchdog_data), GFP_=
KERNEL);
 	if (!data)
-		return NULL;
+		return;

 	data->addr =3D addr;
 	data->io_lock =3D io_lock;
@@ -438,24 +438,16 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_regis=
ter(struct device *parent,
 	data->watchdog_output_enable =3D output_enable;

 	watchdog_set_drvdata(&data->wddev, data);
-	err =3D watchdog_register_device(&data->wddev);
+	err =3D devm_watchdog_register_device(parent, &data->wddev);
 	if (err) {
 		pr_err("Registering watchdog chardev: %d\n", err);
-		kfree(data);
-		return NULL;
+		devm_kfree(parent, data);
 	}

-	return data;
+	return;
 }
 EXPORT_SYMBOL(sch56xx_watchdog_register);

-void sch56xx_watchdog_unregister(struct sch56xx_watchdog_data *data)
-{
-	watchdog_unregister_device(&data->wddev);
-	kfree(data);
-}
-EXPORT_SYMBOL(sch56xx_watchdog_unregister);
-
 /*
  * platform dev find, add and remove functions
  */
diff --git a/drivers/hwmon/sch56xx-common.h b/drivers/hwmon/sch56xx-common=
.h
index 75eb73617cf2..e907d9da0dd5 100644
=2D-- a/drivers/hwmon/sch56xx-common.h
+++ b/drivers/hwmon/sch56xx-common.h
@@ -14,6 +14,6 @@ int sch56xx_read_virtual_reg16(u16 addr, u16 reg);
 int sch56xx_read_virtual_reg12(u16 addr, u16 msb_reg, u16 lsn_reg,
 			       int high_nibble);

-struct sch56xx_watchdog_data *sch56xx_watchdog_register(struct device *pa=
rent,
-	u16 addr, u32 revision, struct mutex *io_lock, int check_enabled);
+void sch56xx_watchdog_register(struct device *parent, u16 addr, u32 revis=
ion,
+			       struct mutex *io_lock, int check_enabled);
 void sch56xx_watchdog_unregister(struct sch56xx_watchdog_data *data);
=2D-
2.20.1

