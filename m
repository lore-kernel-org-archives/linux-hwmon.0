Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="M9sgkwCp"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D1ED5C
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Nov 2023 01:05:00 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54c0bca218dso355876a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Nov 2023 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1701335099; x=1701939899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOSpfehJAtjXcmrtCVFOpVd435b0i7EUig22DPIw/j0=;
        b=M9sgkwCpSOHJg0JDkTgxuaLywR7N1s8k0JfIuEX0wzK9dUrwg7YBkIDo4826QvpRBz
         m/3roaXe16E02Gbd8i+z4eJHnBkKolxN8JXEOfES6hf+SRgOwNEVL6hNtKgpa2nzBUdq
         ynH6Vd1BSYcyB8Ssgdy+YLQ+i1sOuI2cZBfrYXYbxNWZ7UCvg9KENP31SQfnXhNtOi+I
         d0Y+w2Gv+x5Pj8ayXFJk2mXUjFltYO7CXYVWnCAaSnLZtl7pMPezEbtQReqX8KZPUgim
         Pl0EsQ9PGwa+1SMi4vdEgjaZGxYs0khwj78sYuGXUFI6CuIPdyBj1gq6KzaWqKt5hQo/
         1Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335099; x=1701939899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOSpfehJAtjXcmrtCVFOpVd435b0i7EUig22DPIw/j0=;
        b=tP+fKEuQXzEnFcL5UWV35/AuNfB6MyQbRfRi0JKoOMpLVk9cm51dCNJfYv/74I0Fwv
         NmMx9t6qZnnuJHM6K3ErqvIMpZgtpA4FqFIssnVpeH14QVlIQfkXXv02uuNSQ40ynFnQ
         spmkqmytaWHOj9P0el91C2pGfMNQrA6C8VL5CcTvM8jSNXsbhb5Rw4/6+mS0Qv1oFSzG
         iulnxljpfWxwmE17jJE3Dz6qJtHCaQ9GuijTL+rAk+dZ0FsxX59gtNtU/+rtkwdw3N/P
         b3888E0ZH2zLNr+ns/jREN8BF7hdxUcyYrFhFFQgh5hes0OZeIew9IhOIH2gick9nrhB
         moJA==
X-Gm-Message-State: AOJu0YywY1jIm6AIxmv1B/7iGP3fl5kdE1Z7KtlPRguSpTtn/FVM8wCW
	CYY+fZeOhkW6pEiAbcPnVY8aLRWC0LEKkcUXigHF/g==
X-Google-Smtp-Source: AGHT+IHZPozvOcPGcqYRKlWe5NehhcGCx0qBGfvZfu9zNrnHos1zKESsl8C4bT/9i+D6muX3zwgtxw==
X-Received: by 2002:a50:d68b:0:b0:540:346c:7b2f with SMTP id r11-20020a50d68b000000b00540346c7b2fmr14685967edi.40.1701335099379;
        Thu, 30 Nov 2023 01:04:59 -0800 (PST)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id c3-20020aa7df03000000b0054b9a6092d3sm347554edy.12.2023.11.30.01.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 01:04:59 -0800 (PST)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: naresh.solanki@9elements.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: peci: Bump timeout
Date: Thu, 30 Nov 2023 10:04:21 +0100
Message-ID: <20231130090422.2535542-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PECI CPU sensors are available as soon as the CPU is powered,
however the PECI DIMM sensors are available after DRAM has been
trained and thresholds have been written by host firmware.

The default timeout of 30 seconds isn't enough for modern multisocket
platforms utilizing DDR5 memory to bring up the memory and enable PECI
sensor data.
Bump the default timeout to 10 minutes in case the system starts
without cached DDR5 training data.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/peci/dimmtemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index 5ca4d04e4b14..4a72e9712408 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -47,7 +47,7 @@
 #define GET_TEMP_MAX(x)		(((x) & DIMM_TEMP_MAX) >> 8)
 #define GET_TEMP_CRIT(x)	(((x) & DIMM_TEMP_CRIT) >> 16)
 
-#define NO_DIMM_RETRY_COUNT_MAX	5
+#define NO_DIMM_RETRY_COUNT_MAX	120
 
 struct peci_dimmtemp;
 
-- 
2.41.0

