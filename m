Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F133EB1A
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 23:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799210; cv=none; b=QnrWi/R3vKIaOP9hc8sExUhqGDtqd0cO2lATpHlYmDaebI6rw7dJFw/jeyxXRAL2+9dpz/f1iyV/5ckZ4KoUEMs1GDy6HfoeLriB5e3Dt1AjNY/9MX6SSjP+hwsKCW3zxNOk0sCEniXUsg8c/L0Z/Ia80YG+jR39IK7XcVKGVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799210; c=relaxed/simple;
	bh=4nSTOZVDCmB4FQT3lzfHAt+C8Yc2O78jJwogX1CQDvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPtVElzssYC8b/MnUwVuL09mmHQjqhLf/iCCdAYE1FPoWLqbCdRQbyuFM+6eDDKGrbQqGiUirde2wTNpA75IK9+uz7/qu9LifFJCrKfvo7tA7U5AG3vNNwIA1wDz8GvZYfNhDPK8MZrtj2/08OiEFUgBiFWkgG+NVSuG/0mPg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg9A46gF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg9A46gF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca80d708489so287912a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 16:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785799208; x=1786404008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bk/RTbqRUN7b1QvHTQpflOw5qnn6RjiCRpdmNegGUQ=;
        b=cg9A46gFE8+pII9YYEWeeDxgX8k+elRcOM91OCwrnGd0Qm9GJ22ki6PHW81CIZXlhW
         Z0QMIwZe32KiEHcteQccxGxB4EisN/hy/fgreMUxHaWsJt05CEnoNYKAum6MMVSJ9JZg
         mS/tLyWiwuX2iAorELbi2syfHglHnpezFXcQK5x3ePdjew4SJ7SkR4VAPtskabkPdaXm
         XrC3aOo/CONEIy6/mPocdtVm8RC9D7gXUaxDKrFaEtBOQeVWpYPOzgNQOlhTeAjouQqp
         c94Jrx0ffVSUQXg3qksDTNeyMltj3HJOgu8/TOPJmQqZ99TMkltf25aQxgYfIrstrEPa
         Rl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799208; x=1786404008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bk/RTbqRUN7b1QvHTQpflOw5qnn6RjiCRpdmNegGUQ=;
        b=IyVYCbrbIBEyNmoIwCLgVGAzredfrmgA1WjwBSIoU9i/u7t0ATOaNxb6EcnAmulG+L
         wrWemBklhrbkYrbpGY2xrerTb+8Y/aOKqfRoZhX3QXu2AFobLLiBIJIUyPDOxcjQnRK+
         Ulm3YuTF5RAK9K5iYbYQWDXNAYCxOR85GtUK2mpu8W+yKHslSPW9UR4KFh9gv9MBYldz
         8apmn/Ojh21DGuK7luvL4PebkqyjVVkDxfLQvu2TTbGaFRqJoCfjzjBwbdt0pvOxyaOc
         GWcqD5nR+vUVCiap3LDHHTZ+98UWZtwLZAldYANdJmqn0jP6c+xC6as42mtMXC3TMlao
         hOcQ==
X-Gm-Message-State: AOJu0Yz6YYX42IaWg/w48mDsubx7ucMPypah/2TAp9QrXie8pRFiksMI
	nol4NMEZhYNHiexIi0ZeM/Ie60xPzpEoXaGtBJwkYsNM8EkmK61CfNlWL/25Lw==
X-Gm-Gg: AR+sD101UiqWzqj7bFgvrEyQ2f2rWmY6JCYbCLHFPyYDqY14W/lGa/srU3lPoIvvlW+
	aoX+1CSuaKmg3T40aWY5Wli1BhEEiitpJnAm1QiWjKHYc7zcCtZmAni6U3JWGvRo7y3rAwyD04H
	l4T95O2EzCwrf8TtWAPg4ua9jarkeCBm7ntyrYsxTyllE7aAeNmf2LagCAKvhnGvKkj83p3ajNi
	7XiyI/8X3iaAe3bpKmWJ+we00OaKRulvlMfyhSyZnjfTEbheWt16LPHZEt7h98CpVl+IRdXzc/F
	isdexbGbGhdj4IOO/tCkoiiRZSXSvipyAk1JAiJq2M5Y45CZMd2TYAg83Hz529sQlXYWXAa5T24
	BRIetAN12qS10yv9YnPVvih7iV5KbSbjrqHVnxycMJzCd4bJZvuuGAh8K3jHvGjr3ZE4bzGBEdH
	ZPwOjvjhBcnqJ8ikRD+OZQz9jIgYr5WlGytm5iATR4Xme5kzY0/icqks9+gJhW6lnj5UrWD8eC9
	w==
X-Received: by 2002:a05:6a20:e291:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3cb6c9c13c0mr1238181637.23.1785799208131;
        Mon, 03 Aug 2026 16:20:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4fdb80sm33374849c88.15.2026.08.03.16.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:20:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (corsair-psu) Fix linear11 calculation
Date: Mon,  3 Aug 2026 16:20:05 -0700
Message-ID: <20260803232005.2339611-1-linux@roeck-us.net>
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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

