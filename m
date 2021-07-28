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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0400FC4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDC8460FD7
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhG1UwY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:52:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:41677 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231574AbhG1UwK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505511;
        bh=Er6k5tLiUJPuW1WNmYTS1PUHAIWkMV1+c3yIe+8Tf8E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Vw+ZGn82lSzD0WFgvpD0HY7OVNJnZ5gOM4w2jX3Q5HsucuCYVrZqvLSlRKbiVA5Z6
         LvD6YL3S8Za6coAbCw1WqxekzoQdzQsbEimpYssWimHKDEIChnL/jWDOx4/6dYgAFG
         osn7LDmM9JLrsTWyujDgTSMRBvGr7dSbhatjrlCo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mgeo8-1mpdXP0Hca-00h9ug; Wed, 28 Jul 2021 22:51:51 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Wed, 28 Jul 2021 22:51:38 +0200
Message-Id: <20210728205142.8959-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
References: <20210728205142.8959-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M+WNHN0ZUk9eA2hiVHUJmejTehceMyGCpH1ZkQgX7bC2GL89zTM
 qsN8nJ6o5Othex4bI5tO9U9Dggr8FDlgLsaWIhZsc0oYj/6MYu7W4z5e54dPgzlymb0lCzO
 ER+924uIknGJ86mdU9nomvH5NiiIrCeJ3Rr8wkTNWWTbiaBrJ003BJiDMCCqrXPOGQymQNn
 /BBhv4vzRxdQYRIJizfPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9qCUt0yl1OM=:rQL32SIYYGZ7RgNm89UBcr
 cfRkthVIvs8ZgKhykeQdy78JaJ8vxKAMayUMiovYMPYzc5mKhei1U7NEKdSlGNeBsawobjErP
 tk8bQFHex6i3UmYrbKlQ4ByK/AlY0F+EtKs570+t6p9LoL8W8g4mZSp+rgj1uRO79W+vHj1Fs
 Nhatpiw6oDKjWiSHBfegDF47Vzc8bC+Znxsw+/EkyeKcO6pNVDVYVm25vlQfbHXqqRd6c9yVs
 N3yLYlQCeIXc/NXz84MPr7861umZ5R/5BsuBaoJMlpS4E93+vTYXsOimgtc+rB8YEDfrQ8GPG
 fWzvQ8Jp3InHvtHieUDfoBe8fnKcvorKqe/uu3NxvRE5D/TZ+kFcKqQ8f7b1SDKY+8V+R2K0v
 9Tr2jDL8r9QQhqVqbH6FWLengOeyjWuvO81jXrucG04wgP+yPuLQU90ECT6qpxd2/J56UQwQr
 mwiqAbNcHdHDvWgVUGNXm7zSEuLVLn02j3avIHYMORXhTUjaLo7dJ8WPo6zzvwJNS+YwLtGFZ
 n0Yv7nUzMgDIKv5ufnPsGrkpDHfxSXEhUJHvNxK6VWf00qgxyCy2cfE5PqgS6bq4XMuh+8lTi
 qzslO0v3b3QU2/OPULevXyPYk2bY7tlS3t+Slh0tZJLNsXWMfJrOHYCtf7D6MA4ruQoU8of4D
 g788gMe64G+Jk9yAEP0gWJOL1Z684NmUQ67hHEiIfkWUxHyVnOM4IYY/4oyrhxKeKTekTo6tA
 TOTplMytciPvqLOkJ6Nvf430I78fq+Dh57adHe5bzN8gg7kWIavIrrL/xvaXVu4OpJlzEG2ZK
 KmnYw9jB/607p2Tv0BGyJNn1p1RjUxOwuOgVJaBT7alfquQzI74iFQS7cCOo9STv/pExi5BVv
 Jvk9xaURXEr8PXWV589+xqu8FKbOm1ZLJqMYTUPFUSrt8W+7wdpJKjWA6SLkuWSTb21slt3Xr
 dmFaONq6FF2bFSSX1nJeKDRYu1GU4ZMZp0lbjTdCaT1iFzQAFEahd6QaOgPiFe9C5C5sNa2tG
 XUAIYMmOREiSky0NjdmSswjBH0Yfl2ZpP605BM2CZDmcfjp1E650xC3dxSPcBtAHEUQ0vOh/L
 LVvaeYo5eUrd6mb5bX61db+l5lNvd8HUesg
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

i8k_get_dmi_data() and i8k_get_dell_signature() are
only called during module init and probe, which both
are marked as __init.
Also mark these function as __init to lower the runtime
memory footprint.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
Tested-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f06873413aea..c898d6bd6a18 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -128,7 +128,7 @@ struct smm_regs {
 	unsigned int edi __packed;
 };

-static inline const char *i8k_get_dmi_data(int field)
+static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data =3D dmi_get_system_info(field);

@@ -384,7 +384,7 @@ static int i8k_get_temp(int sensor)
 	return temp;
 }

-static int i8k_get_dell_signature(int req_fn)
+static int __init i8k_get_dell_signature(int req_fn)
 {
 	struct smm_regs regs =3D { .eax =3D req_fn, };
 	int rc;
=2D-
2.20.1

