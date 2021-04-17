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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63BDC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6BCF61354
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbhDQVKX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Apr 2021 17:10:23 -0400
Received: from mout.gmx.net ([212.227.15.15]:40151 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231555AbhDQVKW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Apr 2021 17:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618693779;
        bh=jAoqA7m8iMS8WjedqXzF7H2/yBtx6xhjdzDye3VdXF0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=KhSn+82iQIZC2R3FEiae7euZJd61fbYaMa7zkV0SMgnSRP9w7NEXLtXJU6uqCHDgo
         XmdQeWgOz4dXe9KmeS0RHMum4Ql3ILlKYk7nlmdmThJLqrs7rkCHCg0f38yXL42kHR
         H1cvxTr0SJZ+Wic1/zmAAdaJkzA/+vtHjIQPlAZ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.212.143]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MTzay-1l6tA843d4-00Qzdf; Sat, 17 Apr 2021 23:09:39 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (sch5627) Use devres function
Date:   Sat, 17 Apr 2021 23:09:19 +0200
Message-Id: <20210417210920.15496-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417210920.15496-1-W_Armin@gmx.de>
References: <20210417210920.15496-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wGtZ56NeL5tD67x88s4Lrq07e8x0uAeYW1SPCZeAF7PSNhfZTPt
 VV1SHqkrMjeTqEqo+2C/m+P14dPNrkVV+bOOK/TmMXNS3qHSGheFPYrUMRYgcRVKUKxVp2D
 ckNthI4IXS6Vtb6hoSWaAzpNVAmnRdccs61aaEg00706Q4qC5jVAz229UfVFLzcEu6Ccc7m
 514S9GmDzTZT8zqSL1GwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b/aWvU4jFsk=:jYGyHzNiUlwfx4No69gT9s
 RAcJ6/OurBtA2lvCzFo6Q16rgTnJoY4tQYXbWpnV+zqPc/E0iqfovEUEcMnWlDUXGwYeyR5qc
 EuMQKhTbMuJ+vmAZA/ohV/Pp1BB/Y57CBHgvpDJKzH57UNtyQgYnf7JLIZQ1piyrSGpWdrXgb
 IoTDxDbGIidj1Y8llbtxGt8dVFJyTyt3NKRtXIYjit+loAtdPv/ZfY994oLDayZdF/numYi8X
 cRc+c6ayrRwFV9e5pRhqI+g878FRjTaenZJYwfGhDQDU2zbY8LFdzUg9/sLnfC5IJXYiH65GI
 vrmHovij8Py0pd8eTJXTHSoSer1RF8yRWj0MraptKkuvR13azqsctfHjJKU7gUzT0OQUgeSp3
 LAImQW84ZReFa/uGRnFbNHLd4X/HNeAO3vLWs4aq9C98kn9J0rm/WXwxXILRuubVDRhuT4SQ8
 R39F6bDoHITlcC6UR11AaZ0IoKoixpDGLK7YsQ/SnfHSjyQ7y9ZkfciXFZN4BITD90ObYwXCc
 fnP5V3lHYK8nyXraLufYxbVoVUipW1OQUN1vp+Vs2pHiDKPNctaR8kAY9i2HYqkL3b5CV0StB
 uSipfAlTLz3KFHfwmyDH54W57OhLfbFkfkykSc0yX+9Tg+4lK0tVFb2NynWlLgDxnoqrenoaV
 Cy7kPZwHTq43D5Lve3mN2j2ovuChTpOT/p8EJCDJVXCtAwc+0d3JoukNlDTbmB8oPH2OOSPvz
 /JK3MLe8vQYS0JnVo2qe0ulZUD7AEuwE5KHqF7YRVLSv669cnkcUQGgZRp/VdQgH9OPpSF6rz
 /FrfYZygZ//3dNPrpSp1RrgviqvYwPfsVEKizi/t8eAWqDy4AG4F1IdNTOWRG3B3EPDnCg2uv
 Dh4Oc6DgrSMqYKGqsysSzrLH9DI2EyZcbypmoWMIc/GTdnnKOJyOiPvvLh7lmR5bzaMbIzsGi
 0QKUJ7W8StfZxl5PrDmyoKkXbfW6Lyl+M9lxBe/b1Pz4TaI7D7eBFYf3LpU+Wi7eJtQpxSUhn
 iJeT82wsaRoCqBVAvJn/+1VM6eF6VghiH1eHRLqsybjBbstmhCHxTOzIS7RLCcNJo+yomr7ok
 8vGveCzekNfwZo0jvl2Ae7hd8ITlAdmdvbE0u/+f61lszMq1SVtD0QuGEp2lgwIaFT+B4ylQ+
 y/Wb0lklOFGbGtgC8oAKBE/BufTQOB4djjAsnFzruCSpa2byih1s0aB2vcAe/ND34smic=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_hwmon_device_register_with_info() and remove hwmon_dev
from sch5627_data struct as it is not needed anymore.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch5627.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 8be339ae5f7d..ea042a6dae58 100644
=2D-- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -64,7 +64,6 @@ static const char * const SCH5627_IN_LABELS[SCH5627_NO_I=
N] =3D {

 struct sch5627_data {
 	unsigned short addr;
-	struct device *hwmon_dev;
 	struct sch56xx_watchdog_data *watchdog;
 	u8 control;
 	u8 temp_max[SCH5627_NO_TEMPS];
@@ -365,15 +364,13 @@ static int sch5627_remove(struct platform_device *pd=
ev)
 	if (data->watchdog)
 		sch56xx_watchdog_unregister(data->watchdog);

-	if (data->hwmon_dev)
-		hwmon_device_unregister(data->hwmon_dev);
-
 	return 0;
 }

 static int sch5627_probe(struct platform_device *pdev)
 {
 	struct sch5627_data *data;
+	struct device *hwmon_dev;
 	int err, build_code, build_id, hwmon_rev, val;

 	data =3D devm_kzalloc(&pdev->dev, sizeof(struct sch5627_data),
@@ -471,12 +468,10 @@ static int sch5627_probe(struct platform_device *pde=
v)
 	pr_info("firmware build: code 0x%02X, id 0x%04X, hwmon: rev 0x%02X\n",
 		build_code, build_id, hwmon_rev);

-	data->hwmon_dev =3D hwmon_device_register_with_info(&pdev->dev, DEVNAME,=
 data,
-							  &sch5627_chip_info,
-							  NULL);
-	if (IS_ERR(data->hwmon_dev)) {
-		err =3D PTR_ERR(data->hwmon_dev);
-		data->hwmon_dev =3D NULL;
+	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, DEVNAME, =
data,
+							 &sch5627_chip_info, NULL);
+	if (IS_ERR(hwmon_dev)) {
+		err =3D PTR_ERR(hwmon_dev);
 		goto error;
 	}

=2D-
2.20.1

