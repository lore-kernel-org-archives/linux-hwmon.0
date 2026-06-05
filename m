Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C03B0AE3;
	Fri,  5 Jun 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683304; cv=none; b=MeFhcQMYpkHfBJ7LFEWA505GZbSKAeit1j1KHjXYDjqKTrNXy2BkOXXrFbyfkn2CamfbdJRmi3NYvfi4NTl9FlbU+/uC9aCrXf/aoAJ5iqWqQHznGJooqBCSCXKImpJ4F86j/7K6F97Hs484nIepxNbGeRYD+8+S7cpgkuElK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683304; c=relaxed/simple;
	bh=gnbU5Ilb+yduUOyOT2fsPrx/iMgmPn7saMoQHwrSEeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aE/c1s5MDdpwoEztbAu95ZI+KIyZuh3mzVGKm2YCpBfNUgy0+h62vq8mXfKQpn88IXNFR6GdIH29pbHNTfaKxxEhz3jTRKXwBZeiQnT8qc1aNBAayKgcz+vGYpSIaEdeCPejtCYUdaywMLmSYaTyvp9+cZ4IJHV+llV53hEHSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=iBM4OyLx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="iBM4OyLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683281; x=1781288081; i=w_armin@gmx.de;
	bh=N7rpZGky13GHZDyEkDi0LgjTZgpTVhYyiqjgI3mJIMY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iBM4OyLxIYmQM8d17zB8sb8jNES8ZzviffRE0ZhspUswEj8vGoV9lsXE+OpkJe0J
	 Ri5dPQfQVVGYJbmwAa5CoXVaas3Uoc+xwhE+ScVeq4fcCTH5KgbyYu8o/i6QdoQyN
	 3Hyg29mbZCTYq1tsGy9rRWK4WWWfQKmXVeE1UTNoDGUlaOb2kDa5mUoV3u6Y/gtm0
	 J5tIaQlS4Gi43IK8p6nw56nkiOT88540s3wG6pU5APAivAlk9qfabOqASz68e5l3V
	 mxFLHdwlM8sg8lpJ4vSqwSGVZlvLCf/ZAG7A73wajNTTz7nY/Y50UoMcepCoUT++G
	 0Q46xYViq8xtV2BEUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1whECs3d3m-00PkLT; Fri, 05
 Jun 2026 20:14:40 +0200
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
Subject: [PATCH v4 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:26 +0200
Message-Id: <20260605181433.188847-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:IqZH6KjwlpqYSGdy6ZXnMutDH9EtKSyfEJDEeQiJfMOAtEdBxOG
 cnCHXohiOxHsg/Vq6rZG2w8RBpz/8kVOjQQ1215nUAqifSrdrB1GvDdBCTJtBW2Wbk9Ytb6
 ZJDirnDak8HeToLTEyekHYw5nbn+qiJF4WEskVSlvusUoLPfVU5DW8ly5KjDrN7onbnJoVz
 MMP32FWUWzSym5Hen8dqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DiMB7VfLFgI=;rh7yRXXfoPbG6cfxuUCITILZmeF
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the device state.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-privacy.c | 77 +++++++++-----------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platfo=
rm/x86/dell/dell-wmi-privacy.c
index ed099a431ea4..7bc1bae3a196 100644
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
+	struct device_state *state __free(kfree) =3D NULL;
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
+	ret =3D wmidev_query_block(wdev, 0, &buffer, sizeof(*state));
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
+	state =3D buffer.data;
+	priv->features_present =3D le32_to_cpu(state->devices_supported);
+	priv->last_status =3D le32_to_cpu(state->current_state);
=20
-obj_free:
-	kfree(obj_present);
-	return ret;
+	return 0;
 }
=20
 static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
=2D-=20
2.39.5

