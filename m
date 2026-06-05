Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE3280325;
	Fri,  5 Jun 2026 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693210; cv=none; b=r4mwY6oBrdGMdd7I3F1sAO4NZnH+hIzAyvJYIDRqtRjJAC7jkHasFlOjGxrQwKIQAAPt5TVQWuWuF2ez5R/osNUr30nbXRYiV5n/T+bfL2r7uxhxo56CRaOvq8jlOfC23mBKBsXGl9YtbCm86CteeFv5EOvqOj9vD57Nb1/rUdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693210; c=relaxed/simple;
	bh=WVvy32zQZCu29tWBe7oWk1T/1Icxju/+39bH/b4nMDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZgjfZLjZOGuExcXidXYmWhqBNJcf+yFQmu78JMlhqODqxilTzjHR7Ve6My/vh1ax6bC0wljxR78k9n/jWF3DTGxBSzYjlHrkjp3TcyqGMA1oDeSmc9JEQ9r62Xp9nXdFD0IDg2yF26e5n5gzonB8bYtv4mGSDOF/H4Ek+xqlhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VCInFR0k; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VCInFR0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693183; x=1781297983; i=w_armin@gmx.de;
	bh=N0sTMSjuIl9x+7pr9CNOAk0smnVmQCW0xWoSviEepFs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VCInFR0kX/wCRFoBIwFyqmPcruBh0wH/TjFhlAwSOxJCkfqYQSCJY50xap8jl8Ab
	 cF6Kf/MrYsV6s0owYhV9t+Bn6JMbslqXeymJA8IBweDQj1HfYZ1c3re5cJHtfQAat
	 WjVSHuRbnC5TK32iiRyF9FJYio23kJNloi9Z1n1twBV7D2VQVQEI/UDeWbUnN0VGH
	 JdqN0+o81aBtcUIVF9hEvIZzyDWgxYwXQobYy5HOdy/RGX24FgPw78/4KV4ORp4j5
	 wxKs6jIPAbmRyk2OtooYM+NZWw0Ss4VWy4ks3kyWHu6wupukBnxKzp8TkNebQzFGS
	 8XmElD7aAxThipGwtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1xTBN137mq-00sX3M; Fri, 05
 Jun 2026 22:59:43 +0200
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
Subject: [PATCH v5 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:29 +0200
Message-Id: <20260605205937.530897-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:VIpAYSVDhiI0lFMBbccvJQWzU7t9qfPez30lb0eg9XR5KDSofYt
 8jpYf20Q+Dkn/RHCNADnGQcEnpW7TY47vRNJx/98EhZWChUCDC+gO2k7aL5x67pdlOr1oP3
 VfAz7kPDkSBCeqy1B3fxcL0sZoUdvfiWdcMK/EvxqhJxFf5bwUgFUgdGl5Gzhe6YePUiecs
 gAj7nKT1bCGsCFLnmOP/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n9cKsh1BOb8=;mz/GiZ7lpIS2LsgWK+mxZcS647u
 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
 ZqY4K9cUawQaxN2yVM=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the descriptor.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/dell/dell-wmi-descriptor.c   | 108 ++++++++----------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pla=
tform/x86/dell/dell-wmi-descriptor.c
index c2a180202719..5f5e9f38988e 100644
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

