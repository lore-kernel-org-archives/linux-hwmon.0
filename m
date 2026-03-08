Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1943382F2;
	Sun,  8 Mar 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000176; cv=none; b=EiDK+KDqMXe916GIk0JkTUyge1gzWfV3hE8+RG0HVT5lE7OPvct5f6Ue6SW6LI6UnUwfWgQzHTxbWZWqVygkxhpwnVuK542HoEQJJ4Pc2GkYvs86STyHmKLz++VLvmuJ/7EdMudmeRnXI96TSDnZPf25rP0HKMxea/3FgnHTrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000176; c=relaxed/simple;
	bh=adn3OUAB5U86bg/NTahLF+r6ztrkL0f+31fxu2dWfCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l8hvx6wZYrVQ3C0ncw35vxpa+nneAutCzGuyAjm+tjeCJgWn6wvoaZDsJDHNjVSzX5mNEI46WdOlnxvlC6ygDyDtjQjd23yaN43HDO/YmJBAuvNIoESW2c7vSFFsl684jEiEy+XWjTg3587+ZGsgjho3hX8dnOtyyVTf9HYaa/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lVIq/WWq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lVIq/WWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000145; x=1773604945; i=w_armin@gmx.de;
	bh=Io0HSqt2VkFLGBxEHSKoN7vk9tMBmQLErL/85dz1VI0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lVIq/WWqOmnK7UV+uRNwcq/y4mbD2Wq1Yhn9BdjzP+WUMoYo4rv4qERJDXQSpUyZ
	 TUE0diTHDJmMgZvb/UueEoTDHQbvmGkJWR7RR16JgqkxuC9Nj3nP/sXteT6Fhj+l4
	 qYljhRftIsLLTKW7hyjFmmQ5XpElaoQi7zYPzOTMI45gBhsWDFKVRUZPwVD36Mqh6
	 pQ7FjZ4tQJ5AAvFLjytHyoI3CAKLUCQC4kpN2vgpfMKhxScbRLoCwMAENVzaKURv+
	 5RiFzadz6jXlWViPnbjrCaPBpgRwK4Y32+aWxRe8AdZRrK+MkQJp1pesF6yz0tWiF
	 iYssY1O25OFFPyM7Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1wBvEs3D1S-00PDGw; Sun, 08
 Mar 2026 21:02:25 +0100
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
Subject: [PATCH v2 1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:47 +0100
Message-Id: <20260308200155.118950-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:vq/dqkkpSTzYcLHTneW8QVeeE03qFP+pixN8nuJJS4WYPp1wyJ/
 6r7srFOXkbxoci5+c4AeJor7L4cmS/mNC34WmIvi1R/SDvWX3DsH3LjlUGEtNUsekURtz7c
 iWuRY7O0WUGiiuab+4rRffgG6zqwG3QwHH1EMIHqBAzXVcz2cbqvzCrXiuSK2/DXwG7mPag
 maYJc8ei6oJKnHHfPBSwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KYp0yHI+wHo=;VO9EkibCtYyTrRfx0JVpo76o4kM
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

