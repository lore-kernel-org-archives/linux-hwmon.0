Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D23E7BC7
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140977; cv=none; b=FlPawcNIZLO5i/ZaQoUe8jGUrbCA6TqvhTWAG8y13Sic734iizLghYCjjLz+MLAm2Koi42YLjeAxwZm1B7DBmOVyXz7gve37qEqx9UkNMMIWoa7uajeNjPc5rxPf+Fix2sFNiYcB84S30XFKfDmkStGUSsGIffNM8R3raPm+8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140977; c=relaxed/simple;
	bh=XyMFeppzzeXq9kSD0cskeUQGJv/U8X0oVp+C4DmjupI=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=J7fBg1OE1WxlNwjlSvSEJBX5llN7SayVFnU2ErVmLGMLQhXlZF7MDJsEcRIzrBqZXsu46xjd5GVoCsMS3XPPIC9Yl8qEgfP33bLnKLWhoF9hW+mP5GaUaLyRVu7yLzv+J6n0/iyeecuVX/NA8IxfNVbllhK6fLV6o+HfC5qBpsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=y/n1YTef; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="y/n1YTef"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 0361F181F3331
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 17:36:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789140973;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=XyMFeppzzeXq9kSD0cskeUQGJv/U8X0oVp+C4DmjupI=;
	b=y/n1YTef+p7URbijKZhghJsXGRQLYrxJoCJC76GxsliX+H7qjzU+ocDT/Jmg7osW
	Tf/rjBz/ly8WL2uk4ugcBD5RuCPquHKquDVNNef0ZNB9WT6zkQ/9u7//wlzaXs6Gzvr
	xBRuzqf5xJtOl9m/wMy6VlDHRMeXPq2c4AMqeWH+6bUsrxtYGCLcIuVjbeoYnSmBvXN
	SUuPjmZ/FN2VV2/LVUiMQxRVezTttJuaD/7sjrMVVCBU1m2PHct0bMB/A4OFr1sFl+S
	zg6AnvjjWNo6MQQKPrzJq+VMPEiRINQCEp9u7Zm3Iop2EpLN0yR+qGdzki0in/rk5wK
	WQxAABzeDA==
Date: Fri, 11 Sep 2026 17:36:13 +0200 (CEST)
From: marco.rodolfi@tuta.io
To: Linux Hwmon <linux-hwmon@vger.kernel.org>
Message-ID: <P1G6-or--F-9@tuta.io>
Subject: [PATCH] arctic_fan_controller: Add a way to set a default value
 state on kernel bootup
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 0163f6a5f9f5e848d73c81ce5fcf742ebdce5d09ec4a6e1e0c86da1a30d302df15f5fd9ef5f65e49aba77d8913841fe1f28c355371ed1bac58d58a6370859b24fd:TurnOnPrivacy!:tutamail

This allows to quickly set the connected fan(s) speed on bootup to a=C2=A0
sensible value, rather than the randomly initialized values as the=C2=A0
default behavior was.

Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>
---
arctic_fan_controller.c | 34 ++++++++++++++++++++++++++++------
1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_f=
an_controller.c
index 75cc78d..00ca803 100644
--- a/drivers/hwmon/arctic_fan_controller.c
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -17,6 +17,7 @@
#include <linux/jiffies.h>
#include <linux/minmax.h>
#include <linux/module.h>
+#include <linux/moduleparam.h>
#include <linux/spinlock.h>
#include <linux/string.h>
#include <linux/unaligned.h>
@@ -36,6 +37,14 @@
=C2=A0 */
#define ARCTIC_ACK_TIMEOUT_MS=09=091000
=C2=A0
+static int all_fan_default =3D 100;
+module_param(all_fan_default, int, 0);
+MODULE_PARM_DESC(all_fan_default, "This parameter controls the default val=
ue that the fan(s) will have once the module is loaded. The default is 100/=
255 (which correspond to 50%).");
+
+static int fanx_default[ARCTIC_NUM_FANS] =3D {-1, -1, -1, -1, -1, -1, -1, =
-1, -1, -1};
+module_param_array(fanx_default, int, NULL, 0);
+MODULE_PARM_DESC(fanx_default, "This parameter controls the default value =
that each individual fan will have once the module is loaded. This paramete=
r takes precedence over the global default. If you don't want to set a defa=
ult speed for a specific fan, specify -1 in the array. The default is -1 fo=
r all fans in the array (so use the global default for all of them).");
+
struct arctic_fan_data {
struct hid_device *hdev;
struct device *hwmon_dev;=09/* stored for explicit unregister in remove() *=
/
@@ -254,16 +263,20 @@ static int arctic_fan_reset_resume(struct hid_device =
*hdev)
{
struct arctic_fan_data *priv =3D hid_get_drvdata(hdev);
unsigned long flags;
+=09int i;
=C2=A0
/*
* The device resets its PWM channels to hardware defaults on power
-=09 * loss during suspend. Clear the cached duty values so they reflect
-=09 * the unknown hardware state, consistent with probe-time behaviour
-=09 * (the device has no GET_REPORT support). Hold in_report_lock so
-=09 * this does not race with a concurrent pwm read or write callback.
+=09 * loss during suspend. Set the requested default state again to
+=09 * reconfigure the hardware correctly. Hold in_report_lock so this
+=09 * does not race with a concurrent pwm read or write callback.
*/
spin_lock_irqsave(&priv->in_report_lock, flags);
-=09memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
+=09for (i =3D 0; i < ARCTIC_NUM_FANS; i++) {
+=09=09int speed_selected =3D fanx_default[i] =3D=3D -1 ? all_fan_default :=
 fanx_default[i];
+
+=09=09arctic_fan_write(&hdev->dev, hwmon_pwm, hwmon_pwm_input, i, speed_se=
lected);
+=09}
spin_unlock_irqrestore(&priv->in_report_lock, flags);
return 0;
}
@@ -272,7 +285,7 @@ static int arctic_fan_probe(struct hid_device *hdev,
=C2=A0=C2=A0=C2=A0 const struct hid_device_id *id)
{
struct arctic_fan_data *priv;
-=09int ret;
+=09int ret, i;
=C2=A0
if (!hid_is_usb(hdev))
return -ENODEV;
@@ -317,6 +331,17 @@ static int arctic_fan_probe(struct hid_device *hdev,
priv->hwmon_dev =3D hwmon_device_register_with_info(&hdev->dev, "arctic_fan=
",
=C2=A0 priv, &arctic_fan_chip_info,
=C2=A0 NULL);
+=09/*
+=09 * Check which fan default value to use, chosen between the array of fa=
n(s)
+=09 * values or the default fans value (first takes precedence) and write =
the
+=09 * corresponding value to the hardware.
+=09 */
+=09for (i =3D 0; i < ARCTIC_NUM_FANS; i++) {
+=09=09int speed_selected =3D fanx_default[i] =3D=3D -1 ? all_fan_default :=
 fanx_default[i];
+
+=09=09arctic_fan_write(&hdev->dev, hwmon_pwm, hwmon_pwm_input, i, speed_se=
lected);
+=09}
+
if (IS_ERR(priv->hwmon_dev)) {
ret =3D PTR_ERR(priv->hwmon_dev);
goto out_close;

