Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C362749EA
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768065629; cv=none; b=A8oAOFO/9m3nO69HBU8tEsHTZlH2hiSWjIwucpHKUgHi2ZEEwgKzgx76g6rcVWwTZIsQpHkoIJSQwkvF5mcCzHw+BqOLBoXeKoKQHUFQcAd/pAQkt+bA53I/MwRwfNda57TY1uzKGZNbn+f65wiLjYIhfQIylhEOEc1J72z1NuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768065629; c=relaxed/simple;
	bh=8+oYaiAGBYPOrUJpGaSR8rqb/+YZWwmr+ecJ/8v9KdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+1PgEfjE5Mjx2kJDDHZPE7vQKPLFgBY3ZBnRqltkUdwVYqQaMtT+nJY29l+LrETd5N82HlnZf42/DHXhvZgTl7K/nNYtCHdveawDLhynq/4JjJQ20+CCEc8fuT02Ilze0C3dalzp69AnzVngVnSFAECct4IPdq1+Dqj6lAd3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C54+2x7w; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C54+2x7w"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b802d5e9f06so757257966b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768065626; x=1768670426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSC/HYnczYaiWBfJrNY4/6V+4Vw5B6guFeDjqub2wCo=;
        b=C54+2x7w2B1KJtw7T7Cf/E0M2nHrhnMCJ7aEoncxENyXkolPDLRez16EqXx82t8ZHT
         a+CAYCmLowwdag2tqPsOEC2SsEflLwJdp8SKedseNIvGIZE2DyB5NpkUAX2K3Ouj4dyN
         fWdEzCQM11nUBRU6OWUo+ePSC8yp8nBEH3tY45pND+5YoqUqa0zz2JHxoNeAoa2OwhIT
         OoRtWKsv/MsjKkE7QdGsn9hK7BY0Zh+YDOJGkJQ988bG1U0CV55ZiVHB9uXhLrHq0Rpy
         74JWCNYvvItr80XkaVqFIwiRsK1dJO95huxCgUc4Z7ZNOlig9OK1BDXc71kNrDcuPBXk
         hTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768065626; x=1768670426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSC/HYnczYaiWBfJrNY4/6V+4Vw5B6guFeDjqub2wCo=;
        b=KUWdqZCdmK9zfTi1qQoFNeOJNxLapVqZc8if4d2pFs81sX40p10Rl/YmD8PLL8rU4E
         dVy+AU0uLY12zDh9gTe3hMSLZtGmoEz35F7o0UHLjruEBii+c4wuGiUtkmkkySD6Ahbv
         rCWahT7h+IjQujhU+r4YNWNMkrk7YH5kodpZJu1KJHGPLw2BIqkCIclgh1u+4MlUIYyx
         5wK9c6JRhg3phEMBU+DSWtFVWBq8cLp88o0thRy3Jzsl4ok/qScWVlViU0l9vMXhiGKs
         HnAm+oqXUc0De+C1CzfCEQp0EdIX4umRikl8JF1VyLBwMK5XVgfj28M4/3IfsT4oMUGv
         00Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWprMtybHW7gfJpxGw9oo/JpowkewPtowaqi//pYZi0JlA9X0tS+V/upyDU9RXC0OGoMHRPjgdErbd6Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rPfErvfmOuJbEgMWONh1nctPACRoHBQ2+Kxtm4U7FzxAoJ5P
	gYbYXweVxPgWwsJ6YMb1sb8agqC71cpzt8RBNJuzTr3lJiV3e0J0jZHm
X-Gm-Gg: AY/fxX7NiXX2cpAEyGnb/1dt8rawWSHQMa7pYR9VMdmpvVDHixBwgToKeNEoZm52rx2
	JDbrxlDx9QNobI+o1f8+FC20Rh/3v5UytHeO4TSWmCy5cjo4MXdUPWFGwj6Okx/XfQx04ijCtoU
	VC6SJQkawauu5xIzIlVvK+bIH30MGoI2/+5mnMZFAqCEVAzxCs9cBo0/BsbX9ZOAxnmOWzxkwvR
	xvBaQz3sFbUg52q4zRsu6iLHSA6g4E9p6lR2QkzNVqRxVlw02rpu8jFEvMkkzRSPtsEUPe4OK3b
	8bBf+FnVCangmSi3LboJyz1GPwVdG0EQ5VHb0ik0ILzqoXHusA1pXqI3r1JcoT3M8gDYmffN4nZ
	uKIBSCaa0oQYrOxLROstV7YbsaSzNqtzxTK+F70BUOmOBVMWeRiqlbKSjA/962OlRIk00VItShu
	tqfsm9UUHePrEetzMEUXXq1TbBNP1puDKcd/Ew
X-Google-Smtp-Source: AGHT+IHZ7tOcnVbOkWXtFOOvfOKYhUvA/znspUfp333xPSpK0BRmEaSo7vVT70p5h3YHT/2ampwg1g==
X-Received: by 2002:a17:906:794e:b0:b87:1fb:8369 with SMTP id a640c23a62f3a-b8701fb89eamr119168466b.57.1768065626400;
        Sat, 10 Jan 2026 09:20:26 -0800 (PST)
Received: from localhost.localdomain ([196.188.252.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f88f90a4sm173367866b.37.2026.01.10.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 09:20:25 -0800 (PST)
From: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
To: linux@roeck-us.net
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: spd5118: Retry temperature reads after temporary I2C errors
Date: Sat, 10 Jan 2026 20:19:24 +0300
Message-ID: <20260110172003.13969-2-tinsaetadesse2015@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After suspend/resume, the SPD5118 hub or the underlying I2C adapter
may not be immediately available, causing register reads to fail.

Attempt a single regcache re-synchronization and retry the read to
allow recovery.

Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
---
 drivers/hwmon/spd5118.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index ec9f14f6e0df..63f798991363 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -101,6 +101,7 @@ static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
 	int reg, err;
 	u8 regval[2];
 	u16 temp;
+	bool retried = false;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -122,9 +123,17 @@ static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
 		return -EOPNOTSUPP;
 	}
 
+retry:
 	err = regmap_bulk_read(regmap, reg, regval, 2);
-	if (err)
+	if (err) {
+		if (!retried && (err == -ENXIO || err == -EIO)) {
+			retried = true;
+			regcache_mark_dirty(regmap);
+			if (!regcache_sync(regmap))
+				goto retry;
+		}
 		return err;
+	}
 
 	temp = (regval[1] << 8) | regval[0];
 
-- 
2.47.3

