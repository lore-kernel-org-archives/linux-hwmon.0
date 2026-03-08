Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7AB1DF73A;
	Sun,  8 Mar 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929548; cv=none; b=lAr4nY9l7q2voUo4te44T6medgI3RJPI/GPIkNUtLD2fryK04sMO+pBOtNKqiR2xyeSjgADzRhSHVel+cihcuGXr6gBG67SRyyvjM+BfUHgE1FB67Pp8Rpc6hwlUY8tsN0RPcbd8wv8LjhNv/DQUVW/czVyx9UaDdVzVj9/zjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929548; c=relaxed/simple;
	bh=adn3OUAB5U86bg/NTahLF+r6ztrkL0f+31fxu2dWfCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VfwpoFu/HW3GJLhIKcqRNhAYA1Wp+zt7sMQLqdAbWmuvn80AdISxSKQqvBUsQFcRnu/fZWrnra3hKXoQ4Nhywvl9+07MNjc/l7P9HsYfsxpoGkMz1qXVP+ahsGrDMT0e2+We+If3fkFj3a2xRh441oXhOODj18M2SvyvLTPI7N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bjISk1Sv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bjISk1Sv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929529; x=1773534329; i=w_armin@gmx.de;
	bh=Io0HSqt2VkFLGBxEHSKoN7vk9tMBmQLErL/85dz1VI0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bjISk1SvMbsMmElC4Uh5mNMe4duUdVXi3oUbHDkoClOkhPz8659JgwyrfTccTjPN
	 smJzJly9KzEw+fUUwT/uLp/gAo2606DlyKR8qjSC/tX/VPSn1v6kOU/uJrc1h6dsF
	 XWTqO/1RIvpLCTkOa2B6w3yR48+uhT1Jf/r1Wxh9bkVQwM4UUOgjUdAepSvKC+qEX
	 TK0DcbktS08gA3gtrkYNH6Nq0JkeNFA/gkwX3AQkeyhfkI7fRcHE8Io4g3Wg302ov
	 xlgKCcpSgm6blaMQ+qnsABObIhlpz4XrY/ukb6cQGGYiDbzbl6pPH1yTlZ3WMRJQE
	 JlXCTTym0dX1WGu4Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1vslU01TBZ-003bqv; Sun, 08
 Mar 2026 01:25:29 +0100
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
Subject: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:14 +0100
Message-Id: <20260308002522.4185-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Ek1hu/T1dCYLL4AtlBPrvF30mJ7AxFkVW1/MCrtGNuwrpfrd052
 FZtJ27q/GF9KjXvzP9vCkSBJ967viwQpHqCJErmFMf8OyPORl3B+Gp8t0PbKcW02WQ5pN/p
 B+VN227Qc8mSkXW4eCSmbL1PFaUaLd2F0wy0NRckcOX0b3H8Uh7ftbqu5gyz5wT+4vfSlcA
 MFHvu1fVFwk6oGO4U2J5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0geP3arwJmM=;Q63q1RuKiValTjvgSn/4m+Z4pqo
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the descriptor.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/dell/dell-wmi-descriptor.c   | 96 ++++++++++---------
 1 file changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pla=
tform/x86/dell/dell-wmi-descriptor.c
index c2a180202719..621502368895 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
@@ -7,7 +7,7 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
+#include <linux/compiler_attributes.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/wmi.h>
@@ -15,6 +15,24 @@
=20
 #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
=20
+/*
+ * Descriptor buffer is 128 byte long and contains:
+ *
+ *       Name             Offset  Length  Value
+ * Vendor Signature          0       4    "DELL"
+ * Object Signature          4       4    " WMI"
+ * WMI Interface Version     8       4    <version>
+ * WMI buffer length        12       4    <length>
+ * WMI hotfix number        16       4    <hotfix>
+ */
+struct descriptor {
+	__le32 vendor_signature;
+	__le32 object_signature;
+	__le32 interface_version;
+	__le32 buffer_length;
+	__le32 hotfix_number;
+} __packed;
+
 struct descriptor_priv {
 	struct list_head list;
 	u32 interface_version;
@@ -88,76 +106,60 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
 }
 EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
=20
-/*
- * Descriptor buffer is 128 byte long and contains:
- *
- *       Name             Offset  Length  Value
- * Vendor Signature          0       4    "DELL"
- * Object Signature          4       4    " WMI"
- * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    <length>
- * WMI hotfix number        16       4    <hotfix>
- */
-static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
-				     const void *context)
+static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const void =
*context)
 {
-	union acpi_object *obj =3D NULL;
 	struct descriptor_priv *priv;
-	u32 *buffer;
+	struct wmi_buffer buffer;
+	struct descriptor *desc;
 	int ret;
=20
-	obj =3D wmidev_block_query(wdev, 0);
-	if (!obj) {
-		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
-		ret =3D -EIO;
-		goto out;
-	}
+	ret =3D wmidev_query_block(wdev, 0, &buffer);
+	if (ret < 0)
+		return ret;
=20
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
+	if (buffer.length < sizeof(*desc)) {
+		dev_err(&wdev->dev,
+			"Dell descriptor buffer contains not enough data (%zu)\n",
+			buffer.length);
 		ret =3D -EINVAL;
 		descriptor_valid =3D ret;
 		goto out;
 	}
=20
-	/* Although it's not technically a failure, this would lead to
-	 * unexpected behavior
-	 */
-	if (obj->buffer.length !=3D 128) {
-		dev_err(&wdev->dev,
-			"Dell descriptor buffer has unexpected length (%d)\n",
-			obj->buffer.length);
-		ret =3D -EINVAL;
+	desc =3D buffer.data;
+
+	/* "DELL" */
+	if (le32_to_cpu(desc->vendor_signature) !=3D 0x4C4C4544) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signatur=
e (%u)\n",
+			le32_to_cpu(desc->vendor_signature));
+		ret =3D -ENOMSG;
 		descriptor_valid =3D ret;
 		goto out;
 	}
=20
-	buffer =3D (u32 *)obj->buffer.pointer;
-
-	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0) {
-		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph=
)\n",
-			buffer);
-		ret =3D -EINVAL;
+	/* " WMI" */
+	if (le32_to_cpu(desc->object_signature) !=3D 0x494D5720) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signatur=
e (%u)\n",
+			le32_to_cpu(desc->object_signature));
+		ret =3D -ENOMSG;
 		descriptor_valid =3D ret;
 		goto out;
 	}
 	descriptor_valid =3D 0;
=20
-	if (buffer[2] !=3D 0 && buffer[2] !=3D 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\=
n",
-			(unsigned long) buffer[2]);
-
-	priv =3D devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
-	GFP_KERNEL);
+	if (le32_to_cpu(desc->interface_version) > 2)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n=
",
+			 le32_to_cpu(desc->interface_version));
=20
+	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret =3D -ENOMEM;
 		goto out;
 	}
=20
-	priv->interface_version =3D buffer[2];
-	priv->size =3D buffer[3];
-	priv->hotfix =3D buffer[4];
+	priv->interface_version =3D le32_to_cpu(desc->interface_version);
+	priv->size =3D le32_to_cpu(desc->buffer_length);
+	priv->hotfix =3D le32_to_cpu(desc->hotfix_number);
 	ret =3D 0;
 	dev_set_drvdata(&wdev->dev, priv);
 	mutex_lock(&list_mutex);
@@ -170,7 +172,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device=
 *wdev,
 		(unsigned long) priv->hotfix);
=20
 out:
-	kfree(obj);
+	kfree(buffer.data);
 	return ret;
 }
=20
=2D-=20
2.39.5

