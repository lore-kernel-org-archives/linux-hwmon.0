Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518A32C95C
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383061; cv=none; b=GWQOy3dQrf6fgJKdLMZZDMVZgAFo5uhxJCgKkR7OdZvI+yJDggNkSS3MiXj44NmFBQJyCij3J+lDBYuaeA/iXxvs2aeI5D+pA5jaVZiaPi9ExWzVLFsgHFx4WJQ/zR5BAKOaQPKFVtuBf9VvhEytAndb8yaYjTVltTJTPrqo6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383061; c=relaxed/simple;
	bh=UQaYuFNbLmNdq2oRoSMsBkzQUyqKAMTrcCaP303nXzI=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=UIpufe/TX3Ytcwmtv2wUsHadOrvzS4wyUSMoA2RSVaomXo4TeObRx0eFJ1YsSnmzv4/ultCw5IPhNmSpxajA5eF02EdA4PT5JK3WMKGQu/7VYwSTDtHl1QG2McXEAH5y11AHM1QJLe7+91lsNzrirx6YFUbA+IXBMvoP6VxJ8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=a58zbWc+; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="a58zbWc+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=q5MmBJE3Lda0OOnqo//S9zYO7HxTfYCter/zzSzhggQ=; b=a
	58zbWc+LaLNaiWdoSZoHLwtbrWxbMNwVC6uYzgNnHElqGr5LdYnoNWWU3RCRJI2GXPFpu+6VM/CZm
	268RsUzX1qPAvaMbqBkoU6h7DlMEPxnGDy2uu0TbqEW1YsJXi/iWHFMLv0V3XqYr69gs56Xtu1ES1
	dPCm34h+Sm5sseWXsb8mb0GjpKtFo8fYMXOdMo7qdtWsl1yaalP9av4UAuhvsX6LAWofoeBWmx008
	VS8KlA91/WFvAC7TbSBkIfuV64nispwK50YbzPV776vjoiDEaYXeollJV79ImPX7IVsZJi5e13EJ/
	hwW2e+Y51C70qGSelJxntAElczqTW3JpA==;
Date: Mon, 17 Nov 2025 13:37:46 +0100 (CET)
Message-Id: <20251117.133746.173713564005237147.rene@exactco.de>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] add Via CHA ID to via-cputemp
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

Add Via CHA ID to via-cputemp to support reading that CPU temperature,
too.

Signed-off-by: René Rebe <rene@exactco.de>

--- a/arch/x86/include/asm/cpu_device_id.h	2025-10-07 17:07:15.564453320 +0200
+++ b/arch/x86/include/asm/cpu_device_id.h	2025-10-07 17:12:32.812472408 +0200
@@ -19,6 +19,7 @@
 #define X86_CENTAUR_FAM6_C7_A		0xa
 #define X86_CENTAUR_FAM6_C7_D		0xd
 #define X86_CENTAUR_FAM6_NANO		0xf
+#define X86_CENTAUR_FAM6_CHA		0x47
 
 #define X86_STEPPINGS(mins, maxs)    GENMASK(maxs, mins)
 /**
--- a/drivers/hwmon/via-cputemp.c	2025-10-07 17:03:12.142438673 +0200
+++ b/drivers/hwmon/via-cputemp.c	2025-10-07 17:53:55.232621776 +0200
@@ -134,7 +134,8 @@
 			data->msr_vid = 0x198;
 			break;
 		case 0xF:
-			/* Nano */
+		case 0x47:
+			/* Nano / CHA */
 			data->msr_temp = 0x1423;
 			break;
 		default:
@@ -273,6 +274,7 @@
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
