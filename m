Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120D359A81
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179285; cv=none; b=CMeypzdhkQ5O5O/wW6Vq5yCcOuIZQ8W+zbXOgm5jsMix7GU1L0+XktVVEbmrKNFg5JWX3Wz7XkGjQjPt1ToPdlog8asUa1+tu7wzSxjAPJ7Ex6I7aXjyjRMSDR7aoH3JcG+OvnAeXjWr7L1cdQqd/iy+yCASNtLI0qVywgrkHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179285; c=relaxed/simple;
	bh=sznMME0WMm58+I83SZVfC7dR3aHhDmAMXSbWw3/RWP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WR8+6FLY2Vr3bZqpc8aZZhKixI+qqcbtOoR1PHwHeTVd2q20enr5cHAcCdtSrcQnBl31igCSb93e7zM84Ls1vsAUl2++gryTJvDs668+29518aTJwF7sLmqxtfnx8KSTdpXEAMwXLlWArlCq2Yymt85zfnCI7kO9cjJQpnzmZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGkD0yAN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGkD0yAN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b9033d230so1389207a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179284; x=1780784084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++X2XBn5rn88Sq6By2R70dVKhHbMscS78KT69quTQ0o=;
        b=iGkD0yANVjgwQeylyLKjdZO62y/8L6tru/Qujkgi97MslT0o5ARPzokPDowA4IIlPV
         J1nNZKcIn7/NkTFpxOz2/zzh73SK3ndydG6iu/LkhuXCHIt7lbbh5fxvYPwaeIn1oD2L
         saHPJn120kAISjnFkmo6tfJ7vif7XRuBuL5awOvU5ihb7qQfEmaVNr0O7wpZ2YYAGJSM
         hIJUgte++UlOOw43av7z5Y2iMZkjrBdEgi1YVPt5kTb+8S5uy4XgSsu0tmNmLidgOw+W
         lqR2NkqkVyRJ2wTFVwkZMdGwfaFDeF6wnbVXBpuSk8lnrjfgA1Vl8tFbbZjWrix3pPj6
         2K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179284; x=1780784084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++X2XBn5rn88Sq6By2R70dVKhHbMscS78KT69quTQ0o=;
        b=eECuH1CKP39ZVU2mMqO6o3dvMtOKbFamxrwHbbiwDUg/sQf8Dq1uWq5iOptOXndhpd
         6djtr2JWLOKyLWYwlEdiAqUsej8kjA7uPwlFJ+LuU/K4k0/IEYichoZZ61E3vm1EpJBo
         oTiSctjVnA7ye2n69Sxdg1YeDOU1knP0TNqX4ju9n5aDRs3ZY81Txpb0xTXVI5z1PEdb
         FDSemCtBJ0HeFaGH9aI7g69ixNDwlc8Wb8Fr6eYOdEJ1TAuPjVIaiI9tZ8bZNrx+XLN0
         kYT2wJkj+4RcbtzZSuS1lFyOuAr41Z8RfYM550Rpu+UJ/HF7GzG+8SBlSzSRdKzwrtQq
         WzIw==
X-Forwarded-Encrypted: i=1; AFNElJ/YI8zI4e5PxFI/xv8rXK7W3tJrp/3mDsrZf27f97e3R1K19Jw+I4u/CD77UDCzWtkpGt+j2psZ++6AmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1Q6Cm4UaXosC1vSK499PhAAKNxJmh9cS8zU2UBxNMiVZ/fws
	AvHZj3+lWgJZl6ch66R0C8AIyCj8qgKHGj5xKMPZ87AEY21I3lQo5Oui
X-Gm-Gg: Acq92OGypWX1amr1d1UwOF19xdQOJ9Cf96/lubklBlRh3ht2cbB3DPboYDkAJDMCOIS
	fSdTOJr3iPqiC0zHUnpWtaxpZdqywhTp137KUUOXCwcDw8fW24985dQ6HEiEyEqTcCjKUiWA6NU
	bNShIacXoZg7P/eK2OK9D56VxmxnLQcCtJSZ4QslEluyyWWMSwsR+Z8hsb8fqP5ksw6OtRLWbSO
	TCM6ezhFi/Ih8PYZusq3mwjM7mX339EcC+siE/M7xYdXGadL+07mQkT0+OWHi6MV0ZUzYiy9PLS
	bEgWzPrgTEr5ENCiOBYPhtpHDweAXB1X3YMyYEUgyREJYgK7mSLBktEQ633COoj1OitbDXLmRdZ
	Z3m77rYBYRYvE27mOlTk6AMKASYm/EjpgH+bkamTbBoFw9ziTwnTAgo8Tq9ifk2Uz0rMCz90uTe
	ikAbkpmmWeqvDnu+fWuOczBZvDXGz2O6wNqdbO5Poe/pgq9byl6uoHiQ2Rc5DkWk9GVqAjAe/Yw
	NSlafS3JwZ2GLc=
X-Received: by 2002:a17:90b:1dce:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-36bbe0b4748mr7535075a91.5.1780179283984;
        Sat, 30 May 2026 15:14:43 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:43 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 6/7] hwmon: pmbus: adm1266: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:51 +0000
Message-ID: <20260530221353.159461-7-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use empty brace initialization (={}) instead of explicit memset()
to zero-initialize stack memory to simplify the code.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/pmbus/adm1266.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 6f6ad7b20e9a..806b92473a4f 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -449,13 +449,11 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
 static int adm1266_set_rtc(struct adm1266_data *data)
 {
 	time64_t kt;
-	char write_buf[6];
+	char write_buf[6] = { };
 	int i;
 
 	kt = ktime_get_real_seconds();
 
-	memset(write_buf, 0, sizeof(write_buf));
-
 	for (i = 0; i < 4; i++)
 		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
 
-- 
2.43.0

