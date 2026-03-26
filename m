Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16B3A5E82;
	Thu, 26 Mar 2026 19:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552971; cv=pass; b=G10bm+xqy2ORA+6OW+kc8gBqhtFT66hrugP7VMEUsAoFhOl6iTv0LsGy4WGWL4C2LFNSedgBuegjDIwNuo+QrYy4YkV2aCCiykiqzZpxItqJ4ceQe2RimDM3kMBCgP/lR7r2USyrlOfXd7Bx4HCu7waJIBBpfoKRmd9jP2TGI1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552971; c=relaxed/simple;
	bh=YQ2TsDAXwhLYKHSU70OsI0vAnNLbCizNN03jzBterjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m09K2Iw83G0XcGaOYkBeu/g6zTmsgcFNDwoP1B+tp36zxQI9HaaP11ZccQiwtskpIjCDHFLp/j3GAbbnZnkqWPOBOv6sYBU4n7NzDPCK1rp2av/1AwbmQzTVH1jj/3ex29HIOycK/m8DU1jt1M+Pkhr494Y4QLyJNP4bt3hA9mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=moJgVtnS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="moJgVtnS"
ARC-Seal: i=1; a=rsa-sha256; t=1774552952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MItXoy2w4CAbazyxo/w6mTl3q50M/VHpERN+jUUQYE1PbV7xn2odw0gXyROTeagBvvXOAaef+T7UEDU4gEdPRg2MyYShlrPPYkwULb2WdFQAqH9x7fpu/WMmqiKKN3cb8lb/BQD8ebYq3BAbYI8wFILMsyhlzKs3iTAyENgOsFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KABKeWXmWNy6xZq4X48vkXEBYxA09Dc1PuIQoMMCq5A=; 
	b=Gan1W6gnqmKSPOcD9Ez4QvednztXkKTsWs3AdMYEPeZT68vEJ05/dIVx+1AEhv9ig310zUdILLxWsOCZwPMhL1Ov/JwSMY59ImyFMNgSvIQKbFp0+3GO5oKZu7GxLWxkikLuS/ZK10Z1sjc11FOpALnG/VMscTyx8lqh4G20SdY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552952;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KABKeWXmWNy6xZq4X48vkXEBYxA09Dc1PuIQoMMCq5A=;
	b=moJgVtnSP2koK1UkqU986ubo02wK+gfnIqJTbg498RHhAALiraXEfUJxmPohFoz/
	kvQkE5y6VHy2a6oqssBYmPfJ/6mt1DgbiBoS65f6WsOw2+ZMyvmChsyJKFljSNn1wnk
	M0IOJQzml3S1z57D0uRBMOiK6qSeokrKhtv7JQYplyGdyIjWDyoNm+94nwzByOh2gFK
	PSIS8uky2oDFf2T2Hb4peiHRmYnqCtWBTJ6TripxR0fvKvF7U95sv2H9wY0DzFS4q59
	2vJmWE/q4cqu3AFUTTJGwbNFBsx0DukqMATuwtpJzdpEN9wID+8yJ7gtgD4vGbikQa3
	u3rz+iJLSw==
Received: by mx.zohomail.com with SMTPS id 1774552951116471.509015632529;
	Thu, 26 Mar 2026 12:22:31 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 27 Mar 2026 03:19:51 +0800
Subject: [PATCH 2/4] hwmon: New helper module for floating-point to integer
 conversions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-b4-hwmon-witrn-v1-2-8d2f1896c045@rong.moe>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
In-Reply-To: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-ad80c
X-ZohoMailClient: External

Some devices report sensor values in IEEE-754 float (binary32) format.
Their drivers must perform floating-point number to integer conversions
to provide hwmon channels. Meanwhile, some of these devices also report
accumulative float values, and simple division or multiplication turns
them into useful hwmon channel.

Add a new helper module called "hwmon-fp" with float-to-s64/long
conversion, multification and division methods, so that these devices
can be supported painlessly.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/hwmon/Kconfig    |   3 +
 drivers/hwmon/Makefile   |   1 +
 drivers/hwmon/hwmon-fp.c | 262 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/hwmon-fp.h | 212 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 478 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 328867242cb3..7ad909033e79 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -25,6 +25,9 @@ menuconfig HWMON
 
 if HWMON
 
+config HWMON_FP
+	tristate
+
 config HWMON_VID
 	tristate
 
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5833c807c688..6dba69f712be 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_HWMON)		+= hwmon.o
+obj-$(CONFIG_HWMON_FP)		+= hwmon-fp.o
 obj-$(CONFIG_HWMON_VID)		+= hwmon-vid.o
 
 # ACPI drivers
diff --git a/drivers/hwmon/hwmon-fp.c b/drivers/hwmon/hwmon-fp.c
new file mode 100644
index 000000000000..2ad636129a0c
--- /dev/null
+++ b/drivers/hwmon/hwmon-fp.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Floating-point number to integer conversions
+ *
+ * Currently, only float (binary32) is supported.
+ *
+ * Copyright (c) 2026 Rong Zhang <i@rong.moe>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+
+#include "hwmon-fp.h"
+
+#define FLOAT_SIGN_MASK			BIT(31)
+#define FLOAT_EXPONENT_MASK		GENMASK(30, 23)
+#define FLOAT_MANTISSA_MASK		GENMASK(22, 0)
+#define FLOAT_EXPONENT_OFFSET		127
+#define FLOAT_FRACTION_Q		23
+#define FLOAT_IMPLICIT_BIT		BIT(23)
+
+#define HWMON_FP_SCALE_MAGNIFY_SHIFT_L	6
+
+struct float_struct {
+	u32 significand;
+	s16 shift_r;		/* = Q - exponent */
+	bool sign;
+	bool inf;		/* See below. */
+};
+
+/*
+ * The sign of a floating-point number carries significant information,
+ * return a saturated value for infinity so its sign is retained.
+ */
+static inline int hwmon_fp_infinity_to_s64(bool sign, s64 *val)
+{
+	*val = sign ? S64_MIN : S64_MAX;
+	return 0;
+}
+
+static int hwmon_fp_parse_float(u32 flt, struct float_struct *fs)
+{
+	u32 mantissa = FIELD_GET(FLOAT_MANTISSA_MASK, flt);
+	u8 exponent = FIELD_GET(FLOAT_EXPONENT_MASK, flt);
+	bool sign = FIELD_GET(FLOAT_SIGN_MASK, flt);
+
+	if (unlikely(exponent == FLOAT_EXPONENT_MASK >> FLOAT_FRACTION_Q)) {
+		if (mantissa != 0) /* NaN */
+			return -EINVAL;
+
+		/* Infinity */
+		fs->significand = HWMON_FP_FLOAT_SIGNIFICAND_MAX; /* Distinguish from fs(zero). */
+		fs->shift_r = 0;
+		fs->sign = sign;
+		fs->inf = true;
+
+		return 0;
+	}
+
+	fs->sign = sign;
+	fs->inf = false;
+
+	if (likely(exponent != 0)) {
+		/* Normal */
+		fs->significand = (FLOAT_IMPLICIT_BIT | mantissa);
+		fs->shift_r = FLOAT_FRACTION_Q - (exponent - FLOAT_EXPONENT_OFFSET);
+	} else if (unlikely(mantissa != 0)) {	/* exponent == 0 && mantissa != 0 */
+		/* Subnormal */
+		fs->significand = mantissa;
+		fs->shift_r = FLOAT_FRACTION_Q - (1 - FLOAT_EXPONENT_OFFSET);
+	} else {				/* exponent == 0 && mantissa == 0 */
+		/* Zero */
+		fs->significand = 0; /* Only fs(zero) has fs->significand == 0. */
+		fs->shift_r = 0;
+	}
+
+	return 0;
+}
+
+static int hwmon_fp_raw_to_s64(u64 significand, int shift_r, bool sign, s64 *val)
+{
+	u64 temp;
+
+	if (unlikely(shift_r >= 64) || significand == 0) {
+		*val = 0;
+		return 0;
+	}
+
+	if (shift_r < 0) {
+		/*
+		 * Left shift:
+		 *
+		 *   (significand * 2^-Q) * 2^exponent
+		 * = significand * 2^(exponent - Q)
+		 * = significand * 2^-shift_r
+		 * = significand << -shift_r
+		 */
+		shift_r = -shift_r;
+		temp = significand << shift_r;
+
+		if (unlikely(temp >> shift_r != significand))
+			return hwmon_fp_infinity_to_s64(sign, val);
+	} else if (shift_r == 0) {
+		temp = significand;
+	} else { /* shift_r > 0 */
+		/*
+		 * Right shift:
+		 *
+		 *   (significand * 2^-Q) * 2^exponent
+		 * = significand / 2^(Q - exponent)
+		 * = significand / 2^shift_r
+		 * = significand >> shift_r
+		 */
+		temp = significand >> shift_r;
+
+		/* Round to nearest. */
+		temp += !!(significand & BIT_U64(shift_r - 1));
+	}
+
+	if (unlikely((s64)temp < 0))
+		return hwmon_fp_infinity_to_s64(sign, val);
+
+	*val = (sign ? -1 : 1) * (s64)temp;
+	return 0;
+}
+
+static int __hwmon_fp_float_to_s64_unsafe(const struct float_struct *fs, u32 scale, s64 *val)
+{
+	if (unlikely(fs->inf))
+		return hwmon_fp_infinity_to_s64(fs->sign, val);
+
+	return hwmon_fp_raw_to_s64((u64)scale * (u64)fs->significand,
+				   fs->shift_r, fs->sign, val);
+}
+
+int hwmon_fp_float_to_s64_unsafe(u32 flt, u32 scale, s64 *val)
+{
+	struct float_struct fs;
+	int ret;
+
+	ret = hwmon_fp_parse_float(flt, &fs);
+	if (ret)
+		return ret;
+
+	return __hwmon_fp_float_to_s64_unsafe(&fs, scale, val);
+}
+EXPORT_SYMBOL_GPL(hwmon_fp_float_to_s64_unsafe);
+
+static int __hwmon_fp_mul_to_s64_unsafe(const struct float_struct *fs1,
+					const struct float_struct *fs2,
+					u32 scale_ntz, ulong scale_ctz, s64 *val)
+{
+	bool sign = fs1->sign ^ fs2->sign;
+	u64 scaled_significand;
+	int shift_r;
+
+	if (unlikely((fs1->inf && fs2->significand == 0) || (fs1->significand == 0 && fs2->inf)))
+		return -EINVAL;
+
+	if (unlikely(fs1->inf || fs2->inf))
+		return hwmon_fp_infinity_to_s64(sign, val);
+
+	if (fs1->significand == 0 || fs2->significand == 0) {
+		*val = 0;
+		return 0;
+	}
+
+	/*
+	 *   scale_ntz * 2^scale_ctz * significand1 * 2^-shift_r1 * significand2 * 2^-shift_r2
+	 * = scale_ntz * significand1 * significand2 * 2^-(shift_r1 + shift_r2 - scale_ctz)
+	 * = (scale_ntz * significand1 * significand2) >> (shift_r1 + shift_r2 - scale_ctz)
+	 */
+	scaled_significand = (u64)scale_ntz * (u64)fs1->significand * (u64)fs2->significand;
+	shift_r = fs1->shift_r + fs2->shift_r - scale_ctz;
+
+	return hwmon_fp_raw_to_s64(scaled_significand, shift_r, sign, val);
+}
+
+int hwmon_fp_mul_to_s64_unsafe(u32 flt1, u32 flt2, u32 scale, ulong scale_ctz, s64 *val)
+{
+	struct float_struct fs1, fs2;
+	int ret;
+
+	ret = hwmon_fp_parse_float(flt1, &fs1) || hwmon_fp_parse_float(flt2, &fs2);
+	if (ret)
+		return ret;
+
+	return __hwmon_fp_mul_to_s64_unsafe(&fs1, &fs2, scale, scale_ctz, val);
+}
+EXPORT_SYMBOL_GPL(hwmon_fp_mul_to_s64_unsafe);
+
+static int __hwmon_fp_div_to_s64_unsafe(const struct float_struct *fs1,
+					const struct float_struct *fs2,
+					u32 scale, bool div0_ok, s64 *val)
+{
+	bool sign = fs1->sign ^ fs2->sign;
+	u64 scaled_significand;
+	int shift_r;
+
+	if (unlikely(fs1->inf && fs2->inf))
+		return -EINVAL;
+
+	if (fs2->significand == 0) {
+		if (div0_ok) {
+			*val = 0;
+			return 0;
+		}
+		return -EINVAL;
+	}
+
+	if (unlikely(fs1->inf))
+		return hwmon_fp_infinity_to_s64(sign, val);
+
+	if (unlikely(fs2->inf) || fs1->significand == 0) {
+		*val = 0;
+		return 0;
+	}
+
+	/*
+	 * Make the dividend as large as possible to improve accuracy, otherwise
+	 * the divide-and-right-shift procedure may produce an inaccurate result.
+	 *
+	 *   scale * (significand1 * 2^-shift_r1) / (significand2 * 2^-shift_r2)
+	 * = scale * 2^6 * 2^-6 * (significand1 * 2^-shift_r1) / (significand2 * 2^-shift_r2)
+	 * = (((scale * 2^6) * significand1) / significand2) * 2^-(shift_r1 - shift_r2 + 6)
+	 * = (((scale << 6) * significand1) / significand2) >> (shift_r1 - shift_r2 + 6)
+	 *
+	 * This will never overflow: (2^32 - 1) * 2^6 * (2^24 - 1) < (2^62 - 1).
+	 */
+	scaled_significand = ((u64)scale << HWMON_FP_SCALE_MAGNIFY_SHIFT_L) * (u64)fs1->significand;
+	scaled_significand =
+		(scaled_significand + (u64)fs2->significand / 2) / (u64)fs2->significand;
+
+	shift_r = fs1->shift_r - fs2->shift_r + HWMON_FP_SCALE_MAGNIFY_SHIFT_L;
+
+	return hwmon_fp_raw_to_s64(scaled_significand, shift_r, sign, val);
+}
+
+int hwmon_fp_div_to_s64_unsafe(u32 flt1, u32 flt2, u32 scale, bool div0_ok, s64 *val)
+{
+	struct float_struct fs1, fs2;
+	int ret;
+
+	ret = hwmon_fp_parse_float(flt1, &fs1) || hwmon_fp_parse_float(flt2, &fs2);
+	if (ret)
+		return ret;
+
+	return __hwmon_fp_div_to_s64_unsafe(&fs1, &fs2, scale, div0_ok, val);
+}
+EXPORT_SYMBOL_GPL(hwmon_fp_div_to_s64_unsafe);
+
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
+MODULE_DESCRIPTION("hwmon floating-point number to integer conversions");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/hwmon-fp.h b/drivers/hwmon/hwmon-fp.h
new file mode 100644
index 000000000000..55d6a5021535
--- /dev/null
+++ b/drivers/hwmon/hwmon-fp.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Floating-point number to integer conversions
+ *
+ * Copyright (c) 2026 Rong Zhang <i@rong.moe>
+ */
+
+#ifndef __HWMON_FP_H__
+#define __HWMON_FP_H__
+
+#include <asm/bitsperlong.h>
+#include <linux/bug.h>
+#include <linux/build_bug.h>
+#include <linux/compiler.h>
+#include <linux/limits.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+int hwmon_fp_float_to_s64_unsafe(u32 flt, u32 scale, s64 *val);
+int hwmon_fp_mul_to_s64_unsafe(u32 flt1, u32 flt2, u32 scale_ntz, ulong scale_ctz, s64 *val);
+int hwmon_fp_div_to_s64_unsafe(u32 flt1, u32 flt2, u32 scale, bool div0_ok, s64 *val);
+
+#define HWMON_FP_FLOAT_SIGNIFICAND_BITS	24
+#define HWMON_FP_FLOAT_SIGNIFICAND_MAX	BIT(HWMON_FP_FLOAT_SIGNIFICAND_BITS)
+
+#define HWMON_FP_MUL_SCALE_MAX		BIT(64 - HWMON_FP_FLOAT_SIGNIFICAND_BITS * 2)
+
+static inline int __hwmon_fp_check_scale(u32 scale)
+{
+	return WARN_ON(scale <= 0) ? -EINVAL : 0;
+}
+
+#define hwmon_fp_check_scale(scale)				\
+	__builtin_choose_expr(__is_constexpr(scale),		\
+			      BUILD_BUG_ON_ZERO((scale) <= 0),	\
+			      __hwmon_fp_check_scale(scale))
+
+#define HWMON_FP_SCALE_IN	MILLI	/* millivolt		 (mV) */
+#define HWMON_FP_SCALE_TEMP	MILLI	/* millidegree Celsius	(m°C) */
+#define HWMON_FP_SCALE_CURR	MILLI	/* milliampere		 (mA) */
+#define HWMON_FP_SCALE_POWER	MICRO	/* microWatt		 (uW) */
+#define HWMON_FP_SCALE_ENERGY	MICRO	/* microJoule		 (uJ) */
+
+/**
+ * hwmon_fp_float_to_s64() - Convert a float (binary32) number into a signed
+ * 64-bit integer.
+ * @flt:	Float (binary32) number.
+ * @scale:	Scale factor.
+ * @val:	Pointer to store the converted value.
+ *
+ * Special case:
+ *             inf -> S64_MAX or S64_MIN
+ *             NaN -> -EINVAL;
+ *      (overflow) -> S64_MAX or S64_MIN
+ *     (underflow) -> 0
+ *
+ * Return: 0 on success, or an error code.
+ */
+#define hwmon_fp_float_to_s64(flt, scale, val)		\
+	(hwmon_fp_check_scale(scale) ||			\
+	 hwmon_fp_float_to_s64_unsafe(flt, scale, val))
+
+/*
+ * Handling multification is very tricky, as large scale factors must not lead
+ * to overflow. Fortunately, cutting off all trailing zeros and restoring them
+ * while right shifting is enough reduce the scale factor used in
+ * multiplication to a small enough value.
+ */
+static inline int __hwmon_fp_mul_to_s64(u32 flt1, u32 flt2, u32 scale, s64 *val)
+{
+	ulong scale_ctz;
+
+	if (WARN_ON(scale <= 0))
+		return -EINVAL;
+
+	scale_ctz = __ffs(scale);
+	scale >>= scale_ctz;
+
+	if (WARN_ON(scale >= HWMON_FP_MUL_SCALE_MAX))
+		return -EINVAL;
+
+	return hwmon_fp_mul_to_s64_unsafe(flt1, flt2, scale, scale_ctz, val);
+}
+
+#define __hwmon_fp_mul_to_s64_const(flt1, flt2, scale, val)			\
+({										\
+	u32 _scale_ntz = (scale);						\
+	ulong _scale_ctz;							\
+										\
+	BUILD_BUG_ON(_scale_ntz <= 0);						\
+										\
+	_scale_ctz = __builtin_ctzl(_scale_ntz);				\
+	_scale_ntz >>= _scale_ctz;						\
+										\
+	BUILD_BUG_ON(_scale_ntz >= HWMON_FP_MUL_SCALE_MAX);			\
+										\
+	hwmon_fp_mul_to_s64_unsafe(flt1, flt2, _scale_ntz, _scale_ctz, val);	\
+})
+
+/**
+ * hwmon_fp_mul_to_s64() - Multiply two float (binary32) numbers and convert the
+ * product into a signed 64-bit integer.
+ * @flt1:	Multiplicand stored in float (binary32) format.
+ * @flt2:	Multiplier stored in float (binary32) format.
+ * @scale:	Scale factor.
+ * @val:	Pointer to store the product.
+ *
+ * Calculate @scale * @flt1 * @flt2.
+ *
+ * Special case:
+ *     0 * inf -> -EINVAL
+ *     x * inf -> S64_MAX or S64_MIN
+ *     x *   0 -> 0
+ *
+ * Return: 0 on success, or an error code.
+ */
+#define hwmon_fp_mul_to_s64(flt1, flt2, scale, val)			\
+	__builtin_choose_expr(__is_constexpr(scale),			\
+		__hwmon_fp_mul_to_s64_const(flt1, flt2, scale, val),	\
+		__hwmon_fp_mul_to_s64(flt1, flt2, scale, val))
+
+/**
+ * hwmon_fp_div_to_s64() - Divide two float (binary32) numbers and convert the
+ * quotient into a signed 64-bit integer.
+ * @flt1:	Dividend stored in float (binary32) format.
+ * @flt2:	Divisor stored in float (binary32) format.
+ * @scale:	Scale factor.
+ * @div0_ok:	If true, return 0 when @flt2 is 0. Otherwise, -EINVAL is returned.
+ * @val:	Pointer to store the quotient.
+ *
+ * Calculate @scale * (@flt1 / @flt2).
+ *
+ * Special case:
+ *     inf / inf -> -EINVAL
+ *     inf /   x -> S64_MAX or S64_MIN
+ *       x /   0 -> See div0_ok
+ *       x / inf -> 0
+ *       0 /   x -> 0
+ *
+ * Return: 0 on success, or an error code.
+ */
+#define hwmon_fp_div_to_s64(flt1, flt2, scale, div0_ok, val)		\
+	(hwmon_fp_check_scale(scale) ||					\
+	 hwmon_fp_div_to_s64_unsafe(flt1, flt2, scale, div0_ok, val))
+
+#if BITS_PER_LONG == 64
+
+static_assert(sizeof(long) == sizeof(s64));
+
+static inline long hwmon_fp_s64_to_long(s64 val64)
+{
+	return val64;
+}
+
+# define hwmon_fp_float_to_long(flt, scale, val) \
+	hwmon_fp_float_to_s64(flt, scale, (s64 *)val)
+# define hwmon_fp_div_to_long(flt1, flt2, scale, div0_ok, val) \
+	hwmon_fp_div_to_s64(flt1, flt2, scale, div0_ok, (s64 *)val)
+# define hwmon_fp_mul_to_long(flt1, flt2, scale, val) \
+	hwmon_fp_mul_to_s64(flt1, flt2, scale, (s64 *)val)
+
+#else /* BITS_PER_LONG == 64 */
+
+static inline long hwmon_fp_s64_to_long(s64 val64)
+{
+	if (unlikely(val64 > LONG_MAX))
+		return LONG_MAX;
+	else if (unlikely(val64 < LONG_MIN))
+		return LONG_MIN;
+	else
+		return val64;
+}
+
+# define hwmon_fp_float_to_long(flt, scale, val)		\
+({								\
+	s64 _val64;						\
+	int _ret;						\
+								\
+	_ret = hwmon_fp_float_to_s64(flt, scale, &_val64);	\
+	if (!_ret)						\
+		*(val) = hwmon_fp_s64_to_long(_val64);		\
+								\
+	_ret;							\
+})
+
+# define hwmon_fp_div_to_long(flt1, flt2, scale, div0_ok, val)			\
+({										\
+	s64 _val64;								\
+	int _ret;								\
+										\
+	_ret = hwmon_fp_div_to_s64(flt1, flt2, scale, div0_ok, &_val64);	\
+	if (!_ret)								\
+		*(val) = hwmon_fp_s64_to_long(_val64);				\
+										\
+	_ret;									\
+})
+
+# define hwmon_fp_mul_to_long(flt1, flt2, scale, val)		\
+({								\
+	s64 _val64;						\
+	int _ret;						\
+								\
+	_ret = hwmon_fp_mul_to_s64(flt1, flt2, scale, &_val64);	\
+	if (!_ret)						\
+		*(val) = hwmon_fp_s64_to_long(_val64);		\
+								\
+	_ret;							\
+})
+
+#endif /* BITS_PER_LONG == 64 */
+
+#endif /* __HWMON_FP_H__ */

-- 
2.53.0

