Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78021F4631;
	Sun,  8 Mar 2026 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929543; cv=none; b=Sk8VnJvZ4CCAcwZcc01i9imDsTEuw7MRByOcrnCK3rPkT+802ebZ71zgolEbxnF9LyldROt4wNFUm/eUCwhFV+NeHaVT6qZjRuQ3VtzXXaIOZCwVwd1mdADdJO0zvvcQW7bnFquKwee+dcv5vYbuNxAsHfDiedX7jyDQP1594hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929543; c=relaxed/simple;
	bh=lqLLax5AUIzeLvuMUH5Bc4/KsRBo/suA8+O3cOc85KU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWI+kouUT00wZajxEP3Pcie5lLpzhGZMqm1yi1lEkwEAzoc7Opl1rAEO+l1HLR/E2xoA2KhD4cXELqjwYI7/ZDjaa3NsGpFs6cC5Z8GfTJeW0rBJx2w+CJsHTOpd7yw3h2+Jlvwz+FOGEBOJUn4ZOg8CXciM1rOJi2H3Zec0lWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BMC/B+/7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BMC/B+/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929535; x=1773534335; i=w_armin@gmx.de;
	bh=3C8KX+mNbXBtpLU3SulTYab3rrmX3JXn7OFVwlc+R5M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BMC/B+/7APUqw42cRmo1R/9ZLaQtTxAzQJJIN6lurSZXiYGXWP/q+n9QiOclH1Pj
	 z3LNKwy0N4r1QaE0LP9BB7CFwyEjhm7CYxbA+PF5U8bI4ijV76iRX2vb6Y0o8CSZU
	 871fD29mDNgQ0AjRIWUeeD+6K3EopVvYkSVjDvipI97FiB89KDrOQtHq2CDW8SP8t
	 OJHj7Jd+Y6VRhnHmDt762LSHC6x+d6hQq3/sK2+OCi6MDI7CCb1PFXZp8yyCkkaEE
	 Fqm+KzDzIx54JP6ud76t7wIEMdENyxJd99T6S77HPVDpiMx/G66sc2P4FOxmjG0/B
	 4WeOU1pQLCuLuWnc8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1veDBa2sSz-016hKs; Sun, 08
 Mar 2026 01:25:35 +0100
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
Subject: [PATCH 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:19 +0100
Message-Id: <20260308002522.4185-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:sqibX5sG7MClgC8yfOo7ZUUnDENMD2HrrfPf8RMpbHyUHrFhVN0
 cWNtf0aXQlFwCY8fnCwnNS5R6S4mSIhhpXT69VmA8dNNOS8CBaX+QWE+JmFKMYBhKMB0no3
 VUNzOXi93mgAB1+7ojzFEWjgY4c3Ak8fcDMlTeKsGPqXgt3bFoxCuRpxQ1uifiwlQDSjPsT
 /ypEweZyzkL58ErvAhjQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NBVmMP2cH+k=;YMGCVfTWF/urCK6wD2wv0JAcF/g
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
index 038edffc1ac7..07c05a82dc26 100644
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
+static ssize_t wmi_parse_register(void *buffer, size_t length, unsigned i=
nt *reg)
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
+static int wmi_parse_response(void *buffer, size_t length, struct smm_reg=
s *regs)
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

