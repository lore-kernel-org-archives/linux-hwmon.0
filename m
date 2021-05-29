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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31958C47082
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0819C611AE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhE2GlQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:16 -0400
Received: from mout.gmx.net ([212.227.15.19]:34233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhE2GlO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270362;
        bh=74UcKt3Z3PoliD1LPr2DSXpjuxEdJp45FyIPj9D2SGQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LHdUFomaSPpAwyYIb+3Th+LSEgUyiiE1YOr8Va1F6NhK2plc1C2RluVRY4rLFiWlI
         pX/QVsJN0alWOKFHJb1axt+Tk+9lmuFeDpu6LqFbpNSL9jDWGoc1TOCAyVLJhdS0ql
         X5KOmU4AFypxUhAjQLXUICXlGr3oMJf3AL/B2q/M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1lYwJI2MV4-00utrK; Sat, 29
 May 2021 08:39:22 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 6/6] hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
Date:   Sat, 29 May 2021 08:38:57 +0200
Message-Id: <20210529063857.10177-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529063857.10177-1-W_Armin@gmx.de>
References: <20210529063857.10177-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rQ5tUTNX/Vr7y9oBZVVmnl9+8Fi7T/nCiURDzWJ+BbFksfpnkD4
 ECaujjjdc83h2qMYxHMfei/vMOSgHwCrpSCoHVXGhnGcQzla489wBRIahf3BVJgDMXf8QwP
 mQQCIxSue1l1d4XDD7lqkiC5KWkbfc4Iyl43g6+oxzheW5qzGfaHOBcGZPGzpesizzCiM6V
 2lxua217PqzTuHed47ORw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r+T32bRam10=:Gf5dpTR4Ly8evWu6Zwocem
 G43wBUuO8EhWlxax8q8+dfF+3uHM5V+i5jfi0jPDBGzDZmd9K6U/fQu5xA/jAEiC24BecsmD5
 xw4Iibc33GjkR5T0mqjpi6kcE88XnmbfUe8/24FMyJdVlcYvVP6J3TAhzYuKvU2aqEt4bGYaW
 qYIk9Nxzk5jSIRZgehykD0qYJFroWzo+PW4h8vLlN1ZzhT8U1WWNEK2k5cdokwOEJ93dv69fk
 h+YBlzmBP3AgWYE2cgg3WH9PHASA2KlfFihy8c1lvdWVlNiDiZy9dukdp50HQAVwCYQA9+Cs/
 KqpozbNNIfWFJyr0hDkQ0S1aJtZPiqFRTNzgLqitc1d3g+7UBu1TFBOQbh9EDKrwkBkVdIxVt
 u+i3YEDxw4yu3qgdZ3OMt6UtbBJ9oFnXrFYXEth4/4vsTiunuMSmoz2+NfzvSEDTs/zPU+P7K
 UcIwSOL+lUoQwJAlPuZ3sNTJjOokQNEOr9o5dxV1c5x38PDqe8QTt8Ldm0GXvIAzIkBzpwp5G
 od3iAYMlFtp0fFkvQY0wFgZjUk9H2DtKoI40VUO2uu1k1ZHMKVEHlLMOk+IuYCf5icSx8E9re
 v4I8N34vRSKmeQEKU05q0Cxk7/cepA9mIsdLLpd86PxsrykQ4V/lzfEWGun/2/tBDOMVAvzgV
 gIFylhLw0ecqfoYGjNZAr/r5XNBIKdgHD+zwTW+YRD4vAgqO8YQk/MmR1zXH8FKTudv9RU52p
 QbBD8AigT9E8CMxCSWkcwwzpXxixC5167nH4imIFHOcRlXA7AhkNTrNxxDyQQVc6uwhrDsDkJ
 tzmIAaLGSLj/NnTntoi+Vwm0l0XlwYG4OacLBGuzGkbVHdJGRAISRdhQZ+DGC5ewmC84N8RqB
 E+GjY4zl9Ku/qToxPIYYrBVtGJW6v+xI6HIHVzaZAzlsNnXkuaFelBmo8mxBsaWUYKIWPPBO/
 K0n65G8nbxCoyPTxhQZiBynPjOMmiI9tMVUKRo/1DaLlvbOA2J3G8IvDssWUk0y62d+tNyQdF
 qTAV9ws0mzPqFg6AaRDQ6YaAQdrQY68QEvqTCtk2e8pl4Z/VoX5LBgPgKQbl2J4ZxA2eEOlt3
 KV6qaN1rNN5vO4ghZM4efzJzH3BYrr5Re6EWNwJ0YvzTlYkM9MxRJpHspmauWNfMnlUvrDbhs
 c1Pw2M90wiI8lZG3Ht2T9UZ1yWqHQf81TMQSME52aXuJH/fBZ5T+xUSYaSkFVWbbTp/FA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

There are up to three fans, but the detection omits the 3rd one.
Fix that by using DELL_SMM_NO_FANS.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 0ef3dad74a2c..b7378f84e1bd 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1248,7 +1248,7 @@ static int __init dell_smm_probe(struct platform_dev=
ice *pdev)
 		 * Autodetect fan multiplier based on nominal rpm
 		 * If fan reports rpm value too high then set multiplier to 1
 		 */
-		for (fan =3D 0; fan < 2; ++fan) {
+		for (fan =3D 0; fan < DELL_SMM_NO_FANS; ++fan) {
 			ret =3D i8k_get_fan_nominal_speed(data, fan, data->i8k_fan_max);
 			if (ret < 0)
 				continue;
=2D-
2.20.1

