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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A99C49EA5
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B2C86128C
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhFWVXg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:23:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:38469 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFWVXf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 17:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624483254;
        bh=Er6k5tLiUJPuW1WNmYTS1PUHAIWkMV1+c3yIe+8Tf8E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WVbxs+NG4tbdi4NQMlWSJCimtpAkdmAl0x8Aeax6nZ7ROb5PvzfF8AMR2a/ChRnhI
         MK0DevEPvgVFumRa1JfF5uEAUiasRp82wZPMCEr+1P0pXZ5K9VGaH8oSvJV5q/6dQI
         9MT6w4wpZHoP10augLEMuHuPnvWtBFix149bV3EE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.178]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N3se8-1lE43h3yng-00zjdt; Wed, 23 Jun 2021 23:20:54 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v5 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Wed, 23 Jun 2021 23:20:22 +0200
Message-Id: <20210623212026.30799-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623212026.30799-1-W_Armin@gmx.de>
References: <20210623212026.30799-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PpbqYXwsfBAPFPl8i7ERcqev/UeAYRuJhASfKZa62XQ+fSAuF+B
 +QgSFXjKEyn4zzb7Uu5s1wtxWGegzg8v1Zt4g4unY1dVvpRww4jdqMym9XnevG8b30D/h2v
 w/QnKXgg4Q0crivc+1/HvbOm4XZ40O096G9vSS7VzsVnrJ73sTtZzl+jp2qlVOFbhWLLBrq
 hPGMMsQZSNXkS5HOrpmdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bnCykIcg1n0=:GV+j/eoDZnnwHGYj2uwp2J
 LTjt28vgqXCigp+dB7iAhtYAryfZ8x/GcVQUVImCmAkvgJstflnk7l6ZgTF4y0Hefs+/6Qzd2
 yrwkEz13o/t1nO+qzkDGf3l+AQ1lH1Nl2AiGPCVQ2C9EiJEt7sxex7zZqdIGFZ/uRD289bSVv
 wXXejpWOAScpviM3usUdiIx/d1P0CSX9AN4yZ40kCdCKRQDytX0w/HL1AGUXRZR78ywRb4mMC
 Qebz8OZDgujVoanGekQh/QeihmBx5CLXoRCwMdHCYSqWk806RgFtKJonBn2S9me4/iSUsnPig
 SsnhqQh5sC7Rn4XBZAvcmzBcOvmqtTKqHCuZ90Rsv6bq1Ut3MdZe2LrxfhRgkpaxsivl1vHRC
 sm7rdIas0DOG4zHajsYbqVBY9D0hA7WoD2JLet3DHEX9g8lrfeEveK6VCmuymMd7AttXRgbcE
 7vKK4ykcPEuInZQy1uQy0KaNddFZjGnxg0NL4ljm7wCrnAntR646HeN2pjJi2rSMKRH9l7RgX
 7VQKbIWTobNIbm1+cFAbRo/MCNj1yoAwiqEYg1gyXS7oMWbEBfiyDDHTZQEu9Hr7/9mCAY+yA
 vaZQhYzk3XjcJO3aj1uYEVWIZ4G9TIOLKEq0qLJeiuf268OrDtAUFR7334lDCTaUrBGf42EyE
 nUsEyzoX/6ouf9fmbYkkPByLA64ykdFd50HbF2lTP+kB1u1r2vf0HFT6xgX22/H0LPE3BWnC9
 KPrUnTO+jUNwDxJ/rvxF0Dp4ylwmivJuVqKbyv5jxhhZztCiT48k/oR6Tbzr8uDhmv/FKqxLO
 ndQMsKq/VdYsiAGSFgLsRlvfMTz0TQ5aEsh5DFfRXAFwsq534v5RcvRkFJaOte0zngitnvUYm
 QdBp85uhHgKN1mjBRlvGqQb+Q1CSjQpASxo//voMsy2a1BzgISBSBtuxUo4OWlL4eRu1iqwcz
 dNe54mFDRDxlkE+yOabkQYaWMY+jUP+JDCQSorqnbMQ4/yBhlt3GSxKtOZRQJBhW3tSsJ9PwM
 hggsEal4dSNCYEj0oQVObxp45CDaTl/IQiC1JkhBQYzEJjNPjnmh0AZcenl7M2aYkdKYOnRKB
 Hn6olh6RpitC5DPsjFUWFFQ7SQrrZmBUz51
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

