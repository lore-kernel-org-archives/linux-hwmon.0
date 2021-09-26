Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A460DC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C78660F4B
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 22:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhIZWMq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 18:12:46 -0400
Received: from mout.gmx.net ([212.227.15.18]:45509 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhIZWMp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 18:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
        s=badeba3b8450; t=1632694251;
        bh=Z4YV0ViNGXLjmwTvsBCwX0IysXTWQCRVraatngTpz5g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=W2bj47wJIUfE9rsTj0hc+qLZ95r9Ju81CeUT2pvfUVB/VMI1EZbmCkfPJyt+OCn6Y
         F0R0/SFWDqs/Ugo87a7Z4gV1BhYnoW6yd8Nlf6qsBl7Z1ETLUh1sZu11dT8bQhI24N
         joHAe8RMXrRkJ5KFyYH1o9VNHsRcHI5dH4CDRmXY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N79uI-1mtg9P2y0S-017Y1w; Mon, 27 Sep 2021 00:10:51 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target
Date:   Mon, 27 Sep 2021 00:10:43 +0200
Message-Id: <20210926221044.14327-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210926221044.14327-1-W_Armin@gmx.de>
References: <20210926221044.14327-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HIce/h/ynVOSVyCI81PyOdRXP0L93GCnsLP1Zvw5nsPhpnKiwQm
 PCjnXIDO25nr5/tdBNJRVShMXNKTG51ojETO05pkTPJqpX34lu22e1tzyLV4YILmYtOfQKz
 H0r/2y+ovWm79kQPQ12pYjJiJttEJXGwTjpaQZ4wDj0tQvFF0O147wPxXKCDDQI4mS9XO93
 uEKrHZ5NGz5T6DciBtnEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cLdl8EDrQUk=:uF0zkwDtuomOLEHKc6pU3/
 ED/c3+1xChUMf9Z9Fy6zd65MyuOd2nCkyN/vg8Rd1EhS1/eoCyNwgNL6FuFqkCxgT8V89dXYX
 dEkyzgd+vAlDc3jrdQHNOKXiaR9vMIM+8pySJHNv/WV40UBcetSxWL7H3einiHknksa/HZKSS
 x0mRtkvlJve8mozeoqT8BgJjdtgUedp+GpmK08q1cZKi4MvciNGM9UirfT4TuFcHe8viiWfA5
 jxnLCpTE0tecxov5G0AdMQA3SaWQgi9vnTkfMv9C4mjtpNXWcPW7B2St7njA9uTqlL7mpI2Sp
 0oJ2PrXV2Kn6NjM8xvBk3MACDMpfHkBIzdoTBIvU11qWsNYDM5WPytHALLOdRwAZ5CLNxlcOU
 W5/2714mxGT7OhEroOkxBnvA62uzmXx1+sCI+/UFp/kUVXbyUlyi18QOUOCUHbR+ouajqkkrp
 +85YAF95/Itk3nMzl+BRJlxrExx5VrsWKLnK927KGvzhOL2BiHjoC+3pXxZj9Xs9tBIxzsgbF
 pYOcV4RkcXThjE3sQQfXK6LGl/DaRWEq47IjkigFLnMuxD4Ushtc5F7L2q7wQu6rNHInKeKOd
 ZNiwZhHOAYTjEHiEak/S1/5U6+jNwd0hQfnUI/K3yff21mTW0TYAyX6X0rflYOa4f+6Q8aKOR
 SOuW8ScURGB1gx79CpiosD1zraWDKrs++t2Vlsf5542kITnuPyN8DXoR5Kz840i9687e/nRNR
 o7T+uXEJuccCB6SXGPP/uthrRc8GOz/30aV4U85P37Jj1ywGbdcV0bOEnmZmKc2WKc/jLEjFe
 cNW8ABtHZzAieUpRHc9rJNLIEo+ep++3kkKymuKvVdPlBwOkt6mVzTr5v8M7DJuFOmjZC0VUS
 39z0x/oTmU3QQPVhID7rnyXzVifCzRgHEAwDIlmy5LjYwutljs4h2URkbFKcQljb8fE4GlNxt
 tZUtltHx308y3ZdSiGdzyb6ZGV6uCVSuSYLArAh8cRKznq0cX005tgGDt7q+54KJGPNGJQsxG
 0WkNVp9JJwVpVHrTT7rc5gEZFKvbgYws5CYDbvQoUbGWLco/qzKe1cLypRbifZDsm16S8w2rx
 Pa0LYyRyfBPu6M=
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
 drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 6 deletions(-)

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
index 774c1b0715d9..476f2a74bd8c 100644
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
+			if (data->fan_nominal_speed[channel])
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
@@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device *=
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
+			if (err < 0) {
+				/* Mark nominal speed table as invalid in case of error */
+				devm_kfree(dev, data->fan_nominal_speed[i]);
+				data->fan_nominal_speed[i] =3D NULL;
+				break;
+			}
+			data->fan_nominal_speed[i][state] =3D err;
+		}
 	}

 	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", data,
=2D-
2.20.1

