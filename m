Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3F1EEE6;
	Sun,  8 Mar 2026 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929536; cv=none; b=QLONCHJgGhMpt5AtFZBlFatvgAFOTxztkHSy5QIeGfGdEniCywIrs5cogd9LJOnAbTYkRG1s0AgBnArX/L2xtLT10gc8jVi1V/HI0zha4a1qCDuYbx9FKmZg4kP8PR3RFBucKBKvnNVzpMS2yGqFyoljalRII8rkyA2wsrfzmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929536; c=relaxed/simple;
	bh=4qQeuO95GLSeEuCW0l4UelYobqF6TLscPNjWun3HviI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGamxGcbF0NuyNwaSM5jjGalbjIG+V2fZ9RWRnp4oyxD8zJcZ27zKY8CbQJFXuMbsmgUfbbkP4mMHC6ScpwqbcMvgq8XcSeJsfLbgvfE4V4Z/RPv/AQ7j2i0DHDmj9GoBNxsMiP/yrYy8rqHAAvxPA6AlxffdPL8l0shpwWnEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=h3b9jxMM; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="h3b9jxMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929532; x=1773534332; i=w_armin@gmx.de;
	bh=9IkgDUTGUrN88laQfkUAHjuJjQ2/fB5RAdk3lh9Co/I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h3b9jxMMzQuxMoGbjZ/YNqT+0T0IC+bZ9Z162NDiY/uo8n7mR58aEabhYwgzoCPK
	 Xg57XJRM4oGDYUWOkXeP3ColBqJAR6fQqz6VaUZoeziX/gY3wgfLVI9RMArvL0riP
	 oZzgiSAh2qlYZaS93rRqsUKQMMcOH6U7GWm7oFVFuPX7UJPogHAL/+ocNszCVCop+
	 epqkWH8CVxv6hdLh7GRzSxZLHg/KqtIqbaCIaUz+0MHvYNER/Q9AiS29oCf0b1HOu
	 1Jg/tXivhFezeQCP0MRw0HCQo+SaNKWpHFo2lbOdUVoPXZlBbzYFqoUowF0c0UnAO
	 hBhAkJgtxmvIm5nMVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1vc3Rp057l-00usEV; Sun, 08
 Mar 2026 01:25:32 +0100
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
Subject: [PATCH 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:15 +0100
Message-Id: <20260308002522.4185-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Vfy+wIfyU/nI8K5KXwrLesE27167l5HRQjFvsw8+JPt9urP0o4D
 5Ix1eJ6VQG2DqGqkCX0E68iaBbzeB15zmIGvxAQd7MPuZ/R5QMCDeFni5p58HgN8ByOT5uE
 gt0QzmGcCtiOYpkkUpMKP0UmMPhUNTbxOt3/EU1UFCoqqXaGESFRjq7vWbmgLX2H9IyouEe
 RL+QGFzxDnZAHuKVFT7XA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jzvE7ITIoSg=;R85EIHhYW9KW7iF3VEaLVMyN+5h
 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
 RqqsCX+8yKoKpetg45ef

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the device state.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-privacy.c | 78 ++++++++++----------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platfo=
rm/x86/dell/dell-wmi-privacy.c
index ed099a431ea4..470273cc2fd2 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -9,6 +9,7 @@
=20
 #include <linux/acpi.h>
 #include <linux/bitops.h>
+#include <linux/compiler_attributes.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/list.h>
@@ -25,6 +26,26 @@
 #define DELL_PRIVACY_CAMERA_EVENT 0x2
 #define led_to_priv(c)       container_of(c, struct privacy_wmi_data, cde=
v)
=20
+/*
+ * Describes the Device State class exposed by BIOS which can be consumed=
 by
+ * various applications interested in knowing the Privacy feature capabil=
ities.
+ * class DeviceState
+ * {
+ *  [key, read] string InstanceName;
+ *  [read] boolean ReadOnly;
+ *
+ *  [WmiDataId(1), read] uint32 DevicesSupported;
+ *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
+ *
+ *  [WmiDataId(2), read] uint32 CurrentState;
+ *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacySc=
reen
+ * };
+ */
+struct device_state {
+	__le32 devices_supported;
+	__le32 current_state;
+} __packed;
+
 /*
  * The wmi_list is used to store the privacy_priv struct with mutex prote=
cting
  */
@@ -185,59 +206,36 @@ static struct attribute *privacy_attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(privacy);
=20
-/*
- * Describes the Device State class exposed by BIOS which can be consumed=
 by
- * various applications interested in knowing the Privacy feature capabil=
ities.
- * class DeviceState
- * {
- *  [key, read] string InstanceName;
- *  [read] boolean ReadOnly;
- *
- *  [WmiDataId(1), read] uint32 DevicesSupported;
- *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
- *
- *  [WmiDataId(2), read] uint32 CurrentState;
- *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacySc=
reen
- * };
- */
 static int get_current_status(struct wmi_device *wdev)
 {
 	struct privacy_wmi_data *priv =3D dev_get_drvdata(&wdev->dev);
-	union acpi_object *obj_present;
-	u32 *buffer;
-	int ret =3D 0;
+	struct device_state *state;
+	struct wmi_buffer buffer;
+	int ret;
=20
 	if (!priv) {
 		dev_err(&wdev->dev, "dell privacy priv is NULL\n");
 		return -EINVAL;
 	}
+
 	/* check privacy support features and device states */
-	obj_present =3D wmidev_block_query(wdev, 0);
-	if (!obj_present) {
-		dev_err(&wdev->dev, "failed to read Binary MOF\n");
-		return -EIO;
-	}
+	ret =3D wmidev_query_block(wdev, 0, &buffer);
+	if (ret < 0)
+		return ret;
=20
-	if (obj_present->type !=3D ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
-		ret =3D -EIO;
-		goto obj_free;
-	}
-	/*  Although it's not technically a failure, this would lead to
-	 *  unexpected behavior
-	 */
-	if (obj_present->buffer.length !=3D 8) {
-		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n"=
,
-				obj_present->buffer.length);
+	if (buffer.length < sizeof(*state)) {
+		dev_err(&wdev->dev, "Dell privacy buffer contains not enough data (%zu)=
!\n",
+			buffer.length);
 		ret =3D -EINVAL;
-		goto obj_free;
+		goto buffer_free;
 	}
-	buffer =3D (u32 *)obj_present->buffer.pointer;
-	priv->features_present =3D buffer[0];
-	priv->last_status =3D buffer[1];
=20
-obj_free:
-	kfree(obj_present);
+	state =3D buffer.data;
+	priv->features_present =3D le32_to_cpu(state->devices_supported);
+	priv->last_status =3D le32_to_cpu(state->current_state);
+
+buffer_free:
+	kfree(buffer.data);
 	return ret;
 }
=20
=2D-=20
2.39.5

