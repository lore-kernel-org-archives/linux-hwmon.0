Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3E37C925;
	Fri,  5 Jun 2026 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683295; cv=none; b=ZLwFy0kdsUZOd6meoYtzhKGexNNp3LZQwqvQihFazHhH/rM5LdBb4K6kXBANRrYvgLSOlwAmfWgKYEmoRzYLTLLT82REriKFesi+52XVh6STALUFncYaQVIg5fN5ixOnGBuUz/JpxfEczDWLtDz4725pGvcMEuIjAn6kokkrK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683295; c=relaxed/simple;
	bh=R6jhKSw7Ls4wRvv6hDd9DjiWqFzo3e+NJRmJOli2NOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uirjv8DEnHfecMfsHg9Xywpx+tZdSMcPtkEBAv3JMee7SSL/ai4abj79ceXm7i9HY3nK1m2Zd5qdX9ufJOD200ihlb2089/V8rtBY2K1taLQLmwN07nxc/mKnL7mPMSzK6kpmBhWAqbCR3nxswxLBhRUVeEy0bo/z8PuC0Uw6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qH7u6tih; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qH7u6tih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683284; x=1781288084; i=w_armin@gmx.de;
	bh=JtHTJa+SmQgI1Ow1Wew6FmetXK04z+gNCABL0Ss/1BU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qH7u6tihZVD3Pwku5TvhkBI8pgA8t+ZlD/ujXbgaKZmue8sGO5BNdZRn5XXqj/po
	 4N+YNpcdXBJ9a1geQomR459STUY46YNOzm4E6FeUhbNqo9AOh+yx4ETqz+3GzXgpl
	 p+p9KsA5uQ0k4Xei1tKaoxadxZEGpe+0Rlinelwu6vIfJw1j9hmRJLYagu6lPxUBz
	 Z8hpmmJd4uI8fAaC1gTR1KRiSstFrSsahMxZAPMO7e0SvDoxrY5dSYn415P28pcad
	 2hvY4/IZeCVl+9N7+HmBKYWgeLlWu6LHYrHWJBNZAROcNi5xqPIXYHG7ujQVFPLdP
	 Aegkmf2v2DvxI59lEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1wqmyV1VFz-00Sgse; Fri, 05
 Jun 2026 20:14:44 +0200
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
Subject: [PATCH v4 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:30 +0200
Message-Id: <20260605181433.188847-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Wozw98zJIqzlDdmOxa93rtOWsBFY9h4D+MHL55bSjOfXS3nU4kX
 L4F/tk6+Q9G1Wt92rrHZtByn+H1wO6Pj2YtAI6Dbl1dc5CSuhhFF5tuH0qdVfrOcwVLwT1n
 szXxQbL8UHCk/mQe710tJosoEPT3qfx/xDDXy1Tvgfsy+UeRd5XsJsFU/22S1VwkJMjldja
 nLxYV7WQiqeSRzXVOoizg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tRoErE8aHkE=;ZHL3PA5HWwX6alzwcqVPIiPbGMX
 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

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

