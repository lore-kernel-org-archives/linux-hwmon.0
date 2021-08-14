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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C048C432BE
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF5960F91
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238644AbhHNOjg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:39:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:47075 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238512AbhHNOjf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628951931;
        bh=ctIxWeRrudS37WE0LhW7RLnIxOuhmIbvkDtnypWIIrM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hLprq3LNmV4rCJBmEYWWn4hVDSoWRMwSDPd6r0MVfUjlwvhm7Xmr0qrze07f3n5YC
         smp90LrOJy0ovVFsY/B6EYxVp/JFXdT0+9/joBaRhDK4Glf2SBsAydVmxzJgtuqfO9
         Hpo5RFoAGtMd1NXXJ4Q8KsVo69tyOwXqmUb9H12s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1nDW2K0FZj-010ZOG; Sat, 14
 Aug 2021 16:38:51 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/4] hwmon: (dell-smm) Mark tables as __initconst
Date:   Sat, 14 Aug 2021 16:36:34 +0200
Message-Id: <20210814143637.11922-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210814143637.11922-1-W_Armin@gmx.de>
References: <20210814143637.11922-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+AP1JaO67EKx6P66rSe9YXsO/3aseF+9kC3FXwYz0kEXGO9ARPE
 NsHGc5A28VEiCZR5STzE/c0GWqW9qM16hmMn/Ho7HBuDCo25+ShyCPY0Sg8IqqwnLFgcWR/
 gA0ChrWBrA/Q9VqK2Lckevc4u0f7VjLVEMcedcNud/2qQC0YbagVWqW0pnM3I5VSmvGkGkD
 n3+q4PCgiqezfNLnFXaiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hpmTxSAonMQ=:EQ0mi3cUY79FACpDm3jwLb
 fAeycN1iln2ecsiwttiK3W+xZwQxfWlq3v+d4d7kKx26lxRpdEvTPpqpUaQ6/0MNyKYjv+qMP
 PWQSjQUXWlCE3rUquLuqimKmMqz9nmGWOjos5WOkBXFUsqy2syeWAp/v+7aKm7sMzDBH/R/0Z
 SAjmOFg4NY4rXQXkOl+F8WeqbFJfSN1bXAtnvB02AB5w09ge6Mp6HLsgwl1Plaa+Fz+f/EZHH
 4eXD/uI9E6z2cvt6HZAfSpAEuWhpFKKXwCm9UiRcge63R+z/WYCBgjaKsPK8NpfEuX2aRxU3o
 owKfzCReHgHolHc5In8yFEyv5OT5Umj7KL+kEImXlZe6StF0pIPAU5lrM54WmeGBzDGaELJg4
 7Q9/yYzKdXKdwK/f4Fd1qmIDFw1Vg8+Nlv5X70fIvduAE1rWmFf1vYSK5a2mgQLDK7wBMHnSd
 R8b66sMJZtStfc8uOc076ppEXHzwh6dpT5jurQcJC8NGIM8sSaHCzgO+B9sqGdgO8mXseLwc4
 96ZC9vcbTE4cfRB7FojRzyVEURiS/S2L9R1Why9RV2juZbm9x3B1MsfokFR0lfth5V8u9rPse
 MAMWVfjZ/58wpifzrMAb6sebqEJgTQDFvTRszatFa8eIg7NGbScRW4zFngkY/IxoxZTkujv76
 q6zZVL3qhvO0s54EKir0wtb7m6DonqIB6qTAuISYBvMTVZYMRZI06fhE+JEFZpfRyq3WIFVFE
 cA/THpVqFdKRWKiiPbA5LNMUavaOcvqHqWlbWeb1gywZGwEZX+qzF7DRkUHRiCPq0cutuU+pV
 7PBQeOcny8Q5MXedIIc2khzx8QURTCdlFbr4wTq93x0NI1cT63lPfVY/Mh4dd1s0TbWM7PA92
 tNRtsQJ46TvOxR5JNp11qWaeh/1Y+FvnZLHgZHPpioiRMoRY26qq9njaZqEH+SRZrbnghZjgL
 ElSztv+ZbAgnOc3ILXv+KdFAUVGev+79hUYBrBIWUHjUR3tZCL233RolVgJRmFLGtRtYVbJ79
 3fn1mg2pnubKGuw17cJFkSAkarAyPnkZvXDQqrOtC5w1b83Gm5UGbYqh8EEqn/QGiCeh04+eD
 mWVmswdCKSTBFPaYz+rRsVc/90LfS36KCU9
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Both the config and the DMI tables never change and
are only used during module init for setting up
the device data struct.
Mark all of them as const and __initconst for a
smaller runtime memory footprint.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 43da32ad2dce..68af95c1d90c 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -957,7 +957,7 @@ enum i8k_configs {
 	DELL_XPS,
 };

-static const struct i8k_config_data i8k_config_data[] =3D {
+static const struct i8k_config_data i8k_config_data[] __initconst =3D {
 	[DELL_LATITUDE_D520] =3D {
 		.fan_mult =3D 1,
 		.fan_max =3D I8K_FAN_TURBO,
@@ -1115,7 +1115,7 @@ static const struct dmi_system_id i8k_blacklist_fan_=
type_dmi_table[] __initconst
  * support for affected blacklisted Dell machines stay disabled.
  * See bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D195751
  */
-static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initd=
ata =3D {
+static const struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] _=
_initconst =3D {
 	{
 		.ident =3D "Dell Inspiron 7720",
 		.matches =3D {
@@ -1156,14 +1156,14 @@ enum i8k_fan_controls {
 	I8K_FAN_34A3_35A3,
 };

-static const struct i8k_fan_control_data i8k_fan_control_data[] =3D {
+static const struct i8k_fan_control_data i8k_fan_control_data[] __initcon=
st =3D {
 	[I8K_FAN_34A3_35A3] =3D {
 		.manual_fan =3D 0x34a3,
 		.auto_fan =3D 0x35a3,
 	},
 };

-static struct dmi_system_id i8k_whitelist_fan_control[] __initdata =3D {
+static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst=
 =3D {
 	{
 		.ident =3D "Dell Latitude 5480",
 		.matches =3D {
=2D-
2.20.1

