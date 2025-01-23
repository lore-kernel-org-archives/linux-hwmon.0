Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA0288CC;
	Thu, 23 Jan 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634659; cv=none; b=gr/XiqFA2oJZUOrDkfKXDTdvu6LbkgCUMNUZ8+aAA0SZfjm2oywHaYqmZ42bgMqt+uK5f1CB4eYYDFsBP6B8iL+OmEuEhv8JoKlmzyl4gJh20yC22pShxIG1HMN/C42yURJbN8hNpeCGHGiEzf+BWz6Q/Ns6evxxwp81DU76Aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634659; c=relaxed/simple;
	bh=EP0oJEuAcJGhSnDueQ8mXGdKfzRBEA2tyUK2Rxg5yrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imquj52dz5N7mArHqtiKWmOjRek/zmJg5m4t52ZL+3tCxHZG46aHBcCYP7vJf2n/ZxFuuzlQHN/E0d25VHUJph4XD4JKt9hmnlUq3Ejdq6Vr04sfoXCf8zEuDhhaFAZdb0zxkeg3A+jes6Rj0XGn27RKhvpPyofaPLm2Vt4f6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI8j3CHz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI8j3CHz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2167141dfa1so15122735ad.1;
        Thu, 23 Jan 2025 04:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737634657; x=1738239457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/xY1eGauN3ukoUjXzPMJFfKhMopq5cZD4MH9ReUpXI=;
        b=lI8j3CHz7Z6oo0MIDtDCN4LrNEVSfYOqeVksp0HLb5F5PrxsqswPfELoxSFUziw3ZN
         Y3TCP88M6i4IEet28EPatDzqsM/OM+e/UTKC5+ITQoADI62UQ0A2U+qA0x6dNjVoyMuX
         aqAJUIvyhXAFfbAmX0b3r1SiXW1zVC9vojQ1EgRfSQHSl/LcAqnyWYpbHImAMF8VqTwc
         6MRdWgEgzDGG+ou2aH+QoxGN6JVk5M05kVqDVasnPCaY4+CCz5i9W/7ZBAeIUgQ5TXOj
         fU7YYW0iruoKXdno+xc2e+LkYXrcEyfTwEH9cl5AaHr8ubT0RYg54U7NMoiSlAwaHr8a
         cdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634657; x=1738239457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/xY1eGauN3ukoUjXzPMJFfKhMopq5cZD4MH9ReUpXI=;
        b=Er7GZjIoQmgwQlEHNwOlr3bKD1nz2s4UktRE8UUXCuB6qTBP91dvNhfH6VbMcMgpjZ
         L9Lm4BbO3fGScQtjahTKEy8MEgk+pEBH8B06Kn4dxQtZpMHH4uMRtu19/06b3wt+eevF
         0QHeMXIBo+A/MUWOok0O6DIIjpcc4P5p/oH/mSr8gKLC3W2W671hBQIenY/A5183JKkM
         2VmJbEzA+Lp7KLpVhtGitcMw5j1NZ7HAXjZHRQ/9j9nafx+t7vlnF4e79wUOKs95fZI4
         6UplS3lRit0BQ2ATCM+eUq2Bh6gw9k1Dqzi/tz5G2sczVKfutL7LMdAVFAMtLXtHrB3y
         qYvw==
X-Forwarded-Encrypted: i=1; AJvYcCVbym7JJxhd3WHYGuctKCFUcXod7NP2kTlXNJ70wufWhW5pDDpe0mdZewNrRgtmq9bBBVkjUmrKQTx9ZA==@vger.kernel.org, AJvYcCWtfpUCouXlv2iDLtk8nnfOVeEcP6P7KxECK3+KAe3jYwzAg88SKcjLgUYpP1DWwVL88ro+k5I8fzZLyyve@vger.kernel.org
X-Gm-Message-State: AOJu0YzCs4I74z0PZEP0Q7BbDAOOZJsmfVJEb7x2Li3xg7hibSw/b/5P
	AcsvP9E7PRVDTBsOn7ol8BjojnRIZ8VNAGykDCjf9HPXkN/gdcMZo267mA==
X-Gm-Gg: ASbGncssWDviN1hiZ+g97rPsEx26ykMkaUi5U9Lxd8V8hfeeMseHRmSRo1EOxarOA+3
	8B4hf7X1sisEf4ZFaEP4E/hqK//2oL8cE0j1zl02+UQ9AbGFkZ16h7AN7qRWZ4ULwZ8a3GqQdaW
	KJBFaZz3FI8IzU3aVTx122eOd44VvZYCDKxxk0ZS9JX0CFMSc32i0aAYj1rsSZTes7vo11bugmp
	TsBgIPfIVkWEgyokCLN5xZQ1e2d3HyWDPLuBLjtR9Y77rWg3GAfEzwTQ7RZwtibk8AWd4ZPetVy
	DrQUBiz+ZtB8OBcJM98NE3M=
X-Google-Smtp-Source: AGHT+IFJ2XzEY1fOLMPyq2r/40PPQXu99YMjwDiuQtqMSg4x1Ukxl/Nc8t/D0qoMep18Wg+WbJf9NA==
X-Received: by 2002:a17:902:ce08:b0:215:a034:3bae with SMTP id d9443c01a7336-21d9937aca2mr49524005ad.18.1737634656862;
        Thu, 23 Jan 2025 04:17:36 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3e:1731:11df:8c91:2a8:248c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d402e5esm111217605ad.210.2025.01.23.04.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:17:36 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmom/applesmc: add imacpro
Date: Thu, 23 Jan 2025 17:47:28 +0530
Message-Id: <20250123121728.1383-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add iMacPro to whitelist as one iMacPro is released.
The iMacPro 1,1

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/hwmon/applesmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 7964b0e0c5e8..20e390d595e0 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1373,6 +1373,10 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
 	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
 	  DMI_MATCH(DMI_PRODUCT_NAME, "iMac") },
 	},
+	{ applesmc_dmi_match, "Apple iMacPro", {
+	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
+	  DMI_MATCH(DMI_PRODUCT_NAME, "iMacPro") },
+	},
 	{ applesmc_dmi_match, "Apple Xserve", {
 	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
 	  DMI_MATCH(DMI_PRODUCT_NAME, "Xserve") },
-- 
2.39.5

