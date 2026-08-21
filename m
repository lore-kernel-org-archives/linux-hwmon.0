Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0D4746D4
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313442; cv=none; b=fj9KbZi1sm7lZfb74plLVqXES7zqgvIH4FfpueAqULA0TD2XYt1iya5hY85QjCai068gkl90Iy7MnWeE1kAh9EGEUERB/otTK72yljGlxA6l/7oYH0oesYrX/Cf/yWV8wk5UpsBA7c+63AXU84wc0DtcwBSgw9MG28hgcxdrJkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313442; c=relaxed/simple;
	bh=D2B3Bt61qVYKOZP3Eg5lt3OTdOlnDUh2iBi0eywECGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPOov4nvGwnpx95jks/tVnz/+ud6vS4hRwQtxmE7NMKcOFPUZWg1bn81YkHx1SHI7gcBji1G2Ecwzt8m3S1bWtt4Nx0C98BU5JnkKEQHbf0pw0skExRIj49hKij7OtNgQozSqmNe6m+G5Zr58pXRtjm3ds4ZirS9AjlFH7NBitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiRn1voD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiRn1voD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39266382df6so683668a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787313435; x=1787918235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBkm6g+wSU92dfADi8i0k4KXI74rlSgZiTXISgDG/9o=;
        b=FiRn1voDjUXpvDb9tXKSW/xxgxk6MyXB3TcmxtbBWcL7XZY/iyZLGUoovJxGYDqlCd
         4eNn+669WrBTyZXeWtHEFgd3q+CsiAum6iWXUTYrEFKNk3t2qvLI6KrFqgEjdhe9qsFj
         HlxortFGpazEumvA7o5GBx8x4Bwx1XIJk84FxR5Ls+DJeXDVCvg6Ox38BhaBBmX2LlYD
         3K/Z7UFBQOjBQLSHyCSGgiSNf9qb1RDMy+fLi9/NopapFgrl+yFr6fQn9jzOBAhbPVuv
         mqp7sMiG7anqsEUijThVq+1m7Eis+N/sfOclLy4EVHgSGGycjhXDKZiGBX4h2xU/sxdd
         SJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313435; x=1787918235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBkm6g+wSU92dfADi8i0k4KXI74rlSgZiTXISgDG/9o=;
        b=EUzIHJ0S6qBsHTUYZw8aog4RfxB248LQt2xbt7poo/h3w++iRztqmuLVo0KMSY9Cuc
         xSnovPPJ7wvJOAYqEtwrdkiFXz9cgtQaKKH6lzU2Fpsdl5w4TUVT9i/N9vbNTJGoj9+N
         aXQAOcHGWcTs5hXGEdC/KeVBbUih+eiIFcQJiZFa+IQZVcniEYPq16DB96d+PuMil5LA
         XvopDC3hMlOnVGLd66bpaF31E1d1jR1lIBV1orMMjH8rrDuJfxi73TE+9sjjbbjkaHvH
         t1QCH90JFbyw+xTPl1li12wEyKm/8ExxNxVpbU7ErJ62Wmugb2JJYJ06xezDNIwh7aZw
         nH2g==
X-Gm-Message-State: AFuF++mGsnX0k2YIknuK0eEA8PSbdutzLgOMc4lnORqoTYAzZBhvLQ5M
	hj9AQR7V/xFTo32/lyu5eh15rVEQZ2dDmKJy4nz6DorXFNnuAC+IgCrU
X-Gm-Gg: AR+sD11Co7YNTikDDw+k+eznGZO0FsV3qCTJhuhzyGc7tod+Mdbyb9uRJjuWPLDki+k
	JTSckYJRvneehkUDBRT1eAk+M1qWXTKcAGH1v0ENAK/v1GPWoa2FPkNUStSzgkhVoXQMoCuzVCU
	B26iNPzRytsr2sEFuLP+V/XSEK7fKu+DiR4Kr3EwlJG0GynKGJrQhFglnRwXarcR7T1nlViUWwC
	zI+A6Z+oRnctlJROoL2+HbDPAElL0fhX62uwjmlV0J0YAN8B9VERA+gs8jp22wp2fncE+QRlxz+
	uGrMNo2IZhdApuoTEHMxmGQifB77MJl7h0ccz7HHx0Usw+iFRUvwRm07XW0qVnwRKEaoI4etkm4
	iQllJZNIb7ptIQmLu83ptnoLdZeQPuzvMog8IL7HE9ddEZ023N8lqdU2qOva8OOchVkea+xYa5A
	6R8K9q+4lqgyvinfMtLdU7LxXakNsl/stdJc06fIJAILTgeBQ/11TWTiDwqVftCH8yKzBpkAonH
	NWM0EifXIY8OyY0z9fSWfHgWyU6bUzCBAQeuGBV4vBB+3zXKKk5
X-Received: by 2002:a17:90b:6cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-395c2f13243mr11785502a91.0.1787313435311;
        Fri, 21 Aug 2026 04:57:15 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c46b5e4dsm2926324a91.6.2026.08.21.04.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:57:14 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] hwmon: (pmbus/ibm-cffps) fix format-truncation warning
Date: Fri, 21 Aug 2026 19:57:03 +0800
Message-ID: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snprintf() with "%02X" and "%04X" specifiers on an int argument
triggers -Wformat-truncation (and thus a build failure with
CONFIG_WERROR) because GCC assumes the int can hold a value wider
than the destination buffer.

The value comes from i2c_smbus_read_byte_data() and
i2c_smbus_read_word_data(), which return at most 8 and 16 bits
respectively, so mask the value to make that explicit and silence
the warning.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index aad94bcb9..dd7ff3a19 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -166,7 +166,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 2], 3, "%02X", rc);
+				snprintf(&data[i * 2], 3, "%02X", rc & 0xff);
 			}
 
 			rc = i * 2;
@@ -177,7 +177,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 4], 5, "%04X", rc);
+				snprintf(&data[i * 4], 5, "%04X", rc & 0xffff);
 			}
 
 			rc = i * 4;
-- 
2.43.0

