Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B4381EB6
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746686; cv=none; b=FQlq2Ss1TDbDXJKdjl+Jgi12imCUeIMpk9GGen0kJyjNqdikFktVGWArTRigSAYnw3Bj47iz+aO6/THMSpHUyHiiexPCuOPEqVpgjsvofLG5+CBBZO/6clHNqGFLmZ4YgtU31mWaO/qxd4B4XG6His3LWYls/Alf1KjXeN6gWAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746686; c=relaxed/simple;
	bh=hTxnvCCR3zR+4xEII5otMAMtiwZ/u8ZxjcxhCkNWxJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXaVeSMhHLltwPnzu0g/IGkOiISbm3YquaHOJuI+tFz40c1AO+5kQj6G7rm/jgAr9c8cy9ht14I+CLKXyCc69CXCFs0lYHlt0BYJJy+JF59mRv0rM4ETLqg3m9Fd4emZUzY/Riu7XhLWksgkrCsac/fW2kcX4AvOMcbx5rLu86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6le+HOX; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6le+HOX"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so14816533b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746677; x=1785351477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wj+1LGqAFiJSD/N1c7ShfQVKFXacB+69/Yy7TCDPawc=;
        b=F6le+HOXvP/ZOuVPNPFYtKS5tNYZPCBuhXrXPgC+qvmwhOiU5p2PlJszAvuHUSFQsg
         IK1NrpoasQbk5UzPwgHEj0M0SF4uoP51aYUe/684EEEy1hPUEVKFl+qRPL4WKUZtfc/t
         Jc8KXONcVGQesFnCFPRUovrD2KR8oZczetsekeQahnZW9WggSAE8b69iVg53GHczoISM
         67WhKTLp1uDqEqJ2EPp4xXvWdQCAh/MWgtw2kfmVmCPDuRJQiLJ7z7VHnPhnStofxsqw
         U4lFoM2Ec4cy5taEgWUfj6SC93XPCl/gnLo8gTgY25UGZME9hZeWaa7GwoDDi6BYn9/K
         Nsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746677; x=1785351477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj+1LGqAFiJSD/N1c7ShfQVKFXacB+69/Yy7TCDPawc=;
        b=WeJA0ps1vW/MBYN0lEQH5v9HFqTKEQQKZ39Z3I72QQJ+2oXIB6XNpvuS/it83QWqIp
         l1TQlBURbKaTaOGexODpK1f9Yj0T4bQOOp7rqmZQZTQScWJaN65wk3BJkvNh9JYd3UvU
         HhaHISmHa2QweDnvOogoxKI19YJDZ+tkQY5pXrVRYiUGTvHeZaBA6iQJ867RUkO0yLCm
         duf1iAYx41AIWWraKQ8Itn31moke7NZUWHlNy/hh6MUdTdlDIALK2910Rwv6PpBwUf6g
         MItqqanuTxOsNmL3EkkyXNIcgWTlvIRLW5jlPv3JABK4ceKrpAGgQl76YYxa+yew7TNa
         /IzA==
X-Gm-Message-State: AOJu0YxBirhjyyfJYOgTI8+Ww+AcAM3/D9kRjubmZctIghp+s0Q9TBED
	TC4zERfBG58URwddjmNSiM3Y5skSTfZLrfLebHsxLv7rBzVCbh86qIkOPx2JlA==
X-Gm-Gg: AR+sD13yRbirwl8vn3fdXx6ClQB8L4CW1UnoO6SypzC6UnD7c80j3dFzwxoFN98AJFa
	xqYVyXuUuSp/GILwPjZ5y2SM12doZCNwTRdkI6jeRHwVEdH9XJkF2czyky+BdMTwleluNfJwQrf
	h7RJvslIx5t6LKl4htGX9VaeL+Xrz0bGS/UCz9ihRBK43zjtssXGEdfoaMGoXb5q2cx5pgxFjIb
	Pe/r5SCSrSqzzK905jat1FhaJ+uCrNjxfDyo6cPWSzT90jYVe4Qos703TdrDIz26jQfhZ0Xv/rI
	NxDB/Cm1oXhhlScArtOWRPUOzChEL0oNXokuZiHox12GcHp+qqBQ36vMbF++SDs/hXDnpFnHmTj
	birQ5mR/dUD3JYWx3lnUQUPq5TwjfLS3fkCrJRPhXADAT+MHibiTiWE+U9QIDXaBIzFohkThlZJ
	qk54E+yf+alEfGme4iLF953Axhaw==
X-Received: by 2002:a05:6a00:b48:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84e2bbe8f2amr109545b3a.13.1784746677083;
        Wed, 22 Jul 2026 11:57:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17236c6fsm1827827b3a.5.2026.07.22.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:57:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: linux-doc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [RFT PATCH] hwmon: Add support for currX_emergency and inX_emergency attributes
Date: Wed, 22 Jul 2026 11:57:49 -0700
Message-ID: <20260722185749.2313572-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hardware monitoring chips support three alarm levels for current and
voltage measurements. Add support for currX_emergency and inX_emergency
attributes to support such chips.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFT: Waiting for an actual chip driver using the new attributes.

 Documentation/ABI/testing/sysfs-class-hwmon | 26 +++++++++++++++++++++
 Documentation/hwmon/sysfs-interface.rst     |  6 +++++
 drivers/hwmon/hwmon.c                       |  2 ++
 include/linux/hwmon.h                       |  4 ++++
 4 files changed, 38 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index b185bdfc7186..42fd89305101 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -81,6 +81,18 @@ Description:
 		take drastic action such as power down or reset. At the very
 		least, it should report a fault.
 
+What:		/sys/class/hwmon/hwmonX/inY_emergency
+Description:
+		Voltage emergency max value.
+
+		Unit: millivolt
+
+		RW
+
+		If voltage reaches or exceeds this limit, the system is expected
+		to take drastic action such as immediate power down or reset.
+		At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/inY_input
 Description:
 		Voltage input value.
@@ -647,6 +659,20 @@ Description:
 
 		RW
 
+What:		/sys/class/hwmon/hwmonX/currY_emergency
+Description:
+		Current emergency high value.
+
+		Unit: milliampere
+
+		RW
+
+		If a current reaches or exceeds this limit, the system is
+		expected to take drastic action such as immediate power down
+		or reset. At the very least, it should report a fault.
+
+What:		/sys/class/hwmon/hwmonX/inY_input
+
 What:		/sys/class/hwmon/hwmonX/currY_input
 Description:
 		Current input value
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 94e1bbce172a..e8f2a12793af 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -127,6 +127,9 @@ Voltages
 `in[0-*]_crit`
 		Voltage critical max value.
 
+`in[0-*]_emergency`
+		Voltage emergency max value.
+
 `in[0-*]_input`
 		Voltage input value.
 
@@ -332,6 +335,9 @@ Currents
 `curr[1-*]_crit`
 		Current critical high value.
 
+`curr[1-*]_emergency`
+		Current emergency high value.
+
 `curr[1-*]_input`
 		Current input value.
 
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 55a9a3ddd4aa..a07bfe7ac7db 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -621,6 +621,7 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max] = "in%d_max",
 	[hwmon_in_lcrit] = "in%d_lcrit",
 	[hwmon_in_crit] = "in%d_crit",
+	[hwmon_in_emergency] = "in%d_emergency",
 	[hwmon_in_average] = "in%d_average",
 	[hwmon_in_lowest] = "in%d_lowest",
 	[hwmon_in_highest] = "in%d_highest",
@@ -644,6 +645,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max] = "curr%d_max",
 	[hwmon_curr_lcrit] = "curr%d_lcrit",
 	[hwmon_curr_crit] = "curr%d_crit",
+	[hwmon_curr_emergency] = "curr%d_emergency",
 	[hwmon_curr_average] = "curr%d_average",
 	[hwmon_curr_lowest] = "curr%d_lowest",
 	[hwmon_curr_highest] = "curr%d_highest",
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 77a6f2bffcba..2cd433966723 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -134,6 +134,7 @@ enum hwmon_in_attributes {
 	hwmon_in_max,
 	hwmon_in_lcrit,
 	hwmon_in_crit,
+	hwmon_in_emergency,
 	hwmon_in_average,
 	hwmon_in_lowest,
 	hwmon_in_highest,
@@ -156,6 +157,7 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX		BIT(hwmon_in_max)
 #define HWMON_I_LCRIT		BIT(hwmon_in_lcrit)
 #define HWMON_I_CRIT		BIT(hwmon_in_crit)
+#define HWMON_I_EMERGENCY	BIT(hwmon_in_emergency)
 #define HWMON_I_AVERAGE		BIT(hwmon_in_average)
 #define HWMON_I_LOWEST		BIT(hwmon_in_lowest)
 #define HWMON_I_HIGHEST		BIT(hwmon_in_highest)
@@ -178,6 +180,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max,
 	hwmon_curr_lcrit,
 	hwmon_curr_crit,
+	hwmon_curr_emergency,
 	hwmon_curr_average,
 	hwmon_curr_lowest,
 	hwmon_curr_highest,
@@ -199,6 +202,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX		BIT(hwmon_curr_max)
 #define HWMON_C_LCRIT		BIT(hwmon_curr_lcrit)
 #define HWMON_C_CRIT		BIT(hwmon_curr_crit)
+#define HWMON_C_EMERGENCY	BIT(hwmon_curr_emergency)
 #define HWMON_C_AVERAGE		BIT(hwmon_curr_average)
 #define HWMON_C_LOWEST		BIT(hwmon_curr_lowest)
 #define HWMON_C_HIGHEST		BIT(hwmon_curr_highest)
-- 
2.45.2

