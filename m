Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFB2EFDBA
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337258; cv=none; b=L9658rg9SN6/yt5PdbfZKAn8JyEhRvdL0K/YfrKaCHI5jrgm8J9MrKJr0zW1Ll7qRSZKIRuPhGSmHef2j9QcCh3FIuS9k1KjBZD5ALEn2XxRUK0byOm/n/zb/nPwF9EzaOItIJvemHczL6o1etkOYDPOC0t6qlPMbsLjY20u8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337258; c=relaxed/simple;
	bh=6NPx+X2WywRhQ+1oS5o5Hec/aHLKkdUJXFTe4ZBYQgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lkHzYRpMGT5t/B1eHLFO7IhOkiiL4I+d1o6ZAnNFe4UY6BE9jvR5uHqafiUDZPaSydTs5YWMEjM5XZMZnWz51ulcNfJb6BFTUuNJ3TUEn8LOJx2P1YnjkRQNanDGTjRDmIl1abvJOYBkL1ppJH9UNQdslhvwGyJ+50xEx9/A8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfTTTyJZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfTTTyJZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so2659231a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337256; x=1761942056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KRiNp1ap25NQp6V+0Xx5744wiQSngYoe9dljgW0lUk=;
        b=EfTTTyJZeDWxBRbIBiWpRIbmAY5mfVwsLTA1XECO4Yj+03tqyf9la4v6J28NgVrHx7
         o72tTJ1JTUc3W/+ZjOc3wB6fFcWzFBtR9VCgsm5zJZsLIlVlPM+7wQyAepnDVUCar73t
         Y8kzftE+IFzmA1qZUP0sUUjAFEVbMDGhjXugxN1S2vvtOaoO1QRvGxLawkH8ITlAyy2q
         j9NMW1iRTrkH8TuIZV0E8x/o81BKh2FpyDRMH00KLKoSNSdU2T2BDtcVvHVLUcQ1q6KG
         h0lNW3FMkQ/ln4fBaNBpLQDtjpFZ5uS2b6Q0rnVwPi21rL7zfJDk6LTS0X8gsg9Z25/k
         XbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337256; x=1761942056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KRiNp1ap25NQp6V+0Xx5744wiQSngYoe9dljgW0lUk=;
        b=cBScONy5xztybIgdZvWUisyisrV771XsLD3Poymi98ToTodDyj0TD/jeVb4QU+t+UF
         KPv/fVjVpemLSy5VDiJhg7NnVp1KJs0q5ZdwaClOX0BQxXcx4bGA1qvCHJxQ7cXIZNTX
         fNUW1eVbHj00ff6LwzNaPziIdcoXGTT/kTSjUKMkqgyiY5QJWX60RX7q4V1XqK10K20D
         zyGpwJwgkm4lYKwjsmWteTyxeHr2bgpPg8iIC7AB9hqs71ROyJBgXkOxP067VkLPFDp7
         86JMQQbDIShFqnaxvGZ7cmaf5OjdfOayihu3/9m+pobAO4pCYOFW7ZVhdYkEAKY21tQ5
         7owA==
X-Forwarded-Encrypted: i=1; AJvYcCXziUzKLqNmy7KQ5CqRsvumNWXFKNIEKJ2AC3gce+BDgmdGJ2LVZvrIAIDFgiUT+dBv9FxnedUWVmjmMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYXcS4qzfo3XMYuZlUAe3sIMEDrRJu5o3IPv5f1IRqfKKlbGg
	K2vF5bP2hkyYJimB1QsIVtVEwptvTQ9KRP7kUvIrsrX/Ds4OnJShC64S
X-Gm-Gg: ASbGncu4D4J4QYcEUYs12dWHilRB1e70qXNYMGaCFLUy6QGGL72OtQkM+GN8pNecw/N
	hlxwlSGKRFsHRRQfoldL9B3MKfpxu6+3jGYbBPCNyf5EYfU1+I1OKkzC1Y1u48jaAAp8oTIoaqC
	nV/vjzVdsorI+BPIfbgQapJIonU8F7yWnEsDG7tK4sQIlyz21LZzIob0cs40hgLLqza+WApaTO/
	7mlkl6laI5yDy2Vb8/7hQYrwo/rAKftWS1HkPRUFRuB5OzhYqb0bgCNsb/jye2CaXXRiaqNirM8
	S2csQXRpQJgqIR1PtohbNSpP8q/4mH19fXVWxwcEKPAg0pfzpbsonIsU8mqNjTtZ/YhASXCYNJZ
	gtzuKWLLU7XRqX6ZJS4XdXe/sML+E6MkFKMtMccVUZveulHVaCtBKxMu7Q2QZR1qsmSlS8+hXWD
	WBL3CWvQKEcneSG1pLUYqm1gW5CEjkyA==
X-Google-Smtp-Source: AGHT+IEbhlPACOmKZ3NUiAKCZ74uClfD7T6fHIUOPv7o///eViQUAWbiITUiLoEhOia3JIqDriWEkQ==
X-Received: by 2002:a17:90b:3803:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-33fd65fe245mr3970297a91.15.1761337256432;
        Fri, 24 Oct 2025 13:20:56 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224c9bd0sm10001563a91.21.2025.10.24.13.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:20:55 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: cryolitia@uniontech.com,
	linux@roeck-us.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] hwmon: (gpd-fan) Fix compilation error in non-ACPI builds
Date: Sat, 25 Oct 2025 01:50:40 +0530
Message-ID: <20251024202042.752160-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building gpd-fan driver without CONFIG_ACPI results in the following
build errors:

drivers/hwmon/gpd-fan.c: In function ‘gpd_ecram_read’:
drivers/hwmon/gpd-fan.c:228:9: error: implicit declaration of function ‘outb’ [-Werror=implicit-function-declaration]
  228 |         outb(0x2E, addr_port);
      |         ^~~~
drivers/hwmon/gpd-fan.c:241:16: error: implicit declaration of function ‘inb’ [-Werror=implicit-function-declaration]
  241 |         *val = inb(data_port);

The definitions for inb() and outb() come from <linux/io.h>
(specifically through <asm/io.h>), which is implicitly included via
<acpi_io.h>. When CONFIG_ACPI is not set, <acpi_io.h> is not included
resulting in <linux/io.h> to be omitted as well.

Since the driver does not depend on ACPI, remove <linux/acpi.h> and add
<linux/io.h> directly to fix the compilation errors.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Tested the changes by recompiling the kernel with and without
CONFIG_ACPI for x86_64 architecture verifying that no
compilation errors are generated.

 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 138cff0beb4c..4c45c0154a45 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -12,9 +12,9 @@
  * Copyright (c) 2024 Cryolitia PukNgae
  */
 
-#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.43.0

