Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92E33BBCD;
	Sun,  8 Mar 2026 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000181; cv=none; b=YkW5rT+mMK/ffjqkpLaYpMvczCO1BuRdpU2wcJpaEJpXteWv74VohSkUuEAErBrhd+Drh1C5u40Kv2hJ2zrn78T9P9+KoM8Jt0ImWnI6oq8RkhvnZgVoSS0Kw6xe6WlzaXHpORs0iClDOzX++Ey0X5TxIErGmB20cqfes4r+f6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000181; c=relaxed/simple;
	bh=VZ037bVoKHx6d0+/fnvPmEq+HXUmoCiQ5vTAW0kwpSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HdBYz9sy08v5wdgHMvCvb3hRg343v5AVFU0D4RL/vht3jILhfD3TlgCYuBrp49KejZvOtiWXZ67SW0gF6YZyqX/i/DxVbz3D/yUaztrw6n3lGfgyfTu/GVZYpwyBhD+lN3xrrvCQNr1s8Zvfyk3/9++zAEs7X086AZ8iPJcN12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bS9N13N/; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bS9N13N/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000157; x=1773604957; i=w_armin@gmx.de;
	bh=/vcRDzeKtfvrRs2Sq7LBTqeql5RXsrzw1+DjSN3jROA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bS9N13N/a+hYxqt7QZ32Cm0apVUDD4U9YRnBkc7QOByjaGj7RfmNOt+xiPu8VqeJ
	 JqZjPiT9kpMF55YYHQG47O0yclL/Tgc/ECqfi8AYTnnIJEmZmA/dTb4fn0J3LKQQ2
	 7gOGnJrg0XfwhE0OWcJtUqh/yXqHR2rDBsOtnps57iqxhjqjiYwJrlToZA8T39cuk
	 Hn87OTzSAQ2PZZjY1sWzeJfxmmmAiOKRGAe3gKJZJAXW1gE0C8Hksrlda60TKT/Jq
	 NaLROdFOEuh6X543JmBUISTo3Sxt+oP6gR8lVoTENXDJCF/e4EWiZSD31qdKhaFv2
	 vt9/NE5eyCtCy5uVRw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbkv-1wJK9X38t1-00WIIX; Sun, 08
 Mar 2026 21:02:36 +0100
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
Subject: [PATCH v2 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:52 +0100
Message-Id: <20260308200155.118950-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:vVyvakVh54MW7fgdOGYeeHRgBhgCmVdzAJeILLnqFC3/+v1olMZ
 PDh4rQJewCw0lARQ/5g7cfWfEasYVZO+cy3m+iGPIPo2eOyBfhJfO4Z+vhs7iEc0N+WOJNt
 Wfd0uoM5paA57JK6socSbXlI3RpM/ruPYN2y2CumVGLLVWjyUf0SlGb8JDF4lGBWhMgWs5s
 /Js4IyX7U8rqQkw96w60w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JRlWXRVy2+A=;lS4Zwsge2cozLX3H2kPN3/I8NAs
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMM call.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 038edffc1ac7..82aa626fc4b8 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,8 +12,9 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
+#include <linux/align.h>
 #include <linux/capability.h>
+#include <linux/compiler_attributes.h>
 #include <linux/cpu.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
@@ -36,10 +37,10 @@
 #include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/unaligned.h>
 #include <linux/wmi.h>
=20
 #include <linux/i8k.h>
-#include <linux/unaligned.h>
=20
 #define I8K_SMM_FN_STATUS	0x0025
 #define I8K_SMM_POWER_STATUS	0x0069
@@ -232,7 +233,7 @@ static const struct dell_smm_ops i8k_smm_ops =3D {
 /*
  * Call the System Management Mode BIOS over WMI.
  */
-static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *r=
eg)
+static ssize_t wmi_parse_register(u8 *buffer, size_t length, unsigned int=
 *reg)
 {
 	__le32 value;
 	u32 reg_size;
@@ -253,7 +254,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32 leng=
th, unsigned int *reg)
 	return reg_size + sizeof(reg_size);
 }
=20
-static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *re=
gs)
+static int wmi_parse_response(u8 *buffer, size_t length, struct smm_regs =
*regs)
 {
 	unsigned int *registers[] =3D {
 		&regs->eax,
@@ -261,7 +262,7 @@ static int wmi_parse_response(u8 *buffer, u32 length, =
struct smm_regs *regs)
 		&regs->ecx,
 		&regs->edx
 	};
-	u32 offset =3D 0;
+	size_t offset =3D 0;
 	ssize_t ret;
 	int i;
=20
@@ -273,19 +274,16 @@ static int wmi_parse_response(u8 *buffer, u32 length=
, struct smm_regs *regs)
 		if (ret < 0)
 			return ret;
=20
-		offset +=3D ret;
+		/* WMI aligns u32 integers on a 4 byte boundary */
+		offset =3D ALIGN(offset + ret, 4);
 	}
=20
-	if (offset !=3D length)
-		return -ENOMSG;
-
 	return 0;
 }
=20
 static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
 {
 	struct wmi_device *wdev =3D container_of(dev, struct wmi_device, dev);
-	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
 	u32 wmi_payload[] =3D {
 		sizeof(regs->eax),
 		regs->eax,
@@ -296,32 +294,19 @@ static int wmi_smm_call(struct device *dev, struct s=
mm_regs *regs)
 		sizeof(regs->edx),
 		regs->edx
 	};
-	const struct acpi_buffer in =3D {
+	const struct wmi_buffer in =3D {
 		.length =3D sizeof(wmi_payload),
-		.pointer =3D &wmi_payload,
+		.data =3D &wmi_payload,
 	};
-	union acpi_object *obj;
-	acpi_status status;
+	struct wmi_buffer out;
 	int ret;
=20
-	status =3D wmidev_evaluate_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &i=
n, &out);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	obj =3D out.pointer;
-	if (!obj)
-		return -ENODATA;
-
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		ret =3D -ENOMSG;
-
-		goto err_free;
-	}
-
-	ret =3D wmi_parse_response(obj->buffer.pointer, obj->buffer.length, regs=
);
+	ret =3D wmidev_invoke_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &o=
ut);
+	if (ret < 0)
+		return ret;
=20
-err_free:
-	kfree(obj);
+	ret =3D wmi_parse_response(out.data, out.length,  regs);
+	kfree(out.data);
=20
 	return ret;
 }
=2D-=20
2.39.5

