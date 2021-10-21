Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D939C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F57D61390
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhJUR5j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:48951 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231396AbhJUR5j (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838906;
        bh=jac/CaH1YH563dghuUKBKgU49JQgYUdW3AaiDKqB3BE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YC8Md/+Cmf7JeZwdUmaFAuu6prMfTZPStzsuKnplmeHUTh+sVO8pZZn0dl3JxreF+
         QVRN1OGm8M1o7CmBgBNxmPi1jG+v+iu0ZE7jonhayMn6C/9+zo9sl/8yItRURHN3w4
         Z2Ydo6/zT6YSWcPw/+Fqi4tDbwSLAoLCD31P+UcY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mdeb5-1nCOvz1jWL-00Zhck; Thu, 21 Oct 2021 19:55:06 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 4/5] hwmon: (dell-smm) Add Dell Inspiron 3505 config data
Date:   Thu, 21 Oct 2021 19:54:46 +0200
Message-Id: <20211021175447.5380-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021175447.5380-1-W_Armin@gmx.de>
References: <20211021175447.5380-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:grIJCnfaEAPW6x6yE/+29DOLbdSau35UmyT35FVqv7XxI6UfMAh
 NwwI+uV1lCPn1dqQm0Jubj7HK1r3vxnl328MFbNNPyhhsDfpw+Nb4WGLqVK7zNNVg3NXSG8
 prdL8iGfoqmhDHOEVHWUl9qeKSAtl9YKWbys53VYpJU4Fn00qswVlNLUkmPFF7skLCcMdiM
 GUngCKPcezJqxkXaWhnag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+0/z56191hY=:SfcFrXGNWa7drJ6qpuGG80
 tYmTDq2oJM2JwtgjJjxD45+bU77lkENrD25Fju3mSUIitbkID0AFaimHEFwdTjsNRCscgpgxP
 /X0Vv6ykrgCsTa6Kc+T6A/SQx8Kj0DJTqMGdcycXfAgORZ+ro8bLjAXJ0yTbnVKzhVZSv8sIN
 Sgsy/B4ZJjqHGrJ1g16bfjK0E1sII7/InF8dM/pU6JdeAjfVvNSSLlttOI+gSfafiSHoYw/r0
 F/2xmrx8cWXnAGg7tQ8zuZTVuxvrSLdKKWi5/3AXO+MmH+ESlRRiqAOuNsVUtQr/dvRyfhbRZ
 H00SdmKD2mFioNVjyj1MQ1UOckxODAZZ4OHiob82bUqqzw7daprOXNmwwrzAP35baY+7BLS45
 zpGx7Khwuihwp8wkjR0QHIIAJOq/Ll4B+79bh443ehwQnLYRweS9zLPrtsD/oqw2wbYc9iqdw
 m8y4qpkblLIGkASsJZeeKCvbnfaqBYQN3d7PSJRd/XgWuPXPNYlYabqBf3UztB0qgBXMnCBjZ
 iizQ+YxsHQoSn0nGpAWXeGGNiE3AvOlUu4kxJjN6g2lksSuZHiz5yH9FGg1RvQoGmN6lg+TK4
 RtObfAtW4ROPe03GkHPQv6bKcSk8f3tBQdUjKw0cmzGjqcqRtGsp0BIMM89ioH8yKMyN4pWHT
 efbyfdgET9Gse6T2zGQXSGZgBM32mGeoWNeibqQet+YflDyyAzdvhGvmVs/nqbZlOQ9iDtcjT
 XQrsgTxEmMRUpuOOJS/mxxRTBigCIoQpey4RU9JwBdDJ1ssKjgkfealDreae6rLbuzhzb+wBK
 +D+kOwU/Rc9kdsMXyRQKouPhUiI+ZNLChlJoWso2Uco4/1EkNuzBeJOOZR7vcxsNk9dFd/VEv
 SIrHOO+4dePplMMon991twUQIvvqUZzmcY5u/4kO1XePF1B/IB+bPWJ/48MmTO39JckUuNKpk
 8pFxZRtG9ldQeNdv66D/ExQ5X9upBTqEZwMHYE8NyGRwz1U6jFyLR0QCwAPZh0SMDXwfU8v3D
 PnxZQssgDpF8Yp+fcSlkjG26ilI1oPcVfPVUxJaDhPytkfiJP9RhyNrpMPEY07vgBsMdRTrs4
 Peyh4hGM2P3T/0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

After checking the fan speeds reported with the
Dell Diag UEFI ROM, its safe to permanently
set fan_max to I8K_FAN_HIGH and fan_mult
to 1 for the Dell Inspiron 3505.

Tested on a Dell Inspiron 3505.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 5f0338b4a717..2579dd646b20 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -990,6 +990,7 @@ struct i8k_config_data {
 };

 enum i8k_configs {
+	DELL_INSPIRON_3505,
 	DELL_LATITUDE_D520,
 	DELL_PRECISION_490,
 	DELL_STUDIO,
@@ -997,6 +998,10 @@ enum i8k_configs {
 };

 static const struct i8k_config_data i8k_config_data[] __initconst =3D {
+	[DELL_INSPIRON_3505] =3D {
+		.fan_mult =3D 1,
+		.fan_max =3D I8K_FAN_HIGH,
+	},
 	[DELL_LATITUDE_D520] =3D {
 		.fan_mult =3D 1,
 		.fan_max =3D I8K_FAN_TURBO,
@@ -1030,6 +1035,14 @@ static const struct dmi_system_id i8k_dmi_table[] _=
_initconst =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude"),
 		},
 	},
+	{
+		.ident =3D "Dell Inspiron 3505",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3505"),
+		},
+		.driver_data =3D (void *)&i8k_config_data[DELL_INSPIRON_3505],
+	},
 	{
 		.ident =3D "Dell Inspiron 2",
 		.matches =3D {
=2D-
2.20.1

