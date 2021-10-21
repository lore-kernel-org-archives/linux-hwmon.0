Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EC8C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9603660F46
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhJUTIQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:16 -0400
Received: from mout.gmx.net ([212.227.15.19]:59137 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhJUTIP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843143;
        bh=sJgIsGCg68NznbWZGkvDnYMEcCSo6xcAKIRHglZPoOE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EUotikqfZ9FPTjE7VHUBholKEbKNiC0Nx7UZ9YnGIIa07AC1P+iX77NQfOe3dmjNK
         NPpA5nWkJWSonEou132cQUSE0CLZZdg+yMeGDICWL/FSTD8WPZK9c7odEv+HHyGqRh
         admoweifiIFd2ti1moqA5tdc/sPqipZ25qFfd9s0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M42jK-1mddNn0VdI-0001MV; Thu, 21 Oct 2021 21:05:43 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 5/5] hwmon: (dell-smm) Speed up setting of fan speed
Date:   Thu, 21 Oct 2021 21:05:31 +0200
Message-Id: <20211021190531.17379-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PzAkWWd6AC/fbiCi7/aXLYn+7ujC0uhqrUZY6cZAf5t6NEcpSZN
 VJ9PEcUDGn/JvTivBbZ1fg+s8397Ghh21l67bp0fUwE5x0A+f2+ffEb8ZZrYRJy2QkWFxYq
 EqzRbiTSAaKwAZlbV3KVewO/G9ImMNH6HBZr4LwoRhZG137BYSuEZnpMJvUmu8qLX6Up5ju
 wb6ONKB6fKfgwvK5vbX4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hVLMMlLvI6Y=:+FvDvqvmYS/6bvJUxBeRY3
 SyLBDlteksJDDfHaLipaTmTWfA1P27Y+iltfQPNUFWCC54hXZNdhE0HdSD+NWdBOplu9xTZvG
 kaDHkwD9cneuhNcr2fU0wAkoreHmpB/aPZzDlSAtZ58xUC9QT2VPimLyc7k6YS+JTUS9Pi0oy
 V40iet/nH7+xwiYSUBbqSYEJrsfpywFmfUxBgwyJGou6HkCylvWOVNB45AIs97pvo9RS/gpfO
 PdUjBkpVVIt9unDULY2K7Tt1CuU1f7WPY24+dXym1jtEjhiNwUkVS2nvlcF/czAcNoqt3l1O+
 YfKZTTtR1kaiX4g8JNluCKwmjLIkA6Zd8eWKmdJd0vUuoX6KqD6ML1f15KBunY0pBtLYiDVnK
 Sg+tl7k65ETRqkXu3uZqotNylt5X8SpLVqWBjI9s8Xf8VXeAXGVwtUQ9aOhmC480BqH4keR7f
 Y5MwtgbssOSH90NnJvlzhy8Zvln2+5KK83h2Y5llST6ctCq/3KlWM8l+rkAk3110QayPfXOK3
 CVgQ2m82NMkcTAqd4Ecm3tey19oYFCzFjNT5mx5zTpFLL/HczERWxwkdSi5MnUHfYEouLNejm
 UVHXl4uNLcsWfjQ3/dx47pgVvwCdycLw6IlmLhv2aE6Wk2PDE2vDbFq+c6Rw+DSSCdbbCrg+J
 UQkc89bY+ryl2izP9fQDa6r6Kzr4eurCCwTzVG1U7M4l49/9RU/q2NRDNiW7n85uLHcVimxaG
 jPIPUjkF67SuEKd2pPMRiXoiHz8by7rk32my7J1vhPNAG6lu2hqz6KduBnRe0exzlpCRRNdoX
 bKf00eHfQXepiVAIhVMG9iihUxUsQ96GerSj62HpDxURSMaFfXDm1drqY6bK+WafO7YQV6KmP
 aQV1w0Aa9cVnU0jLRJDIS06gVY0kT1G9gLykW6IqVEx29Ny8iaPvd5RPOsJrnH8LBNARybgEv
 rysmtlCVixd/FI82ibGw+q4wXwLC3xeef4t7yQharYtZ0PK5nQn6h8lDAqY6wPw/Oh9E35Zau
 fgzj1dK7Sf/535hwmJ0hKlN7rgFobsM/e8lIn6MWx9gGVCCeIdFEoQ2cO8SnuQoYJz24KDFfC
 FVwIumtaAPqolA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

When setting the fan speed, i8k_set_fan() calls i8k_get_fan_status(),
causing an unnecessary SMM call since from the two users of this
function, only i8k_ioctl_unlocked() needs to know the new fan status
while dell_smm_write() ignores the new fan status.
Since SMM calls can be very slow while also making error reporting
difficult for dell_smm_write(), remove the function call from
i8k_set_fan() and call it separately in i8k_ioctl_unlocked().

Tested on a Dell Inspiron 3505.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 0e1bc3a2dd12..eaace478f508 100644
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

