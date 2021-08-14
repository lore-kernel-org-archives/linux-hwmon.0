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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E95C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 19:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F89360EB5
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 19:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhHNTGF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 15:06:05 -0400
Received: from mout.gmx.net ([212.227.17.20]:59931 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233256AbhHNTGE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 15:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628967919;
        bh=djI90wVGhLPIl81UPPj01yiEBahd1DXPwpMbe8xGPMc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=AIsrOXVuxpdUTze7CRf/K8UhV7w5iUuSOXb4tawv+Cr7T2CzVMGEvnX1yO7YVcLI/
         pGX6d6zaJijS15wyYLLvbcc8YYRPnZQa1FuhYBAA6lGB2Hz+mQ3l/GPjoGINIQILnQ
         SwVQNfJDwtHLK6dkVFLWLJJE9g8tiYvphsVxZpOc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1n1qEZ3yjJ-00vfP0; Sat, 14
 Aug 2021 21:05:19 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH RESEND v2] hwmon: (dell-smm) Rework SMM function debugging
Date:   Sat, 14 Aug 2021 21:05:16 +0200
Message-Id: <20210814190516.26718-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0pfgeZ5FNqgf0dJHiNXVnzaGH5hiXaVU4k0FY7W2l7VsOnP+Rzm
 UfvQJS6wavvouVoIGsWFaBKgVPDv9Vz1Rf7uZPHXziwExSrbFHx6dgQR60fk6dVKWCOAS1B
 W9bBBR2wAUsntvvBCHrPoGtd5wE1fvNi8CrQd1edyaDbRtJnwXn6zRiPUbIhICc/LAQ6Tx/
 K9Iso65heajSKCVYHhR8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:njb5o3O4XRE=:zcdtD78ekFNS4+8tV5dgoX
 ZuabTbrzDmVipDg4aH4/Ff4FkN3+8aJ98GKOhifxnU2BFJYNQH9M7sYz3hPJpi4LF8hwksgMF
 qSIFZDbG25agWK5MPOsfjcUwnkdlxdhNpEftf783uatw9deIfPweoGgwldYsjoYpOLv6abhAi
 GhMuWVKojOvpnQw3H9aZDkIgq+L+DghGiL2rxzaFFePpEqjecFQRCNtXPVrGwVhDpj0D30lmV
 f2iqWXwyusEtYP1ip54SdTwSHeo6KHCXuam81ss5zQXNP0BvzG5hZDg4xLa6Ys3tvukyhOvRR
 uPQ/f9bDZi27NfZij1TQfz4A681VIadExGT7IbOf+jUH5GZmFv1orHvmYJUDjzDFNXbme3iFK
 ULoNtjBrFFI3e5XSCfrF5HIMb3mcWTahCkRM3mFxxIQWgn6gGAtxgoDOVwsHt/6wqQlJc+cIw
 olXpQLVpEsPfU4kr/OPcQUAru/IfeHWzjpS0CkADbJw1Ygmx7FxFkArQxHFWr/ee7vdbKSsLN
 F3yNOdQmDtWlFjN4RmvT3M8vrIZ1W8PI0PDxESJGaG37dA9H9NN02OWVuUaP2pghGb8NZzpL3
 zydyNG6vjvH5F9t4fX651hSsDVUtrzPP+zUmf95ROQ90czmsqHbH44qdZ58wHeVwbnQV9Y/Mu
 RmuQ4RARCU9HxsLB01XbTCBwU9MrLtakmiA25QCUd9e4rTY9OIOLq+2N6wiLL8zAvWaH5xdhu
 W0KR+V+YLc8ZDwGU98rH42tGTfVkpgynEJwSv7gElG52Iixr6akEvXpc4xNZDJTvMHuR0rDcl
 2D1r6gO0KF8/umUpCUVOxUb3mk2xRA5qWmKnuNGaEIs/lstPIJQA6FpltZ0vRknAjUcEBXe+P
 ppU+haXXhssLl2RH5af9gtyuUkPVcu1w8EycKXMvZwuBYA9Cg8fKM0Lfvl1PMuxnE/DH1qv2W
 wCOLzPlp439CM8NaSnNdKcWrFVQEZTY60FzJOq2AJava1rCzv3Gy2ENIBEbMno8rvyD0gxjWe
 PI3b//rMud5eP5ccKnoct34osDyIDTBbcYSMZtWit2S3zn6XSCwqMpLUp2rUhrQh5dBhIEYlz
 BnaxFK09OfYVagA6o6hJyK2Q7FT3Q3RyEtPxuAbj6ky6w3GoGc6RpIzLQ==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Drop #ifdef DEBUG and use ktime_us_delta()
for improved precision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes in v2:
- remove #ifdef DEBUG completly
- init each variable at one line
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

