Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11953330B11;
	Sat, 14 Mar 2026 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510812; cv=none; b=Z7TidTRDH7fFZ/ZSViYCev+51dx4CfTeEyF931EAFUDEU6em0ZAdUVXisi04ge/Sfjj1tOIWcybfvEpikNDXH6l/Gj9G20KW2F3LLkZqO8rsjt5GlWLTvIia8+ftvk32ObZ7J9fWI8j5sNqNVvFtkUtn51nfZxuwQcpQOA5mDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510812; c=relaxed/simple;
	bh=iOXEKFGxozfYT2NUFiHJmC8VWdHm8VnpsygnNb8YSLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iDA6qKs5xNCeq/iKN42+zUldgvrjsgV4UqFIWv6l2/mVGMCyjCrJGu4ZJ8jJHHJQZ2RAYRwWWQUsuBGNcHubLywkIHj9+X9nHJNzl3QR6UIzFqH/YmcNVA8ujKG18ixnvvfa1E+mQYYDCW02Ab6mfE0M3EFYQ1K3yHx1OPyTb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OGrs7H7g; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OGrs7H7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510782; x=1774115582; i=w_armin@gmx.de;
	bh=oKFk8CoolvYHEzEuBDkKVucdbFD7sGZSY8c4spG/500=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OGrs7H7gcyZuTxCI00kuhJVrr+vgf34/Y0YEflvbrtI16KMpHq5l0I8EoRzJOT1H
	 +nENBeo7ef8lCeB1T/N1g97Ht5FdVuytEQY/HlD3ByE0pWjq8Yy3JBlRN0FNLyGVh
	 YFJgx0LbpCzSsGbdkRG+NcFPCp0ipw+okLfC0Ib6/YqUjfddr4dlQLojHhxDdpNbB
	 tCwToIUDhTupmNzldY1+401g4F5UVqPT885/KYIeU5nSZ4zKFh5OHsFm3A0aXYMmP
	 HnkrQgGwbtpN90Rg+0CpcYsmbrHhey53wFW1WzuALCi4zoejTI/E/ogmJNQTT7rvt
	 Ey6ZqabHHzRQ/002ow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1vENIG1BZO-00n9xS; Sat, 14
 Mar 2026 18:53:02 +0100
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
Subject: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:41 +0100
Message-Id: <20260314175249.16040-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:BtnbhIqX/A1IB6Bj8FV6VgsISu1pM2y3jqYjDxgFVTaEIuJFgJz
 hLfsKdxl5x4X5b69RZQNtN137MCFUgQf3bn9vM2/GUBozCmBPGUdpN6o5Fu0Fe9B8xYfato
 94nU6jOmq24vDvR4mPQ5DlQnFva1/w0ho+H4vSHTczFwMnNTFLfNQhYG/ODMx5aYlQwUHrN
 RgwP1CEN91XHDd6ro5kzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6vZmgC2htaY=;ezm9QUUjB80zRv0+kGgCNICJ73t
 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
 BQkKBjwg5/X

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the descriptor.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pla=
tform/x86/dell/dell-wmi-descriptor.c
index c2a180202719..fe42eb8bbd79 100644
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
@@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
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
+	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signatur=
e))) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signatur=
e (%4ph)\n",
+			desc->vendor_signature);
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
+	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signatur=
e))) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signatur=
e (%4ph)\n",
+			desc->object_signature);
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
@@ -170,7 +170,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device=
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

