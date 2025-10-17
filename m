Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A52D9EFE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706170; cv=none; b=iGK3R5l/5uG/7tPIaH8Py/5UnAq2NGSKk3f0qJpmbiyE4yyyP9xvJ9XivgKdZlSbeCj0s0GS21NLWzrkJoR2Y99+5837+/hYF5HuNFiVVdOF43wy0lBGJdqiegCHsYFmm1/dDRWmoVP6v8/7DD9y5JgIfsoG15RLSwhGYX0/jK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706170; c=relaxed/simple;
	bh=Gpb62VhA08oEAGFkEzgrR6AVc8XYgRpm2AgZS7QQyBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuyqQmJh06UOZvqs8c8XTJhxACDuK+kzMAH6eGl3epjm+kWDyhK0kPnt2AX8W7ZycW0UFzjmmXx/inbl19xkp0WqmDOUQxWwWZo0wbtkQtHFaA6CD1bur+rwPpe7tiwVicr+R6VCtxCf8F///47oF4q8eaafLeSXq3hVs3qRkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+clzMZD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+clzMZD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782e93932ffso1760151b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706168; x=1761310968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7EnFS+2CSdAVXlnNBNIQaf6HGeGVWY+gLW6ZDEQqDg=;
        b=e+clzMZDXhYSAhS3rQ2rdbLa5EpHXnnyA5YP4gNeMr5rIuHYCBnxM4uBEIGx99lyc1
         b36jeK5FqVVyhSHpGq+Ktya1feLNfU5INFyiyGjKqeIZBCzoRTkKdqDV/khyWLZ+Xtl0
         NdkmSzwPFpeCSBA/rvxlOTEkObEV4dmLfAIGQ/v2dvPZsvYD/XEBbLg6GQKBlPjRXiny
         fP17I3Q9gv4TpEmPlRnU7AccWgA5qAYjYXuTZ+4cWS/Zc//++hjgKkyMmsVz+K5cyQi7
         +KzPuxhtDkclVLlCYr1X2JwZqbehFo0ffZb0BG8MrdkKGtOWseSejchQo+fjWVgzJrsT
         2juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706168; x=1761310968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7EnFS+2CSdAVXlnNBNIQaf6HGeGVWY+gLW6ZDEQqDg=;
        b=OdD6Q8twugmOLH3DBLYk7u2uOA7y5FZ5ndv/XTuD8a9xV/CQELPnU+ZWRix9oHAJdn
         Z68O9UrK2Db4FliG2aBTXMTMhGhliICybputrY2hdtVzNbem1b2NQwIwvH5fJBiw/ByG
         196g9YdeL106+Q981050mn+J5LS9sR90aQxEiIO6YdW4KmSTvOgmtp9pHw84fEi8oBs2
         pyS0s5+gkTtG4zzC42OvAYE7bkwoy+EIIbD9Rt6gCEBH/XNCIHl9SSvSAwueevALpXBq
         U5LgxG7ihmHJYIQp5Df4jOvR9RyWLzMK9m7/ZbDcaf3+guqBcDEQbcD/+dZCBzHhuopK
         8iJw==
X-Gm-Message-State: AOJu0YzG9X5EyoMjQbKRupnis54JG3zIKHlxO0jvBO1m1QE8veieQ8oh
	JykMosLtimSAHRLyaGWTWnyEsgqWdCLVa1YqLdiAMwnBSfWkBAINsWU+lpqccg==
X-Gm-Gg: ASbGncu8hunlTRwmmCm3s4gelaAbas58ibYk4j+wxHrjuKcxIFFfhMUsqCk4TDWBdWI
	HT0uoRuKhkGKh/KHRa0JQQ1aJ23UigoHaF/aKAW+t45ItF+giGuzDAad6Oro02vEPeZGnCpZfmf
	yWnmug5iOzo9Wlt5Gdq3qBio31e1flVt+om8s1oVtPKFNB2lTuAU7wQ8MKAT4dJYTOwdsyFF9sy
	gXhPELnQphq0eE6zYzXgRU+xChTyfyK/o3TSTFAsIJppEDneVZaTbbX8Id7kezmTJ8k/jvjl+X/
	jrOH7+gZc1b1/d0bfaM2s6WXjqhaenesIkQAZyOf4ha/5vqhW7VCCqBewS9LCqLma7BIk91KP4Z
	VKsMP7SnFNNscq6P3uw6Nz70HS+CotiRLs+e6i/F11632Eo6H3GkvR8RIyVtS90bzmyUcN9VK8R
	qVXtqkoH0q10xBJyUyj948swg=
X-Google-Smtp-Source: AGHT+IEuBLXc6GNfYJG5KjNW4Zj3w2Xthq6PNe2qBCyWU4QvW0op1+0iKbUKvqpi892Nj6zzOj1UTQ==
X-Received: by 2002:aa7:888e:0:b0:77f:4f3f:bfda with SMTP id d2e1a72fcca58-7a220b25969mr4254290b3a.31.1760706167562;
        Fri, 17 Oct 2025 06:02:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0964c1sm25479489b3a.54.2025.10.17.06.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/29] hwmon: (k10temp) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:01 -0700
Message-ID: <20251017130221.1823453-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index b98d5ec72c4f..7fc1d97a9971 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -31,9 +31,6 @@ static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
 
-/* Provide lock for writing to NB_SMU_IND_ADDR */
-static DEFINE_MUTEX(nb_smu_ind_mutex);
-
 #ifndef PCI_DEVICE_ID_AMD_15H_M70H_NB_F3
 #define PCI_DEVICE_ID_AMD_15H_M70H_NB_F3	0x15b3
 #endif
@@ -137,12 +134,10 @@ static void read_tempreg_pci(struct pci_dev *pdev, u32 *regval)
 static void amd_nb_index_read(struct pci_dev *pdev, unsigned int devfn,
 			      unsigned int base, int offset, u32 *val)
 {
-	mutex_lock(&nb_smu_ind_mutex);
 	pci_bus_write_config_dword(pdev->bus, devfn,
 				   base, offset);
 	pci_bus_read_config_dword(pdev->bus, devfn,
 				  base + 4, val);
-	mutex_unlock(&nb_smu_ind_mutex);
 }
 
 static void read_htcreg_nb_f15(struct pci_dev *pdev, u32 *regval)
-- 
2.45.2

