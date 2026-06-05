Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF425392C;
	Fri,  5 Jun 2026 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693211; cv=none; b=I36fkosnMK30+497MZfNS7LKoxbg96FdsCIF7tIaM/5aBwtCfvQTR4xQHKHGM0j2cnUlefwgUEUmeVrTKmLWILP2DIMp+mmLn9tNbOYkhSQ6YKj9SgvTVANf/b2Ee4rVzyepNKnaijCFRZTKPrlAi8ajlaubtP8E8lABSZDQszQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693211; c=relaxed/simple;
	bh=R6jhKSw7Ls4wRvv6hDd9DjiWqFzo3e+NJRmJOli2NOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kA6k/NrBFIvtZl/ABkMJTmktya+naXB6H+yxgOhMgWBolmrD/j7XHiOqJlaxmNKTn/HGI7g8Mm8P1TfcjHAh/J+cVermVfjw5bvzBDdkqB7CPFiwPevVCHfoOJ2FGkMR35DeBLwqLhcVMVIJaQOpdymg9GSt8GTyQ5r3HHTNDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fIAKuoF+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fIAKuoF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693189; x=1781297989; i=w_armin@gmx.de;
	bh=JtHTJa+SmQgI1Ow1Wew6FmetXK04z+gNCABL0Ss/1BU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fIAKuoF+71kmKoVq5M2/yjluqOUBADBo2WPCA1IHGWg1uzlyw55qp4qL0HtXz1wS
	 MF9gFWkqB78Yvp9gY36C8iPpHbJiXYQYM9ZMtgd0FgA5Vp6Vyo9/K7uDaMUyB1TGL
	 zHSVt/4odHuiKXsLez+c5iKWKZypc4HMODXitEmzly7DCQ7GM9GQ8Y1D+W4XcDdsK
	 rPsuPK37tb1ALbCXxCKYWxTGzPYccyJ+kP7dB1ClO581+ROR3QK/SHbW5w7DSMizx
	 50nDYHpMyUkxnv1otHlD2Qj1+gYHLteDWLGMH4IuMxn/G8Cjuh9lb5i/jmWtPbiMU
	 2Agj7le4BgWHiahR4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzT4-1wux3p1nNE-00INMx; Fri, 05
 Jun 2026 22:59:49 +0200
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
Subject: [PATCH v5 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:34 +0200
Message-Id: <20260605205937.530897-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:MB4zCz/R0Kbqx5ZfoWDVr7/Ncg2e2i0nScv2NGrMOC3y3LgWsj9
 dh+zRm1XVoEfuv7SN+Uz9lEelowl5uuIlJ3YUscHcqqKXDT+e4SFKO4QQR7ucTVyJJ9oG3x
 OOTgWHMFfy4HkmZUSzGJNPY8/MiabJOSELX5DLV8O/1DB7WgEHQPZOtM0mmR32+zI+UrHDs
 rXSlZYDidpzkZWwbvlybQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2ld5O7hCihg=;4h7bfzeNrrcXapKxnlzPknJnOwq
 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
 5vgBPdfx/vyzkHmDzk=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMM call.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 038edffc1ac7..0dbee562220b 100644
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
ut, sizeof(__le32));
+	if (ret < 0)
+		return ret;
=20
-err_free:
-	kfree(obj);
+	ret =3D wmi_parse_response(out.data, out.length, regs);
+	kfree(out.data);
=20
 	return ret;
 }
=2D-=20
2.39.5

