Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3813542C9
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709081; cv=none; b=MgHz+FW8UGIOvF+Rf1sm4mRcqtrJMYyHjMeCkhvr1DlI56op77vqR+3PstKKOr79mj5rhxt8z53zBbH9Wt+4fgtOr0ekNY0HQiJri8tCevsKDF9LdVQkcoIOZOpLFrR6p2M2vefbuwpgRfWf+G1LGO7NsioNsbRIadz5rNwkmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709081; c=relaxed/simple;
	bh=s0ExOevU/0a1rdHJwbW/G02EvzV9Zu1M8qfhWQppRb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSin3GGcoaDhwo72I7kXrlOn/CoeMrMlL00OyjbX0ZP9xGGyiYWjfsy1HJdDJRqCjgaDtca3jShQcb45VjseZxrGh7qmkotuh+6xHjXkm/tmaaIq8HhJ94N+aBCbUM4lX82Y94tSvkOQts+KZsvx08lnHkF3D8qbEw4PHX/WYSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbNAb+9+; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbNAb+9+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b71320f501so2186472eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 09:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769709078; x=1770313878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8nYEZfVyqhzxzccc2BHbsJR4bGKXZNF54TlWa4+clE=;
        b=GbNAb+9+fNRn9xmmT4W2wracRTTI4KrRs+XgzlxTLTxmEVDC2RmzMO54XLibPHoodg
         L9nSZsghLJOq+qBu10iwp1URnx+JdCOmBDne/cqCTTqzdr4xlqTsYBUde8COBpasyU3e
         v50ZrpQXORC9bb7Qc6kUpspkV+1/yiEmmEa4e5tsiW+xbX0CXxIMdYjryQ78664ddpym
         ffwqgPbRDOWqh3hQG5uBinNmg6qDycQj0nPdsqSI8IXALzqggBs0Pp+onx3QOmXYfHLv
         UKHClhYqKaDPSoMuji0RDvBrV/3WMFM/LHPX9q6NBIiG3ztT4/p+xoebrL3jGvLKKIvn
         RHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769709078; x=1770313878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8nYEZfVyqhzxzccc2BHbsJR4bGKXZNF54TlWa4+clE=;
        b=SykqiIZzEdNPVMV15c/Qru2xabD999Iec3leu/xhxAvno9V0ADGS1LkU5MRzoHISA1
         zLSmcCJt+tIFbv2K9ce9elX5buf+IMcptXtLe8j+21m6fWN5w+9ydl8Yeiab6NgW8QcZ
         XMFpPu24C66HhFqjN5qx7udWmGCNpEW/hpjXt98PDHIjC6Ht5N5AzNSIW+QiuzD4Jv4O
         73AWsH3QyQ2kfEmqODYgNtWWjKVwZ4mA2KflwqnqxIk482CWopWH8XkpHQIxqhpoI9w7
         5dqr92WH34RqBWoQeyeknsGsLAfZ3xNdUfv90IiWfp4weUnfc90GNpgYM4XxD8hnngn/
         PIAg==
X-Gm-Message-State: AOJu0YwfCZUyc002LskguVxX1ngYn7UdyeSvFfRIDKY6h7nq3rOd2Jxf
	rUkAUEWJ3DtFU/vSYUxFXmTz36Z3F5AqMDiwYdzhYtIEdbPLGm3SgT54LfZXLBOG
X-Gm-Gg: AZuq6aL3NW6bZeqH02YRKgbQvr2qGQZ5lwrVT2h3+NteO4BymG8nkvMquR2kvL9SC2G
	IxZyleZGY8YqNcwS83WUeQYIU7g0n5FpWdbhuQeDWifT3imVyZ51a2e7An6ze49YySTfR/7knwn
	5PPXEINtAbcf05GQwVKvQlItWHlA6uefTNDZv36UPjhino5whDWTe+7xY/mIoQzCi5p5RPjrvMS
	JwujqZXCuNSoPvcprQDXSBf7gS2ixyolfQ517MjuZSdwkMy6DH4ACRpjAFbsfOwx7+7TzQjft+C
	WnXygk5jkjDegQk1+izp7XqON2lpClEZ5CFxrofXRmJKNQjUA/zn9uQPA+EANrnm7m8DM9m101d
	FO7ejuV55zqHzunTE+HBChwEw1LweE8L/NEOfHjnPAYjHS0l4+2yX20gBUSMbmvPz48qmDoEO0E
	Fsz1vfgOzXk16jzVV5wUgURcVv
X-Received: by 2002:a05:7301:e24:b0:2ae:5ab4:e932 with SMTP id 5a478bee46e88-2b7c8943fb6mr99337eec.43.1769709078286;
        Thu, 29 Jan 2026 09:51:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1addafesm7962475eec.25.2026.01.29.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:51:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	James Calligeros <jcalligeros99@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH 2/2] hwmon: (macsmc) Fix overflows, underflows, and sign extension
Date: Thu, 29 Jan 2026 09:51:11 -0800
Message-ID: <20260129175112.3751907-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129175112.3751907-1-linux@roeck-us.net>
References: <20260129175112.3751907-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macsmc-hwmon driver experienced several issues related to value
scaling and type conversion:

1. macsmc_hwmon_read_f32_scaled() clipped values to INT_MAX/INT_MIN.
   On 64-bit systems, hwmon supports long values, so clipping to
   32-bit range was premature and caused loss of range for high-power
   sensors. Changed it to use long and clip to LONG_MAX/LONG_MIN.
2. The overflow check in macsmc_hwmon_read_f32_scaled() used 1UL,
   which is 32-bit on some platforms. Switched to 1ULL.
3. macsmc_hwmon_read_key() used a u32 temporary variable for f32
   values. When assigned to a 64-bit long, negative values were
   zero-extended instead of sign-extended, resulting in large
   positive numbers.
4. macsmc_hwmon_read_ioft_scaled() used mult_frac() which could
   overflow during intermediate multiplication. Switched to
   mul_u64_u32_div() to handle the 64-bit multiplication safely.
5. ioft values (unsigned 48.16) could overflow long when scaled
   by 1,000,000. Added explicit clipping to LONG_MAX in the caller.
6. macsmc_hwmon_write_f32() truncated its long argument to int,
   potentially causing issues for large values.

Fix these issues by using appropriate types and helper functions.

Fixes: 785205fd8139 ("hwmon: Add Apple Silicon SMC hwmon driver")
Cc: James Calligeros <jcalligeros99@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>
Cc: Janne Grunau <j@jannau.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/macsmc-hwmon.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
index 40d25c81b443..1500ec2cc9f8 100644
--- a/drivers/hwmon/macsmc-hwmon.c
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -22,6 +22,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/hwmon.h>
+#include <linux/math64.h>
 #include <linux/mfd/macsmc.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -130,7 +131,7 @@ static int macsmc_hwmon_read_ioft_scaled(struct apple_smc *smc, smc_key key,
 	if (ret < 0)
 		return ret;
 
-	*p = mult_frac(val, scale, 65536);
+	*p = mul_u64_u32_div(val, scale, 65536);
 
 	return 0;
 }
@@ -140,7 +141,7 @@ static int macsmc_hwmon_read_ioft_scaled(struct apple_smc *smc, smc_key key,
  * them.
  */
 static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
-					int *p, int scale)
+					long *p, int scale)
 {
 	u32 fval;
 	u64 val;
@@ -162,21 +163,21 @@ static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
 		val = 0;
 	else if (exp < 0)
 		val >>= -exp;
-	else if (exp != 0 && (val & ~((1UL << (64 - exp)) - 1))) /* overflow */
+	else if (exp != 0 && (val & ~((1ULL << (64 - exp)) - 1))) /* overflow */
 		val = U64_MAX;
 	else
 		val <<= exp;
 
 	if (fval & FLT_SIGN_MASK) {
-		if (val > (-(s64)INT_MIN))
-			*p = INT_MIN;
+		if (val > (u64)LONG_MAX + 1)
+			*p = LONG_MIN;
 		else
-			*p = -val;
+			*p = -(long)val;
 	} else {
-		if (val > INT_MAX)
-			*p = INT_MAX;
+		if (val > (u64)LONG_MAX)
+			*p = LONG_MAX;
 		else
-			*p = val;
+			*p = (long)val;
 	}
 
 	return 0;
@@ -195,7 +196,7 @@ static int macsmc_hwmon_read_key(struct apple_smc *smc,
 	switch (sensor->info.type_code) {
 	/* 32-bit IEEE 754 float */
 	case __SMC_KEY('f', 'l', 't', ' '): {
-		u32 flt_ = 0;
+		long flt_ = 0;
 
 		ret = macsmc_hwmon_read_f32_scaled(smc, sensor->macsmc_key,
 						   &flt_, scale);
@@ -214,7 +215,10 @@ static int macsmc_hwmon_read_key(struct apple_smc *smc,
 		if (ret)
 			return ret;
 
-		*val = (long)ioft;
+		if (ioft > LONG_MAX)
+			*val = LONG_MAX;
+		else
+			*val = (long)ioft;
 		break;
 	}
 	default:
@@ -224,7 +228,7 @@ static int macsmc_hwmon_read_key(struct apple_smc *smc,
 	return 0;
 }
 
-static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
+static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, long value)
 {
 	u64 val;
 	u32 fval = 0;
-- 
2.45.2

