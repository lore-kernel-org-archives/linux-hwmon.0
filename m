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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34C5C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0F79613ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhEGVZp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:25:45 -0400
Received: from mout.gmx.net ([212.227.15.15]:51555 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEGVZo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 17:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620422668;
        bh=xmw9bIz0JbaGMXrW/IkaUwlZOQ+UcFUuEu0ihxDOGlI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Nh2/mAxeTsnfnUFpOMSnQDoEL8WEm9kqogNYjjQ1VEgi5G0bCtsiNkregAYSlNLjL
         k3ao0sLaLU1iOH2xF89nRMlIoWn7M+AkljaRKKIOXmn6bkpXlOGJbrLO4OgEorId/m
         2XLVgwSTRC2A2uorqvb+8mhbV8+SF8vKHgNaH5is=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.209.175]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MwQXH-1lM5hm3hLR-00sPDv; Fri, 07 May 2021 23:24:27 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH 1/4] hwmon: (sch56xx) Use devres functions for watchdog
Date:   Fri,  7 May 2021 23:24:01 +0200
Message-Id: <20210507212404.6781-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210507212404.6781-1-W_Armin@gmx.de>
References: <20210507212404.6781-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5a6CBi48auSOmACJ667NTQ6gbdNMykXPgXkN7P222zbiSoKxj8w
 nl8nWfLGTYoHwzDV0tObFZebSoZtzDA1klZMsZ3x5Jg6vr32ty4o43oRVqGr8A0pxRb4TIl
 38zq8D/j/KT8IYhMsf0ZdWDV0mbC0OpR7z3RdaGgnkeZKmG+aIgFsOVkdqtTGTistatsDEQ
 /rf/+IkPh6CM+bonHY+4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bXqqEAsK4qY=:1WVx5tgGb/uMB/ucUSXxxO
 7B1GwvgYPl6hpAE+LLmp0Qk5GXn8E6aT03J8ML7pfSyS1NbFmd3UyfMtNEUp8MNzpTfTN3fmI
 RUkJ9r9m1Bhb8fcYCEQmHKv0cckACh7KG9hMNjH/L/ez1GV8DDs1LuzrkPRRNl3f2GPUQ7Zvu
 iJ3/jWg8ScdCrVr/gCcWiWQJotfb8h1MoYkaAt2fJsgTIMzbbZsiqjI68FXE7fqjIvgFssoDV
 ZeDk3VDPVQvmOq5gpMqr44YWVyghES0YHMEA+u7aVAxERXMyitAe0Q2kbX7J7dOboPRmro4HC
 qf3ASMuSu3oRs+RqiLJyh9Vo/Bs84BnFaV+3QjMTfkNQ+xafQYkRy3bIeLkXiqGTexf6SdHDd
 X4D9L1JBXGQschx3+/VHqs24A53DKaTRxiLTUwzFPxsok3vuRwBZNm5FesmKOfEUKCmIRTn2b
 5bXKs5PpCnxz5KMyH5jAn4sbEt6izsCMCF/12GtrmovgDuN/cNs6k02iB0K6qmcJAkbygZndl
 zec3DenGCfCAQOJ3qVjw1OOHhs4Y1QPnjZp74B3KRTIvMsX+dcDBcZ32IdwDeoTyNVFsjQSCi
 JpvviVfna+tBhcDj90FR4Xl2yD/NtttLlS5WCdKpTiD4fJhCdZWLFdbzQkk1sNy0m+TP3Cb94
 1kAQIuyuQK+ABQXFZhOXNbuKrCCFDnarOvieR8uPVYSEDM+IT+xGTtpRsAKiBYdumg0ksY78d
 J4ZwZALNmRuNbkcStJjSLpKaZDE3DqDx20afwXt0Qwiua0DTNlfRxLv5RK9qd8tmlS/QtXSbD
 b4x0A9N6zRz8vEjLrHoVVHCUNEMuR7+bUAPFICNDDhe/wOchjPEtMq4WHo2jiQYuvB42VPHR4
 gvBmuXYMSfaJwXjc3jwJurgua7L/9t7QPU606jS9GBPEU7r0ExsBPHJ2gezNaz2wMGWGsSIJm
 4e4OyLUFdBYKlS3Wp7Bdq15WcIi2VAs4kxZ9NEsecHPCeyaVwhXLfvB5Awn9IYYTbA8bvARFr
 6vgC7aOwkX0qGXkbH/PyRHLp+9+DcVRU+2KIptGzATb9PPTYScpbiVFSVSz+WiMsrfDFgx5Rb
 M3foX8OCA+B9vMyqUQIzp5beYApCTpmefZeJ2YzTOn34wqb4GlEf1DfRJgteVlj+cwLa7BSQ3
 hTEb7FIy9h3P+HCsFHEtkLy/4R1Fmi8zn9b/vYu5patILemPd7ITghLMKGHunh+xxvJug=
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
 drivers/hwmon/sch5627.c        | 12 +++---------
 drivers/hwmon/sch5636.c        |  9 ++-------
 drivers/hwmon/sch56xx-common.c | 13 +++----------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 4324a5dbc968..8a71fba33ea0 100644
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
@@ -359,11 +358,6 @@ static const struct hwmon_chip_info sch5627_chip_info=
 =3D {

 static int sch5627_remove(struct platform_device *pdev)
 {
-	struct sch5627_data *data =3D platform_get_drvdata(pdev);
-
-	if (data->watchdog)
-		sch56xx_watchdog_unregister(data->watchdog);
-
 	return 0;
 }

@@ -460,9 +454,9 @@ static int sch5627_probe(struct platform_device *pdev)
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
index 6c84780e358e..9c884fd0beb2 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -401,7 +401,7 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_registe=
r(struct device *parent,
 		return NULL;
 	}

-	data =3D kzalloc(sizeof(struct sch56xx_watchdog_data), GFP_KERNEL);
+	data =3D devm_kzalloc(parent, sizeof(struct sch56xx_watchdog_data), GFP_=
KERNEL);
 	if (!data)
 		return NULL;

@@ -438,10 +438,10 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_regis=
ter(struct device *parent,
 	data->watchdog_output_enable =3D output_enable;

 	watchdog_set_drvdata(&data->wddev, data);
-	err =3D watchdog_register_device(&data->wddev);
+	err =3D devm_watchdog_register_device(parent, &data->wddev);
 	if (err) {
 		pr_err("Registering watchdog chardev: %d\n", err);
-		kfree(data);
+		devm_kfree(parent, data);
 		return NULL;
 	}

@@ -449,13 +449,6 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_regist=
er(struct device *parent,
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
=2D-
2.20.1

