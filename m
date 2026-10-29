Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264383;
	b=Xtwn5kHi6CkyIzZtmUQrcpq+1L9gxxbutxk9K1VjZ6xcnGEiE1sgMUZIVn336iUKINFE
	 LRdvLznwkQTTaRat4SFKL5CJzL02NmKREJx83d2urj/abgpbCiesyQiwK7y+JJx5CldXD
	 UbGs7+iAN2+ranfFqGaqL6SjXdvfrrJ51+UeoxMlffssr32cmgkJBj2ayxLDAHap9SnyI
	 HBu5WuQpGIcy+2vvtPEieywKOgkWIeZnvioGPBI2nMIUrDOLMR9XnXxqpyhdXZVJXdGBo
	 yK6p4kDuuUViNh3PzwA3L3gV01mHB1n9B5ZBP8JxS8PgiMI0QOMRkUivLuquI+G4Wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
	b=BXRmuOueGYcXxBefTCzQtwPGAgRajBmycu0CJNvBphmCjQp/2zyXFtuF2BRmPbe6FdJ3
	 ozB++581M4k1n3MRTW9n/OSBppRspm6BYES7zTK3GugJNUGW5lv2Khx+cDITkOAb+0hr2
	 XD/VEX6+UhHT75WxqWmy8hJMsfVvzyIbB9rnTOGIosGH9tgfFHKSmKw5WTkljIg3KwFVr
	 tYjHmMhEwdLUonfs/YSjQlB7hYjkIsG25IkPnmVXd2ze51RhU1gIJhSmvfTGQSlzPFMkO
	 VG8a5voMdNqUePAR1ZoPH4x3wNUOxqP99s3pH+sxiTSGVfz3D0nOaqZvQWKsdGC6wGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Qi2/jq4a";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A28606A32A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 08:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A28606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qi2/jq4a
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2887504eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264382; x=1793869182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
        b=Qi2/jq4afQD4LZt+PZtRMASfRl+J+ccJhe0O0E/DfjB2yNciffUvLoLJDn/6LY/l1Y
         4yGgRorgfRzDpgIYcMvHKJlFouz1kyEx/au5yfO7jE125Ij+A4zasZ2J+bAQJJJzvP6b
         UGccBoblZkkIqzI2Hdg0ryhaJ81jrr6qCTNpdAZcTWnPPk4iDoAx/YIO11jVrQc9ES0y
         ymciG6i8hrbZXRzHRR3ggBkZy7Lx0Q8uD6VoE4mqk+Ex7dw2/9ILWFfTzPIBNuxSss+B
         qpKPFctR4RtIjCFzQ34vwHj71QBPUSpVfjUrtfE5Pdw0CD9uRbl+g0Sq8R7ueaSTKSGK
         3ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264382; x=1793869182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
        b=Eg9pX1WSiIa3rX0hC3j3f9r9n7WLY8Q8zYLh+MZfvSBgjP2Vbpnk+GOazGEUkAs7KA
         3rYYGYfgg0jOXn5aoRnYOcLuSwi7XOezb7Qu5hCTaW2Fe+jLubc2EVaug1ssDeoIINfQ
         JhrTWIgQRzNklWrl3kcAnhWeJH+bMG59Bo6fGI68foAM9MhwTphIjJkSm8/OZQu0yGIb
         AaedSCBTCiNeYup9GMM3pFdeLR7Ybw+TW7vZjylvY8teKzZQQJqoyDuIs/WIh0Ty+uaj
         X9fwNxAsvDnuB0Fqq1ezNpJVvN1SYdEXkbCZ2bs3DzxUA/0JJNkECATiSRFbjxfmiUme
         DHqg==
X-Forwarded-Encrypted: i=1; AKwUvBzgAlgupKTjDhAWS+g5M4Pqjbw4LqESrMkEAgi9LfRcMjJHbyYkogP4R1Som4yX54+4yD8oVHKjmQyrFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7uGmvjbD2qbLPXgz/ETqhf3xaaD33V3Jxg5t5hMFpVthtjHI2
	ohopYuj+8wm/OuXujx5JatTfE0S+tX2OkVpOHwKCT3Tkod/ofvSyqxM=
X-Gm-Gg: AYBFou2EZdkNp84YBMzSmK2cLqDavnTVPt8NE0Q5P0pTu7ppW321eivNSqgn0KHtmHj
	636tkZhEb182HuAHC3l+LnWNsmfhKqR6gFFTEC5UYBQtA3Rkcp7ub2RgPlmGECSQeeb3tA7LUV5
	0EYSnavQWP1Iq3h5mjEqm8MjODUoDD24n7UYdFlE1Oe36tSlQsFXK9+Tn7cnrh3wP4UYX69S7vS
	XixpWZ+EM+IpgTNTLib1Pfnufm5JRD7/ovKHxE87W2SWxB45t7IUYndgmab8vuC4weVa0TgyLMR
	Ul14M0SDZm119noeLQSQJ9fFtgPM4mqvXWesfhJmDVWPh4Ph24mN+PwfHuvNfeMNDhKzPbm64dR
	c6qfS5nMbF88anzCoq3yhrCc7cvBZHImxGrqmdjNA2xkXgGgtjec10858jawcB+n7ITWiebhuRi
	/V7kMCidr12lWiH+Lh+YVToW1DqSAynjdqlT/Qcku+PJ3gppUjP1gExQNZFPdjWxrw+4ERC3oiI
	y4/3PhrumfNT5OWen7zIsUDJY4t1ebeko03jfvR1JeVydvQiMJrBaqOqTlgRGrWgOsY1V3mRj2x
	8F+i/WU4LCVOIhsrVe775RgRSUUbBB5q6aaEUuwcGz9hGdGsv7FSOQ4x/Yo18A==
X-Received: by 2002:a05:693c:20c8:10b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a203e2f43mr7265770eec.35.1793264381578;
        Thu, 29 Oct 2026 01:59:41 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:59:41 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 08/14] treewide: Add a flag to detect the Apple T2 chip
Date: Thu, 29 Oct 2026 04:52:05 -0400
Message-ID: <20261029085504.3547-9-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a flag to detect Apple T2 chips on Intel Macs.
Cache the result to avoid repeated checks. That will
be used in upcoming patches.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/kernel/quirks.c                      | 37 ++++++++++++++++++
 include/linux/platform_data/x86/apple.h       |  5 +++
 .../platform_certs/keyring_handler.h          |  8 ----
 security/integrity/platform_certs/load_uefi.c | 38 ++++---------------
 4 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/arch/x86/kernel/quirks.c b/arch/x86/kernel/quirks.c
index a92f18db9..6651e5d4d 100644
--- a/arch/x86/kernel/quirks.c
+++ b/arch/x86/kernel/quirks.c
@@ -664,8 +664,45 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x2083, quirk_intel_purley_xeon_ras
 bool x86_apple_machine;
 EXPORT_SYMBOL(x86_apple_machine);
 
+bool has_apple_t2_chip;
+EXPORT_SYMBOL(has_apple_t2_chip);
+
+static const char * const __initconst apple_t2_models[] = {
+	"MacBookPro15,1",
+	"MacBookPro15,2",
+	"MacBookPro15,3",
+	"MacBookPro15,4",
+	"MacBookPro16,1",
+	"MacBookPro16,2",
+	"MacBookPro16,3",
+	"MacBookPro16,4",
+	"MacBookAir8,1",
+	"MacBookAir8,2",
+	"MacBookAir9,1",
+	"Macmini8,1",
+	"MacPro7,1",
+	"iMac20,1",
+	"iMac20,2",
+	"iMacPro1,1",
+};
+
 void __init early_platform_quirks(void)
 {
 	x86_apple_machine = dmi_match(DMI_SYS_VENDOR, "Apple Inc.") ||
 			    dmi_match(DMI_SYS_VENDOR, "Apple Computer, Inc.");
+
+	if (x86_apple_machine) {
+		const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+		int i;
+
+		if (!product_name)
+			return;
+
+		for (i = 0; i < ARRAY_SIZE(apple_t2_models); i++) {
+			if (!strcmp(product_name, apple_t2_models[i])) {
+				has_apple_t2_chip = true;
+				break;
+			}
+		}
+	}
 }
diff --git a/include/linux/platform_data/x86/apple.h b/include/linux/platform_data/x86/apple.h
index 079e816c3..47b27dcea 100644
--- a/include/linux/platform_data/x86/apple.h
+++ b/include/linux/platform_data/x86/apple.h
@@ -6,8 +6,13 @@
  * x86_apple_machine - whether the machine is an x86 Apple Macintosh
  */
 extern bool x86_apple_machine;
+/**
+ * has_apple_t2_chip - whether the machine has the Apple T2 chip
+ */
+extern bool has_apple_t2_chip;
 #else
 #define x86_apple_machine false
+#define has_apple_t2_chip false
 #endif
 
 #endif
diff --git a/security/integrity/platform_certs/keyring_handler.h b/security/integrity/platform_certs/keyring_handler.h
index f92895cc5..a355f4400 100644
--- a/security/integrity/platform_certs/keyring_handler.h
+++ b/security/integrity/platform_certs/keyring_handler.h
@@ -45,11 +45,3 @@ efi_element_handler_t get_handler_for_code_signing_keys(const efi_guid_t *sig_ty
 efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type);
 
 #endif
-
-#ifndef UEFI_QUIRK_SKIP_CERT
-#define UEFI_QUIRK_SKIP_CERT(vendor, product) \
-		 .matches = { \
-			DMI_MATCH(DMI_BOARD_VENDOR, vendor), \
-			DMI_MATCH(DMI_PRODUCT_NAME, product), \
-		},
-#endif
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index c0d694844..b4096d4c8 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -3,42 +3,16 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/cred.h>
-#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/efi.h>
 #include <linux/slab.h>
 #include <linux/ima.h>
+#include <linux/platform_data/x86/apple.h>
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
 #include "../integrity.h"
 #include "keyring_handler.h"
 
-/*
- * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
- * certificates causes occurrence of a page fault in Apple's firmware and
- * a crash disabling EFI runtime services. The following quirk skips reading
- * these variables.
- */
-static const struct dmi_system_id uefi_skip_cert[] = {
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir9,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "Macmini8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacPro7,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMacPro1,1") },
-	{ }
-};
-
 /*
  * Look to see if a UEFI variable called MokIgnoreDB exists and return true if
  * it does.
@@ -165,10 +139,14 @@ static int __init load_uefi_certs(void)
 	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
 	efi_status_t status;
 	int rc = 0;
-	const struct dmi_system_id *dmi_id;
 
-	dmi_id = dmi_first_match(uefi_skip_cert);
-	if (dmi_id) {
+	/*
+	 * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
+	 * certificates causes occurrence of a page fault in Apple's firmware and
+	 * a crash disabling EFI runtime services. The following quirk skips reading
+	 * these variables.
+	 */
+	if (has_apple_t2_chip) {
 		pr_err("Reading UEFI Secure Boot Certs is not supported on T2 Macs.\n");
 		return false;
 	}
-- 
2.55.0

