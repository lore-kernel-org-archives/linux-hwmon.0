Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAAC3921C3
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762413; cv=none; b=kKlvrQeEf0ZtpJTFEAJOWuVEP7J6mwXjKhr3/goEd5zahvXUad+KBF+MdoMa17aImShHbSEIqt8mO+LPTL7ucoRpYDvJwy6hP/h0fdhKqgXG0tvbjIDPW4XW6LYx0oa3mezUqPOyNw3G60FwmPGAjrxNzyp02oqoyiDdJwHP7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762413; c=relaxed/simple;
	bh=TFMbF+6YpQE5zKhsi92k+6lG3+v7THpi7mqTMKsa1tE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uX3jZaEKUQYMuB54a3Yuj4Le0MyyyAbzSJ3LFoQqU0Jrh7urf3oh/STDGkNfmtsbjDSYJpnf7W8WywG6esN2mOzJuPE/NU/OlBJPkzJlSyXIwGLtvOYGR9FsitRlgvJNlZjzzVhkfmtoBBvUV4uAvzlt5ZV6Nk4rXG/QEAP3fnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caea3f742bso18687565ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783762412; x=1784367212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fCVs3YON/pS66KjufLTdz6MFzQkosWnFvToVGu3OBSs=;
        b=SHWh/ijr2WE4F+1n9PFwJO9+7BvbJBn6HB/6tQtsiV8XBvLYdm2cRme0TTUewEMcC/
         UhoSIFGcUBgdh7tvsbJlWRDZ6gxSsSd56S7epZe8IhV3V/VVts74GYENz0aoVkmCbOuM
         F873sKtaRO64E81jVrdkeiF9MvXPK7WwPFm4Zxp2ALhDXqFarHybSTV1s2UYjq65zCxC
         2EbFpbfPp2DGCTWdUZ8AL8G2VBtYCXU4luvGTxfcz8eJU2hJvnArZ629uVvSOJVzhfJZ
         VPo0KbL6tIs4FT+F/xKtJ0jQ8kCc0Wetr+icTcCZcxNRapYcLR/jg0lQY6PkV17gzp60
         TPAg==
X-Forwarded-Encrypted: i=1; AHgh+RpKJtB+ldSmTyJ8Ssz6l5UBZP+FdRz+FVG4JklfEr+lhxv9F0zyDh9oI6tFiXi+RWk8Y7NLdftDWR2zow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnbyGmqSNkJnYFL6WNoJXTqWZ7O1VAIAMEdtMPTXfdAROLTvv
	v2XVa8IuutRHoZPyOlji8jKENYgpdI1/fbCoxYIPkZoJF5D8rYAvYWs=
X-Gm-Gg: AfdE7cn0tClh14nDYwiuNj+0V7H1YIL0lOj+BuOXcfEs3irRSCkDzoRmJhlbgh1RISf
	lVbrRlfckxb5WSYXAeBnAuNUVRxPlzX4NgM8I/KMtz2ga6BRr1ZDS4hXMqWL46Pd+cRNINhojlw
	Qn2OcCwxrmYpoGEyTnDSm+6TesOaAr89Y7d57WPlG6RixZwK8wWrDdy6JSy3gh1n0a6lJ94kqy2
	1Z+1/8nwbGBBYKFEkTXhauVQr2+NXRkCifPF6tmChqaDfCIEGxC8WT6Tgo/b+4P6Go9XrwUQqci
	P82yeXVmh5Z/B9Llc/dWnSI+apc0xnwMUI0ALIfRpPFl0q0H2ZJbxEi7miCw+Wp6riQTNG2I2B/
	xmorhk2hHkzGDxnRkYWyzU6PvQfdyL88jwgM2XA/1lsm9DmJqy6p3EbLcez7HV/imz599z/bOr1
	6FvNKWoUhvZjS/3w117+OZ5B149QAazAZgY9HjfC29bhziFBXMaTvOgjhuPPdiE6kVtUFcsyFQ+
	C5OHcJ4R9pf/vd2lK9B4PzAPQ==
X-Received: by 2002:a17:903:3250:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2ce9eac4b01mr23239435ad.16.1783762411975;
        Sat, 11 Jul 2026 02:33:31 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm71389135ad.65.2026.07.11.02.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:33:31 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v6 1/3] hwmon: (applesmc) Cache fan positions during register initialization
Date: Sat, 11 Jul 2026 17:33:21 +0800
Message-Id: <20260711093323.14529-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711093323.14529-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support the read_string callback for fan labels in the modern HWMON
API, load and cache the fan position names in smcreg.fan_positions
during register initialization.

Pre-pad fallback labels with four spaces to match the "+ 4" pointer
arithmetic offset used by all fan labels in the read_string callback.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..9b2d9ecb20c0 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -133,6 +133,7 @@ static struct applesmc_registers {
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
+	char fan_positions[10][17];	/* cached fan position labels */
 } smcreg = {
 	.mutex = __MUTEX_INITIALIZER(smcreg.mutex),
 };
@@ -566,7 +567,7 @@ static int applesmc_init_smcreg_try(void)
 {
 	struct applesmc_registers *s = &smcreg;
 	bool left_light_sensor = false, right_light_sensor = false;
-	unsigned int count;
+	unsigned int count, i;
 	u8 tmp[1];
 	int ret;
 
@@ -597,6 +598,16 @@ static int applesmc_init_smcreg_try(void)
 	if (s->fan_count > 10)
 		s->fan_count = 10;
 
+	for (i = 0; i < s->fan_count; i++) {
+		char newkey[5];
+
+		scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, i);
+		ret = applesmc_read_key(newkey, s->fan_positions[i], 16);
+		s->fan_positions[i][16] = 0;
+		if (ret)
+			scnprintf(s->fan_positions[i], 17, "    Fan %d", i);
+	}
+
 	ret = applesmc_get_lower_bound(&s->temp_begin, "T");
 	if (ret)
 		return ret;
-- 
2.39.5

