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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D495C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 19:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BEB560EB5
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 19:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhHNTCZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 15:02:25 -0400
Received: from mout.gmx.net ([212.227.17.21]:60297 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233256AbhHNTCY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 15:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628967694;
        bh=U0bWsRIOij814hoy8fV+SZ6Maf5t763frP78yvsYRO8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NhOFeN6AUNJ0cEgtV+VA4fYqzP1iYhBpB0dfJ2l4epYNQrxqJ1wTJBvysKVaybaw+
         kblVMHi9hKo/znu41qWVkJFutOObHo458DlkrSWwAhptFixf7tPQWo98ybZPOY1fxU
         FS/E+PKCSf/QeIH7H4dvFYV7cC0iFC68ToPYHyto=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1mIaLz2Yqj-00Grad; Sat, 14
 Aug 2021 21:01:34 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (dell-smm) Rework SMM function debugging
Date:   Sat, 14 Aug 2021 21:01:27 +0200
Message-Id: <20210814190127.26456-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FeHvJ5CqUTTiTmJI5xeamQ8EA9/aqHBTjPPCXUvOoGYrU0fkbzH
 gTQSCWrzozlmLssN8GJsAbjFux3u5AOICBzEnest0a+FGGoHiyQur7nMiNOZSpswki9R3+Q
 xzIZY/TIKj9l2NTKdoHiDQdH/sEgDXdVbNeWgPfWhSCNnrtWWhTIhb6X4eZ19e/6qSTTJXE
 9G23Aa6S/xJyNDwLgxp2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k0B7WwRqVjo=:/zYf5fb5H7s6xXoHVXemzu
 lQr7l7OPIxVxWEkUzlKBjKZ7yyHxHCIRWS/V7pUwl+tWvxQEm3vUy6wkHmpIod5iw379iPGP1
 wi/Rsq4hszn424VHKJEyqQoW7YjzJtx3LJUg9DgZmINTLZjGea6tgrbRYOnWL2WDDOEtGjxTe
 BdhfHmbdu1YdRvfAWMiiOSUxl+QlJ9Dq9jtdnVdbCtLUF6xQvfVCznsTM2lRZOuFg3wZe4XTj
 8M3ojQCSq65jyLAQZzvaxr/OXYf4mhOGUlH/3qyMHYhTievtigkq/naqNcRmwSl38Etkqr/hb
 nRsHw5jzS+xtnbGDxcIWOZsr/SE/u44Io7U5/0QXP3yIh9L16EcsacQyJzn7Mb8kVCZyr2XbI
 YJYGiYG0E448jKqsmSi8cKRzMZOxUmAuoshk7y44eGWAJxujRfpw9vFBmrvX+OEpiG6Cgimt2
 mDZMrJrVbD0dTPWIb7SnmcY5+Od1NsdykCw0skZGlBohcwbZpqDIuNT3ZIhfa0fCBgbgJj0hD
 sU36pQuItWT9QBz6JfiFGvSooxHnu76UmLn804hidPZ7juvIbtSZ0h+/fW2jP3wulSi30zrvU
 8ghL9Bc9xlgpzlO/WnHzTcnNxzUCip1POw58Q/aJH4U0N9ELtTIV4WHQ9yCgKF/gOFRkFxy1g
 N5TZ9tNpuT6Cp06kx1+6tRmyJZVR1UB7rep7ODvp/fv50DWvAJHXgqaCUnsD6TtBbOYY+PEDx
 mfVg/1w2ljd0BL+PGV9xlj1oKnxvIiNnWxt32uV3ITsLzN7aei/CYzabm7KThbhoKIhyemDo/
 e99ZmdntAAGkq+0XSNia2mhQ3lsHRsjz9ucFVDX03qE7jMqSZqjsGuIIHP6yhUrvWHAHdCdEn
 jtF7ge2MjVtMsGFerIelrjVj93DaCsK9jIL5pJTrCiZ8Erdn8UqgWCbYWgz9ZFQfQXyDKOpAm
 NcLIrf6dTwvsQIL0WWljfcMG9FCSclO1r98PI2V9eqdjNh4IAkouKDhYg3++rXljYFWrh0kGw
 6hO2IfdDmawTEhNhbjexhWCcvdraKuvJ6kMVMT08MMqvWYwwK6DOCUHPtW0+ONb/yUv+ycHHZ
 plShTnwy5+AlxXuHli0QHaO5/LbXj4LJ504VFnS2R4jghE5BaG25ofSwA==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Drop #ifdef DEBUG and use ktime_us_delta()
for improved precision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 68af95c1d90c..25fac796fc86 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -158,17 +158,12 @@ static inline const char __init *i8k_get_dmi_data(in=
t field)
  */
 static int i8k_smm_func(void *par)
 {
-	int rc;
+	ktime_t calltime =3D ktime_get();
 	struct smm_regs *regs =3D par;
 	int eax =3D regs->eax;
-
-#ifdef DEBUG
 	int ebx =3D regs->ebx;
-	unsigned long duration;
-	ktime_t calltime, delta, rettime;
-
-	calltime =3D ktime_get();
-#endif
+	long long duration;
+	int rc;

 	/* SMM requires CPU 0 */
 	if (smp_processor_id() !=3D 0)
@@ -230,13 +225,9 @@ static int i8k_smm_func(void *par)
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
+	duration =3D ktime_us_delta(ktime_get(), calltime);
+	pr_debug("smm(0x%.4x 0x%.4x) =3D 0x%.4x  (took %7lld usecs)\n", eax, ebx=
,
+		 (rc ? 0xffff : regs->eax & 0xffff), duration);

 	return rc;
 }
=2D-
2.20.1

