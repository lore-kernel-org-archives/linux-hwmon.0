Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149443CFF49;
	Fri,  5 Jun 2026 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693194; cv=none; b=Gf+IjaFT0fXWSg2pT+M1FKo9JvFX1PfVMJbwU/gCAZHRbJHpu9mMQJlt3zX2ZOa9buzeg0T6D7YlRypqhf3urii4y5+Rq7tfvburhUvZGUaWYcjJvAu0juIgsyEokKbKSmTWU6KAPbp6JY+7SPJc1XfPQTWzgCx0a01GOftkxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693194; c=relaxed/simple;
	bh=gnbU5Ilb+yduUOyOT2fsPrx/iMgmPn7saMoQHwrSEeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PnjXoQL4/U28ZSXnDBgY9Reid85NVGl9MRrazBzD1CmLenDJw8qZNrPqBVwyDuQ6W4ynzJuBOtBmKJDUIvBhAqWk5CC7WRFCIKX2H7MMrcRSXxG+w6F99FD3Q5JTsL8EvYZCk7iaE9eAl4WP4zYNEbinYPqWenjsCG2+Ozq7qac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TXbFUxik; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TXbFUxik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693184; x=1781297984; i=w_armin@gmx.de;
	bh=N7rpZGky13GHZDyEkDi0LgjTZgpTVhYyiqjgI3mJIMY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TXbFUxikSSE/VkXLM4MuaCNicygokRQmEEU3h4Y9RDrF2bDTuaWugyuL4fQ1kiRV
	 o6EXkwL23X0upTwnXM+8Ma76AH2yC39QHnVw6vWaZlGzg/OThGEMqhqMhxL2lPNtt
	 YiFZRBOMsd8QrtP6sN9BnCthVhSqwlWCXHeLJ5QMyasNnKso9REXRw6Dahozgkgpp
	 6CbMvs0cYfpOS6A2ZwXGy+BNj0n0p8kLU8FjEDCU6nnJc6HWGIne0qgsRtDsHM6Gi
	 r7+6QaCpgXXpV8D2mCf1hvq78vLwf4s9Z2oPwEz9SMsA8QtlWFoXyqrY/L/CSTSNQ
	 rlmriYEZGXJomCyz4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fn0-1xFxwO2vTE-015lNU; Fri, 05
 Jun 2026 22:59:44 +0200
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
Subject: [PATCH v5 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:30 +0200
Message-Id: <20260605205937.530897-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:JKwpRMgFTo929SzWTTPjzOO7TMF1sG3NwQGin/i3W1xeK2JlvRt
 finbay8yPhz1fcqwmbYJNbFCxrJwGng6gZs7rOZlrMnrX3AD+oNJpJAP0+LhmRMvIay28Tx
 BuRiVNoIz4KF9Jzq4T3D/wyrfmfE9pdXUbER++ua2WSTci0qHc7nlDs5yDyMjT0KtdOk69f
 tEsdph1sAucNi3hcFNl1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p7yfYvl+KvA=;wybd0l0oHli0OQ5ooj0F4/LWIyp
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

