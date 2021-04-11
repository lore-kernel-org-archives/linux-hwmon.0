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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E013EC433ED
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC516601FC
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhDKQnB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Apr 2021 12:43:01 -0400
Received: from mout.gmx.net ([212.227.17.22]:42691 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235640AbhDKQnA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Apr 2021 12:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618159361;
        bh=vODKaqYs/DMf9nAkjm+J9MKJy6AnOTlYBuMqmURqk7w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FU719t5FJYrT6JZaTqSztpNy6Z/MtzSJ3F/rWPLF2wD1ualCLjVQue8+PrJcReV/v
         viCxWAeZzo8sarjuJcrove3MOo0QypPMto4YjpL2FWd9e5f2YILJ1VwklfBxQMbXYf
         legDWmi4rwPS/ZdPZoB3BtFaE/uU3uqe9CQ19p4Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.99.26]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1lMWMi1u1B-0099yU; Sun, 11
 Apr 2021 18:42:41 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 2/2] hwmon: (sch5627) Split sch5627_update_device()
Date:   Sun, 11 Apr 2021 18:42:25 +0200
Message-Id: <20210411164225.11967-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210411164225.11967-1-W_Armin@gmx.de>
References: <20210411164225.11967-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H5Day4BV4xWbFdkgAUTemUQGpqOxccdPvuiOLia0YSS/kmzowzY
 0QoKDcwHPh/0SvdPc9lNk3PU32prZYNsPqiJBdDFyYRNqugBz9crLE8wK/1X1hPLqx71xqi
 CIrzU5iX1mrtIX4MMAAAPvFWyv5o/a/MWJdoJyffed4ojIEoCM+VaTd0odGdKb6uvyNbqTd
 n7QGrDNohpA+/tbRn5fkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+UAnTVOKdLA=:C3ciL5XfbW8SRRHr2DC5OO
 A1LKWgg/7YRkrLlli0Kv/Y/tKj1slXMDQ1Tcos+gMqZeQRV1BJ+xSpb+tAM1oZSaxAlaiIT3G
 0dJm2QkbumrDLZlT9PIdciPC+eRkH/beRuC1UCWzi8OinEL/c4WNqoI3wnm0HfIfA8DOFrsKe
 nRqcuuJ0AtJ/VlW91JRAKHHmr7OWOmHvqRRWGz0ZsTD2TZzVTGZ9RUpT8y4EawBI8xoauAlmN
 Ip4U2N1w93zPo+xaLY2OGLy/eJ5fN9q49+01Hb10S1JETq8gVfb/O/2fOLrdLRcKxzB4gD5rJ
 7+TRGAcBH1q7bvB2EPqQWn4KjbgyNdvL6OLbSKuhojd6WMwFNHGWiF1kxX02d4++jfAKZbbAN
 S1NfYXQ/8gJrhiRcQ3jrC0ybyUmPjrjJ1kxaMDBiBDB9tpF1hBu9sIW0zlrySDpCuSuREiKeK
 fEKs16Ab+qWhECj5IF/AaGpna7sX8DBp1aD78gPCW0MVQ4JLTIPJUXv44P+eBCWXnziMYC6Lk
 7BCcGlWUXKXNifyP2iqYeWOifdjjgaRb6frXc5yKs+ADEhpQfbuXrn4wF2n+2TYiJtah3lzFD
 Zr5NQtHwo+0PICWDBDj0AAL/SQp0hiG31cSSYQOFlF80ZKIbc41vPNFppbao/QhGcByShzLna
 cXHpbHGGg5OHQ9YidVBlGCqurxIc2ysZY9UpHwebPgg7MS0+fTGmXDhvJPZxcHATJFMwq/YYT
 HWSol6QGiU99COhkGkfj7Nahj369g6N9qJmKOqpE26pc6aeot9bzA78TAKPSmICJDBV4vqX29
 ICLCyOuqSOqywk3vdBfeCnQ1SZVJufcxFZVMM6ILqnjan1+EkupmaQMAi/DOWaST90U+VV5pr
 29X69KCNoT5ohbFm4KWcOX18S/1zcydOuByeEIRaFlHDWTIDuogq6p0UkMZUvUffK0eCm+MFW
 dQfvjTJxQMqEJa8Odk/iZ4yRLQw/GSpVz9QwAtFP1kVRamgPEc14E0KGcUS2G+JkRgcPZdocM
 jlaJl/+ARPGpL0mjWx1wSHowSCO5gWqKFx7mBKLOWrwAAxY1p2xhdjHePFnN+2rXlNNhmFUj9
 pdEnHuD9CI14QiASReY0d0sX857q5RNLt4Xofjc2zuWAal8F1lqgwhisWEASlw5bxGpAp8FLo
 UU6p6wI3MxlzxHJ1/Ggb0MIbits3NQGGWSH68SX/36YEUjL7Lf6otb/L/FfEjQ3joKg8k=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

An error in sch5627_update_device() could cause sch5627_read()
to fail even if the error did not affect the target sensor type.
Split sch5627_update_device() to prevent that.

Tested on a Fujitsu Esprimo P720.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch5627.c | 102 +++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 023376082ee6..9735f3a81cbb 100644
=2D-- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -73,66 +73,96 @@ struct sch5627_data {

 	struct mutex update_lock;
 	unsigned long last_battery;	/* In jiffies */
-	char valid;			/* !=3D0 if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	char temp_valid;		/* !=3D0 if following fields are valid */
+	char fan_valid;
+	char in_valid;
+	unsigned long temp_last_updated;	/* In jiffies */
+	unsigned long fan_last_updated;
+	unsigned long in_last_updated;
 	u16 temp[SCH5627_NO_TEMPS];
 	u16 fan[SCH5627_NO_FANS];
 	u16 in[SCH5627_NO_IN];
 };

-static struct sch5627_data *sch5627_update_device(struct device *dev)
+static int sch5627_update_temp(struct sch5627_data *data)
 {
-	struct sch5627_data *data =3D dev_get_drvdata(dev);
-	struct sch5627_data *ret =3D data;
+	int ret =3D 0;
 	int i, val;

 	mutex_lock(&data->update_lock);

-	/* Trigger a Vbat voltage measurement every 5 minutes */
-	if (time_after(jiffies, data->last_battery + 300 * HZ)) {
-		sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL,
-					  data->control | 0x10);
-		data->last_battery =3D jiffies;
-	}
-
 	/* Cache the values for 1 second */
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after(jiffies, data->temp_last_updated + HZ) || !data->temp_val=
id) {
 		for (i =3D 0; i < SCH5627_NO_TEMPS; i++) {
-			val =3D sch56xx_read_virtual_reg12(data->addr,
-				SCH5627_REG_TEMP_MSB[i],
-				SCH5627_REG_TEMP_LSN[i],
-				SCH5627_REG_TEMP_HIGH_NIBBLE[i]);
+			val =3D sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_TEMP_MSB[i]=
,
+							 SCH5627_REG_TEMP_LSN[i],
+							 SCH5627_REG_TEMP_HIGH_NIBBLE[i]);
 			if (unlikely(val < 0)) {
-				ret =3D ERR_PTR(val);
+				ret =3D val;
 				goto abort;
 			}
 			data->temp[i] =3D val;
 		}
+		data->temp_last_updated =3D jiffies;
+		data->temp_valid =3D 1;
+	}
+abort:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static int sch5627_update_fan(struct sch5627_data *data)
+{
+	int ret =3D 0;
+	int i, val;

+	mutex_lock(&data->update_lock);
+
+	/* Cache the values for 1 second */
+	if (time_after(jiffies, data->fan_last_updated + HZ) || !data->fan_valid=
) {
 		for (i =3D 0; i < SCH5627_NO_FANS; i++) {
-			val =3D sch56xx_read_virtual_reg16(data->addr,
-							 SCH5627_REG_FAN[i]);
+			val =3D sch56xx_read_virtual_reg16(data->addr, SCH5627_REG_FAN[i]);
 			if (unlikely(val < 0)) {
-				ret =3D ERR_PTR(val);
+				ret =3D val;
 				goto abort;
 			}
 			data->fan[i] =3D val;
 		}
+		data->fan_last_updated =3D jiffies;
+		data->fan_valid =3D 1;
+	}
+abort:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static int sch5627_update_in(struct sch5627_data *data)
+{
+	int ret =3D 0;
+	int i, val;
+
+	mutex_lock(&data->update_lock);

+	/* Trigger a Vbat voltage measurement every 5 minutes */
+	if (time_after(jiffies, data->last_battery + 300 * HZ)) {
+		sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL, data->control |=
 0x10);
+		data->last_battery =3D jiffies;
+	}
+
+	/* Cache the values for 1 second */
+	if (time_after(jiffies, data->in_last_updated + HZ) || !data->in_valid) =
{
 		for (i =3D 0; i < SCH5627_NO_IN; i++) {
-			val =3D sch56xx_read_virtual_reg12(data->addr,
-				SCH5627_REG_IN_MSB[i],
-				SCH5627_REG_IN_LSN[i],
-				SCH5627_REG_IN_HIGH_NIBBLE[i]);
+			val =3D sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_IN_MSB[i],
+							 SCH5627_REG_IN_LSN[i],
+							 SCH5627_REG_IN_HIGH_NIBBLE[i]);
 			if (unlikely(val < 0)) {
-				ret =3D ERR_PTR(val);
+				ret =3D val;
 				goto abort;
 			}
 			data->in[i] =3D val;
 		}
-
-		data->last_updated =3D jiffies;
-		data->valid =3D 1;
+		data->in_last_updated =3D jiffies;
+		data->in_valid =3D 1;
 	}
 abort:
 	mutex_unlock(&data->update_lock);
@@ -200,14 +230,14 @@ static umode_t sch5627_is_visible(const void *drvdat=
a, enum hwmon_sensor_types t
 static int sch5627_read(struct device *dev, enum hwmon_sensor_types type,=
 u32 attr, int channel,
 			long *val)
 {
-	struct sch5627_data *data =3D sch5627_update_device(dev);
+	struct sch5627_data *data =3D dev_get_drvdata(dev);
 	int ret;

-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
 	switch (type) {
 	case hwmon_temp:
+		ret =3D sch5627_update_temp(data);
+		if (ret < 0)
+			return ret;
 		switch (attr) {
 		case hwmon_temp_input:
 			*val =3D reg_to_temp(data->temp[channel]);
@@ -226,6 +256,9 @@ static int sch5627_read(struct device *dev, enum hwmon=
_sensor_types type, u32 at
 		}
 		break;
 	case hwmon_fan:
+		ret =3D sch5627_update_fan(data);
+		if (ret < 0)
+			return ret;
 		switch (attr) {
 		case hwmon_fan_input:
 			ret =3D reg_to_rpm(data->fan[channel]);
@@ -247,6 +280,9 @@ static int sch5627_read(struct device *dev, enum hwmon=
_sensor_types type, u32 at
 		}
 		break;
 	case hwmon_in:
+		ret =3D sch5627_update_in(data);
+		if (ret < 0)
+			return ret;
 		switch (attr) {
 		case hwmon_in_input:
 			*val =3D DIV_ROUND_CLOSEST(data->in[channel] * SCH5627_REG_IN_FACTOR[c=
hannel],
=2D-
2.20.1

