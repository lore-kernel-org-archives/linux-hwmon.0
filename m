Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DB352014
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799321; cv=none; b=J3a1Bu/dqHt8QmGnZrNdQKpaXPro1EPy8yQTaGCMcaQ5SFyeEf8zPM3KUrV12G9QPd4T5uvzmLNHSZ/Pkcl4lRABhQQ0kYh5wa6OVjDCo9B0ObODh2PAWvKAeYsdW23jfP+kna8tQCVPI+j+EZZnfwukFnaLn4vrAdfQEVrLLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799321; c=relaxed/simple;
	bh=QrzF/BZAEq0HUpSpMjT4L4S/eHXuruqdTDvI6KWLzlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kjj8PUmeuVds4itLhTAD3HwpNVSOTatwlOkmd6Zjacn3ytD7qY1Jbcawh1VFf4TVPgIN266Sw/n5mauMbuc4HO8aZjhonDREWbjXwmmAqa+43Wx1Bta1S2G10FPQ0/u2ShqSWL/a1dkyeV76JlpDDO6YweCJBBUw8BZuPWwZxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SssSdLgj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SssSdLgj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38101f85591so321111a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785799319; x=1786404119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0qYv6zOHZcbUH0bDu4z4YwFsxBhoWoX35EcYcg2qUE=;
        b=SssSdLgjAWhsg/Q5ae7iPu5AT5dFQbsIwkRFR0lm7wdhm6m/FYDEGc3xbPzMvJBGYD
         g/mV5VqE/1z1wJ/Wmg1Zao+FUZmbGOayBqgtVSUM0Pb/i1EHHl5KTeqT0C4cz3ugKUWF
         Eg19rBGObZb/f9OzIR88TqqIAQmhl1xNxQfUJ742HCBjSvvRhSDdHISRN3nOO/K4Eits
         VXjMkqkNpopTGGxPnS5Cvhhl/xu/WqCStsEA/ghImPYiSkGVRATANyqLpwd2zgsM2obA
         awC6J64uknQLE29GyTdahALfWxpuXARykhxfr13J6PnlvsWwao5nEvQzKPwU4eeXbubR
         jf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799319; x=1786404119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0qYv6zOHZcbUH0bDu4z4YwFsxBhoWoX35EcYcg2qUE=;
        b=O9te7l9oMGyejS8trPw0DmniCmDxO/WIHJgwb1f0OGaCB4bJHS/4rY6UNowlp2q1F9
         OSEvyedbpVxiI91ah4fiK4MXzzgeWpO5jGgHdE1zb6PpiZApu0x/xpMVRbAIcznd/LGm
         S+yYrGkIpwD9Rea1bXdDB3cxON6MfkJAaCd2yQzPDhSJDdIcBGmomOmfHbUdU6TkYtWH
         asPq+GiVJD7smq+9zifDWdWbv5JdsoHyT1NlQoWcdjWbSA82qjECZqwV1he59LdNlRlJ
         +VAI+PHOPo8DzEfl1tAfHFxrg8SItGx/32xx1l6vjrNABKXwELylzXTXibJVIPMCWXmd
         Jg5A==
X-Gm-Message-State: AOJu0YwAhMIawdUclaBxyrgDW6wj5Pr0rWHRfcUxxLSmvT1de1WNAvvd
	c0+xeChz90ZjF6n4eJq5QggHLZ5wYDN/+5ZG707kmdkai/4Nmn4lDAmZYnPMGw==
X-Gm-Gg: AR+sD12XUAtVl+OVYe6HDojWC+3RcvHlSK/xR+9yctUtWqv0HW9FtWNwrY9M0XywfKA
	HlHmBPfD2W3dxlZdWUPlLikfK6kJtEWnthykRVyu0k130q2DZfO7E1z4W17S9WzWrJuZgWxDCOI
	FddwCetzxesLBxr1GBmJb5ZOZmyUfDACE1hDii8bqY49bsL4ZRf/33738UJ5kUWvZ7PLh22b1q3
	fdkPhQcaxRR27xY6u1mzpCRCUUXdpwb7LgcYbhKbjp8zZwDEkWA53jGWfWlsi4f605BmCa89p83
	773rnUtmg9wVWbZ+tf7dvucb5ihU023ju7N76NMo3icHNdmuTUjOwHAOPLRYM53G1uog6eRSEk9
	rsKgFhRjVM3NGV6intUGBItwAw/J0IWS4UV2Yy2BIgD+LIAr5/sCSlj9jW+1zhXMtBSp5Gr7I3y
	PTDXl5qVFjSZecSNb8txoG/yyKAvy9wVViY0yU2/FxyFbc2ywxkVkz/eMcA2KmmeCziKB4R1zT8
	GNYOwHKY2A26Q==
X-Received: by 2002:a17:90b:1d4f:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38fedd6601bmr1191935a91.21.1785799318795;
        Mon, 03 Aug 2026 16:21:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab14475asm33727202c88.5.2026.08.03.16.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:21:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>
Subject: [PATCH RESEND] hwmon: (corsair-psu) Fix linear11 calculation
Date: Mon,  3 Aug 2026 16:21:55 -0700
Message-ID: <20260803232156.2340048-1-linux@roeck-us.net>
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

Another problem is shifting of negative values. In C, the result of
left-shifting negative values is undefined, and the result of
right-shifting negative values is implementation dependent. Use
multiply and divide operations instead to avoid both problems.

Also use a local s64 variable to store temporary results, change
the return value type from int to long, and clamp the final value
to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
retaining as much information as possible.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RESEND: Forgot to copy Wilken

 drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 24100519cd83..6e12325e0a3b 100644
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
+		result /= (int)(1UL << -exp);
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

