Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFDBC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B44326162E
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhJUR5l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:41 -0400
Received: from mout.gmx.net ([212.227.15.19]:37651 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231396AbhJUR5k (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838908;
        bh=bQMi+iQQSOVtfNjpKLoDLJ8+wtqyYr+u8eOCiOUw4aY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BGM6ByIlx5shm1ECumrSNZGESmpgQ9hEEHiZ25xolZpe3GVmQtj6wcg1Qqeuu55Ws
         d3iUhTtSlSrvVlwkAeL217bRsBYQ8NAD3FRa+kXhs1uZgATMcHcfmrgaBRgl0xsTIR
         GgWgFnvE9CNfvMzC5oTBtDfVeBSouea0XaL0nLA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N79uI-1mlE3c0gcW-017Xxv; Thu, 21 Oct 2021 19:55:08 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 5/5] hwmon: (dell-smm) Speed up setting of fan speed
Date:   Thu, 21 Oct 2021 19:54:47 +0200
Message-Id: <20211021175447.5380-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021175447.5380-1-W_Armin@gmx.de>
References: <20211021175447.5380-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UpFGIFkgSRWhufFW5C71gxkqyDTwtsTKkv9C4Tlen1z2UsshucX
 7gon8Wkf6tQnm5POJDR2E/tWQGHgvQ/ttfMjekuhDjMs8gr8bF344MvD9K7T2O4n4RSzcDZ
 mm7TaQ4YeOVTWN4vzmllrXcKjawPhZyS2/c+uPCt1FD2FC3KSmqgXUsDekFZQNxQiam/D9q
 5JS61NT83P8FDPKTpkR2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:udeRE6jYRFs=:/Ooct4w3i2g0FWjmngCmTd
 72dy4RSy2Yu46z8Xv4EZs0d4imLLDLJL4UohRUDqmKjoAc5vu23OmnZlkJHhvsfNhthFTB/4X
 r/qDP2lpoDvyT5CO3D+qJ8iullUCvXzuIXmc8cbzBeip6ncP4z9JBknqC6dH9kyqK2ix0PTVZ
 2qWNMGixhQsw4/e7NA/B0Y41AFySIXf0rVfxf9Q4/u/KIhub+urXQ93jhSoOkzA/iDkwciX/a
 Zz3zPZ7m5YMfmlRAMd0dSaxwQL7DAxv0Z5olDvYBvZyAK8kSqDcGeSMGR5xsgyPLU03xIAy4l
 BdPhX9OxDqryyOed0l8IOAwAL6KCjc2HR8lK1t8u1HSZtgBPbPpqageoKHZspwCXoJ2Uh5NrN
 KwU5dH54OLpKbsnPGgxy2aAG7MpKQQemF36u/Dc/adgj9MVuDzhFJrU9YyHzxCtZ7RzYwVUgV
 ye8EMes9rpvlahaexztV4pGL6KTxUjwf6oZ844zKquK2PowjYTloIyzWTaPllNAXoDBQl0+d8
 VVg+DjQEAxYkR/RpoQ+YQeLd3xDoj+PLsJFYG26MpiM/fSiU3Pd3k4b4atdFifUY+WwU5NmvR
 lq0vY1qcnYblivaRpFIA53v+uvw6R3/9HSP5qdPEcJrt6oTwzgRB1xsB5MuYIyNwT6MioUuS0
 CupSW8QZ85PIiR2VYW2fI8UtvGYKimdwFtLcT88iFi7k1NRvk/EOzEs3QOP7yjInbtqJAv1xJ
 P1GAGdc2BGQDUCi35bM5ioFKQ7t1fZCRXMP59tA3NLLltMQPHZ1K2fKTDg79IodTEnkWxhV5+
 a/y38ylhUsnxVCDq5yBESaMbv9XDzae3hZeiFKqIba+wHHxTyCPtRWj9tk2g1XvdZfkP80s4j
 ZSjlHo5x/HaZsqQfEkxaDPsL0QMYyJOYxNHJd3vt4RQBftXbbd0z3DyPx9oIMWCMQHJXT57xF
 +Qa9EAmQpCsi27gCCKkSmYREr45TVVraBfu24JqgbEG++bA6yENJKnFaaGd8UrL1Nn2tI5JDE
 LDFB6yoPFswUQDotOljnvwxhQ/I581zFtgd+SF5goTIrzhZRUUJiibmabTMvHo/YtaCm0FC2g
 PSv0acOBLcvdC4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

When setting the fan speed, i8k_set_fan() calls i8k_get_fan_status(),
causing an unnecessary smm call which can be very slow while also
making error handling difficult.
Fix that by removing the function call from i8k_set_fan() and
call it separately when needed.

Tested on a Dell Inspiron 3505.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 2579dd646b20..62f087f67925 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -327,7 +327,7 @@ static int i8k_enable_fan_auto_mode(const struct dell_=
smm_data *data, bool enabl
 }

 /*
- * Set the fan speed (off, low, high). Returns the new fan status.
+ * Set the fan speed (off, low, high, ...).
  */
 static int i8k_set_fan(const struct dell_smm_data *data, int fan, int spe=
ed)
 {
@@ -339,7 +339,7 @@ static int i8k_set_fan(const struct dell_smm_data *dat=
a, int fan, int speed)
 	speed =3D (speed < 0) ? 0 : ((speed > data->i8k_fan_max) ? data->i8k_fan=
_max : speed);
 	regs.ebx =3D (fan & 0xff) | (speed << 8);

-	return i8k_smm(&regs) ? : i8k_get_fan_status(data, fan);
+	return i8k_smm(&regs);
 }

 static int __init i8k_get_temp_type(int sensor)
@@ -453,7 +453,7 @@ static int
 i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned =
int cmd, unsigned long arg)
 {
 	int val =3D 0;
-	int speed;
+	int speed, err;
 	unsigned char buff[16];
 	int __user *argp =3D (int __user *)arg;

@@ -513,7 +513,11 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_d=
ata *data, unsigned int cmd
 		if (copy_from_user(&speed, argp + 1, sizeof(int)))
 			return -EFAULT;

-		val =3D i8k_set_fan(data, val, speed);
+		err =3D i8k_set_fan(data, val, speed);
+		if (err < 0)
+			return err;
+
+		val =3D i8k_get_fan_status(data, val);
 		break;

 	default:
=2D-
2.20.1

