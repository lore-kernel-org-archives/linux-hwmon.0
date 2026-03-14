Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E381FCF41;
	Sat, 14 Mar 2026 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510808; cv=none; b=mB/UPeo/cQTghNJbYPr4Yw78pGHLFBOXKOBRcOGPdWmKtZEDrhrbV+62v6lDk5zL/lS4yv+17l1trOMMlgqkQwK7Kx5SrHu9NM6z1qewczXXxvR+UPMoWAkMH30bzx2pceF/JtFzAGBY75LL1eL5KOkaUlarplMgxnKPQGg18qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510808; c=relaxed/simple;
	bh=4qQeuO95GLSeEuCW0l4UelYobqF6TLscPNjWun3HviI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCSEca4LzW0jLf8LjoXeHOQZyVC90cGrGWce2dCtdHMxfGTb4nmwzzAhsn9V8X7ap2DVtCzYJB29bb5WHVDmKXmDCPb9GbqP7qveKYQv26QNDgw6GPYyrW28fdEBdrLX3SrdLz9AUA+UaNF7gNMECpHCZlhkkh6t4mV7Ap08lco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pb6GncjW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pb6GncjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510784; x=1774115584; i=w_armin@gmx.de;
	bh=9IkgDUTGUrN88laQfkUAHjuJjQ2/fB5RAdk3lh9Co/I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pb6GncjWFwbDyDBHj3iXURbTfJ7Ry00WhsAN6Fp6CdcQ06+LBfhBrCVdzpo8domf
	 wYfwjR96J8c9Y5aDPiRFf0R9NcU8hX9l0N6VwUv/Ob1rJlHMtQ0cleyvbx7kslSRj
	 84pLpB2OW9feJetehKf9UejE2CHhJ7XC2joI6EZKzYHlcSep/tELl/2euHes+9ddp
	 zaiJGwX+yTXv1gzU5hjPeRxZi63eWQVhmnoKSK0YMV4uPm96nTIsIuJrDTZmaqnJ5
	 rP7bQk9r0J6heerDRW1H+Im88WA/7irtiuNtIJ5ObMD97e8kV/YENH8XACRFTfzxG
	 7AJ+I8Q1c5DeDm2xwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdvmO-1vRaek0Wrm-00a0jM; Sat, 14
 Mar 2026 18:53:04 +0100
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
Subject: [PATCH v3 2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:42 +0100
Message-Id: <20260314175249.16040-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:vB+Vl0o38j/Y0M7AeTwwzKFRKZpSPubNkSluVNr5wUmoFOFq26C
 3TzUfAmEg5IKgSQ7On98/vCOAGBzKgVxvaHGJj5MWLHXQZjqy1ckmhQW5pvp8/egdpPsSLb
 Ou6Wz8zzq2lEYxHq8OMot7qqjnc4l+yfHZj2RBNsly/TCiMGVJ2EVJIsTJRbqFRqnyeXTFh
 OT+JUwZigWzHVAO6XPfyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b1RegSRgHlk=;VZYa83uSaRO+Z4eFHVrIodOSR7f
 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
 u8gd2LJEUHKN3pIcOwK7bmGz8C+flQCXQ==

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

