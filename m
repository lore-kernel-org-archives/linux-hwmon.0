Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878D2E22B5
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815296; cv=none; b=QwXIH7v6ZY84g/jiAaGP1RNr3qAJbiCrh1JMMrN3N3qRtcGwl/25bObF+Lkfpgde/27/OfqTTfHpcI3YpYu3BZT2V+GhBLHZMwqZAk98sQ2U1yG/sLjtLP4cYN7IFk66UHUQWzske/gv3gSABPgS8+iU/1rwnH7/8lA41nX6GFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815296; c=relaxed/simple;
	bh=lQl98MIllF3XpChVsVtAXLxNBhwlbKaUotAUzBmdjfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2mojUGQO1GKKXbIr7CQPnKs9J3x/eaNXztgWY7W4EI6B7D8P7Pp/LpeEBDw8oKqz158M/XZ0fzlIxkohXWsY+aSs5ZoKKiPdyW168JGr4bpkd3gxNgLvuFp7z3BBd1n5pJ41wuieeo7UzuMdv+jj/vJhtxYPf4FQInUpCzs76s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKu8X9lK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKu8X9lK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2373056a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 20:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785815294; x=1786420094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J91D1yCcec2ciy4qu9k1ZmbFCY/xhsjNhqMzj0LPUio=;
        b=QKu8X9lKMRZIvbWv0/J5bdbspsPXULoRe8NaNO1BBC42YbwCh/JcifaC4lIDG6VuUA
         +AC3xHZmgnGIwrmjMClpDyotoMmNy+lpu6g+0VBVS7RT0CER9Jn7mYztN/SaJiBbFvm0
         i/x8xlUbK3T1KRA12j2whWABayv1DBEDmekHAXaPev7ljCEW+cnNMpIgu2DeCEDx+2yv
         nqyXaowv/8dqsDTUEa77TnIO5JBpi9VmR2GkAPcl9mPUjPyZ+aAz2nEE3wGlyFXSZb34
         7hUXsrMn9Ltep6TYsz/silNX+AUSnWraU2citfGeUw75kJ55IGo6yaZTIgsF+AniFhpj
         g4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815294; x=1786420094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J91D1yCcec2ciy4qu9k1ZmbFCY/xhsjNhqMzj0LPUio=;
        b=GN5OqByTWfkjPen3qyJLnBOH0MIouYW/Dg8D7A7J1Zqy0rzCuOc4pJYR0YE38I0TJD
         J/Ec9E2IYYHurNOzYV1EKdOJC9x2xP0S36Y9xsaMnzUzlarWvHpzwYTlLTKG5hXvWspy
         Z/fxdFgnxYAj61b0AKItpH5Ci7sV22ZnG7jykmrVD3K9GQvhhdXlijL089hdPrVwvt42
         C6jUs2DLI5JumRwEaPKlTnTWvAXWr86GduBkqRWAS3ZX57vkqtPOsENZZUAK/t6Vihwd
         Ag+VjxAhWlhbCV9mUC0zXbAFjiPiZWcBKA2Fi7rMIRBZvWYNW0shaatgunMc7Zgw8bPI
         BdHA==
X-Gm-Message-State: AOJu0YxT12ve63Y0ZpubC7LIm/kdp9EZQsxObx3BB6QAxX8foawNdBQ9
	KCaZ6gtDImrHL3US8+7q4yuAGTXf93s8nk3637P2Rk16VX/mZFi2aPVVoA2+SQ==
X-Gm-Gg: AR+sD10QYoGSuI0fgrkz+GG+qMjaceITP9W44rKkDpPR1kCHbn92zln6E9bAI2u0zdM
	ljKJ1h8lVcuOi+S5ogLuXWVZ224rUitEr5THmWrl3Z4VyBs5rJOcizAxIFtS9vP5A6VgNY3PClq
	b7QEORd1YC9b12dCySv4/NQUFYJEmXXjnxpxZCLAhFoUIKKyDN6xPhpXeAYbyRScK6e/ylDra9u
	5EcNziGVnuqusAdEKH+iKGsRAoTUsqWfTSVOGP7XoebiuxRf1qIr6Bsj7Ace3TF7kUhk3RCTp55
	xBXstSC+2nGZ+ajpQbjyHSEHz0TJEZCHq5wtmDsDh8zBXT1lp2yVrWS6AKoQGzLixe1z92bJKO6
	Hp0jVT7nAw0TBnDUasVkrrSEpcfvYMwqHWY6eczZLRq0ZTV1DWt9zbUjq0ZNXeeaQxgR32R50GQ
	trGVScqTlATfo6zZg+A+HJtAfBnOKh0WoLFbIY22I5O/ZuucQkBLC6Mj1US/WZiapGKHPFwcJxt
	5PnQJmKfsnPaKW7deUBT4xv
X-Received: by 2002:a05:6a00:2e93:b0:84e:23a:14ba with SMTP id d2e1a72fcca58-84ee496ea16mr12262211b3a.55.1785815294191;
        Mon, 03 Aug 2026 20:48:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31585sm4509703b3a.3.2026.08.03.20.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 20:48:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>
Subject: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Date: Mon,  3 Aug 2026 20:48:11 -0700
Message-ID: <20260804034811.2385506-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
operations and cast to s16 before being shifted left:

static int corsairpsu_linear11_to_int(const u16 val, const int scale)
{
    ...
    const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
    ...
}

Due to C integer promotion rules, the masked value (which is always
positive) is promoted to a 32-bit integer before the left shift. As a
result, the sign bit is never extended to bit 31 of the promoted integer.

When the device hardware reports a negative temperature in Linear11 format
(such as an ambient temperature probe reporting sub-zero), the negative
mantissa is parsed incorrectly as a massive positive value. For example,
-1 becomes 2047, which scales to 2047 degrees Celsius.

Fix the problem by type casting the result of the left shift operation
to s16.

Another problem is left-shifting of negative values. In C, the result of
left-shifting negative values is undefined. Use a multiplication instead
to avoid the problem.

Also use a local s64 variable to store temporary results, change
the return value type from int to long, and clamp the final value
to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
retaining as much information as possible.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Skip handling right-shift of negative values
    (since it is widely used in the kernel)

 drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 24100519cd83..c437b469de5c 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -137,13 +137,18 @@ struct corsairpsu_data {
 };
 
 /* some values are SMBus LINEAR11 data which need a conversion */
-static int corsairpsu_linear11_to_int(const u16 val, const int scale)
+static long corsairpsu_linear11_to_long(const u16 val, const int scale)
 {
 	const int exp = ((s16)val) >> 11;
-	const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
-	const int result = mant * scale;
+	const int mant = ((s16)((val & 0x7ff) << 5)) >> 5;
+	s64 result = mant * scale;
 
-	return (exp >= 0) ? (result << exp) : (result >> -exp);
+	if (exp >= 0)
+		result *= (int)(1UL << exp);
+	else
+		result >>= -exp;
+
+	return clamp(result, LONG_MIN, LONG_MAX);
 }
 
 /* the micro-controller uses percentage values to control pwm */
@@ -263,13 +268,13 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, l
 	case PSU_CMD_RAIL_AMPS:
 	case PSU_CMD_TEMP0:
 	case PSU_CMD_TEMP1:
-		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000);
+		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000);
 		break;
 	case PSU_CMD_FAN:
-		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
+		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
 		break;
 	case PSU_CMD_FAN_PWM_ENABLE:
-		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
+		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
 		/*
 		 * 0 = automatic mode, means the micro-controller controls the fan using a plan
 		 *     which can be modified, but changing this plan is not supported by this
@@ -283,12 +288,12 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, l
 			*val = 2;
 		break;
 	case PSU_CMD_FAN_PWM:
-		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
+		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
 		*val = corsairpsu_dutycycle_to_pwm(*val);
 		break;
 	case PSU_CMD_RAIL_WATTS:
 	case PSU_CMD_TOTAL_WATTS:
-		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000000);
+		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000000);
 		break;
 	case PSU_CMD_TOTAL_UPTIME:
 	case PSU_CMD_UPTIME:
-- 
2.45.2

