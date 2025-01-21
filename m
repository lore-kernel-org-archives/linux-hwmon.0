Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B64C62;
	Tue, 21 Jan 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737462683; cv=none; b=QcQRkBqFhjrKnPnoZi3mbrYvLtQUyY7FJDlkmaaklqx1JIudmIc81COZqz8EHmaEDiYtmzn0NmQnClDYSfsIg+s+65/L8IRAS2u8gAG6lP5mlf82GgSU1p0zAv/3xdLgg/t8kHplZ4zDyraAh6hiFds2csDD8h+fJ9ntJMeyFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737462683; c=relaxed/simple;
	bh=3B/DbqUcWpKvaZVGEpOCKlqsCxc8FfJz90HoMEIqp+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kByQRHoJQw3G1n4PMPqgACNa+xMrKWSac6+6yGIsWLP/nyFrqvrxoMB65rbpKK6O6V2lcAZBj5UkFSDRzaO5Rz3MJCIdSTofz056Qg77RricsaXvhhLp3R5fr6D/j04QNcOizN41RmMcMU8ewNBlDu3kaEww9T1ShPdzhdtOHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqtwi/9R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqtwi/9R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb94cceso68318555ad.2;
        Tue, 21 Jan 2025 04:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737462681; x=1738067481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmZQPcaSfcIgB4B/0o/F3eWuXQcbMdlZK2A7IUyTUQY=;
        b=eqtwi/9RJG0j0H6C9iJpzSXmAEeWd/f5tsjoqDo/rYb/eXbz37fk5UkBrc6uwsqZee
         ksD5QTqa4M119KDhThdYjKQfpzSv81P8Um3HG5ObSm+FGYKY1ofpKZOAuk/8lmUqq1y1
         6vwkETpaXuFkxIItTSPPnfHZR23nSZL7gUUTVIRmnqkkkpEpNbXGnR59eJGofqXRxImb
         SiLWAzw039tyvnJJFmV4vqsPThClhXSQdJDEZxNo0s97K84qpCE3jluJ/YOLnapd2p5y
         YNZdVUg8MdAU81hoqJhY4LbcmmWADOV0XdSz9KELGS+4oog5OXKuxBp3UpWOcOqneDJr
         sd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737462681; x=1738067481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmZQPcaSfcIgB4B/0o/F3eWuXQcbMdlZK2A7IUyTUQY=;
        b=JAGqAbKzq3sHySqK5y7Qdl+4ksrypzMYcCjEDwUq43FBRHjbANcVHuV7E4JXj/95MR
         fz2dttw5y02/2Z7SVeV3HzukoP1f/kqCM1/itsdwtLL3p+XZoVBZTQ83I69cbX2i4+N9
         ABob64DNrbNdYo7XrUtIr1h/9byTuiSkeGBTlTw2ub0LRAJ6MlQyfUHui1x8tsUZMDWT
         5EfiUh+ppA+mrMfOVrHs5wgSjekXaOI9EjSUzql+Nl+hfd3o6RIjKQVLxxLi7PQNyZvT
         ap2EMRCWHT+iSHjkzohKE/UdQ8fptlLQT/nCDL42MxKXRxEFyCYNIr+mLF0u8hQkWP9S
         st7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKACFmukc+ElUpT0yEQLnE/19GLEfZTsebZg2irP/9WEQEFCcik2iynHHhVDohyYDtkL7HCXUyO/GMpidc@vger.kernel.org, AJvYcCUuJmkC0Git2G+booXHhgJLgUNbhkfGb6BJkhPsAnsbpwweJo6j6BTLtvumOMRo46O3dVvwFTp5Dahqlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2UgHu94xN7ygw8CUu1lT6BjYQYqEUyBHDVdDs9unn8ay/nCM
	ZKT9fWoPBXBzyiSceo4+Q/KyBxXrWNwz88TkQNI+4FdeQAaUif5o7LQW5w==
X-Gm-Gg: ASbGnctWYm2fya5EQ3rbbeKudsZFbkTecSC9bv3wZ4OJ1qjsFqDSuusGifQ215eqpET
	e758iBpYbPanHOTDoHQOW8O+JbjdYvxNRn6HMaSt1Wj+B49dSXWxdDCn6ClQDklUbpA7mDOGvO0
	CY+xBpfCJ1hucmx0x53mPqhIiKU2dA3KhH3rOLH2pqKpVaFTuV6xt8vFBUQD3DXtOVrOwOYihuj
	aG1mIYu7G5yULMVZHeZc37PxIiMCrtg0UcHBaBM78X+E4h7BOGQJ5v0wt7DMIoZ6wCUiyDZEyQq
	Ag3vitfNZjEqaA==
X-Google-Smtp-Source: AGHT+IFLpGR7vqMiJ+8R1BHhJ9AefTAeM9ZNXnCeJ8Y6SKn07uRPA2rkNs3bLz/X9/hF4ivW7ENE9A==
X-Received: by 2002:a05:6a21:6d87:b0:1e6:5323:58cb with SMTP id adf61e73a8af0-1eb214afd38mr25371578637.23.1737462680962;
        Tue, 21 Jan 2025 04:31:20 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:7ee7:e6fd:4c4f:524d:ebac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab849e1bsm8877402b3a.80.2025.01.21.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:31:20 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmom/applesmc: add imacpro
Date: Tue, 21 Jan 2025 18:01:14 +0530
Message-Id: <20250121123114.3393-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch adds the iMacPro to the whitelist
as one iMacPro has been released (iMacPro 1,1)

thanks

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

