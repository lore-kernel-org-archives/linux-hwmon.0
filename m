Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377B39FCB1;
	Wed, 10 Jun 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123710; cv=none; b=pHCPNJ9s683flQ3LAoqDP3nPaP/hZEZn3ajhAcVRRB/c9Dbaluej1ftT2e5s4koJPH3EmYUZJsIok4YkokgcOIhLMLsa1clNYuUNhjjpXzVoNeImH8n5IuJmAAt6mu3ZdTj2juj39CTiFpQF0nPVi2BsxyTiU6s/wAyOJ0P4md4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123710; c=relaxed/simple;
	bh=N/XpJanW6kdMhy90J3p0xWRi74pum/5mkXVP+XR0JoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ht1kAhkD4a411jq1r4Y56CeOqGIxuMXImeXUjDfESzTn94U2lTK3QeZbCU3S74GnIPro4g60H1O6wNg25hqGQPtKZtn3WJxXMizzViz2QO8RT8o3etiNt5rXacBQmgj8/UKXNEAoi5NJRcMGA4pTQqAx3l2DTjzwTPw69BGsjQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k5hlu2n4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k5hlu2n4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123706; x=1781728506; i=w_armin@gmx.de;
	bh=SyjF3q6uimCcjuVZt4NVxbsdRhXpVdXmBYAAcc/YDXE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k5hlu2n4/ebXnqp5CXhywp1StZWfjyaS58UzR6h2WMuPsPKuG9a+5bQhBn9xkeoG
	 6sd9+SJzYDYmPh+7MEJHp+5A4jbV9Pnu4HOgIsOQGVxKwyWEcdAAdxo7pnG3TjuaX
	 6mqbv0Fc+tdF0aBQZ5dF5/VGw84hrR8s8u8NGgbkYgUwTzECUe66kB0IV1VOQ+SgB
	 axLwHOHULKlwEw7b5+0NPNnkGEuLI8rgej4uMtLC5lQ4NA1CEGrAGDyyu0itYkmRa
	 iqntV4BYgZMXPwxwAa7QqPRibTAXOFV+CSw34oi6BxqCQr8NXFIdBTwKVi0Yv4XNU
	 bo5fne5eeaOnO57rhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1xAcGm3qSH-00pXlq; Wed, 10
 Jun 2026 22:35:06 +0200
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
Subject: [PATCH v6 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:46 +0200
Message-Id: <20260610203453.816254-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:pwiiqwwyVG00F8midS/o9yUbGtXe1N5stxucXY/3m0aNtMujoAg
 veoEFEeq85P+ynPR3lsjdXvtoafqlLGunWkPdZmcyvD/x0BV9gd6zIZKQhsu+IIWvwJrncx
 xXtRA0nwFExuz2f4lutPFcUJ+7b3SyCaC70hIqG13QIeJyIFFYI0kcWu2AaYQ0AU3Uu0mD5
 nXQnHLrkNss/271MPTAFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:964Ibzu6rpg=;miFGJYOGyVzGaN9OgEOBjy/9EYD
 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
 q2GxpVDRI=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the device state.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-privacy.c | 77 +++++++++-----------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platfo=
rm/x86/dell/dell-wmi-privacy.c
index ed099a431ea4..f9d275b2f900 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -9,11 +9,14 @@
=20
 #include <linux/acpi.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/list.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/types.h>
 #include <linux/wmi.h>
=20
 #include "dell-wmi-privacy.h"
@@ -25,6 +28,26 @@
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
@@ -185,60 +208,28 @@ static struct attribute *privacy_attrs[] =3D {
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
+	ret =3D wmidev_query_block(wdev, 0, &buffer, sizeof(struct device_state)=
);
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
-		ret =3D -EINVAL;
-		goto obj_free;
-	}
-	buffer =3D (u32 *)obj_present->buffer.pointer;
-	priv->features_present =3D buffer[0];
-	priv->last_status =3D buffer[1];
+	struct device_state *state __free(kfree) =3D buffer.data;
=20
-obj_free:
-	kfree(obj_present);
-	return ret;
+	priv->features_present =3D le32_to_cpu(state->devices_supported);
+	priv->last_status =3D le32_to_cpu(state->current_state);
+
+	return 0;
 }
=20
 static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
=2D-=20
2.39.5

