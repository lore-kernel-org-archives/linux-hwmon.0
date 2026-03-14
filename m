Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8E3043DE;
	Sat, 14 Mar 2026 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510818; cv=none; b=K7HU+E5tpbpS8tpRDRVQt+lpplLrh9NGFq8JXvuqsYx94feoheSmYnhDZDeG3H6uX+Z0IKvZYCTQFdUKSG+brC6TTIsufhn98ZqNL//FSgygIIAu6m72y3dInOS0rF/5gHHgceyhaHoSTtHJDfDuK2I/kFHNWtwZoTQdamGB8Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510818; c=relaxed/simple;
	bh=hX8yCnYWnHj0i6qWj2AAinoE9jeXb6HnLZTNJmXhByk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWhuslSKgU1x27gf8hSr88jBkIOC4E+XCNj81fhuXj2DB7OWkBx38TmqQlXzhNW26zkCq8TenLF5RUUSeOZ2hrkX+njuC6uJhczv+GTMnlx3GTvzJ9nQ9aMRlpa4KeyohNhYYFe2TKIU6QfvZuKZHnNI9nElOTDjsZFtW+g03Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CwfCEJjl; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CwfCEJjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510788; x=1774115588; i=w_armin@gmx.de;
	bh=tU5WSuU6lQeUEGa2DbWvnOAy24Q+kkPjDW6mof+dCxw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CwfCEJjlTRrpZo3M8O6CwtR6IpKqTR+L7qxGwXeMc0YA3UD9EqeqHArE6TrtfwYk
	 0Q1bKwKaKOphrHZGtjyFDrTi9Phck9F3Y51gkdNmqtEYM1cfiu8MAZOWXppqY7H9M
	 3+dw/HYutUDwJSQFkq3NzyXYIf1g9z4QtjnvuXvSCs7FexN0mxxR59a4AQr54ZaDt
	 1o7hEPfcXdEOfGS+/WLJ4RMj37uxX/tPg8sKroJrPxkkw9Ie9nzAiDcahlayrf9tE
	 aTbhnlaNSAkc/0tEH9J3C851bSCwEhKcumsgdlBSv+aei8jnnR+8qxx81oRfiMbqe
	 RETHiYUwfT/4GHyFZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1wKFZo33t6-00LjaM; Sat, 14
 Mar 2026 18:53:08 +0100
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
Subject: [PATCH v3 4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:44 +0100
Message-Id: <20260314175249.16040-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6migSiWGo3v9rlydFT0S7gnCl6ouULgpH/5UrbeIpZlFxtSNoN4
 p0gZB94uWZ6nZ/jXba3yotBlJZCsj59kiDKk4dC0xxw0trUbfVZjoQ2usZblXaQRUS+nTKX
 iSSoHi2F+jju2qLgBuBnVACOnGLmGR8TtQwM/5j/JY7GaCg65SF4YuMk7VF45NwW9WLXHQN
 FA6J/338eyLUlQY81CKYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OHwSTWwKvTw=;wvMM0D1vi8JKrYPYb+yXXRJhQxD
 +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
 8PDIR4V8Ay9smiCp2hgR6oxpogLg80OEQ==

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

