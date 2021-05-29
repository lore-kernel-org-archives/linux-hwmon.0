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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC635C47091
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D7C3613F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2GlK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:10 -0400
Received: from mout.gmx.net ([212.227.15.18]:37389 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhE2GlK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270358;
        bh=PZsPMxibvPq4tT9Bbcp0DPfijzbAJNrdlBbz800ARJY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MRGs6VfaVcpxumzbIfUbf5XHJcbLAmKneIyzJgEVTDHevuB60vLH5iZZ4bb3v94co
         KQe7zlo562VOaGLWpCs38eNn0fCE2IU9Byok+VoSVsYBhDCRKcDtTkL6M+bl8rY8m5
         Vw6mXZeA30QTPugJNQkKcgY5EFypJutjdoUID9O0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1lN4Lr1wfN-011B78; Sat, 29
 May 2021 08:39:18 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Sat, 29 May 2021 08:38:54 +0200
Message-Id: <20210529063857.10177-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529063857.10177-1-W_Armin@gmx.de>
References: <20210529063857.10177-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kWNU86ZPjdw4+9kr0uZsxdXkkOBbj8ygEucPitApuOOm6QYrpFo
 uEC6idR5jDIxblaBCivYyNMM55WXYRjq/V1dYrM+av/zH3ZiotNVqG5e7ACEiKCX9WNTXn9
 +OryrTjrTOFzFGQdrivc26Q19NKuOiqKXclfWJHy5UHxKs0TbcmqGtgp5/3WgCg3L7NTaii
 dGhL+aDpU1DdcNOwytkww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TjfN4IoVfXk=:S5fmImTvc+D0ru+sCdE9kN
 NMFRkBFdlZhmxg/nbOTx38jtfIxm4SsAQhzRWWX7hO4/mDpsG4C/9MTZIxqvI1I/CX9BKuult
 iE9HeGVgW1vUI9TXjklfYdrmI40EwBYssNi6WcEffdCwCo1fxYY27jefdTZNHShGzDwjxjuxd
 MPljObn/eH1lfRxbXIKySJBccZsNenTSRxiw1aWA61JVdOX3QABPpSMZzndDkhIzXm5FVd3qe
 c9KF9SzjtAXfQPzL/zM+m4Mhwt6e5Jokaay2YNZZJxPyJmkvMHtkiRNX8Ej2oNpZUC6LlYVug
 HWBO3jS3RFmsOCCcF4/OSEk0WjXYKKysZXWeauUncbvW4gLCcm70MCEhX0jwmIDr4Yz47+AuT
 Tvf+eFSZOhyIb98JNyRvV+q6Hv0+sLtbAzwbovsQpoUc8xQJG6SeT3qxt/f4C2ns9q1oqeBdC
 iLQVclUcCGhMlS8J7jK3py9eZp0B/x3x+jxngohEfsxfbPBdBL9+oDR6rkZu2EFLhT6nAzaM0
 2l6lcg38elTAtDyrj8ngGC+q44jE51a6hVTJER1ct5P6sOwGBTvPfKh1H7qf3MO4lvhiHuMn5
 Rt1t8JImOl9Hpq2g8A9nrCTsA0mWGRpliShMoWK3upJIUWUewD5Sktw4YEq34RY2IgkHE6DM8
 aEyTIckLc7BSMJuhDyxPHKbIkNMc4t9nRtpcmkRvTJRVqfCOsUPiYIvOfTNC2tRGv8uQTUqLg
 O4D173XoV7p1o1vkYX8wxQXD9liYa/EmqTKgP1IKkDGEO+kgTo5aOc5vVTTqndgVOptl1CZZQ
 5lQyF9lw/XTmXA5M+RkpIfFOPEIZ5g6+pwI6WxDdgOgBZxOYeC/A6kIvZv8msXPpy7GcMrebN
 IiClTHECj6nT9ld9XUqRD0wLatTc7Gknpwlwi3aBj9OmSyegZtJtyLmPU66FEfNr+YPhGbovm
 9gRrSm5kZ43PNl78hlkud6OhCYFqeGa1G7NEOp6uDlXEfDaILKlPr+Bw/7eAD+PxfionR9WRt
 OfufCJuvoPAdAumsoLs681R51H94v1yMGfPCToPX/hUemsaAdwNFx1jkhi+ZMI6sEchLNYxYy
 eoOGuyKw9tiRfgFio032azlQpTwozdTGwDE
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_add_action_or_reset() for calling i8k_exit_procfs()
so the remove() function in dell_smm_driver can be omitted.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index c898d6bd6a18..da7040f2442e 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -605,24 +605,22 @@ static const struct proc_ops i8k_proc_ops =3D {
 	.proc_ioctl	=3D i8k_ioctl,
 };

-static void __init i8k_init_procfs(void)
+static void i8k_exit_procfs(void *param)
 {
-	/* Register the proc entry */
-	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+	remove_proc_entry("i8k", NULL);
 }

-static void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
-	remove_proc_entry("i8k", NULL);
+	/* Register the proc entry */
+	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+
+	devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
 }

 #else

-static inline void __init i8k_init_procfs(void)
-{
-}
-
-static inline void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
 }

@@ -1287,14 +1285,7 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 	if (ret)
 		return ret;

-	i8k_init_procfs();
-
-	return 0;
-}
-
-static int dell_smm_remove(struct platform_device *pdev)
-{
-	i8k_exit_procfs();
+	i8k_init_procfs(&pdev->dev);

 	return 0;
 }
@@ -1303,7 +1294,6 @@ static struct platform_driver dell_smm_driver =3D {
 	.driver		=3D {
 		.name	=3D KBUILD_MODNAME,
 	},
-	.remove		=3D dell_smm_remove,
 };

 static struct platform_device *dell_smm_device;
=2D-
2.20.1

