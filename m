Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711C0C43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 525FA6140F
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhEHNQm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:16:42 -0400
Received: from mout.gmx.net ([212.227.15.19]:53371 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230488AbhEHNQj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620479722;
        bh=2JjXJ+A1EbPiAra4s+rtm3TZY1uXz383PTvaOIjdhWo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=f6gv8E7m68eRGyHVhIq+QYjQKv13G3qCBLTRT5typmclqDN0wMzJHuNf9g3BzMlTs
         LR8BnhPt+f3L3jy9H8Xra414s1fzGaLXx2wdT12tR3/zFDJbrurHe2CHht5mOSDVnM
         pjVy2bFcTIpFJk845DX5v9W7Krrg0dNEDc/3Slss=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.223.76]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDQeK-1lmXnT3QSE-00AVmI; Sat, 08 May 2021 15:15:21 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2 4/4] hwmon: (sch56xx-common) Simplify sch56xx_device_add
Date:   Sat,  8 May 2021 15:14:57 +0200
Message-Id: <20210508131457.12780-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508131457.12780-1-W_Armin@gmx.de>
References: <20210508131457.12780-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SSuNa8bmb/4pXXm0IfbRn8xwF/URj0V5W6E4sy6fsKn7HuIvN/u
 KtNSknQ6l7JelWNV33+/w+aBzlKIDUSlMWaTPgBtbsdJbEllMFPVRdfTH6qp7EQhoT0+DFb
 /DuMkdoI4Km+/7dB8lH7wl3koGgeStYlUKhCcjicEUB0COyqsGyMmpMprocIf/FhFNcQ1bn
 LqD2OPT234ZfbIWdNA/8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y52HckMlXmQ=:xXFFgR1y1eXPwLIKuXJXlw
 p6pYJjkaDOB7+cnX9ofraH0A7qWOoiAX228SXqANmHlY1unyUB1GzKLxN7NLeUGccJMb42lak
 CDErbhvGLpY6IHhUJYjZTpIOhfHHw6Sqy5HFIcW8XK5Rs2K/HAHeBA3zsUtbwbBmcfERtGY99
 rGOKjW6SXkULesLMHGdFEzo6BXMWnzuftivQ44kVki7a+qU7llwCyWLWYdiw44mfOS7Onokoc
 GSgaZuPSkBaAQmsd4epNPRzT5sblUAhAaXN4yPcWxnDrVbne9dfNGpTkE1YUIjNCZ8QPWzN3M
 zo9OYSlMdYSo2muik2+3vjA2Cgjhq3HC21RgThvUt/tVv3Jroqss5PuxQ5LqBmPP3d2j+VKmc
 XZgi+sSd6CjQ99LWEvb26RahuLBj58jdixmQy4KU+pswMBkYvUJC/GW1ax2MxWjY4PI5/0lsV
 UCtn6xa15qq1VwZewbA7e1N2LD0zJiYLc4KQ6cUt/8gXx0KjvHg+faSXbUsucff1ZYEg0tVhW
 vz6CwUv+ID7S51LAOQJ+OJwE53zysF0ZYJcdaPflV184NGm4JoC6cRsSN5cqlEbTvrgJvkZOS
 zYLLhugPvL9PsDMXP68WlQ94ylvAAmZ92xWuq57B/71LKI4dXQFb7J2pJONFtBgbfJ3ypUvq2
 Zi7ofIDmk5YyYP0XggdeevbPSoI5tXuRTC23ngGrwAP/3ZMtsgBkEOxF6isf40LIAMDR5WyVC
 1+yzPHAKt7E5EhN9VNxS/tm1RwZC6ULyOLGW41tyFulS9x3h0BMh/ynneYsFQb+M8Y1pSvygx
 N1lL8e8wkJ2ABFcPNEnGOZ1dasU51MgZsYXDnorsd3YF3Ay7MBsSZH+jrLnFtzlz/rahReffb
 cE8Zl9YywhqILiFb95GUGqljuUTrFNKGya00TsldNXhHD2bT9utgG3ATLoqZlgnZFa6wwLlG4
 HTN8HsgZH6DDPIF2rLcwlKu82Kx+ixGDvo1p+vdjHQuT1Ym02K1w5+edIdn+Q8Ul4Zuo8yviO
 5tmz/CVLCH1LNYkG8xyb+xSLp8UzYX9yiY7e1tCgYtb9aOeFspnIEZ+Hfx0lw88jSQo7gW5Kb
 3r1sLIhzSAEQMEz98pfD/R0PgGes052lE8vtd1PnWAfaX7pU9tTZHNjl0Pupy5QXk5cbLOEVv
 q6kAwcMPM/Ad3thOqhtsBECFiyiNNXn/cJ59PFYlMXkWA+157Qai5aYe4ANpcPHZOvJxk=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use platform_device_register_simple() instead of
manually calling platform_device_alloc()/platform_device_add().

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch56xx-common.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common=
.c
index 180801f80118..5307fda73e70 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -506,37 +506,18 @@ static int __init sch56xx_device_add(int address, co=
nst char *name)
 	struct resource res =3D {
 		.start	=3D address,
 		.end	=3D address + REGION_LENGTH - 1,
+		.name	=3D name,
 		.flags	=3D IORESOURCE_IO,
 	};
 	int err;

-	sch56xx_pdev =3D platform_device_alloc(name, address);
-	if (!sch56xx_pdev)
-		return -ENOMEM;
-
-	res.name =3D sch56xx_pdev->name;
 	err =3D acpi_check_resource_conflict(&res);
 	if (err)
-		goto exit_device_put;
-
-	err =3D platform_device_add_resources(sch56xx_pdev, &res, 1);
-	if (err) {
-		pr_err("Device resource addition failed\n");
-		goto exit_device_put;
-	}
-
-	err =3D platform_device_add(sch56xx_pdev);
-	if (err) {
-		pr_err("Device addition failed\n");
-		goto exit_device_put;
-	}
-
-	return 0;
+		return err;

-exit_device_put:
-	platform_device_put(sch56xx_pdev);
+	sch56xx_pdev =3D platform_device_register_simple(name, -1, &res, 1);

-	return err;
+	return PTR_ERR_OR_ZERO(sch56xx_pdev);
 }

 static int __init sch56xx_init(void)
=2D-
2.20.1

