Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0942A80;
	Sun,  8 Mar 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929537; cv=none; b=oi/0F8C1h2Jn9pO8zB4TK7QkQ2n4kYEp466vVcRcCHDTqRCimazsB1r783RS5AA58D5wtIQw4cmZI7hNhbbSVIqMc9gGFT3z2Ib90K5RGfOwPtnVHaVvPLUjZ/rUfvHIBNqiRcmrBHjDA7gshr8ECQBrZgp5ujt186S27YJSDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929537; c=relaxed/simple;
	bh=hX8yCnYWnHj0i6qWj2AAinoE9jeXb6HnLZTNJmXhByk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XPYOdX4pfMd2Jy3uF16At3y4wKm9IOI5RdnBdoLTOK9g4cycgbU1JXDfxSo8XHDPLzA+lQdRd5Le6B4hlHvelqVV5m8bG0w4z5Cl5hbLt8q3+gEsf8mMIWQ9wf2UQ4cheMAax3DRVi7SqhmBe6RBMeknp3gOnDFsAOHXSvIyCYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YYZiYqRx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YYZiYqRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929534; x=1773534334; i=w_armin@gmx.de;
	bh=tU5WSuU6lQeUEGa2DbWvnOAy24Q+kkPjDW6mof+dCxw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YYZiYqRxxFVAwnM+1m0fR9/2xwEbT8Gs9mAy89n7pBFGoHPWubGr8unbb3RqvWO5
	 /qwMr0S5U0y3iBCWcmd+g0rcV628MjDhTBfLHVFMco7wi8zKLBSy68dDp4NH5UGVY
	 JFaP+SvmUt0hauIzycPAFu2dLhQvIaj3MrnKvZ300L8U4Ho5szkAfniwJg8YUO7YC
	 wKcUJFm4Ub3V2TLn3mz5oqx2dzVPf4oCK7b68XHz+0DW6auil2nTbi1yEJfaXbPCu
	 BZtL3J6MCrHFb5VSMMWC516z7+mh9I9rahs2SGEosPxo1VZSia407+VFJY+ZBUXF4
	 IUEw8Oh/2tZkgbKRew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1vvVZm3LjH-001xvP; Sun, 08
 Mar 2026 01:25:33 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:17 +0100
Message-Id: <20260308002522.4185-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308002522.4185-1-W_Armin@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ms6Yg9w6Ojdm35wOu2fUDSGd3r//2BPqw/3Mq80Ycatp8XE4yZY
 Ozf7LduPlfA6l+l6Y6xAFo4Pfq7suwvD+Mpsp5CZif/0uUrH70XOH7ArG+KpfbVcQ5SVpEW
 73CeRyD3DEK1SRGaL+tumPmH0wX4Vd0ZFJKxPC/u1u9WLdE3Wn74BMr79uu9/pv0lbxeYeM
 1As4lW0NQ54NZQyiAK9BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q0SRLXie/BM=;bo5CCL+aRO764bJ14CBt2xP1djo
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the event data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-base.c | 68 ++++++++++++-----------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index 4eefbade2f5e..4a7ab9fb3f81 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -13,6 +13,7 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/compiler_attributes.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -408,7 +409,8 @@ static void dell_wmi_switch_event(struct input_dev **s=
ubdev,
 	input_sync(*subdev);
 }
=20
-static int dell_wmi_process_key(struct wmi_device *wdev, int type, int co=
de, u16 *buffer, int remaining)
+static int dell_wmi_process_key(struct wmi_device *wdev, int type, int co=
de, __le16 *buffer,
+				int remaining)
 {
 	struct dell_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
 	const struct key_entry *key;
@@ -440,15 +442,15 @@ static int dell_wmi_process_key(struct wmi_device *w=
dev, int type, int code, u16
 	} else if (type =3D=3D 0x0011 && code =3D=3D 0xe070 && remaining > 0) {
 		dell_wmi_switch_event(&priv->tabletswitch_dev,
 				      "Dell tablet mode switch",
-				      SW_TABLET_MODE, !buffer[0]);
+				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));
 		return 1;
 	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000c && remaining > 0) {
 		/* Eprivacy toggle, switch to "on" key entry for on events */
-		if (buffer[0] =3D=3D 2)
+		if (le16_to_cpu(buffer[0]) =3D=3D 2)
 			key++;
 		used =3D 1;
 	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000d && remaining > 0) {
-		value =3D (buffer[2] =3D=3D 2);
+		value =3D (le16_to_cpu(buffer[2]) =3D=3D 2);
 		used =3D 1;
 	}
=20
@@ -457,24 +459,17 @@ static int dell_wmi_process_key(struct wmi_device *w=
dev, int type, int code, u16
 	return used;
 }
=20
-static void dell_wmi_notify(struct wmi_device *wdev,
-			    union acpi_object *obj)
+static void dell_wmi_notify(struct wmi_device *wdev, const struct wmi_buf=
fer *buffer)
 {
 	struct dell_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
-	u16 *buffer_entry, *buffer_end;
-	acpi_size buffer_size;
+	__le16 *buffer_entry, *buffer_end;
+	size_t buffer_size;
 	int len, i;
=20
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		pr_warn("bad response type %x\n", obj->type);
-		return;
-	}
+	pr_debug("Received WMI event (%*ph)\n", (int)buffer->length, buffer->dat=
a);
=20
-	pr_debug("Received WMI event (%*ph)\n",
-		obj->buffer.length, obj->buffer.pointer);
-
-	buffer_entry =3D (u16 *)obj->buffer.pointer;
-	buffer_size =3D obj->buffer.length/2;
+	buffer_entry =3D buffer->data;
+	buffer_size =3D buffer->length / 2;
 	buffer_end =3D buffer_entry + buffer_size;
=20
 	/*
@@ -490,12 +485,12 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 	 * one event on devices with WMI interface version 0.
 	 */
 	if (priv->interface_version =3D=3D 0 && buffer_entry < buffer_end)
-		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
-			buffer_end =3D buffer_entry + buffer_entry[0] + 1;
+		if (buffer_end > buffer_entry + le16_to_cpu(buffer_entry[0]) + 1)
+			buffer_end =3D buffer_entry + le16_to_cpu(buffer_entry[0]) + 1;
=20
 	while (buffer_entry < buffer_end) {
=20
-		len =3D buffer_entry[0];
+		len =3D le16_to_cpu(buffer_entry[0]);
 		if (len =3D=3D 0)
 			break;
=20
@@ -508,11 +503,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
=20
 		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
=20
-		switch (buffer_entry[1]) {
+		switch (le16_to_cpu(buffer_entry[1])) {
 		case 0x0000: /* One key pressed or event occurred */
 			if (len > 2)
-				dell_wmi_process_key(wdev, buffer_entry[1],
-						     buffer_entry[2],
+				dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
+						     le16_to_cpu(buffer_entry[2]),
 						     buffer_entry + 3,
 						     len - 3);
 			/* Extended data is currently ignored */
@@ -520,22 +515,29 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 		case 0x0010: /* Sequence of keys pressed */
 		case 0x0011: /* Sequence of events occurred */
 			for (i =3D 2; i < len; ++i)
-				i +=3D dell_wmi_process_key(wdev, buffer_entry[1],
-							  buffer_entry[i],
+				i +=3D dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
+							  le16_to_cpu(buffer_entry[i]),
 							  buffer_entry + i,
 							  len - i - 1);
 			break;
 		case 0x0012:
-			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_en=
try[3],
-								    buffer_entry[4]))
-				/* dell_privacy_process_event has handled the event */;
-			else if (len > 2)
-				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2],
+			if (len > 4) {
+				if (dell_privacy_process_event(le16_to_cpu(buffer_entry[1]),
+							       le16_to_cpu(buffer_entry[3]),
+							       le16_to_cpu(buffer_entry[4])))
+					break;
+			}
+
+			/* dell_privacy_process_event has not handled the event */
+
+			if (len > 2)
+				dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
+						     le16_to_cpu(buffer_entry[2]),
 						     buffer_entry + 3, len - 3);
+
 			break;
 		default: /* Unknown event */
-			pr_info("Unknown WMI event type 0x%x\n",
-				(int)buffer_entry[1]);
+			pr_info("Unknown WMI event type 0x%x\n", le16_to_cpu(buffer_entry[1]))=
;
 			break;
 		}
=20
@@ -821,7 +823,7 @@ static struct wmi_driver dell_wmi_driver =3D {
 	.id_table =3D dell_wmi_id_table,
 	.probe =3D dell_wmi_probe,
 	.remove =3D dell_wmi_remove,
-	.notify =3D dell_wmi_notify,
+	.notify_new =3D dell_wmi_notify,
 };
=20
 static int __init dell_wmi_init(void)
=2D-=20
2.39.5

