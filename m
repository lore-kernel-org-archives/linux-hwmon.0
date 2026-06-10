Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1316548096D;
	Wed, 10 Jun 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123722; cv=none; b=EpW2Nnfv1j9PiuF6ijTgrE+M6LckRxN3py51tAuLkEvLH7XAR9q4KPA4nKbzfqvb2ryEQZmPS3qZTeMRzb0sfsf+QkXkkrTb3fOPRuY5f8AKL1ZqJD2edqRieTXObFA30ItIH8FZhphQXm9Vrq0AFNB8Re9MEtAEf2W4QAJyHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123722; c=relaxed/simple;
	bh=j0PO9IflLIIXC7A8kekh9PUEz5VGJBA2E902jRf6Ies=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=USHPUdGdCk+0+8LTppyox7Qds16Z3RwxhjL4iFVncGmUFve0oPioHJCZn9JAosYZb61/6SpIOmAvH2uOj5WQ5r/tbabCzy/FuoClmLLauUN1pIOm/XYGNo73oCeS6KpbjH2A46XW0jjwGPz8LJom/IyTqHQupsIqIX9SbGPeEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=R/4AG2/N; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="R/4AG2/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123711; x=1781728511; i=w_armin@gmx.de;
	bh=mIb0K5eiIj66Ex90JWnPJ/XCD8JwIiGtYbewjEqgh0A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R/4AG2/NsPvpXboJah6PioUQllUVlGBQfyIQUvNfX4X7hLRnFQQZ6GoF7zZ0D+Y7
	 6CBvkiFWoLA95eMi93Ldz78pg0UCzHTzZnyLSMNPr0rHB+W9NZr+UQcZ7tXuA9Apw
	 FrxR4eCp76fHyH7aFxkypNHF401SAzBdEs2lWzbWMmHpWeo4RKICovN+LKmdgPZTx
	 P+6apfCwfz0A0TAH1NcSlH0NFvmKiNDIhLZr7vrEuqIQbUrd/lL96R+WtO5k4lFNh
	 TuVmNi/SRpmLooxyvm//IESKjJSmaRRgJRNiMfsHqfw3fP1WiYJmfi7J9+NHpZ75X
	 08tuDu7O8x3Xx4Z+Dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1wr9PS34Dw-00VY7w; Wed, 10
 Jun 2026 22:35:11 +0200
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
Subject: [PATCH v6 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:48 +0200
Message-Id: <20260610203453.816254-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DY+l2w7ogwdNxG76UArET1Ri1zr40pGP4+dboJTueRO2qMu29aN
 /Khse+sSULnrwwFHq/gyOupSLU1v2VQ+GTZjY5qc31rao1oLBUxquWUBcQCdCL5FPxHm/Wa
 a9rQmm0QOxlGO0cH9OyjNFiIFH8mBWNeGx35Vt1xMkjACNed9YZZRf4+q0KJfPklCh9rRD3
 7IY+T1uGShFr4eMYeLW2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CZbl5+iqjr8=;GNW3kKZcyWwQCNzkXpffcCbNT0M
 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
 /O+spEf6Q45f2Ejs3g=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the event data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-base.c | 60 +++++++++++------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index 2a5804efd3ea..997383ba1846 100644
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
-
-	pr_debug("Received WMI event (%*ph)\n",
-		obj->buffer.length, obj->buffer.pointer);
+	pr_debug("Received WMI event (%*ph)\n", (int)buffer->length, buffer->dat=
a);
=20
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
@@ -526,22 +521,23 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
+			if ((len > 4) && dell_privacy_process_event(le16_to_cpu(buffer_entry[1=
]),
+								    le16_to_cpu(buffer_entry[3]),
+								    le16_to_cpu(buffer_entry[4])))
 				/* dell_privacy_process_event has handled the event */;
 			else if (len > 2)
-				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2],
+				dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
+						     le16_to_cpu(buffer_entry[2]),
 						     buffer_entry + 3, len - 3);
 			break;
 		default: /* Unknown event */
-			pr_info("Unknown WMI event type 0x%x\n",
-				(int)buffer_entry[1]);
+			pr_info("Unknown WMI event type 0x%x\n", le16_to_cpu(buffer_entry[1]))=
;
 			break;
 		}
=20
@@ -825,10 +821,10 @@ static struct wmi_driver dell_wmi_driver =3D {
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

