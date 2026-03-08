Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBB395D82;
	Sun,  8 Mar 2026 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000162; cv=none; b=aTOrlupQ19iDJJ+Y/XuzWgB88ytYUSUcvArdGAf7U7uP6pUDgnPvud/6AmW/irp1tMUHeQNTyDPMOH1rvdRkNlqz03lWeVKprqxw6jfjYJrXP0tT7fOGH8qSNYVLEl0BbVBMHiEasLiz+744ArhGE1jQPaYGdDw+FjNCEMH4NVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000162; c=relaxed/simple;
	bh=4qQeuO95GLSeEuCW0l4UelYobqF6TLscPNjWun3HviI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RTsQc0U8k9jLZtAG6eaOE3CBGJqv0TyXmuoY+9rtCL8UkJ6fwxOsL1w6yIzRETXWYH9haLdZli+kO6kPiepKdDNt9jvhA6u10aYK0rAud3P3uDWvnBRh9WOIGqxzNzrBXyMy3enCu6LNxwXsASrLT96gj1b5ylLGfICfJK1Ebso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rwPI4Qwn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rwPI4Qwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000147; x=1773604947; i=w_armin@gmx.de;
	bh=9IkgDUTGUrN88laQfkUAHjuJjQ2/fB5RAdk3lh9Co/I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rwPI4QwnMQoceMx8mUP3wi60izgBkMx7npeh/dbnC1vQUoRGsdYQE2hR+Rtaz8iQ
	 26CkJgskYKOBqDt9jzCL9d4kIE6lCU7HroFiORB6hBbhmu+DrzG5QTnet2hDI9zS6
	 4z1usf47/04NbOxSGSutUiqi8AU5THibwyq4Nk8YxsIuSrfssneRyYuLHzC3nNK/C
	 PaDMXtriGh1BytpokRfLweM7WA7sZPbrlLgAFYebB+FG6BBvOqFzEXwVPa5EIYYOR
	 1gqb3304kUYIqBfw9hZD78evJjfkf2/LU/AK/U4H/OAG6cHcJxQrciAs4NjuS03l3
	 ycjl/SEKx8bk5E+PXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1vtZ2c2eRR-007Ra7; Sun, 08
 Mar 2026 21:02:27 +0100
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
Subject: [PATCH v2 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:48 +0100
Message-Id: <20260308200155.118950-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:c2JIfTZqNXqJsz8B/5YgZ9U2zTLCJe1lcH/6CFw2jHaByafTuBl
 BxUxT4wFsgKVBc2MlpgHWxIpCgjSW0ikoQprNZKZa1H39wgAkxkoSiU2OIm1sWGBI0ESBe1
 Wn4c5sJn0hH1N2USIcQumcZootWYMs6H8OkoWpXHzMozs0yAhQPaMjNXD6y6t/15uPfFrRd
 IPXIxe2+eXBhktxNjLnEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9DgHSi5V6as=;FhR5VIjoZTewZ5Gc2snnh3lnTtx
 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

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

