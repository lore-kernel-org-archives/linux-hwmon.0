Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15E0C2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C54A6613DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhE1RjU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:39:20 -0400
Received: from mout.gmx.net ([212.227.17.21]:56121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhE1RjT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622223448;
        bh=JoDvYIsMHtx6gueKLKKW45Zj/pND9+2ajlZZg/tERBE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Yjkjxkc2V3ND31BIsHkYJhMCyu9hmoUUUoM48mvD0wbBX2us0tg2PEtJBZm5rT+Qx
         LQ7rXHwORoBb5m2gwxpq039yTaqrWT+1TT+0AUpQAAo6NqFd/bSRtjwLRyGIG+ocKm
         tf0mbz/XtIpXDR5pLrPSFLMPim6gnggBOCwQ94Ds=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.180.99]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MmULx-1l4W3F1ziD-00iTrO; Fri, 28 May 2021 19:37:28 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Fri, 28 May 2021 19:37:12 +0200
Message-Id: <20210528173716.10975-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528173716.10975-1-W_Armin@gmx.de>
References: <20210528173716.10975-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZWIH3eTbeY6ob3CkC66F0Ha2gENifmsLQxrf0xceHkJNJkcTLjF
 ohpXnwu8wpqto2bwbBygNIfECZipK74EbZkxS9M2f/j9yhpfymfb79XyBIKIWgA7fxcd8PU
 d3LtZsLCXZxp2VmGl/CKwsZdnVs5DwefadbinQcFmkoTwG2x3Bz3DtPL0Gz0VGOuLPniyJO
 zBjftbLgwssb+JAnGPhAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kFvwH581IJs=:Udelijg/Xmuu4KwRq1cZlN
 FrwAZWLUuMqulh2Injwagnoyv9c5z7xSZ7nALAOIVflVyN3mLo++KIJukAEWo/4OSWMdb66AN
 L8WWDWIX6NUOwz67XVHjen+e7gma3g3emHTbVf5IJOIUrWAFjSWA1VpMqavpXXM8P1O730bsv
 K3G6g1bW/bk73KUyPsvDHN8yTvv81zvACIVnKl1n6uQuKiswXq+N1fvX6hHhex7M0YMREZ5ui
 NNE3RQG98CEGLCK0hwWiBnTZd4Q3H+zOkZ8ekMf2KxDEwLmMhROCBrHDc477iyvts0Y9Bvgln
 vzGHy5Ag2lfsKUuqkcA+f7mbdFpvz/gVRB/o0QdfLtCQF3W0Q1GEFvll7rzPImBSxYojnGUFk
 BtYTkWAgvoK5HxQsnI4rQeFZAhfHbeK4zZnII9zY7lNHyMlz+moz8e3T3/Wv7HaOS0gt+rU78
 YsruXUSxnY8/9Ma4lzrmcomJg0GR5Sm+kO13dzHxjz0xF0OtmbAUG8cXeiQIeut3VxUPXtWzT
 pZaWvtbL4PGROpo5pI2TSmZG3ml4hLEoORyTb0A4f+iNIbEsXrznMOqTGOei/FqGFmgbQqMwx
 uwxzU6hacdVDbj7V1Z1oyf1KBHAOeSgroFDQ0a61UrrflOCuxdxYdCBlq2eb0bwIlpYxZbHEu
 ejHs1BXh+4HgD1hyzt2jmgh5gvN0UimoUXJALgj3HGp0nQ4gtwgWe+e8/5LZKzBxMRfTxZACi
 Kn/gMMDYVbYQLa19Wy+SNZuVSTo/G9oLZ4u7+kV800bGQvn8NB2uIpQr2C8wnlCLI5AXUCDQH
 FDsg3iHNnMAEWO4emhkBqt7YCcj82U8amj2mGhYW53hwBvFYVS5oCMMyqvngsstANuG5Ee6Da
 uxix3Zk9KlaydP3OvueuUKoCWxzkZXuO5fg0fjH2Qued+kcIZrgojF49Dual5aQX9OuWie/rl
 G2wm7Vs1Fqj3dqweaunS5W5YC0xzSugYqsRmT8beUzP3HvH9bDY7M0x2bFy1YwIoLPR4uCrqi
 RasBi4trs8vC0BzH8uZA7cSmFQg55eXyVs7k3Co67b4jTgG4upV3FszfZ9YmUj0Niwsa3ioM6
 /ahbsqEa+2CHQFBLuJb9aSniSgKw9sNqtKnZIGGieFpNMS9StkU0AaWo+w8QhL2m/MD7ny3pk
 Kzttjt6gxfv4KfDt8cUhgeFEb7Xs7b0W4OsFdpNVZQH12sJu90skCdjR5Jmw2yLFLeZwM=
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
index 2038f2a50e11..deba8819164d 100644
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

