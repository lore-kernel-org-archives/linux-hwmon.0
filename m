Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DD227BB5;
	Sun,  8 Mar 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000156; cv=none; b=UQpfy3PnVLlGzR7JDr+TPVq2I/v02N8frvjQdDHXgZIOb2gqlAQruyRo7jw8jPYMJGzrnUinYGLRu/35iF1zqE5lXWvHPAlmyx3cuGEbGWEp4nQz4FN11jE40UakKVTg/DXMsn8Y6AZwUE9GrJHEBTrnZngmgvtmfLVvy+gxkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000156; c=relaxed/simple;
	bh=hX8yCnYWnHj0i6qWj2AAinoE9jeXb6HnLZTNJmXhByk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KtsoYjoJ5m6OlWK0k60wYbkETJ+VehIyu4UKDCpRXlhKg31515u9i79a4U2yTbCKQetXyg7XeakLvilfulKtqOmI9kIDfz3LFu/95biIICkwRfj96eeR0maLuK0H+5bc/1DeZaKGlzkx88/6NMQMrORX5Qdq88TDtxoz+abpdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=j0cHx36v; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="j0cHx36v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000152; x=1773604952; i=w_armin@gmx.de;
	bh=tU5WSuU6lQeUEGa2DbWvnOAy24Q+kkPjDW6mof+dCxw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=j0cHx36vNfgHTENP4kzu+hIKnPHkyNfvVFqzM473wW5ldXoBJ1Bb7/MmOmXQW4Qu
	 HaCkN2NDLp1UADQCsKC52dczjMSpkv70+Hz5jf1PnPSSLZbs6UGUOXu/3lt25ZW3s
	 s8g6CpcEJqBEJd9xSmVrtSY+uLtf7ZnGX7GlM8D2MCBwRqJMX90f+CQjtg9j7K6wk
	 7V5Nsj0/g2ydhmNWp6IJXcCRjTrhs0P5SZCpqZJWTfpXTi4cbvOBkrvIyWCVRRn2+
	 OpqsKUcDjtoBmhfNl8sm7RH0OPIjVDV/f7j2FT5wykbEZuDE0Au9OTJdEY8QK3zDx
	 IpSfmr65V1kPHVL64Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1wJ32G10xM-00WKeN; Sun, 08
 Mar 2026 21:02:32 +0100
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
Subject: [PATCH v2 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:50 +0100
Message-Id: <20260308200155.118950-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308200155.118950-1-W_Armin@gmx.de>
References: <20260308200155.118950-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iIXXICZdEHeNLjyAxSm3PuGNIIR2WHjZYttReVBdlu7Pqq8RGgF
 lAuA2hPOTDD3q0xeRQpY4XPSIMrfZLXMQKE9WguRAHA1acNomkTqpWNnGG0UCMsqz3xLcEH
 N+zf2RS91dipAN8QZMnJI659A1Qbuc1M6foSWvHt86Pmq9Z3NUoMb1hnFFwd/sZz2m1a9p6
 BLySFMt5DJ0SF+/wLnySQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YwndNc2of3g=;RWVcV+AJE9do+P50ndPWEqMpnVL
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

