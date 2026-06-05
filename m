Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11A3CCA1D;
	Fri,  5 Jun 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693193; cv=none; b=If0P/JFu4khP+pW42S52OnXqwf/3/3Osmxe9hr2vGVIcWFp2efO1pTWiFlP/SYjd9S6yjZMo7sKjswxGt1Ah+N/G/B500qvdz9Mr704n/qRh8eaYJZDAqAczS6grL6ZAHADIjSLOu3YltFMBU1ixCffTTVkrHhiAYqw2vYwFTSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693193; c=relaxed/simple;
	bh=EVBbej8Iq9BR0HeCBJejx9a8VyQIX0Fp7xI0QQIiHxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QFUgmSNZOQXTCi78Q4Oa+8+YA9St23HCUt/lj0lFr2Pjh0QQVP0QjSlwG0iOMyzmqwqOxtQT3dPkuuti9P3DKrqotrE1mMy3WUoU4wHQ0XS5b8cS8XY3hTdaynalofA4RIUWXTfnMSozw2zgeL0y/dj2IjwLWBO6pC7/2GJs0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mzaSRQcq; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mzaSRQcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693187; x=1781297987; i=w_armin@gmx.de;
	bh=5DFmaNPGwgIZpM5YAFvuQe/ki93+zYJZXvag9YoTJjY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mzaSRQcq5A6qa3UhNJ6ZvpFKz2H7rsqFjVbQThB+WUFfsMYl9d8apxv0zhQPqROh
	 2w8l6W3rc2CsSEa+Kib0lH5h3N703HmsPnSUYf3tBhLNniO5dxiqA5UWYxd+awynY
	 FPdKvc5WrgOwcrPVwsktLMlSWGbGojyg3R8L3/gcq6mYyGwZXhIhLyv8YBWFB4XK+
	 NQVZYIMkWLOOW5Q4BIfPWrnidSVN9CRn6v+tU1Bsf3sQF4PNPp9Vj2MYR6UwYWumL
	 InwST5sUd+ogDZnfbL6zlBwTBYIEyY2kYAT3hfwCyelfk/6brtf5A5841lN6+vERW
	 1aYoyd/c9Y2LhULPSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1x78Fn21VI-00fQIF; Fri, 05
 Jun 2026 22:59:47 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v5 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:32 +0200
Message-Id: <20260605205937.530897-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S6FdFOFdErpY+NEnVdeZPMriHfV5kWJsi39N69Z50Bf5M2U+ZZ8
 oy7mILLGKG9YqeqJR00ke1mmTQEQDBGZO0dFzrO1NdN3iz8DHOjpOQxVJdKmUblzoIrUGAR
 WP7CHC7Fx+3mixsd8IC16+25tDMes51YveRC4bStqm+6x39wDW4MQ65VUm8Z5mIcDeQpPT2
 CQEsYkQubCyyaG9ZMSySQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:44Pn1/ajoL0=;CidzXLITzDRlCWG3IslbOQ0DfHL
 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
 f00FIrDxwVX0yEjKVErxf8irKyguhEMTjPw3hl7

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the event data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-base.c | 70 ++++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index 2a5804efd3ea..1070df065807 100644
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
@@ -414,7 +415,8 @@ static void dell_wmi_switch_event(struct input_dev **s=
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
@@ -446,15 +448,15 @@ static int dell_wmi_process_key(struct wmi_device *w=
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
@@ -463,24 +465,17 @@ static int dell_wmi_process_key(struct wmi_device *w=
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
@@ -496,12 +491,12 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
@@ -514,11 +509,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
@@ -526,22 +521,29 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
@@ -825,10 +827,10 @@ static struct wmi_driver dell_wmi_driver =3D {
 		.name =3D "dell-wmi",
 	},
 	.id_table =3D dell_wmi_id_table,
-	.min_event_size =3D sizeof(u16),
+	.min_event_size =3D sizeof(__le16),
 	.probe =3D dell_wmi_probe,
 	.remove =3D dell_wmi_remove,
-	.notify =3D dell_wmi_notify,
+	.notify_new =3D dell_wmi_notify,
 };
=20
 static int __init dell_wmi_init(void)
=2D-=20
2.39.5

