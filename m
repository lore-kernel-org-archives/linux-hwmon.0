Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49658394EAD;
	Wed, 10 Jun 2026 20:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123708; cv=none; b=cM0K9kA7KmH/3DSlGhh55oTepe4tDs/xuVl/Ujy4XiDBMgCca2nYGKWrL/s4Nnr1e7xIf4Me5yZ/m2s1dFykdo2H/IfGluH8S3BXPLjgCMoY9nXb7luI+M5iL5DXOJi/dfHZwZqrtUHfl7VXAwhMuJCY5U//6zS88Js3fK6GJeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123708; c=relaxed/simple;
	bh=1wldWsdwzfXwTayxJ5NMFKk4EU15CJd92ekBwbNpGdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWyY0KwedHvJzKorgWX2Ocr6VgNrycybby33NUr5h/RCwEqNWkro7hcGOJ3ZgrHQI2KQInulgtF7BndTYUogf2d8FDlcH2ZILgyaJPzNc1YhB8XCfWuhHQI+oAyq1OKAX9qSq94pBRObN4FolCLhlvgKlIJU6igdQ9AoA2StDbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e6JBO0Nn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e6JBO0Nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123703; x=1781728503; i=w_armin@gmx.de;
	bh=4H7/H6FlzWYmgYTJ79L8PeMItgp93BN6vJTDVhVZoK4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e6JBO0Nnb9prH4clK/+VGDXsRKSotAbXE1OnFTeKosRHobcR4vqagW10j5W4IZAB
	 MGWyOx9hw+LF6Fdr48Wh2cZqflceENNpmnKeK0EuUszaQAV47hr8hSLs/736qviWk
	 Se+A1vKSHUU9GwAKYpy8y1iqqLEbG68NPCclC/4HOWJlEQRjXUkJAA0FT6IHeghLd
	 /MKGkWucfQnKjzgqknxh6I75w//RYSqvrJ06KKCihbPOSBH83RBWWlhCI3O+TrwmW
	 IwDfEtl9V0UpnCwre/+Wg1NFfkzEC2pveRQ61PUGsbtNX3Ri3j7KsPu0g0oEFSXGi
	 TKgsZBBpLEAc2tX3Gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1xEgJt0FuY-00ruY5; Wed, 10
 Jun 2026 22:35:03 +0200
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
Subject: [PATCH v6 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:45 +0200
Message-Id: <20260610203453.816254-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:UiLlY1ScIstR7BfnLNhnqr3F9+JOe+UwvPiJ6oLich1wkb9Hej4
 aEnOequ9VASeYw1HYe0/WrfdshzY4hNSvn1j428w9NNthIjZa752eZKgzQNR07eaZW0QGbv
 NZANv3Vp61NU/eCE1Q8MErgkU7PcDO+RcBOXh9xAKzhzPBdW/CVFYCKtm0/D3ShfO9G406Y
 vNd+aG2JIfgifvz/PF+jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qa/6S1xWRjg=;hVUBZjrBND+SNwx/ABAEYl18hDi
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the descriptor.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/dell/dell-wmi-descriptor.c   | 108 ++++++++----------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pla=
tform/x86/dell/dell-wmi-descriptor.c
index c2a180202719..179d5678b3ad 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
@@ -7,14 +7,35 @@
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
+	/* Both fields are NOT null-terminated */
+	char vendor_signature[4] __nonstring;
+	char object_signature[4] __nonstring;
+	__le32 interface_version;
+	__le32 buffer_length;
+	__le32 hotfix_number;
+} __packed;
+
 struct descriptor_priv {
 	struct list_head list;
 	u32 interface_version;
@@ -88,77 +109,46 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
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
+	ret =3D wmidev_query_block(wdev, 0, &buffer, sizeof(struct descriptor));
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
+	struct descriptor *desc __free(kfree) =3D buffer.data;
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
+	if (strncmp(desc->object_signature, " WMI", sizeof(desc->object_signatur=
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
+	if (le32_to_cpu(desc->interface_version) > 1)
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

