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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4846C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B864A613ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhEGVZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:25:49 -0400
Received: from mout.gmx.net ([212.227.15.15]:53673 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhEGVZt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 17:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620422673;
        bh=rZbA9snmy9tcYXauCD8jRq04JE8JeE2m7t+lGHFhjtc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=iM1B6nkAD2t6/nH4pcaur5Iv+Nu8yJlM28qJ90lnbH/0qWbvZhjlYbkZYByAMeckQ
         zBAaZbxsEO+0tnrWC6MqbSJqu0Nu9/efWOLbT9nFErXln7WLs8qyKapQPljHfuR2Ip
         f7Lq7zosPeszS7L/dTp6kZ1Oi6NHJsPH+LCHjXko=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.209.175]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9FnZ-1lZtQd3Oz9-006L4B; Fri, 07 May 2021 23:24:32 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH 4/4] hwmon: (sch56xx-common) Simplify sch56xx_device_add
Date:   Fri,  7 May 2021 23:24:04 +0200
Message-Id: <20210507212404.6781-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210507212404.6781-1-W_Armin@gmx.de>
References: <20210507212404.6781-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w6piSZDzD1vInUIjG/mwAQAr0WOTqmDbOjjtjpK8GK3EHdIIUTD
 SXcCflpQsFJ7V7a7f9vhPOeJUen781Zuu+z9YI08aMaRHxrPUKZaZ+mewWfjmCCRp0vmBFz
 BPDf7AvEgqCH69sWmrKNGQgozfMgKbQy8Gapds+pNG4Jiznx+9sPtvOxEqrgh+x+xVtC6sY
 Hzzu1SWI/Mfp16xsj4kbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wtA7gpx779M=:IVPOcUj42dBzLjDQoNAuQQ
 9KtKSUwvZimY8ur9TLbS7yfUbFpG1y8FrqhnrbdrjJ6NrXVvdH8H5owdflcJ7XwD2CoeAM7W1
 hk1aC5zydYuC53JWvtKFJnl8N5slYu5GaUaWg383cZRO/Qn+RQGLrCrTOORypXv6PIQxnmmXA
 +JE+GjP70c0DDezLJfTwoELhEsQHsgFxU9MFKeg7n2qD7WOYxa84ZV6TlcQeHZMf2w8XXh1GD
 KlDkwUwek1q+1zKtQ0ip5Sw61gYlGxJZ2ZdulRzF5KlzneWaIIOfessA6owbjT8IzYbq426jD
 thsk7UO/i8L0eZ7Nrc0GWTjH/Ag6xMVpZl+4yCz/rC5dbiG72NLNBXp/t9OU8VekzEdwo1o0f
 +TAqVpxuzBHu9wSzZ1r0wOvTfssQ9VOFzNZshseAJuB5sU9rG2Bw5i3pHKuh7fnBo1MyMl5ee
 5h2ZOAxzy+x/Ykl+7hvgieAs9UTpbRzbSzEv9ccpmv54lZjjTQjcZSewo0xSziVbL0HznuvoY
 zn4iU2Z+3fkkOSTRmNR8z0Axwl2b5EUpAS6DW84caOyrTqmqpUFxsMzifwQiF3kZMyG7f+Y1h
 f7jkIq2jApnXlLJnw8zCW4rMF8pvN2Ik75zqXeRC2bcXK7sa/Ro7dLjqOkXjCR3MYUMHfhx34
 TTj5REmxIzUunak5JVMrhmQZSiU8iF0l/lYV42qvBSF5IBKOvEI82s6ivSL0rSecRfH1VgwKM
 y7/lz7i+f07T/cFH8KxwoDAGfvOgGRVAjDnmyzxCnb0eSKSAp3oE7DRB2PdyFR80z+jDrEf6J
 ghRjby3DL0BeMay9yv6UaZegXx2M5W09dbxLDeGzcpUxTzu41K6ySLrBA7xBuXhxpM0Zly/Ct
 5TC/pe457k3NZx78csFdyHa+SEqvMsBX3nCtDG/633Nyebq87zsyXAjQcHb7v5UW/uB/atM6X
 GhzyL5Sh6LturUqVB8G+3DvIcxGTOePK/8ZJrLV+eeb2igIdIHOAcu58isyo3zTw0bxeKDYVI
 5xFK0xCLDtP+22tACEFr9VXEyiAgld4ybsC41gKMc42L+I6+LMZs0t10x49q9LD58656Rmh3y
 PR9QUbBQTciooA5yfZfoB5CH66DksN5VNJQNvdoQ6dlgTzWDKaBwh6W/1/NOFBqGYQ5iDM0L4
 qWUnLDeb0vGeXzlWWAII6DUWQlP4Op590IpH8VrCL4UJKPZHAVMBXkvZtAEKTK4J9HQYo=
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
index 2273943960bf..b731c108ec56 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -507,37 +507,18 @@ static int __init sch56xx_device_add(int address, co=
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

