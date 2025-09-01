Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC76D26B95B
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Sep 2025 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738950; cv=none; b=OVi3bc+UQj/6mRRjUK/AxKCuK81J5ROesw/Y4vb2HQYxjPjzhalnd1K285W+cjtJ8OUrPLPNQdkH/qozePfJGVy6NJOEefgG5gthCp3beyGSrx8+AAlKvN5rD0JdNtXjPKR2oHR60LuZ1B7vra1wX8A+Mof6Jb3j/WJto3Pd+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738950; c=relaxed/simple;
	bh=EFVA72BBx+6ycIwGSwaaL6x2OdDoq8kZlaumx9WnDzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKQSvibNoDuK1EBCq1Hy+kgN+oSxLu5XamRVJDciokDPR0T7aouN83SMq0dgClqfMghF6gI1z8Gt7NZ/e8Tl0Xn4qbS6fNcBDfNOWZ+KATMf3ubATI6hD/m9Z4dSpt/H1CqVWV/SFUnPTfxuHw1BCQUqge5uGLa2cuQLZumpZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2lZI1Tc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2lZI1Tc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-327ae052173so2659180a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Sep 2025 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738947; x=1757343747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=184xLB6LRLqTxBNKuQbcBYOI+0gMxX1cMpXRdaChuME=;
        b=D2lZI1Tc40uh/yEz4dkuj3GbXG8r6YJLz7I3/hJEM74nPcOba5ovuEjUfYC/rrNDM6
         TWRQlvFGlUiUtfJ7X18W+TTIeA6kmHgeBUpIFh7TJdHz0tHHjjoSbZuhLk0xScVApi5P
         mkIdfmunHnsFRaFMkDxKEhC5JKSdOrggfmTQjzI8Ccrdp+01rCgULJ/UjSHU1rZ9bjCg
         hbkI7lXnAnJYTVaFjoHa5gAQG1CruJEatN64CLd2G/LjsqTDVN0IzBum/bXzkhRGvrLf
         8htnpbta8b4FkY8JUT566vFGr6xgFnfbkkffBX7VIjIhh2njBExY8Pj4fua2fIfWGCcn
         q4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738947; x=1757343747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=184xLB6LRLqTxBNKuQbcBYOI+0gMxX1cMpXRdaChuME=;
        b=TT+tG82i3C9huWEZ1sUVZhZ2MCCAzQq0npyrDBTWeUNSSE5y3sxcloBaKBcJNlHbEa
         TAMsLmdMGk6P/KLa89P5qPG7ai/f0p8OzF3vG7xsCYry+A5FbuknSK1VDI1a9I6Linhu
         X/O1EjUqJTAI8fYvnc0mCk6FNnMH8qvyRF/A7/1Kii3L35KeT2Y9VOy8Ugqos8GSfs2O
         J64jyPR0zjMXhvwB8LA9KGxxZpfC3U743RLdmGoyT9Jkcmxww68zr7eUJ7DM5B9/zK1q
         LN77Z6mzstGMQhmXvqVgTp2YdyhyqH9J9cM68QdMiuRFYFjvkoKyBL5s7/rOuUkc0IrG
         Z3NA==
X-Gm-Message-State: AOJu0YwGUWVHFM7IleGdBUg6VBOKYBMUvsDkiLwvbKIFfeBV9soFPCLc
	dp8DOz0D5Os46sOzbqPIir0zIyndvZ6mtTk7i2UzvE7zANYwGJb2R4UIBDroGA==
X-Gm-Gg: ASbGncv8nC/ukJUqNHYMAeCdyKTgUjQPXQD0tfaetROEYyduKwta+yAvQUP9aP9rAJn
	zUSugFHLyf4pQ0xBPXwzQG/Qpq07dmmiNYAJszGtI6+jetzShzRfEJ+AsteywpiOjofz2WFoSB3
	Wyhup5lXWsOeiXukeBBIU92v3I1Nnm7WBKO0Thh+LrqEKRFjEoE8nm7AIPfqeyRZcuVBgaFPAEd
	L1Yia/kUuOUeshVrCg7tFdLlhBCIqKfeSpUJukccDF4t22R4H+6QaEMJ0D9fQSjLUK0JZHHtF4N
	lENSOrI7dR+Z/rS3IjAhpdulMTg6ktLogHGI+vAyUqdjqSe9USu330vmH46nBCBSlJgFVeM/7Xd
	Zve5FP7XG/RVNCs8Gud6qop3XcUS8tar1fUt9Q6cy9UGhKw==
X-Google-Smtp-Source: AGHT+IEy9BEohhCbsDn7RB64U/VY0rZiMeQiCiqLLuwAHr1CuiWy+SimHNW+GR+LR5iYF63NvnKT+w==
X-Received: by 2002:a17:90b:1b12:b0:323:7e80:8818 with SMTP id 98e67ed59e1d1-328156e5627mr11980687a91.37.1756738946435;
        Mon, 01 Sep 2025 08:02:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeec552sm11654124a91.27.2025.09.01.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 08:02:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Nathan Rossi <nathan.rossi@digi.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] hwmon: (ina238) Correctly clamp shunt voltage limit
Date: Mon,  1 Sep 2025 08:02:22 -0700
Message-ID: <20250901150223.2636135-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When clamping a register value, the result needs to be masked against the
register size. This was missing, resulting in errors when trying to write
negative limits. Fix by masking the clamping result against the register
size.

Fixes: eacb52f010a80 ("hwmon: Driver for Texas Instruments INA238")
Cc: Nathan Rossi <nathan.rossi@digi.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 4d3dc018ead9..c6b2734898d0 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -379,7 +379,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 		regval = clamp_val(val, -163, 163);
 		regval = (regval * 1000 * 4) /
 			 (INA238_SHUNT_VOLTAGE_LSB * data->gain);
-		regval = clamp_val(regval, S16_MIN, S16_MAX);
+		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xffff;
 
 		switch (attr) {
 		case hwmon_in_max:
-- 
2.45.2

