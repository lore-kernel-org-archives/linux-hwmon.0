Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96934C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F58360F43
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343583AbhIXLrD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:47:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:57901 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245352AbhIXLrC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 07:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632483912;
        bh=xQSw6UsIKL7E5nR105sdpgw2GhbAPe+DiuTJWOov2W0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CuEPDULMPuEr9duBDAGN3/YpwQXBFMfA/m13OxVx46ai7P588Sxa+ODuGQS//W/ec
         cB/Hh63vPsp1NwFFwfNxkLwt11NEjpesCjLPzf4XTeoOOf6d33Y0JkT1BQIx2lHlJ+
         Gd2sbuw56g/jmSdLKxOI779kp9Qhill6gNKA0Ws0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9FjR-1mXIPn1elT-006Oqr; Fri, 24 Sep 2021 13:45:12 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target
Date:   Fri, 24 Sep 2021 13:45:04 +0200
Message-Id: <20210924114505.20416-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924114505.20416-1-W_Armin@gmx.de>
References: <20210924114505.20416-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9g5gzGrlBmkagORNgSoMCorRa2eVuNUALUZCUA8oXT5uCgI2IbF
 bQ1j5gMX/BruUUBeKj/QWIVViwU/EMMLoaXxP2u4iWPN0OJmJeZeSEsaPi91e/UuX9+f7eG
 zyjdXe/A3USqtF1oLJ258NBNIHblIKxqhDyfWNfkz7LHSqMsf24M/Sa3vsdR8KegOCdJE9k
 DMSlCfR2wsl9NOMmILifA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hiZMBczutIU=:vNU97yAPKvss8CKkAyOlLs
 uBjtf+xJTQN/w/4Qr2+Fj41JzrzYZd5Hcog1KrMOORgrmeaAdE0TJlyiGsoVVf7nAuHVILxsK
 s25eXd1C8n8kyJdNMe4NCC0CiKiuFo58K0+F8zj0I912p1MdvqGKQXaD6dztBMshcLkZ++A3n
 GWy7+P75Z8pz+Gy3pIFUSKl8Fokck3pLk0H7ivhyBKKLJ60GQmyyHBw4JJT/gLhF+ctYtgkwC
 deNhyOQwWIEAhBdTv91aXCInxx3nbIOuAra1miw0ZWip+6HMe+y/2WMSIo3slVES1AG4Iv2W3
 nAbLElX4KU5Ow4dbRKNxjItovJB0h22Vh5Wf0ZsT6RbJlKZlPp1jd49x6jnvzMrRjcXkMrckp
 QSxQjAeDYgRBUym5/sJlPs7tS18JXoQ/6NwJCAt2oYK5yV6nfMw1TkdAxZzBCy++tSxu/GZDa
 j5A6JhjTwAwmfpZ6nPCZHTwLiy0hGKyJfKeAde8gR/lkwNSaDHPWjgQtofiJJuITdVeH5jDES
 tO4ENRt8jnZSH0mu/+x8hA8hMYVJQPwVLptEyGxc7k8aVtFZEwtZLdnAizI6FeDrA2A2Q3p+I
 62W2TOxp5K+LoCWCw5PYe+lfmAZpBnnz7Mz06HR2sRX04V7MI+JqRpJ0vkz2dDyuj8Pw0WIcQ
 tSGPDW7j2my/NSjwmxCIkyMJmFdCBmJhCcqBtGtpAphyJhwNfsAJbcQNHk6KVF3AaionxABN6
 vLI5+r9kidFTtAaVualJTu2NH8/JcFP2trCD8Zhq/qjtxS1c0uHaP87pVXfukyNNsZqpa4Wlj
 omUgfJCl0Nw6G3lYlfVRRzn5ZlI6UI4cl7lPGAaOFmc9lRjwkxq6rrYBmU7VnO4krvPhfOUO5
 YVz+6Jw+a7yD/EeyfjGE15oR7BeHqL6XV33tURIEudIgj5l+aF5abyT44yecymMP06S1Kqq39
 BPWdIgXXX8Dg5s7Hsyuiz3iFIyrS4WS1qXdM163ktJTMM/p8fRliK8m8Z5MGwFamI8qeM1XtX
 ROfTeoc/ls77uFYp/KFKpawip1s8L124Y/jWNnS2h7u5VrYBVrlv8b5HCZVh1FhSZxLTWzN/J
 pCmYsK4a+xj1HU=
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
 Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
 drivers/hwmon/dell-smm-hwmon.c         | 63 +++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/=
dell-smm-hwmon.rst
index 3bf77a5df995..beec88491171 100644
=2D-- a/Documentation/hwmon/dell-smm-hwmon.rst
+++ b/Documentation/hwmon/dell-smm-hwmon.rst
@@ -34,6 +34,9 @@ Name				Perm	Description
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 fan[1-3]_input                  RO      Fan speed in RPM.
 fan[1-3]_label                  RO      Fan label.
+fan[1-3]_min                    RO      Minimal Fan speed in RPM
+fan[1-3]_max                    RO      Maximal Fan speed in RPM
+fan[1-3]_target                 RO      Expected Fan speed in RPM
 pwm[1-3]                        RW      Control the fan PWM duty-cycle.
 pwm1_enable                     WO      Enable or disable automatic BIOS =
fan
                                         control (not supported on all lap=
tops,
diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 774c1b0715d9..d7d8da4a63db 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -76,6 +76,7 @@ struct dell_smm_data {
 	int temp_type[DELL_SMM_NO_TEMP];
 	bool fan[DELL_SMM_NO_FANS];
 	int fan_type[DELL_SMM_NO_FANS];
+	int *fan_nominal_speed[DELL_SMM_NO_FANS];
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
+			if (data->fan[channel] && data->fan_nominal_speed[channel])
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
@@ -926,8 +956,29 @@ static int __init dell_smm_init_hwmon(struct device *=
dev)
 		err =3D i8k_get_fan_status(data, i);
 		if (err < 0)
 			err =3D i8k_get_fan_type(data, i);
-		if (err >=3D 0)
-			data->fan[i] =3D true;
+
+		if (err < 0)
+			continue;
+
+		data->fan[i] =3D true;
+		data->fan_nominal_speed[i] =3D devm_kmalloc_array(dev, data->i8k_fan_ma=
x + 1,
+								sizeof(*data->fan_nominal_speed[i]),
+								GFP_KERNEL);
+		if (!data->fan_nominal_speed[i])
+			continue;
+
+		for (state =3D 0; state <=3D data->i8k_fan_max; state++) {
+			err =3D i8k_get_fan_nominal_speed(data, i, state);
+			if (err < 0)
+				break;
+
+			data->fan_nominal_speed[i][state] =3D err;
+		}
+		/* Mark nominal speed table as invalid in case of error */
+		if (state <=3D data->i8k_fan_max) {
+			devm_kfree(dev, data->fan_nominal_speed[i]);
+			data->fan_nominal_speed[i] =3D NULL;
+		}
 	}

 	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", data,
=2D-
2.20.1

