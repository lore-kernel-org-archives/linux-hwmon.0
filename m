Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B74A3406;
	Wed, 10 Jun 2026 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123736; cv=none; b=a/gEOBs+2cww8PhoLXg7BNNmLzYfLbLMEyTyR5JciXkNGHftyjaZ+BvZt6Shy9WteMytT7lNBWwPw6FS5k87iAk4XF+5TQQUrlzG2lAC3YOjWXwYlkMM37PJ9oTugVxQ+lc+lTpF6Z1mEy/fvoMZbvtBLYOfLAEXAtj2o6iyZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123736; c=relaxed/simple;
	bh=CwpFc8ofkuBtMSQhBSp3A5YzYsTxM/yyxXC7UowxCKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1FL3ybgDGgpmbYm39AcTfZTktlYS/e99TE7O6igrQS7DOIQX8oW620VSDXsHcttEoqcH9aYg1UlwgkZdks8VpgHoYwjIGNuiwDxSB4DhfthgCM6m5pi/LeTlL1mPGbE3CsMOdLETFrImocr98xZHa/fpt9KHSF3bp7aizeqV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OmQRHJjv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OmQRHJjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123717; x=1781728517; i=w_armin@gmx.de;
	bh=Hm9PPaH0FNXPEVhPlKD0RFq6+VkeQVkoeJjUxjB9wao=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OmQRHJjv93uo+YlBUfhdarHgxIIEYfKCt73kWhBIW1V9kv2VeFrf7Ytvcf9E+U7y
	 kutvcMRSwCEuU+YvIzvQ1aG17rOOif82gJkitgX6GVQ1Cvf+DUI1TZBmom8WCoKO2
	 Jpgt0zCA2z30gUrME1djJ7FbjwLuO3IwRoaLrJiMLDoMuxSoIdA/FkQGLfWBiFobC
	 P5m3B+8C4HImSCzWBgR59o9hfe52S54ouJcV/MaOuvfNEb9NGPGz8xu7S2zsnoLrA
	 9FMyln/ekm5yHDLgbIqQXx9+/aXTqeCX07BS5kNBYychHFALN91NgWFGmF46Hblnp
	 tqPnM5GXxGM/VdGagA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1xPNfn1tCB-013D0S; Wed, 10
 Jun 2026 22:35:17 +0200
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
Subject: [PATCH v6 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:50 +0200
Message-Id: <20260610203453.816254-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:6+buFilE1DUX4wbTbUfFh7A96fUY8R9Bxs9zq2SdC/iPb78jq8k
 r5spSRMybgBDroLL1TOtHrj137XwzQVGTyiC5sadgYOp6UAK0rm02I9SgM5NIft1ztMDZ+q
 Tbnt9qg4XYX3pPQZrpyB6r6kB9Wa0PR3klu+ZFFRLtg43pZGFCzObMe1Qz1QVheSHsxuHSk
 DFH8CpE8qAknfrg2woH+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8k/dXh25p5k=;nOPRBrtA/2q7I5SDlKnk8TVAsnR
 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
 qNSPONZk3OXOsxV7OIcpjA7FjbaG11uk7SClSQi7X3P7luuuOTjIT85xFQbVA93N5f/OSblGG
 FPGu8ezaRW+G86MbKU1vEH8694F5w/cvU0AsABT/zha62B4vI7NBAQhP3Doe62s/WuRFrbHN8
 Q7vPwy2UjhEfnakuprThHhQjRPMEro3fxLKHv+8z71BIbL88wtJDi+Ij/w03/TeOvR475qHoU
 LOKl6tRrx8h24qJptYwpwL5IXw1LDod/gSyQWBi77behal2+uXppKldfx8CO6T42tXhEyLBQl
 cVIdbjnU1Nepr7NvvaflrfrfRUxNpIY9Txxsa1sninmOI3yrf0dOHhM7nmnqI9N6uS13WKIkF
 BGv7THxG+VHndJAA229qg9NrifIqUTOJEBI+mBbSm327wPcSjPZIz70CywhXCc5M/sexAclG8
 bENkeL9dHaGmOH015kz532D5QUehITop6tg9xSP+ns7hsw4liqKf7TXn9NCC101VwegVeIqJN
 KDhjbbGZTl95Gq+hxXPfpApuwDTNKg3Cba03MKWO+ZQlbQ18sonnUlBMcSVxJ7tu3SQRwxUOf
 WGvj7Bt4llza+Am/mPJeprwPaz6tt53VT935JHuaCIfz4r6r3AnYVgg3XlNEy1r3hjDjN05QU
 3iI21Lda+CkTIi4Fdym0+LfTYeM30rJ4lvv1a3z+f/Z9VffVbxPpXFbH13r6018ofROd4g==

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMM call.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 49 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 038edffc1ac7..6ca2ea4bfe7d 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,8 +12,10 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
+#include <linux/align.h>
 #include <linux/capability.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
 #include <linux/cpu.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
@@ -36,10 +38,10 @@
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
@@ -232,7 +234,7 @@ static const struct dell_smm_ops i8k_smm_ops =3D {
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
@@ -253,7 +255,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32 leng=
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
@@ -261,7 +263,7 @@ static int wmi_parse_response(u8 *buffer, u32 length, =
struct smm_regs *regs)
 		&regs->ecx,
 		&regs->edx
 	};
-	u32 offset =3D 0;
+	size_t offset =3D 0;
 	ssize_t ret;
 	int i;
=20
@@ -273,19 +275,16 @@ static int wmi_parse_response(u8 *buffer, u32 length=
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
@@ -296,34 +295,20 @@ static int wmi_smm_call(struct device *dev, struct s=
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
ut, sizeof(__le32));
+	if (ret < 0)
+		return ret;
=20
-err_free:
-	kfree(obj);
+	u8 *response __free(kfree) =3D out.data;
=20
-	return ret;
+	return wmi_parse_response(response, out.length, regs);
 }
=20
 static int dell_smm_call(const struct dell_smm_ops *ops, struct smm_regs =
*regs)
=2D-=20
2.39.5

