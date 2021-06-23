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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D08C49EA6
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E7A6128D
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWVXd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:23:33 -0400
Received: from mout.gmx.net ([212.227.17.21]:47397 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFWVXd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 17:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624483261;
        bh=MAZ2RepE8pnVZ8vGpHw+h5JtFtRDpUmvqrrE3+KCZ7g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cPOuM+hQukhZ3xkkiHUFEAwgnxLbj1aisrkb72/BU5/tMABWXv5HpU+ninpWbWRFl
         sI3EYgOOE9LRR0hK2cKMmiOhYGCjWll6I//cPrIRZszUJFE5b0wxSE9IbPgKu85zVW
         3NAm8EOvEOMMGURVDeCKxiZtAyHfdOmGZUcX6pbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.178]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOiHf-1lcjVC015b-00Q7i9; Wed, 23 Jun 2021 23:21:01 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v5 6/6] hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
Date:   Wed, 23 Jun 2021 23:20:26 +0200
Message-Id: <20210623212026.30799-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623212026.30799-1-W_Armin@gmx.de>
References: <20210623212026.30799-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AvGEnFynhTwXVYRis2KDLHPSAywwg0+k1WthI7eKEQYqBfgpOZe
 h77jc0Gh04xSe1e5FxyoUarabLcynhatSuSGvRhughYliNa0AS8L3FnXZfA7Lxm9LGC6bHA
 b4mUPn0dCyUqnH9eqRhrNLSIbE8PWjdHEPz1KBmMESWDkuzTlEgi8toWk4Bs2CyqG/DxvdI
 g3nUyI0P78eWy2nVqQwNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Aoh0+r3F1vA=:c1yhDBE2w1rTQXpiPlfOWS
 KpoAERh5A9g0gA3OZ9OJkxeteJhzwD2AMLvCFbJxuHfDA/3/JEO4iwb3IsoiCxLJLy33sEiSw
 plBMD1j3c4mB3AATmRo6aUh9qlkJ60pma/cvghbyS34JAFhEEuaYdABpc6GM9/R98wBnuxOpN
 Ooi6x2DccYMBnOjb+xhyb0Y6LJOp6NTWWjywEvj1zW2Q5oErUf+eQHVbNJ23my+A4gMcu+elA
 edJ1kaHiDBY40yEkLP3QV8/FImlYDZqPTboAu1VzDVWCoaHtE7bCH/UixtMvlNUDts1mx3DLk
 6b2icPGT/FS1Rc+R8TBGhUmRHNMA928piCGII3EZ2uorCOuR75zA4drBeK/eZLM3gmQG2pwJ1
 1i3tuR5j1ILgrsUhaFSeJPWL3HNqJq2hZg5/A25TV/RLdtmw44691LSCWhMOgSXUuiJsTUoQZ
 NaV1fmJEvkpaBaM3rjDM5EljJfVJ0sLhaBtf53UGoxd2qijDNl02GNQKrhVL1S9swcNCCaU27
 Khkg6aZvj22NNyTQy0lfHCrgdVKuBHjK1oo/ek/q2I4/qo1/SCCXXO6qVfLvIC7ubjEiiXU03
 tey9wijHUsqeJjyOwGojb480YTT9PzCVtcUD5rqsJIRKhkwN8HHSHGw8gXYC7aMkrmDXxAx5D
 zDKFUDABOa6uRD1OIDtZHxsNsYHf/t/I60NO+4rk6xx3paqzHV11Pvqw3OpeW+ZmB+VKCHj+f
 DWLbYBda1xQxm4TrkNzD1jZ2WalLxqOXb3hxLQkr3qQ83ZHh4TLDwPgwGPATHACRiusNiYg4a
 fPzkazTzvlOIjlF7zwUC5h44nJD6ENdCazQm+omvBjGIscDnn8JN9igxwf0blDetnEdA01I8h
 45SMu/6DntpHG7EA0xwyrDFVklukyg+XU8oGq6eFsKUDihThcPpCa3niyIKOY0vgBCoHOFgR+
 wOMNh2zPqmBB+Oflv2FnVuJoZuakEj9vWvCQtGfZThhgpoza+7zD6f6pkFz3lEaNruVsQ2+33
 6B/KAL++z46GsZgQ/a/uc/K6plqFarcBopKPETYAfNBrEnfWHMvHEXsw6/koGxCyD36MSjCZb
 WDkFshFuc0XtFamdbrOVXU2hB8Ks0DW7Bkb
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
index 9ae13c569e39..494a37bab4a0 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1257,7 +1257,7 @@ static int __init dell_smm_probe(struct platform_dev=
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

