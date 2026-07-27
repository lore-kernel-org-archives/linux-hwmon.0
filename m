Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3431714F
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188926; cv=none; b=AeXLaluN7DOIWyg7qqQCuH8GMZ26anRou/rbdyJn9iLC1CPtgZ0oxOPKutUGUo074mzX+jTgkKOwx0I08UCyizSKkNkv40XolX/HQkTs/CrwnTy7LS8lpvCgGnpc7U0CqqxFN35sqH0nyzyvvW0v7E14j9M8RTdqQ3Ew4+RN39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188926; c=relaxed/simple;
	bh=xenB3SSccq70ut9MEtcha052ZOO3AMAivtu7BXbNCPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hB1h1zXLZvKcWoHMnrWKQNnYX4wAwp9atYYpud7q1JhKCR8Pi9+6StmTUic/IHUJsBT8mTnSJZDPXjru+G9t59lPcIMZRgWsOM6C4lKpSeYJbqAWSlLXFl5APNNugA+Q07/PyTEzkkfsvwuMRQdfhTscesqvER0RBE+kawDJFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igfMSyOv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igfMSyOv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf50c6f235so38891605ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785188924; x=1785793724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y96agwZlvu+tMVaE0Wm4s5ELT5i8JIe/tvqVcCp0MCY=;
        b=igfMSyOvWZg/fg4ot1AiV9xMUT2YMFKBsqf3ADsGf39GXtGO4P1RGy7x0TBDrFOgrz
         IPuruzwCJyEtnz72JahbxMFkeSbJGAqAhGpBr0366Kjx991u8HyiVnccx+q62LFZMdzr
         m+RWn7nmpkyVnUeeeSwwEiu74P4HrMyT8fsbg2Jn41929vV1D0vVejtleo7pWdptpejA
         DNSMb3HmHsT8iSaGmaVPRL2Crs3Ikvdiffw/FwPRsW4qwezttWzRsSO7KNLlAX51HplZ
         W8V248g4sFscRv7PWZP49QOEsvnmIQ3hgAB85/GbfF0RH3+p9tTbVQXEJ8Xnm2kUa6Zq
         YnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785188924; x=1785793724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y96agwZlvu+tMVaE0Wm4s5ELT5i8JIe/tvqVcCp0MCY=;
        b=gVamzsDvGnbbNVU+EC5Es8N5ccPaa6WjQejKvMoBxKG3/wZ6y1QNGgKP6pdl+1oBms
         tzqAywMEGWFGBzfEqoH/k7LTDpHcgVnj2kqDKpFvZHuv99tNoK1vwX7wCObuuyrfGStI
         kU44yE1UKzGabFJEmablP1XveUFaAmq7HAh6Ps2s1JlKP9UNEPV8n/gGjTYkBo1gkcEg
         lx1hwy4MQA+nXhVdxS6+hWpAYsC420DbM1Jfv+f5a+ktiLeW9TDZLLYIhWW3OPwQvAV+
         bxYMZy8Q2m4W+L6nKeTjehwLOhU0HFTAKH8EnS8/0Xa0mPajyBGsLqx2objPU7NzGwZD
         tUcQ==
X-Gm-Message-State: AOJu0Yxdtoq6Gs/KvccK6+tf7xleK/iZjQdfiV2gnZ0H5UTKVeF5afTX
	4vpInrOX7PSqWBe82/KW6q2Ye/Pg5IPniZyqX+PKVC6mxvyCF6CimCKpdzUSTg==
X-Gm-Gg: AR+sD13syDLvMm4M9c+pfQ36dJBTOd57lyZJjBDgfNh1pt5xRIKvzBHCSGgWEGjyPru
	QUHUXwHSyIBaRihHClw43FNGhllYp8mw8APcBHt75xc8sfuAuEluakM0i+f9PcvY/WA035yV1Sy
	s+w4CCI62dSgCdpP3z4IS8vXRs5GmR1F6VO+IA0MVbumZXAj1iWmt+xbH84KsaviKTmT1eNJCm9
	PZ3TNAJ0xv7kxsxUsz2ULwiwNXOyohBAlDfJHe7D1Txkd5OFFGkJIQR5yFnb2hbDvRIX7NJ6//h
	Q+feYGJmXsfjt1O2jtGkqviLGWAVjZEktLoY5KTO9yHMqH6kSlQuB5KlmzBWSZNQKMzcSpIPfqe
	omBTslz2HWWmpFLDp3R0PVv8pc3Tiq1JgMQFKqdCSg9/CBYGLwYffeH99jHxsZ5+OjQdVHBxQPY
	69JWvEPZMc6KKye/eNkgJuuUqsQA==
X-Received: by 2002:a17:903:1663:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d00f42d025mr9572425ad.15.1785188924497;
        Mon, 27 Jul 2026 14:48:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2ab1sm40738215ad.32.2026.07.27.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:48:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Gerhart?= <gerhart@posteo.de>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH] hwmon: (nct6775-core) Prevent access to unsupported weight registers
Date: Mon, 27 Jul 2026 14:48:39 -0700
Message-ID: <20260727214839.3727592-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sashiko reports:

During initialization of the nct6116 chip, the driver sets data->pwm_num
to 5. However, it assigns several NCT6106 register arrays (such as
NCT6106_REG_WEIGHT_DUTY_STEP, NCT6106_REG_WEIGHT_TEMP_SEL, and
NCT6106_REG_WEIGHT_TEMP_*) to data->REG_PWM and data->REG_WEIGHT_TEMP.
These arrays only contain 3 elements.

In nct6775_update_pwm(), the driver iterates up to data->pwm_num. If
data->has_pwm has bits 3 or 4 set (which is structurally possible for
nct6116), the loop attempts to read elements at index 3 and 4 from these
3-element arrays. This results in a global out-of-bounds read, which can
be caught by KASAN.

Furthermore, the driver uses these garbage out-of-bounds values as
hardware register addresses for subsequent read and write operations. This
leads to invalid hardware register access, potentially causing hardware
misconfiguration or system crashes.

The underlying problem is that the chip does support up to five fan
control channels, but only the first three support weight control.
Fix the problem by extending the affected weight register arrays with
zeroed fields. The driver uses zeroed register addresses to determine
if a register is supported or not, and skips accesses for unsupported
registers.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
Cc: Björn Gerhart <gerhart@posteo.de>
Cc: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 51253acff4b0..94482c8092cd 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -791,12 +791,12 @@ static const u16 NCT6106_REG_TOLERANCE_H[] = { 0x112, 0x122, 0x132 };
 
 static const u16 NCT6106_REG_TARGET[] = { 0x111, 0x121, 0x131 };
 
-static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
-static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
-static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
-static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
-static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
-static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
+static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188, 0, 0 };
+static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189, 0, 0 };
+static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a, 0, 0 };
+static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b, 0, 0 };
+static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c, 0, 0 };
+static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d, 0, 0 };
 
 static const u16 NCT6106_REG_AUTO_TEMP[] = { 0x160, 0x170, 0x180 };
 static const u16 NCT6106_REG_AUTO_PWM[] = { 0x164, 0x174, 0x184 };
-- 
2.45.2

