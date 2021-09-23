Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF5FC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0823961241
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhIWRBc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 13:01:32 -0400
Received: from mout.gmx.net ([212.227.15.15]:52989 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235633AbhIWRBc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 13:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632416383;
        bh=aVm/gPR/H1KoXSDFZSr11mhF6+Hn2CQKT1j7Y6UBroI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=RUrj8QgUoAxsS1XJwzvoqUeieN6IrXFLHRijgfsmDLmYAEmrHH8socG6ELWurCDrB
         NkjxHQw6esA2fpoTK1n57nWj82j+639nlQhdcQ8+0LSWp9NmaW5BwmhJ/zdPaP3P28
         5nhWmMND3Bg9DjZTBoeWdh0iVVJztqW086tvkDcU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MY68d-1mM3eM2QXd-00YPXO; Thu, 23 Sep 2021 18:59:43 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target
Date:   Thu, 23 Sep 2021 18:59:32 +0200
Message-Id: <20210923165933.24132-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923165933.24132-1-W_Armin@gmx.de>
References: <20210923165933.24132-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WDdvYLKBLKyqaxYrQydqqycgNA0KNv6Dm5dZBLLfmbsvCtOkq0J
 SlsY8r2eAmF5bOzn48UCiurLo+NLWINpAKdBZNiaF/+B1ZGFiL5JMc9Th1p9dtaiQkSb6sc
 eBTaAJ5na8hXxNdEA0+fqsyPcrBnynF/1D7qSPSrigZCZn9PDjMXIX9+pPU3wFl/S+QiTLP
 wP30FRWcWlBruF/ZsutAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aRnly7RQnn0=:Q4zs7ST59g2n7yelo5D6yC
 /MxmljSMTQ/w/zawA6oV/OROQBgGNSVDCrpaa2ZERXIlcuNfTUGX/PWZlhQJ4L7Rrlqd93xbP
 +M9VXNwB2P91aB52RtrZPl3ox2kAsPxrLqt6ZIWIXy5WTJkWsfA7Ako8QDlJoEc5PBbgjhMST
 L1w8UOnXbuJCEwhmqbqLm+lZvHLpgY7nbQURrb4UFDxyQcQJ2RUC4RwVVVP0YNRNGnTuo2ttz
 8j0cZ78Fmxekvhcz/JIOwr/25c6/hoVTQU1ft7rdn6eMShorolKUunps+l9wjhgyO53hl17vf
 LaeLtE+Ufg162jRvV8Ps1+WLradCVEbWIZK/ehACL9xXspYH3wppUrX528d60PWf4X4llqBk2
 X0VP6rjvESUo2AuDtWaT/Uhvb9BrlU94fK1Zm4eaa1+imG/GpgEQ2q6mb3eTb8zNkUoMJj4L1
 3TF7eScDBtHlo1AJletvopJy/GCSDjxMfhLHrfIhj6Xvt4eKbqOSCU1MMjQ5qQ9SNgWY43FMk
 SFoeC8ncqwk29PrKHZWuwP+kQm92FB+eSevrdUj4M0jYNmQntMhq2suomRIa64QZj9kZPOCpI
 pTCl5mo3oEKfOO7aTJrpWGotqWe6hbrbTYjUrJNXe9IUkEfPsTts7ZfOxfKrqwNmTtDyfeNVw
 r/6RqrgOLQz6EGfX+o/Amcw8/fu3KhHh2aGvblFpB9SRV/xkB0QueYBQWY8FNpS/M6gq5nf0Z
 GmAaUyS2Z+GHtTfIa9gTl9qNNW39/KioM1tp+dMtAi2GtL65yectVFUeY1wbVwvAOwyqsT8x9
 vu3fjx0vzl5bUUraYmqaqhbdpu+hpVYbPe7dSAIsAAGjdHytJVfBNIC9mRyhk/iOFSBkuuv+7
 k7H7wkyJ32zWfTycu0VuzEhdUDPFTbk9G1Pju9Y9pRCatoGQiYN4Vba+6+fhITrUpdNSG4NMt
 qIXqYACL3TnM6nrbCGCYKzMiGadSSawenGQ/nqG+ZCjvhhysTM084MBsdEXUxB1+KEJ4oOAbS
 E8TIUDRfX3wiuzMljUb8ZMQ8JwCG4xxDwlxQV5SYx5pvO+4TQsGhsYujR/LynC4PfRswjlQ0e
 aeegJPVDhXit+8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

The nominal speed of each fan can be obtained with
i8k_get_fan_nominal_speed(), however the result is not available
from userspace.
Change that by adding fanX_min, fanX_max and fanX_target attributes.
All are RO since fan control happens over pwm.

Tested on a Dell Inspiron 3505 and a Dell Latitude C600.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 52 ++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 774c1b0715d9..a10503a9f80a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -76,6 +76,7 @@ struct dell_smm_data {
 	int temp_type[DELL_SMM_NO_TEMP];
 	bool fan[DELL_SMM_NO_FANS];
 	int fan_type[DELL_SMM_NO_FANS];
+	int fan_nominal_speed[DELL_SMM_NO_FANS][I8K_FAN_MAX + 1];
 };

 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
@@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvdat=
a, enum hwmon_sensor_types
 			if (data->fan[channel] && !data->disallow_fan_type_call)
 				return 0444;

+			break;
+		case hwmon_fan_min:
+		case hwmon_fan_max:
+		case hwmon_fan_target:
+			if (data->fan[channel] && data->fan_nominal_speed[channel][0] !=3D INT=
_MIN)
+				return 0444;
+
 			break;
 		default:
 			break;
@@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum hwm=
on_sensor_types type, u32 a

 			*val =3D ret;

+			return 0;
+		case hwmon_fan_min:
+			*val =3D data->fan_nominal_speed[channel][0];
+
+			return 0;
+		case hwmon_fan_max:
+			*val =3D data->fan_nominal_speed[channel][data->i8k_fan_max];
+
+			return 0;
+		case hwmon_fan_target:
+			ret =3D i8k_get_fan_status(data, channel);
+			if (ret < 0)
+				return ret;
+
+			if (ret > data->i8k_fan_max)
+				ret =3D data->i8k_fan_max;
+
+			*val =3D data->fan_nominal_speed[channel][ret];
+
 			return 0;
 		default:
 			break;
@@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_info=
[] =3D {
 			   HWMON_T_INPUT | HWMON_T_LABEL
 			   ),
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_LABEL,
-			   HWMON_F_INPUT | HWMON_F_LABEL,
-			   HWMON_F_INPUT | HWMON_F_LABEL
+			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
+			   HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
+			   HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
+			   HWMON_F_TARGET
 			   ),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
@@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device *d=
ev)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
 	struct device *dell_smm_hwmon_dev;
-	int i, err;
+	int i, state, err;

 	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++) {
 		data->temp_type[i] =3D i8k_get_temp_type(i);
@@ -926,8 +956,20 @@ static int __init dell_smm_init_hwmon(struct device *=
dev)
 		err =3D i8k_get_fan_status(data, i);
 		if (err < 0)
 			err =3D i8k_get_fan_type(data, i);
-		if (err >=3D 0)
+
+		if (err >=3D 0) {
 			data->fan[i] =3D true;
+			for (state =3D 0; state <=3D data->i8k_fan_max; state++) {
+				err =3D i8k_get_fan_nominal_speed(data, i, state);
+				if (err < 0)
+					break;
+
+				data->fan_nominal_speed[i][state] =3D err;
+			}
+			/* Mark nominal speed table as invalid in case of error */
+			if (state <=3D data->i8k_fan_max)
+				data->fan_nominal_speed[i][0] =3D INT_MIN;
+		}
 	}

 	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", data,
=2D-
2.20.1

