Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D137F8CB
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 02:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131744; cv=none; b=jQA8ob8QFe4U8qkIujTG9L1TeUexANwg+2EIpgWRPdyEmQ2vHFe95mCDWddPUFa7ZwtiIOgIFv7IyxQMfaSW4uw2Vq9HylU16+NpILv2Dfxem6IreAHZteC4UYDXREwgkXAQ70ldTFjDgzOk8T91oS0cJb8/VAWsuiiMTEgLBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131744; c=relaxed/simple;
	bh=czbPeCBzVXWMJc4RLkEP8NduV6XF6uXVlb4FvrHUejo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=skXljwCpOjPT0EBKn8r84I1rihmEYcAogPoSOvAz5Li2rIjZYMwIW/H+0StGh6NX1/682cRYFCLXXujZ1mbnLuJa8MIsCuiBqqvmSTl6Md3l6vJYKTE2c8FDgz9e8zMLQsha/0sXbbZrvuvbCohXKFPPOz4O9DeQH8hU15HgWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtOKQc/p; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtOKQc/p"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so343570f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790131737; x=1790736537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6o8ezEWeqeFRYdsyOq64ZoAW04MferxHaAQi5G8VTc=;
        b=rtOKQc/p6erewDl7yZG4FrTBNWa64+Ci2wYOtet/3pF4AtdkvO6xgfUgck1mC7THH1
         WCC5kp5tGDmla5K9bFWAIm+fDVBFHJfEXs4Z1w73DFZKLNTj8dzLjGIWNlnCKEp/FwuI
         n3rdeo5CToChH5XRV22airsh2WRSaRHkJz8WJBdxEKuh62qiLXUGZ36JohR/LDubml14
         vAyKix27BEg53zeGYacc6Y+L7vWKT9K423F8t/pyAaJtLukIGmLg0QDldFDKsc8n5WCM
         QyY1jDPlHovSRYttsjigJWLMe7UI9FzBVcU6I3GzXagDwcQp9zmeLlW0fRsVf3E3naPl
         ynMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131737; x=1790736537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6o8ezEWeqeFRYdsyOq64ZoAW04MferxHaAQi5G8VTc=;
        b=hcvtoKGkidwTpkj9lNpdnOVZU41R4+dGXy03BKQiH80Dwaf1fAH826wLdVM4wOiFnP
         3W4cZ1IYbMUxLj9QoteYM1Xa11OuVqsJ2h9RARoNjPUC8Ms0jgnaJLRhvgp5S3nr8AtO
         5ykP/G8Mqa8qYzYFPWwo82KXpVQLOb9n0jeP4Ho6XI5SydaMFu534ItCEMJuy0jHnabL
         zfSbnRiNt1O+5IManHtpRiCM/w5NWnQRaXHpjoqLJC7QN/Pog5WIJ0DzSp2UxN+KRR9/
         mwKL8UAEi7q+QgmReeYTSQ2qi86QbcXUZbiJvDrDWk6P8o2GkSfQYpkAKzag3gxyMclc
         D+1g==
X-Gm-Message-State: AFuF++luyCpawa/nzB1yM6NmNt/sRIRdCiuoGPonO9JE+xetUwUrslyQ
	2NQxSXEgJZC0Y2sNE0tp+KvG5I+++CGaUaKaN0EtTd5fjGl4x4L6dvqcG7LdHncQC70=
X-Gm-Gg: AYBFou0rm3McHpOXOMAusMDnuAk4TjF7bBBPfOmNbVC7OkA/W0eSSbEhy08a52lTcbO
	eBs0tp9Nkyw3Tjbnpi4uGiZn6JcIDAZ9C15xjpR8ifx0LP/yBXFp9QV3YsygSEnNUt4BWK03kAF
	leyFonSHNWtGIugAsoMuf+D7CUHxOOgrBrFGr/uAWtZc0JSJcNnSJdZgpm88hqBTpoIYgdQXqo5
	Cq/a+gWhHrNSxTWSLDS/8Q8RwRiLXRpBfxvIuinWksD8cx1m32w3g288d8z5/9CUdMJUkHHP7dd
	eOnbKl4G/LPnkfuYIf1SEGNRKXquTsTdjPQvXLPqZlM9FXGRurpYH1NuGg+fVGr3KaWkililmiW
	iH1CfcKUnyOjIGDPb4OOCzgMoiVqjooS2pierMimhzpcX8EdZSu5jUFsZD/9JNDgmSoM6E9mzBn
	ePeSPFiSSe0Lyz8cRlHUwE4KG3+tB7gD6KoHM9855V1AU4oRAzTJd4gAy+lKOl19EE
X-Received: by 2002:a05:6000:2087:b0:487:232c:a9fb with SMTP id ffacd0b85a97d-488670425bbmr2403373f8f.12.1790131737188;
        Tue, 22 Sep 2026 19:48:57 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm2860432f8f.30.2026.09.22.19.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:48:56 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] hwmon: pmbus: ibm-cffps: avoid format truncation warnings
Date: Wed, 23 Sep 2026 04:48:27 +0200
Message-ID: <20260923024827.56445-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 reports format truncation warnings when formatting
the firmware version values for debugfs.

The SMBus helpers return the byte and word values as int, so the
compiler cannot infer that the formatted values fit into the small
temporary buffers. Cast the values to u8 and u16 before formatting
them.

This avoids the -Wformat-truncation warnings while keeping the existing
output format unchanged.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index aad94bcb9ceb..2498c6f4778e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -166,7 +166,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 2], 3, "%02X", rc);
+				snprintf(&data[i * 2], 3, "%02X", (u8)rc);
 			}
 
 			rc = i * 2;
@@ -177,7 +177,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 				if (rc < 0)
 					goto unlock;
 
-				snprintf(&data[i * 4], 5, "%04X", rc);
+				snprintf(&data[i * 4], 5, "%04X", (u16)rc);
 			}
 
 			rc = i * 4;
-- 
2.55.0

