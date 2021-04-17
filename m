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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26FBC433B4
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A5DD61354
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237017AbhDQVKY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Apr 2021 17:10:24 -0400
Received: from mout.gmx.net ([212.227.15.18]:52325 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231555AbhDQVKY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Apr 2021 17:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618693780;
        bh=qyeSftwHhlJr8VhQb+3EsUzoelRx0yOVZ4SIuUCgZSE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=P0FKz12kuQEjcsWMjcUlJQjZkESUn0OPLKje/vsBOFwDrPfUwx99Lbk+HAVhw2Eta
         kFofLiv8FIrsOxWJr2s6jbeGQTvatx60kRg9cIZAkE7lVvI56kvQxMiE3MayyBaefn
         UY7f95d17PxCsR9suDptOtIDnwyjrdzwqdyaMOsk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.212.143]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MRCK6-1lCv1k1rts-00N7lt; Sat, 17 Apr 2021 23:09:40 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (sch5627) Remove unnecessary error path
Date:   Sat, 17 Apr 2021 23:09:20 +0200
Message-Id: <20210417210920.15496-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417210920.15496-1-W_Armin@gmx.de>
References: <20210417210920.15496-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Qlf+J+MASFkPkFz2TZxYSBmuTWHQP36UX7dA4W4OOlDg/xJcR6m
 LgU4nGmFsaLD7p5f5BrabLvZVXEGb15BPBoEC242P9o1OW5atHcQOJI3/tHbFMfDiFT8yyT
 26+bDPT24Z3e9/wke+eEUHFjExD3J4rVcyp3aLeMNextpa/HuiKMxTyE8xxRWun8iWs91X8
 WHXhr2Llj+3kSKo3PRsUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UH4Fd8ogrUE=:tzS9oy2sZ0Zae56mZiXw0U
 /fNrIKMYUKBxQUjmZOpY5DapHqPyyIJlX2nt2dlpelGuOVpOwOLmmVcH0pgvlNk5SQtizOXXA
 QDZbhA8k/r3w5EIXxFK7TffMGZDnzqEvIlqAwdNh/9S6oyjR6WCsegFJTTSF9V5+FKTre7IzJ
 ut+xYesLviU0xx7Vr4yrjzwttLDMOGrtsCHJM/JBRb1GvGb8UkSvhk88ROK1y75cHkdkGKPi8
 0xtm4EKWzKafgNKwXWU/6G4DwmPD4NQuz0bsLdi8K9iyu3JjRKiL9T189GzE8xrrK32sjxMmP
 SXXbG5irnlssxskqwcKzJ0Zy9IOZENxseb5RJ0vtVnbnQy1SIIrwbDiIowo4P7hViK5fa6ZX+
 pGuQzXP2ebExcsxuFjV7xS1O5QqV1SpoedLRFVcOSse0OERsFIJPJG5pVEzVz/8pPPGPCUSsh
 9Pzw1CAuxjkhRlr6Ta1cKZB0sMR+XT27DKcj4DQJ3WyKIBuJvvXu8gdBdvqV9IDD5NmC+Q6dh
 CvhLAC5qPkbwvg9okYsB8Uqx0MZxGq5Aa22UGgxJavEtSxagmnBjbJikS1LVC5CX8x4XexHqa
 K+R4sZmkvfrOjftsYYEjRUXPoyHl5GUw+1ijhXOVarxD25DEV4o0R/uyJigobvrLIb1J+4BtC
 M2o6FJfVYYm52nfzghxUAEC0d4cw1vFmQsiRFmNl/cQn/raV0rOpQU8B0X1iWvO5GrfKqikTh
 kDWTuk+zp+sBHslg5OSOn+BEeW4rVlB2NIOQ4Qc/Vcevh8i2dyw2AejJ6F0XuTAVaYsMPut2P
 gjNsm1UdgJwyZXyr3trJaWVaFCysO4FUZzoIUJ2rihMInaP8oE0feF6To6COcLk3KfkR2qsZd
 o0HOWFzdXH/2ZwObf4jPs1GIStl/Dqe/Ii1U0ii4jaT6SJgPy00TuQAbg+3u7Vvd0X5q3hGF2
 IXxyUV+DWLfELKkWGDXbhm52uMRrFwbtPUuBMwO82DlcqThJUVIKglXXLw5Kf4PdpJEIkmNwV
 18xOP/0eh6ElaPaBMO4SuqFjAYe79naAOY+DHAKkfMXRA6IjmEAWOjpWd0pYSbjjsUvn8s0JN
 BFHOa+6SnJx8pdtF3FLJ16gX64JpBPZkdFwfEYwEvIeuGoRCFj7O6wq/CJmL7KW2oxRD0BeLT
 LqsduGvXMPjJ5CB7bqlt+sAFiSua3idInHHK5bBrNAXxJjWuLjh+TtTGV5Ir5+nb4f0/0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Calling remove() on error whould have only unregistered
the watchdog, and since a failure in registering him
is considered non-fatal and happens last, remove the
error path and return the error codes directly.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch5627.c | 70 +++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index ea042a6dae58..4324a5dbc968 100644
=2D-- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -383,72 +383,58 @@ static int sch5627_probe(struct platform_device *pde=
v)
 	platform_set_drvdata(pdev, data);

 	val =3D sch56xx_read_virtual_reg(data->addr, SCH5627_REG_HWMON_ID);
-	if (val < 0) {
-		err =3D val;
-		goto error;
-	}
+	if (val < 0)
+		return val;
+
 	if (val !=3D SCH5627_HWMON_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "hwmon",
 		       val, SCH5627_HWMON_ID);
-		err =3D -ENODEV;
-		goto error;
+		return -ENODEV;
 	}

 	val =3D sch56xx_read_virtual_reg(data->addr, SCH5627_REG_COMPANY_ID);
-	if (val < 0) {
-		err =3D val;
-		goto error;
-	}
+	if (val < 0)
+		return val;
+
 	if (val !=3D SCH5627_COMPANY_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "company",
 		       val, SCH5627_COMPANY_ID);
-		err =3D -ENODEV;
-		goto error;
+		return -ENODEV;
 	}

 	val =3D sch56xx_read_virtual_reg(data->addr, SCH5627_REG_PRIMARY_ID);
-	if (val < 0) {
-		err =3D val;
-		goto error;
-	}
+	if (val < 0)
+		return val;
+
 	if (val !=3D SCH5627_PRIMARY_ID) {
 		pr_err("invalid %s id: 0x%02X (expected 0x%02X)\n", "primary",
 		       val, SCH5627_PRIMARY_ID);
-		err =3D -ENODEV;
-		goto error;
+		return -ENODEV;
 	}

 	build_code =3D sch56xx_read_virtual_reg(data->addr,
 					      SCH5627_REG_BUILD_CODE);
-	if (build_code < 0) {
-		err =3D build_code;
-		goto error;
-	}
+	if (build_code < 0)
+		return build_code;

 	build_id =3D sch56xx_read_virtual_reg16(data->addr,
 					      SCH5627_REG_BUILD_ID);
-	if (build_id < 0) {
-		err =3D build_id;
-		goto error;
-	}
+	if (build_id < 0)
+		return build_id;

 	hwmon_rev =3D sch56xx_read_virtual_reg(data->addr,
 					     SCH5627_REG_HWMON_REV);
-	if (hwmon_rev < 0) {
-		err =3D hwmon_rev;
-		goto error;
-	}
+	if (hwmon_rev < 0)
+		return hwmon_rev;

 	val =3D sch56xx_read_virtual_reg(data->addr, SCH5627_REG_CTRL);
-	if (val < 0) {
-		err =3D val;
-		goto error;
-	}
+	if (val < 0)
+		return val;
+
 	data->control =3D val;
 	if (!(data->control & 0x01)) {
 		pr_err("hardware monitoring not enabled\n");
-		err =3D -ENODEV;
-		goto error;
+		return -ENODEV;
 	}
 	/* Trigger a Vbat voltage measurement, so that we get a valid reading
 	   the first time we read Vbat */
@@ -462,7 +448,7 @@ static int sch5627_probe(struct platform_device *pdev)
 	 */
 	err =3D sch5627_read_limits(data);
 	if (err)
-		goto error;
+		return err;

 	pr_info("found %s chip at %#hx\n", DEVNAME, data->addr);
 	pr_info("firmware build: code 0x%02X, id 0x%04X, hwmon: rev 0x%02X\n",
@@ -470,10 +456,8 @@ static int sch5627_probe(struct platform_device *pdev=
)

 	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, DEVNAME, =
data,
 							 &sch5627_chip_info, NULL);
-	if (IS_ERR(hwmon_dev)) {
-		err =3D PTR_ERR(hwmon_dev);
-		goto error;
-	}
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);

 	/* Note failing to register the watchdog is not a fatal error */
 	data->watchdog =3D sch56xx_watchdog_register(&pdev->dev, data->addr,
@@ -481,10 +465,6 @@ static int sch5627_probe(struct platform_device *pdev=
)
 			&data->update_lock, 1);

 	return 0;
-
-error:
-	sch5627_remove(pdev);
-	return err;
 }

 static struct platform_driver sch5627_driver =3D {
=2D-
2.20.1

