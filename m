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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A883C47082
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3F9B613F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhE2GlK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:46481 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhE2GlJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270357;
        bh=jdfwKwpeNA/9hNZjIvtHq2No8hgps/zPFFXtKwxaAlA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=W39iNs/gLP/BuND/lyjzXnZMlRsxgxtT+sivkb31J2dyo+Xd7Vt4nyYPbkAdyBO4y
         E4NBBIWo4VxhNqZY4PYeayOn1UZJXcjd19657+0weFeEoL6ko8Hv+YWODPbO+SB4TA
         SmRWa6TdNEMwSHXjlx8BKRXwetRzkfKIUEFLzlVs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1m800w0RWZ-00LqJO; Sat, 29
 May 2021 08:39:17 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Sat, 29 May 2021 08:38:53 +0200
Message-Id: <20210529063857.10177-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529063857.10177-1-W_Armin@gmx.de>
References: <20210529063857.10177-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ODb62IshJ9ubzd1Jt8l8uMceOGQ98sq5Kxd9fwgIQ8ia/LwBcvI
 fJl+yhStEYGds2OcKveDci7/C7mea5/0ySSbNArNFnN88hkBJ3lAzp64/yghueIMZ2JRo7m
 VkAStKMFKz8eXmjF0EtJt8ZPh9scq6nqIln7fhQuMnaqNDEtic5KY9MKoH1nOJfT2XE2bmt
 K4FEqV8vv/+AFpSU1eBHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YfFsyjg2MGU=:8JMINtnut5AB3ON6Qj0XQq
 LFSzlV5ZUPNGMnoR3HprHeDMwtl4C1jVhuAaWk+X1UqEdQzWQ+hNd27WU37rRfmCZVEIXTyH+
 DPLYazYzaGVwqr32mNLIb5Pjb8PMcTEca2xuR80r8crwBIJF+oE+uXuSPWT49ak6AWQKlejJl
 7L/WATkmuYolLNon6SqeHIdLwuFzL27ynPEv896FsFVYInjMFsm7ggI2RccPG/MZg9gaFlzVg
 p/CYIVOTpRsjIcl4FwzsHxyxvPbCXMV0xX7m43rQ+lczXqLZJJuDg1zmCPuSWy8x6Zb8tM3y0
 lv5jN5iWps0fjv7gIRE801EN839rNucRDUrybO4rerc5C3qPq9yQ6h/UQl5FpaDagZd8zVvPW
 R2Vy45WMaWWhBPdXAxfVMntok1J5LPGHC4an6xauTFIcZF8Gk0hkcDZ85Lg0u9CcfcVCrbRqK
 dUktmQupZxgcxuIg9/5qn1p87syXUfK7iqm+jeru8ho1WyEkFEtUPvDmGABXIB7b59C5wXiGg
 wvICXWUMQIdEL1OjkVJK8OYeiT9JFcQ4SXfcIhy1t5nozqT7GK+z1I1BWd1S/1gWXztqON/Dl
 vEw6TQMhFf3CGzIAXgikcgSKMzjOLEipjItnPunqkCCkWfS2j0aYP1IFVw5FeYxtdY1bTh18c
 skESlqMeGwZlvXUeR2OR/XAnEZAr6uP5YN6Vd2MOpZa2jNFt8Z/RRcD7Q/j6b1VFLNamzM7pb
 jjxfduUeRGJeEIhEkRaOy6qZz3Agse6u0+s1W3bj4lI1eleiRTXK8uxqvlSE2JXGEWhbUhQGe
 Vd4lO97fgMtcSKEQwoUWLRtkq/YcZ9gsbW43KqLGiIolt/wD3LdLSqpxfzgeGku7a9861KXe7
 /Du5MNdM0vpbcVRYkXM5qlNEuRKRghuXW7sQr2G6aTuSHwjX4Cu46kHmv4KTKMp028j4jHefc
 dGPYiNRuz7QS/UJXOml/a4SWyFDXL7VImq3mYjr6r4qWfXtQXz5c+BAnKp2vYmuLfOs/75cOI
 ZffaDEhcRdsex1bFEd2y2Abf37pA75UbmogguqH65ZcaF2GkkFURgGiwNUhRZLceQ0ktpIWAi
 +yisHNQvQS0hREerKaS+vQa5YZpNf6GF9GQQDcaZwuj8GUX22gAyXw+60uLdMzZWW9klmO6/s
 7xH1JUf9/6gThchZKdlq1pktYdSgENuIKMYLvuDRYPmq3QQ4s4YHR+VqRZuAujTYhZkF8=
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

