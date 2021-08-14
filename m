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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB15C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF73760F91
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238654AbhHNOji (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:39:38 -0400
Received: from mout.gmx.net ([212.227.17.20]:38899 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238512AbhHNOji (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628951933;
        bh=TjpaocP26S65OFtSulAoo6oEg8McxYemd0KVNG9ozJc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Bj2eqNuEtmqig4itIGXGorBnC5Kn3rSf9/3sPy9KvrLsmIl/SEBj7t81RfoboFbaW
         vuEdq0ugZteNePMJQPKb3p3h7ysbpW7aaqeaZo101q8flH5pWqHTEh5DNvsJs+AvDW
         VtYH/S/jC/dMCD5OQ2bgFjYXYFM7MT633BC0wu/s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1meAsz08DU-00RVR6; Sat, 14
 Aug 2021 16:38:53 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (dell-smm) Rework SMM function debugging
Date:   Sat, 14 Aug 2021 16:36:35 +0200
Message-Id: <20210814143637.11922-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210814143637.11922-1-W_Armin@gmx.de>
References: <20210814143637.11922-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HWchIONHzewHVS1jG6M+sVv2V0Zlv6i2wDisBksMmO4RlnalddN
 TpaSYSrCGljnci8WmMdzpdxddVar6sGJkK7rbx72kKF3/s7G10taVF6oTEKYuKHbuXsY3s1
 iibRDkXxKrphi6oktEajcjmBlLyU/ZFJmWzyEfYlQvwYKlmVqJtOJYugaTrsg2FUBMEvl4E
 lOabofOdFXdVjJ6rQfqkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HEdRQgzVvqU=:NV5n/hC2NKlh3aNlESEE/y
 cp8lMqitbRX9jiMkZOD5mMnh6Hds8XaGoSPBjAsNIjMj1QySgHN8x0znBE6XT0Z7tmOepLOce
 OhPB1A8WLhG0vk9pJysxjdRa/tdJp9wVPTs4o0j51vy0DR0BYTqD8bAmiamaV5unBkVe2QDwS
 JFMC/sQ638N+R8E/0uITFKh4vHZjf2Xmt3GB+nBWuKrlRfxUXhY5uH2V0qm3Eom+N+QL1RdxV
 4+ng7bzDe1NDYb3STj2xzJ4HiE4yPWeV/RDxmCzGytXSeA2Zb8zDBT/bn9RBoGqB8nJKXpB7d
 4ZbQIy663zrWlCVwpcuFh172hDDZ3Mx//HvrKpOQio5+/TwshcKXQJLgyzMgLkmh/BeKXGOZI
 xhEurna5+at0Zf1T42sISp79fQCpladjCFTTFnLv4A1zWBsCAwY/9nu9WGL5VZy6mRVbsLLHH
 7Kt/9qCYoZ/zqRVKx8Y7rDi9fEPHvpPUlGETUVi8Nv7q5oWTLXHXOs4rFgerr/4/elXhGH7bj
 FFcbZU92MmY/CaW3gLwBQBowmVkgdt3SAfP0EqPSQ3G5JFyFm5I0f6gompNXTflxDoASJUx7l
 tFsgN09XJJLflDp9/opQ/My/fZQtsrRHkwhIBd8PvtN9pfKtkQ8sqTpNmPmOCTg9G1gkgW+uq
 8xYc5pFQMOWXDWyURW8pGNQxU8FKgZ+FcWCXD07tD4rCIObVef6jQz+cjSMDJDErnlZNW0G7D
 xym9q7nq3cZh2NlEJkrb4GMRxe3orN0az2D+/fRguXKC1VtqyU1bCMx/YT8MREdI49pkDlAHL
 DY7wTo8d1s0Kyfdcd/LYEM/U8zLKwwDUZdhrG/oSaltmTli8CYsSgP4RmS8Y6z0C5Mwt7X4Ev
 me/L1PCeFBRYW3iShyOHqDVsrcRWZK3jaxwdCS15cpLsZ2amnziuBnAzZWwZxbbKj2YH6W9KE
 VlTR8IJc5ubDMv+XXsa5WDoNZfHM81d5qvMK6yfceJrbCZhUX0aK6HKIrpUNsMhi1zLUvoaIB
 EOdrqJ02twPg0/WwCsn69/QHkXgTFmaX8UJSIoifX4ICdXEPm9EJuoiJsxMKns9rpnSTQ/FN3
 T7ucmk730UwE8VkorTUDhZKzyGZGpW63yjEQ2W4197kEeODpRDrcK4P3Q==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use IS_ENABLED() instead of #ifdef and use ktime_us_delta()
for improved precision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 68af95c1d90c..3aa09c1e4b1d 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -158,17 +158,13 @@ static inline const char __init *i8k_get_dmi_data(in=
t field)
  */
 static int i8k_smm_func(void *par)
 {
-	int rc;
 	struct smm_regs *regs =3D par;
-	int eax =3D regs->eax;
-
-#ifdef DEBUG
-	int ebx =3D regs->ebx;
-	unsigned long duration;
-	ktime_t calltime, delta, rettime;
+	int rc, eax =3D regs->eax, __maybe_unused ebx =3D regs->ebx;
+	long long __maybe_unused duration;
+	ktime_t __maybe_unused calltime;

-	calltime =3D ktime_get();
-#endif
+	if (IS_ENABLED(CONFIG_DEBUG))
+		calltime =3D ktime_get();

 	/* SMM requires CPU 0 */
 	if (smp_processor_id() !=3D 0)
@@ -230,13 +226,11 @@ static int i8k_smm_func(void *par)
 	if (rc !=3D 0 || (regs->eax & 0xffff) =3D=3D 0xffff || regs->eax =3D=3D =
eax)
 		rc =3D -EINVAL;

-#ifdef DEBUG
-	rettime =3D ktime_get();
-	delta =3D ktime_sub(rettime, calltime);
-	duration =3D ktime_to_ns(delta) >> 10;
-	pr_debug("smm(0x%.4x 0x%.4x) =3D 0x%.4x  (took %7lu usecs)\n", eax, ebx,
-		(rc ? 0xffff : regs->eax & 0xffff), duration);
-#endif
+	if (IS_ENABLED(CONFIG_DEBUG)) {
+		duration =3D ktime_us_delta(ktime_get(), calltime);
+		pr_debug("smm(0x%.4x 0x%.4x) =3D 0x%.4x  (took %7lld usecs)\n", eax, eb=
x,
+			 (rc ? 0xffff : regs->eax & 0xffff), duration);
+	}

 	return rc;
 }
=2D-
2.20.1

