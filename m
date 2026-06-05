Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994A37C925;
	Fri,  5 Jun 2026 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683283; cv=none; b=jJZlG610zzE9sUYKZNAQ8dLTWANOZ40whHZ+A4Xe+NBSzEnWQNXvjfwACXFIydmsyA4VqpipZobwBqcX1OITwGdJydgFWVjB3X7XLSDGt8TTHobu8y3Iu+WhTmdeI0G8QjD2S8xKuPu2lPoyxbZ0V9AsGAOY5GGJd9U76NBvveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683283; c=relaxed/simple;
	bh=JNSYqRABJfUmWpUfWRdNbJwoSxSYtDQH38QJQl1v4MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEsnYO/aEzUZLBse47liq2UOhpjTYokDvQe28TX2pQoatuCi6bZXRkHKWa7gvmTNdV3xnWzxvGEh6BZ0YwI4pot4GEDLpUbOLtUgnrX95slgEMfffE4uOVz1/gbuPwhf8qOzOdHcYpkI0Rl/fmb8xUAN9d1dRHzsX7+MeMHl8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rQB7oFD0; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rQB7oFD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683280; x=1781288080; i=w_armin@gmx.de;
	bh=NYXACJwZaKeEq0yR7VQMig+LVTxXuXx+Zjx3J5uMor8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rQB7oFD0Ip035zplzydpKvOUYhtEmS1KkyX65a2U/t1G5R39ztbli63jDHYArVbH
	 Q0AMzfrz9+F8GHw1RxXD7UF5GDYrUOLQSd7Z0k++N6l0MUPXQ/40DYaRHCu3tJWpq
	 jT1cTkFJkY2P2eW0PVdjb9bBY+LTn1cbu/unRtZrJR+OmTBQ44qrLsZvUw/ZVHP5z
	 mpuFJhlvDrHjExHVwT1GTajRIWi7i0hhJ43VbdL1xoy3BXW5PfIKJGdItTpsNNlNr
	 uCvMe7DIvEyYw967FlpPlC2c4NNEZzo4YL9O0JGbEKoAm4TrF6YvFXX8VXola/hjU
	 LLMLJYPFApuNdxj+vQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1whmQl44dA-00O2eY; Fri, 05
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
Subject: [PATCH v4 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:25 +0200
Message-Id: <20260605181433.188847-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Pf5pISnempVqJQU1Gp3ABcicjnoysGFryqUbgt9akMxMAHDHnAa
 yNDE6BoWURPPeKt3cRqS4LhlxJsKHDbKGCDQOTovSW4TunFvnOcPpbhOeHiee1TWXZNtiro
 9f4WahftLuUQhYk8kUYNSWY36IdvrwOyjHM4X5HAc0zL0CfsSlHmkg2/BkRi3WAFGEHnN4k
 IaHpfbBE6T5R9c2aVtfnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Uvak/OMKSlE=;rUJokYyHYDv1lCQD5cpMh4YmCl1
 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
 ZjRlGQIZ4aDxxGqw1zzDNxNzh1NtLKbmm2i60Tl

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the descriptor.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/dell/dell-wmi-descriptor.c   | 108 ++++++++----------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pla=
tform/x86/dell/dell-wmi-descriptor.c
index c2a180202719..d1e751d43021 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
@@ -7,14 +7,34 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/types.h>
 #include <linux/wmi.h>
 #include "dell-wmi-descriptor.h"
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
+	char vendor_signature[4];
+	char object_signature[4];
+	__le32 interface_version;
+	__le32 buffer_length;
+	__le32 hotfix_number;
+} __packed;
+
 struct descriptor_priv {
 	struct list_head list;
 	u32 interface_version;
@@ -88,77 +108,47 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
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
+	struct descriptor *desc __free(kfree) =3D NULL;
 	struct descriptor_priv *priv;
-	u32 *buffer;
+	struct wmi_buffer buffer;
 	int ret;
=20
-	obj =3D wmidev_block_query(wdev, 0);
-	if (!obj) {
-		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
-		ret =3D -EIO;
-		goto out;
-	}
-
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
-		ret =3D -EINVAL;
+	ret =3D wmidev_query_block(wdev, 0, &buffer, sizeof(*desc));
+	if (ret < 0) {
 		descriptor_valid =3D ret;
-		goto out;
+		return ret;
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
-		descriptor_valid =3D ret;
-		goto out;
-	}
+	desc =3D buffer.data;
=20
-	buffer =3D (u32 *)obj->buffer.pointer;
+	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signatur=
e))) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signatur=
e (%4ph)\n",
+			desc->vendor_signature);
+		descriptor_valid =3D -ENOMSG;
+		return -ENOMSG;
+	}
=20
-	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0) {
-		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph=
)\n",
-			buffer);
-		ret =3D -EINVAL;
-		descriptor_valid =3D ret;
-		goto out;
+	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signatur=
e))) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signatur=
e (%4ph)\n",
+			desc->object_signature);
+		descriptor_valid =3D -ENOMSG;
+		return -ENOMSG;
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
-	if (!priv) {
-		ret =3D -ENOMEM;
-		goto out;
-	}
+	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
=20
-	priv->interface_version =3D buffer[2];
-	priv->size =3D buffer[3];
-	priv->hotfix =3D buffer[4];
-	ret =3D 0;
+	priv->interface_version =3D le32_to_cpu(desc->interface_version);
+	priv->size =3D le32_to_cpu(desc->buffer_length);
+	priv->hotfix =3D le32_to_cpu(desc->hotfix_number);
 	dev_set_drvdata(&wdev->dev, priv);
 	mutex_lock(&list_mutex);
 	list_add_tail(&priv->list, &wmi_list);
@@ -169,8 +159,6 @@ static int dell_wmi_descriptor_probe(struct wmi_device=
 *wdev,
 		(unsigned long) priv->size,
 		(unsigned long) priv->hotfix);
=20
-out:
-	kfree(obj);
 	return ret;
 }
=20
=2D-=20
2.39.5

