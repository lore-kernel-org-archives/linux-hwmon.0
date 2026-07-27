Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ECF3BCD2B
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123321; cv=none; b=Aolu8mrGQUdXYkN66r3HSRIwc3mzcnH6e2w5KJOF4lM6gdXtA5Ypxsi+JDpPrSekjY4B0/d6/+sVQrtErT0NPfpJ0OJi/D8FV5UYRPIRfeIILJI5QtXGFj9zviyTBicP6HcccHEitQw25YiJXSlZyaNpFU46WIJnn3TzdsW1r90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123321; c=relaxed/simple;
	bh=wFnkSUxoYQs64deDm4md1UugE+lxjqSSKbZd1i66CDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TASgpR9U5dHMM7ifBnG4ssjCAJxM2B3Ia+zh1xyAXFfe+A/MsmGngvhrgLDMYQTTsDUykegD7OGhddtnYK6gn063o3lYvw1JpGLfsZV3C54x0Lkdo4a975TKXlBSYBmpKoTAK6xs1aT+8rhEO1Mv57sG59fwjcLi2SNhXANk23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC2x7CPr; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC2x7CPr"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667923d86a7so2997657d50.0
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123319; x=1785728119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qMd5YuwwfiN67Wq+l9yFaJ3wbJ9/YjqS4Jgn0/FeAo=;
        b=EC2x7CPrEJhoI6sSEF8nQ5dX3vOQoMDUPrpfM6jmPSw+IS8o72WT0ku8uDPHGWyrTa
         dzFcAJSjQTy+nSsWyMtHS0I6ekchJX5sVzWMIo7s/WRhIKWlH0nocYgDYRqqhV1UJJ4V
         bR8Hdgc5q3UE8vfwVhrYEmuiA0tVUkzixoGP5kscuPnn9ULknq1hW3gNH/Ybjq5iV0sW
         RXoJep33M+W/rcdYUFrfMDShYfLarRvp21F6nCTlWI2NvCE/v3sYE2KJX3mx0ln08chk
         FY43PlvDpAnTqvfaY0898WQutDc5fJgu9VkxZR7nTB7LiBLhSCimikyZDkNDJlwxgYj/
         KFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123319; x=1785728119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qMd5YuwwfiN67Wq+l9yFaJ3wbJ9/YjqS4Jgn0/FeAo=;
        b=Lg3gPDpuBOGmK4qpRQZfHOn3iuP9rVuTrLGplw3Z+5xPlkazlaIDuwHHTskKgkJfw6
         6IP/LhHicLB4+RqYgJyWdlOHzk+7BTkNemXyS6SN4/yFkUE9lkpwc47OPqTR5cT3ik5j
         Zyifcg899sX6GANos6Qs+JenSQNbRjq2p3ExdpIsZ15TEH3o4GSxgOf/QlX8bioVRtX6
         sDDeRMYi+C+d72u1a9EJh3XAUBvDueczAoa6b3ypb/MXgPWDEhJa82egUf3VU3mcpQNW
         0IIl5k+4HI1NCAjrlDftC6c04ZNmworS2g1obVLpC4TXpEP2ct6HgdYQ9WQdqNsZCW0m
         2olg==
X-Gm-Message-State: AOJu0YwYMpFcwfPPfWX80bOe3eIzNurcNW2S92BjQqahBDnnfEkRj5qe
	f9YuRlXrSI3fucI3qjYKAH8VsL9RQBo4BVWSvApzFfHySjFsWE+sK9Xk
X-Gm-Gg: AR+sD13ZSC7me8a6vTmd97fLtKG0K4xmmgeh3mnOZWRyGcu+ZNqLHt97JGpVJyYHHwl
	JyvQzKBHzzCWR4zfVgOgbI5RyBoYVN5y44Ygd4qou9kK2NOj/c2+/f2S91mb0XiIiBpGcjKKHLd
	4z4ghR+s+DWgAPdzEYszcGRNNaVNZlCQou3ntJ/rJDKEqigZILXJh+NTmrjKAYernlaq/BJN3CR
	GeRNaaeMP+Z4gfHJOR5at7gR5oB/uQjUcLA6yzf6NKNE3481kS2L45br8CVB9SDRgjtSXkPqjgc
	2qFZHYNPzpv8vyjiv7iByUuR5UcjO37+TnWlXV8u8e27I7m7F1I6gY5wvOcavpV8vpHUjMp3kjK
	MzZ1BU2sXFi2ngY4jrD7j449rTcFBXqZwqYiKp5EyUajenJ6Cpz2/RXdBBmZcYerDo368yVx7nE
	m0h2y7XXUw0mx5JPkFSTYi/Y5cUaLr
X-Received: by 2002:a05:690e:438e:b0:667:a025:89a7 with SMTP id 956f58d0204a3-668c7a2f31amr1087868d50.11.1785123318359;
        Sun, 26 Jul 2026 20:35:18 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:15 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:41 -0300
Subject: [hwmon PATCH v3 4/6] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.15.2

The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
currently defined with swapped bit values.

According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
Configuration for register 0x69 follows the exact same bit position
layout as register 0x68:
- 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
- 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
- 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
- 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40

Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.

This typo did not cause any functional bugs because these specific
macros are never referenced in the driver code. Instead, the driver
correctly applies the configuration by relying on the modulo parity of
the channel index (e.g., `channel % 2`) to selectively apply either
ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
Since the bit layout is identical between the two configuration
registers, the hardware is currently configured correctly.

Fix the macro definitions to reflect the datasheet accurately and
prevent future bugs or confusion during code review and refactoring.
As this is a purely cosmetic fix with no functional impact, a backport
to stable kernels is not necessary.

Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 0b19b0925d1c..a34635526aaa 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -70,8 +70,8 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define		ADT7470_PWM1_AUTO_MASK		0x80
 #define		ADT7470_PWM_AUTO_MASK		0xC0
 #define ADT7470_REG_PWM34_CFG			0x69
-#define		ADT7470_PWM3_AUTO_MASK		0x40
-#define		ADT7470_PWM4_AUTO_MASK		0x80
+#define		ADT7470_PWM4_AUTO_MASK		0x40
+#define		ADT7470_PWM3_AUTO_MASK		0x80
 #define	ADT7470_REG_PWM_MIN_BASE_ADDR		0x6A
 #define ADT7470_REG_PWM_MIN_MAX_ADDR		0x6D
 #define ADT7470_REG_PWM_TEMP_MIN_BASE_ADDR	0x6E

-- 
2.55.0

