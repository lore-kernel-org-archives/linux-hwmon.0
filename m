Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB22FFDE8
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455541; cv=none; b=Ai2xIwPiXhxjFpl18NYgoqkrsCypHVuba4DvTuk1TohpsRQzVFmeLlHka6bkBdonZQIRDZ7AYQ0Lqm56zSsuCkWRGbpVWHrsrjWOT0ACSOrElFBYeEYCTJjtw+AUGVre6T+9Wp1vNfVDWmiRlZFz+SAc+oX5J/jTrWIUrrdwkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455541; c=relaxed/simple;
	bh=Z5r7dbiDR7rhMPMrkCSOXVb7S03mUdTRDdRXkjC7+vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCO3AvpG/m0kKS3E4D+pHENB0irWNGrPIx5OFgTRfaweCihP/Bzmw2H4pCLBOawxlRkUEKztxOISOTFQQfaV3Sa6tRTzg26YkAKxWgGvfpSpcBeycG+jpobjsMtd35X3uH/tSHAq2WJnWQxKD3uk9BOO6QOQBX5wLj7Q+Shv40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxnT/Scu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxnT/Scu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2697899a202so43001945ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455539; x=1761060339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiCLPoiPV9ILqSK/KeMT3D6C/34XDtS+tPHl/SRrfl8=;
        b=cxnT/ScuJeHnoth3ABGIJC54Smp6/sD/f0QtLAwo1cIGXSFZNYa7RycthwLmO7EuBN
         2Phu8SfW2J3iEs4uIpVC5Br+mGtk8+vQk1NS9I/6yaHNAqa7agWlbIM3QonnK2fgWEaA
         KYP/GvjB9zPx1OP/nf4pAWvyFaIqCfbU2Ioztx52+5e7GACeaI29zeuTKwySk8S862LW
         sR4zNlvUbBvzYyIHd9WSomMhMivxI5v4U/N/Bq789aVqpgbIY//CPv98LwGrMcAr+NOg
         oDDCHTobD2O21SRFRcsHTQk66LPZ2qUj22whVogbRF9ecx51IMEn0APYo7AMX/Z9Xlmb
         LMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455539; x=1761060339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiCLPoiPV9ILqSK/KeMT3D6C/34XDtS+tPHl/SRrfl8=;
        b=Dv1cbQ9n/zQwVIJnCnMmJqfnV7BDe5noCUc9xJlfZ7UPxBH4zma697b3fXKmFVcajb
         PVDFQ93fBnUXffDwvg6q7cRrNWjecmr0+uVfoqQx0tswPD4QHP0QGjEPTxgycErwn5Od
         UQOgAzfymo2iQ7r73NFv16gZpjunsOlusIPhFqu1JCelLf34696Jm+IjFj587EtEvUeS
         PDxcTb76agVYWFr+ciby//4xOOVApGWS6aPqS8EIoguv50zPonGR4RfsQ+mnYeS8NZB3
         Ij2IJdjOmC5Sh8UWE6BToBE2pnO3GRNmvEORWU7+3aa1pbSQWLJrlUuWv7yiN1OEDskb
         UiVQ==
X-Gm-Message-State: AOJu0YzMZ5miDTAmBjiKN74JAiFC8l5tFBUpCp4xFVvxiMThV+4FvA06
	Pi9XvY23I9md8uVlaYSjqUlkikQGaAobxQPv2zUM9ERuK3afAcobdc13BrIkYg==
X-Gm-Gg: ASbGncvkNWrirIhRDW3SmDcScw9P5w5GTnUQ0L1Vzv0KgbOMloCt7pDH3pV1NFw5buw
	Xn75Kbh6Vnd0ZwrNxvGFWEX4BlkcDmV7i32Up45P0bNYaDcsm9KDVzQjj37Lr+j3YUKkvPoGHIP
	ybiLj/Wac2MP4bDqi9tN4z//Ef9otpzzyh3IUohj3wkESmTsyXmL3w5NE7AdBXDq6JksFCL8Gd8
	9AmmH7gnx0M3XTlOz9vluP6fwi+vv198iGcbK9UKDVTkjGWeluWr1xBYSMHprqy9+jhU6YGFhDr
	StMp4EjeZD0CKqaCVkvDhVWE2ht8gVsa/xjJoJpLxF4a+TwVAqniPc7nt6LwfXVqUjX2PF36o/+
	+Z3nZElDN5TtkpiIwjv+YLKHX6BPoykXmLOj+mljtDODVHA+ocR5mrg==
X-Google-Smtp-Source: AGHT+IGc2A0QHkBJdA6U1LAnDcg0yOlgEYSs8WVn8mJHfaOdWi2E3Bl4ZdWWcicnM2Mhe+57EP85rA==
X-Received: by 2002:a17:902:d58a:b0:25b:e5a2:fb29 with SMTP id d9443c01a7336-29027e78e80mr319918405ad.12.1760455538661;
        Tue, 14 Oct 2025 08:25:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05c2dsm167562455ad.73.2025.10.14.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/20] hwmon: (tmp102) Drop unnecessary include files
Date: Tue, 14 Oct 2025 08:25:09 -0700
Message-ID: <20251014152515.785203-15-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking and does not create sysfs
attributes. Drop the unnecessary include files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 376e0eac8cc1..5b10c395a84d 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -10,9 +10,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
-- 
2.45.2

