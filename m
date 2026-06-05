Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278939A06B;
	Fri,  5 Jun 2026 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683302; cv=none; b=jPTE3g3qqKoA8m2huO3NVk5eTfBNfSlPtiVI/bLvoOnXC5wj2fL84SoKUWUpZYrfRjlyK6Ug3OZaCcrEOAOmi0hvdXKQjaw/mxyZVHIKa2o1b//+YrbzZNtHyUxJMS09VTXkSOM4XCseaAVNpyRXuXcPGPtJvE6IU4SWnhqVpc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683302; c=relaxed/simple;
	bh=EVBbej8Iq9BR0HeCBJejx9a8VyQIX0Fp7xI0QQIiHxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIid7XI21/1shsXv2FEmJdHweIG/HbFQypu/5Ekl3blH1vmcYgiLn18uiJxED8Fp2zxtoXk2HHAmyXLq2A8sDlArRWk9ht1yXkJa3PP1TjKOXPCywNTMoHLc0vY2q7HEI8qIYhqDGVZh2z+oVw/4D6BSSD5Dito3/MstNLH7kmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=efDGRUPk; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="efDGRUPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683282; x=1781288082; i=w_armin@gmx.de;
	bh=5DFmaNPGwgIZpM5YAFvuQe/ki93+zYJZXvag9YoTJjY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=efDGRUPkQeN5C3iypoqTjH8TU3r5QzOGCkNptVOsxEFSH/gV7TjoEGFnpNqnQ+mw
	 WxExtpWEO3+vI4sYA6ctQpQldlVUTLcdGSNzDkUPBXqlWINTGpXPH0XMy6gDV+WXC
	 2PahPpGw1QoCia/CtHyp4UIuQuivcKRiNTNPdunBA4OCVhdTSUGyuEGUGxkjSHqmI
	 tGTFDywaMae6G33s2slHBl6jE8NCwvor2+QU0b2u2u0VFQZr2KO/eyZdNTAZrvkWN
	 pK0mpiXJf/RGyZTfQIN2YFztq3GsSWaE90mWkMvxShU9g46vTLJFi8mdsZMbkvOh6
	 Bgu1Ft/d9tOMMy3xWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1xQg1T2g9B-010B83; Fri, 05
 Jun 2026 20:14:42 +0200
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
Subject: [PATCH v4 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:28 +0200
Message-Id: <20260605181433.188847-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605181433.188847-1-W_Armin@gmx.de>
References: <20260605181433.188847-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BcI2CXY4wVpifrxg5CYQgWZ7NQGRsvUzQ4UEVb+ikiQkrsVO/WH
 6NzO4LtCNL36G2LAHMaE4XDbU4O/ma8XTAD04t5CSIvYwG+KvUYx+BfciMnKWdXr3tsDaXf
 MLVJ0NF/PhlglAogJ55m9sBDKSa3Gl0IfUrLwT4AvgCCF2AsTLk8LDmZ+zVyLj0Ny+uKCwm
 r6gNoBdaEdagnc8RSVL7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SHQNu05im9M=;ruB6Y7RzuTgITsMTQF/ouaxT/KF
 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
 RgVP7dAWuX15vt9IiMmyetI99JYhpiWhdU5hhXj

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

