Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D029BD9C;
	Fri,  5 Sep 2025 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104935; cv=none; b=LWGf3NlwFnNPi/NghTZGkB8oLUAaMTGw613kNiOnDx7UQVB0lN3O1Zd1zOyl5ak8JFBjth0Lbx4KbNep+ou/BVkufumaQhOt6aEPpxFlzaBbbuMAZE51GWpN4BxNcrD07aVNx46MXNH0GzkxUuOm0DTJgzroxYv/7ZRgiV14E6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104935; c=relaxed/simple;
	bh=b7jJaTy0UYnvpX0WEZjZOFy5SCjZ3X1vu+p01EXxDr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eb+D5kih9aplbgFCMY6+K4ShClf3moMzv1pu4W78F2ZCHj0l9dkqgCY+LP3jKDjqSrSmPMJHPVTGyy4njdJSOrCCC8AEL2TS0VcNzBJvHygC3UEOT1ojrarYflQaqUBtkh/gSGu0q4LezOSNbk5hiZhtc8VHrUeQvVdErDXhgGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMbKm+Wq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMbKm+Wq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77246079bc9so3149190b3a.3;
        Fri, 05 Sep 2025 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104933; x=1757709733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f08ZW0lFqHRFeqWhpKCn8QLfaieHO03nOZjcX5BGg8=;
        b=ZMbKm+Wqbn5umzzggY+qAmIohDOq8xgSCbrpC033zD6mLCtB/Lm+wItuQfst/HMa3f
         VeGM2igmScUldbjOecWZUGWNRTno6mUsdOQc992WcpDZhjMNY98gVYJBIE3EiD/ixU+m
         GsvMCo6H58P7zwAXggxJtB8Ki/A596rrJfloUY+2P+JDw2x9QfptFY8atcYDMy+Hjw0z
         tqT1IP2bPCjAgCthvHi/iO9yaljf/XoxfQT4kST2tzuG0e/J78ff1f1+dvsrUTpq6ONj
         Tv1ZH1s/S9zE7zXbUeZCBQxHJrm0Y5JW8V0qy1391l/IyVopR41K8V1j9MPTAxKHhHp0
         rovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104933; x=1757709733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f08ZW0lFqHRFeqWhpKCn8QLfaieHO03nOZjcX5BGg8=;
        b=gAITPlrID5sRyhgn4R9YY34XjlFIXPAUGj3fl+a2Cu7Z/4a193F1NeeyRhF0vHUxkg
         EA942VZGmc8gUV6Ik2JLMNrynC8vCgn1UrgQEVuK/aztslK6qkjXrA+X89c7QM0a7emF
         BB2WF1pkKZAczUbr0jrVCNPAHd1zwp14H9vA3Lo+knUCxvTOV6iKjov9TzwlfjNuI3wR
         z8rGcJmqyZdULcGDvQ0rF2sMBBJ8J/aB45KhBxhFnsE/7KdwckeHl1bfCWIwZ+z1chpJ
         PRr67mgtRx/mJr6kWe3tLSI0WZ0wgEGGezL9/OvCyOE15jNX36KSvbMdpQGF49IjgXdd
         V0xw==
X-Forwarded-Encrypted: i=1; AJvYcCUL9EuoGVlUqrC2FaE5PWj+TEyYsF4jUK5eAuc/G8Tian35iDH9GjEgn5edMc9cskzt3rai0oI/Xxd+@vger.kernel.org
X-Gm-Message-State: AOJu0YynoZoqdqvdkOXTxtQ6B6zm1f5N9AOOtkt9uyF6AvwhoPrzbsTj
	GJhrTmcLmhy9l7VqU10vvPtWGIIqSY5zxebiXCHI1UjStMhTVyARAgYr2zNw7BCD
X-Gm-Gg: ASbGnctIGgReeyj0cABbBs5yhH4EAnpiCC1qWzc9j/Z1oFZ3SffhG1PtVNURDGIJI+f
	JMrypOtPR9vNpugIHcofxWu5KfAYc+9cJ+vn6xZlOc7XqTMjfDVTdM2YI4p0gqoP+H+aQnRNJYm
	vQhIOUC6l5x7ngOZ4Xr8ccdeUIUZyCyfyPIHF0+6kvJJRODYVmtZZ7EqrnQIhZxkQXbqS88toF1
	BD2hIR+wPbvTXTo6gnJfelj9f4MND+IOWmYb8aT1JQT2m5FGTo5i5siP9nn4y4FFMAbSk+AU+4S
	d/aMKHPBNWhlaHZI5pEw4RFwZhZHKEGNO7VaZFOETzhG0M2ZolXLEWqpoUyvAsZJd2lF6KjZ5n5
	VwHseV5tQZHGdDpMUgPhBHV0ni7RlmvxGdAAdXEKSy3OtaY5/lopDNLud
X-Google-Smtp-Source: AGHT+IE1k5wX6Nj6xAgVKOGLhFqBOlWZUwjdJu3tL4Y4zML7pL9vLySMnO9lQfFG4pgJwRwt6GqhFg==
X-Received: by 2002:a05:6a00:1954:b0:772:6f95:f326 with SMTP id d2e1a72fcca58-7742dde2f5cmr108864b3a.10.1757104932829;
        Fri, 05 Sep 2025 13:42:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772810b2ff1sm8152729b3a.89.2025.09.05.13.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/17] hwmon: (ina238) Improve current dynamic range
Date: Fri,  5 Sep 2025 13:41:49 -0700
Message-ID: <20250905204159.2618403-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The best possible dynamic range for current measurements is achieved
if the shunt register value matches the current register value. Adjust
the calibration register as well as fixed and default shunt resistor
values accordingly to achieve this range.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 51 ++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index ae27ae2582f2..c04481a8c643 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -51,7 +51,7 @@
 
 #define INA238_REGISTERS		0x20
 
-#define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
+#define INA238_RSHUNT_DEFAULT		2500	/* uOhm */
 
 /* Default configuration of device on reset. */
 #define INA238_CONFIG_DEFAULT		0
@@ -67,39 +67,26 @@
  * relative to the shunt resistor value within the driver. This is similar to
  * how the ina2xx driver handles current/power scaling.
  *
- * The end result of this is that increasing shunt values (from a fixed 20 mOhm
- * shunt) increase the effective current/power accuracy whilst limiting the
- * range and decreasing shunt values decrease the effective accuracy but
- * increase the range.
+ * To achieve the best possible dynamic range, the value of the shunt voltage
+ * register should match the value of the current register. With that, the shunt
+ * voltage of 0x7fff = 32,767 uV = 163,785 uV matches the maximum current,
+ * and no accuracy is lost. Experiments with a real chip show that this is
+ * achieved by setting the SHUNT_CAL register to a value of 0x1000 = 4,096.
+ * Per datasheet,
+ *  SHUNT_CAL = 819.2 x 10^6 x CURRENT_LSB x Rshunt
+ *            = 819,200,000 x CURRENT_LSB x Rshunt
+ * With SHUNT_CAL set to 4,096, we get
+ *  CURRENT_LSB = 4,096 / (819,200,000 x Rshunt)
+ * Assuming an Rshunt value of 5 mOhm, we get
+ *  CURRENT_LSB = 4,096 / (819,200,000 x 0.005) = 1mA
+ * and thus a dynamic range of 1mA ... 32,767mA, which is sufficient for most
+ * applications. The actual dynamic range is of course determined by the actual
+ * shunt resistor value.
  *
- * The value of the Current register is calculated given the following:
- *   Current (A) = (shunt voltage register * 5) * calibration / 81920
- *
- * The maximum shunt voltage is 163.835 mV (0x7fff, ADC_RANGE = 0, gain = 4).
- * With the maximum current value of 0x7fff and a fixed shunt value results in
- * a calibration value of 16384 (0x4000).
- *
- *   0x7fff = (0x7fff * 5) * calibration / 81920
- *   calibration = 0x4000
- *
- * Equivalent calibration is applied for the Power register (maximum value for
- * bus voltage is 102396.875 mV, 0x7fff), where the maximum power that can
- * occur is ~16776192 uW (register value 0x147a8):
- *
- * This scaling means the resulting values for Current and Power registers need
- * to be scaled by the difference between the fixed shunt resistor and the
- * actual shunt resistor:
- *
- *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
- *
- *  Current (mA) = register value * 20000 / rshunt / 4 * gain
- *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
- *  (Specific for SQ52206)
- *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
- *  Energy (uJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain * 1000
+ * Power and energy values are scaled accordingly.
  */
-#define INA238_CALIBRATION_VALUE	16384
-#define INA238_FIXED_SHUNT		20000
+#define INA238_CALIBRATION_VALUE	4096
+#define INA238_FIXED_SHUNT		5000
 
 #define INA238_SHUNT_VOLTAGE_LSB	5000	/* 5 uV/lsb, in nV */
 #define INA238_BUS_VOLTAGE_LSB		3125000	/* 3.125 mV/lsb, in nV */
-- 
2.45.2

