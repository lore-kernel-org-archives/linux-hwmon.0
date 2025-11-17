Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A2305E1F;
	Mon, 17 Nov 2025 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403352; cv=none; b=tsCzwhcnS8kv7z8/UmiLQBkTl//VYd6K+31tHM7RAxVOR8mSG4XEHwhn2+uvTelndWvde6RpJX5VSyB8tNrhaverKu2kBiLMWKXK02+4Q3Fw/uBhQULumqKlAqrgZduD2+lSt5W8VWkw3tVA8h3lbyQ0Qbb6KFPQF9k7gR1dLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403352; c=relaxed/simple;
	bh=5/DZAFNeA/39VoIqSb6mI1Slk7+LJGIsTeUe96QFOPU=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=sO3SO+kYPkHADE8CJHMe13nWaQn18/zT0r2qI2j5qc74VnkLEtReNPEAf2t5dzOqip4GV/QcRi5Ap4xA7pZxwHKSiCLtmPWIsoajNQ46sTL+qwE54tjvr8GTFlpR2KALQ4ZqxtQQ05FW00JIH1/W8DtGgeMPPpb2HCuFa6Om3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=bN3AM/Kf; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="bN3AM/Kf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=nF0ic8glzTeKyvSR5XMEftFP5v9oU+nrFq4snqo5j/s=; b=b
	N3AM/Kf0ok7t5DpX9terPn7QSWUulHDdLa0CXNfJsjiS7jzts5mrA7fE2CKtvD6iPZfSyb5D1le1O
	knupPpNfbjZrqgi/n/e21OZImSYT/yNKUHbDAg4ppWQAjA+pQQq2xpkRHE6uzYMOk1k6RGaVAVitM
	yB7CKrpgZX4SOfBujizLjWP9oCP2zSJWAB9JHoyySjiMVhVoDrS4wypfNiKbJWgVR+jKwK9yCOsG4
	rJSsjwCLoVzEwjhE2u/FVICsz7FBb/xmIOMLJCOkylguPNi4UsCX55iAx5mQ3m0dBymbRWsxg3IL+
	wOi5TRZWfdRU+7u35VEkum677JUj3J4kA==;
Date: Mon, 17 Nov 2025 19:15:55 +0100 (CET)
Message-Id: <20251117.191555.1034668076458804931.rene@exactco.de>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH V2] hwmon: (via-cputemp) Add Via CHA ID
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Add Via CHA CPU device ID to via-cputemp to support reading that last
CPU temperature some of us have, too. While at it, use defines for all
CPU model checks.

Signed-off-by: René Rebe <rene@exactco.de>

---
v2: use defines for CPU model checks

diff --git a/arch/x86/include/asm/cpu_device_id.h b/arch/x86/include/asm/cpu_device_id.h
index 6be777a06944..03b0c6d0760d 100644
--- a/arch/x86/include/asm/cpu_device_id.h
+++ b/arch/x86/include/asm/cpu_device_id.h
@@ -52,6 +52,7 @@
 #define X86_CENTAUR_FAM6_C7_A		0xa
 #define X86_CENTAUR_FAM6_C7_D		0xd
 #define X86_CENTAUR_FAM6_NANO		0xf
+#define X86_CENTAUR_FAM6_CHA		0x47
 
 /* x86_cpu_id::flags */
 #define X86_CPU_ID_FLAG_ENTRY_VALID	BIT(0)
diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index 823bff2871e1..81373f9e7b32 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -126,15 +126,13 @@ static int via_cputemp_probe(struct platform_device *pdev)
 		data->msr_temp = 0x1423;
 	} else {
 		switch (c->x86_model) {
-		case 0xA:
-			/* C7 A */
-		case 0xD:
-			/* C7 D */
+		case X86_CENTAUR_FAM6_C7_A:
+		case X86_CENTAUR_FAM6_C7_D:
 			data->msr_temp = 0x1169;
 			data->msr_vid = 0x198;
 			break;
-		case 0xF:
-			/* Nano */
+		case X86_CENTAUR_FAM6_NANO:
+		case X86_CENTAUR_FAM6_CHA:
 			data->msr_temp = 0x1423;
 			break;
 		default:
@@ -272,6 +270,7 @@ static const struct x86_cpu_id __initconst cputemp_ids[] = {
 	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A,	NULL),
 	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D,	NULL),
 	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO,	NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_CHA,	NULL),
 	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY,		NULL),
 	{}
 };

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
