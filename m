Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287ACC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C2B61929
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhJUR5f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:35 -0400
Received: from mout.gmx.net ([212.227.15.18]:49797 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231727AbhJUR5f (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838902;
        bh=xdsP6gml0dd2Q0fEMW1hNJf983q2tKghr0Vd2QYvf6A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LTUvX6IpaxFHJclfYyrZK3JsMoh+Jx0o1WHWZDp4/MVBloXMj++YtFE1ISqs3tC4x
         9O33HiU516rgcHtrrLujCOsuEMNZOX6FjdQMfl8QnjCtuQPOa2XkfH0lDvR8qyo1rR
         RE/1I+zJdhJXBPOSLLV0gQ9OOxV4Ax/TXRZD4COQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MJE2D-1mOYN31BoB-00KeYA; Thu, 21 Oct 2021 19:55:02 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/5] hwmon: (dell-smm) Sort includes in alphabetical order
Date:   Thu, 21 Oct 2021 19:54:43 +0200
Message-Id: <20211021175447.5380-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021175447.5380-1-W_Armin@gmx.de>
References: <20211021175447.5380-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:47SVpheqy166JFYkXJjZPNc61/pGhjvoSFuyoCqox2UkOm/5xOL
 RgFK8KDSqb3j2SrIBKsF+Nkw6GSmZBnsnKh7FuRJfs9uGL4G8RHXlaEnjXWgbUlgvol5FjB
 RRUsSkQCV7wRS/Hy6LXkZVOaWi4r7pCgD68CHvDuL7yl0flHghG0QC4nn2ijjr5pYmtl7oh
 Zj8CTf2bFQSWvCnIqCLrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cC6Wx2g7khI=:B6FPxVUg6LPpn0L4p5dtkw
 1pf3G3RZnzeD09N+wVcIVIkYydwUcZwm+1Cynq2N2aKWhi4EHv/SMpBmjr9K1twf45y8Kk/NZ
 0Y8SZuuEgc27D8STkjeTDONEPc44iBsIhveyk8oj+BRjrEJF4p/arggSR6UWk7DQgEXqGYteY
 UXSxme7QyMeoYjVWAiE2hOP1i1I2Ca+uVmvA4NqLzDWarqmUVeAqRgiFS1LtGOVS5BCoQj5dN
 XizCEu1xdCb+TVkpNNDXOR0gcdclLtz4ut7i898mRZX6q5hLzGy2gcRh6KuzLPfdf+MB2ce7U
 +VuqNVbJgijT8e5/Ru1mi5VShbbZn9Lb3FhEU6LTXi/nE+GPj1Cjd+Tol+dyzqYFzfqX8wM5j
 6pKUhGvTS4XVnBQLdKg8VHyvaQuDm4AGix1Zl1S4QeULOrZzgebMAl/GEP5uO0pggyNb2TezF
 uFTGO0CFMisIj1MUJkumKY6H93VbNjxn3IqpfGeTJeqMbrAszrjGT2OI3S4jSGfy9oxempUVv
 3RWElpbdeUQ66+FSvv0bNB/t6UAQfhycOSt1JYxXmPClOD8pQoE414HkZu20TyzhilOKpMlxh
 pvJ7hCTW4Pt+2EyiqkmM1zcEdS0oEW+KKfr+0yKHA/RUSUQ7KXg0M32cIL3KUfCHr+RLwZUhG
 Gr7Up8hFT4vBl6ckqUQdjrdSFqUt4XFvJOgcFl/7O4YHrC99X+U3tQUOYkZUZxMGxNfe4SdvG
 SCvZUe7LsZNdh0AIe+7G07JKdsC/M64zTA7cHRnHGHaphDdtW1uAwbI6uXzsRedodi5ViwcjK
 m7MTFZFzQ4Tk4ZGkv+4lu+8rW7bOBf6A44jnnMmLoalKDccF0rTv7V3/g9c2Q50bAoiVPWFYY
 Eob6WC0gAkX8jUUq2fVMrJtYsn8Tyau5w82z42hT+umKwIvi+3BwbBKH1XJywoawN4LJhSw3D
 xbbKLigFbetCmRLo6vj5RV3DBmJx8sEotUWfrePo5Py1S8NHZ/H+qJLOiSU2l403gpzIPhqS6
 x3n9Lc5Q/y2/iDUuxUGIWoMdgDVU0QKE4cMjrfLE2rdDiQHl3+4AJWpSHEX+2fXzUOot4Z32O
 afhaJ3fVbEE7FQ=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Sort includes for better overview.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index af0d0d2b6e99..9773d6c0477a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,22 +12,22 @@

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <linux/capability.h>
 #include <linux/cpu.h>
+#include <linux/ctype.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/types.h>
-#include <linux/init.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
-#include <linux/dmi.h>
-#include <linux/capability.h>
-#include <linux/mutex.h>
-#include <linux/hwmon.h>
-#include <linux/uaccess.h>
-#include <linux/ctype.h>
 #include <linux/smp.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>

 #include <linux/i8k.h>

=2D-
2.20.1

