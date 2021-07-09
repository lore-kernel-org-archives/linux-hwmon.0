Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3F0C07E9B
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A48613BE
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhGISsQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:48:16 -0400
Received: from mout.gmx.net ([212.227.17.21]:35043 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230173AbhGISsQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Jul 2021 14:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1625856318;
        bh=rGLVj4vDXRp4MVHS59LdfVoW4hm1SeuEwY8sZVvP+4Q=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MrSWWngFufwe+IgRhDapEJu6eG16drr4SxYqny3Oi6n+HiNEjvBjSvMWbs1DVg4Kv
         y18XWtrdAwKMmeaKhxMPez9NGTQ+ruBmsxBQULgkFbfc26aAohMBusgwMxMlARmGwI
         JPWSgVOLdMHJEfBsele5ClUfbIti/uFYCaSLz4Nw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.181.110]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M5wPb-1m4vV03Xi7-007YQv; Fri, 09 Jul 2021 20:45:17 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
Date:   Fri,  9 Jul 2021 20:45:01 +0200
Message-Id: <20210709184501.6546-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709184501.6546-1-W_Armin@gmx.de>
References: <20210709184501.6546-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y6mHfLEhfV1wAFF7fPTMY4HjMDWwq+0GKBeP74p/3iA2CRdwfOl
 hrQnlFTEi6E/6wQ9eDPYZCNV48zBQox7mprTjoKuuKatVSPKB87MWFftatkZzWTNJIOIwnL
 fRlHz9BZwI9T4FUiMcOWTj9o8Bj3jTnsRrLPBAC3Jnvo0CcaF68QGlWaymAt56m9qIEYcgn
 sEU7M4Gh04iaI0CEfwOKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MiDXUwkujIA=:GWmaa6qnwWnDshKO2nVOzl
 CAbrHYRnUtEJCcdbPmPDYWfycDBcSeBo08/Y+YAvVuPKZmJA1p8EHUBRpskc+5ZLvWBbRkYRl
 6B2mni7Yo0mZW3mhC71aqSoXjrSCkIYwPldmUoRHpr5pGOUTtNF8SDOLy48cWi2aTqA5fP/YA
 +InKTIJ5CdEZTporZgRSd7xtZAtQCoJIkAaBGLUtToEKhnAnvIkXowC6AR28v4bblgFgOxwHj
 fKNvtMNzmW94lkPaKHX9mQevO1M9sc3BmXJgap2KqIJeD1Jmm1jFhI8tdOz1+x7puBIr+JhFq
 cPTTa/lWy8pI2Mu3EOaelH15wOxHMG2/6MV4d449rT/uXG5x2fTJwpTVJ22xReoSK/5Sw2wZX
 0S8F/hQUE+u+5YnWWIlIVNgMUbslLr4TgS++eZYmi4+lCq7MTFZJ4obih6YES8WJemecWlWA+
 qeK02CLUjTTVQIZtRJIO4SDsAwuGLJKP4OPS7m9L4lB7VdDP5hTDIoQVh0t6t3ZwlzrClKWeH
 87wAKRPKIpf0bEKKblwzJRD2f4NOVqkrM1Re8CojOjfW7W0+szer2Da79KkTaUCXdQfqpsfgd
 xgpamqntAoAPfAnQHaLONVbQVSohHyq3FrvYHPEGe7zNd4gic9zMPRbHQbv7x8Js2OwUKhMgu
 qaNVH6WkCEsJKQyyE9rerfmk9uFff+ILJC06yXulkilEONQg42JH38USoHcJQsCfjem6eoOsq
 pULtKxA7ucoZ3skzxecHpeBIgGhjV6By2od1tEpsTUwpW53IttQDNkza5ZKViTIm9Q/jrhHU2
 JqOTWP+NGpx8JXsPFLlf/dNc0KmUZk9kYGM0hyov+FKp0j6v9GYRqBG1q1xCUmaQ1H354fsoA
 n70JpHhNL0itg3TXr1P/cdmMd2GQ3i9YkiWQGTOgTnTSuT9PRgX9A1JDfuvAjxmWovQsTv4HT
 nSSBnZ6fwG0QaAmCS+y+Ej7hNeQMimvJk/KWIqTi+rR+bVg6eG180FPVw+wB3J3HJpf+jCvdN
 GF3cMXfSikCqYEwHrYPye1VS2XRg8DlRUI185Q1ePSmFvcQWPML1/cXONKHjjPLIFr6I1aB1K
 tdZNcF9V8MpEF1Y9NDwtbBqp1yn0vGUPAQz
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use SIMPLE_DEV_PM_OPS() to also assign poweroff
and thaw callbacks. Remove the now obsolete checking
of CONFIG_PM too.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/w83627ehf.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 19af84574324..243b9bd8d64f 100644
=2D-- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1946,8 +1946,7 @@ static int __init w83627ehf_probe(struct platform_de=
vice *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }

-#ifdef CONFIG_PM
-static int w83627ehf_suspend(struct device *dev)
+static int __maybe_unused w83627ehf_suspend(struct device *dev)
 {
 	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);

@@ -1958,7 +1957,7 @@ static int w83627ehf_suspend(struct device *dev)
 	return 0;
 }

-static int w83627ehf_resume(struct device *dev)
+static int __maybe_unused w83627ehf_resume(struct device *dev)
 {
 	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
 	int i;
@@ -2013,22 +2012,12 @@ static int w83627ehf_resume(struct device *dev)
 	return 0;
 }

-static const struct dev_pm_ops w83627ehf_dev_pm_ops =3D {
-	.suspend =3D w83627ehf_suspend,
-	.resume =3D w83627ehf_resume,
-	.freeze =3D w83627ehf_suspend,
-	.restore =3D w83627ehf_resume,
-};
-
-#define W83627EHF_DEV_PM_OPS	(&w83627ehf_dev_pm_ops)
-#else
-#define W83627EHF_DEV_PM_OPS	NULL
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627e=
hf_resume);

 static struct platform_driver w83627ehf_driver =3D {
 	.driver =3D {
 		.name	=3D DRVNAME,
-		.pm	=3D W83627EHF_DEV_PM_OPS,
+		.pm	=3D &w83627ehf_dev_pm_ops,
 	},
 };

=2D-
2.20.1

