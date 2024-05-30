Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D791E889
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082599; cv=none; b=t/Yj7AhJl94cNlTXuPSTodbRwC8xpacGhznWdKVVBI2HMu1u2fGtbJE7zwad17BhyP7RwiQWBz9wYjHLoulTH+taz9dP/kWuOE+Mq6kzsPehnmLiNE5hnlvui1yzkQftdOZdOLtRPgDxkD4Jy4SPQpAqFzvMrIzv9dngfIW1A4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082599; c=relaxed/simple;
	bh=5Fa7xeNegDSvGBkhgZFlfX99zWjJYASFB6qowf5OJJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hzPM7he6nLWSsT0nHUAiaOkYFwUexWDtMINAL2+CLq7TMAK+q+rW8JX4r+4qWv5NuO7OwnuCeDu70XNoEzj/QK+g5wh7f/NYcWSXpVMZdfRCpO1p18MBsUcpNvKcLm47oEsihbk/bCbRGTS9+h6o1YvG1SLCsP5RLXUVPCLe41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/GKc6N+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/GKc6N+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6c104f64ff6so468671a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717082596; x=1717687396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Orp0px/VZdRVKXidTsVt6FX7MCovpGmHkFGGhRZPJFk=;
        b=h/GKc6N+F0RDyTJKhfLHHTq+nav1I8X6WPnKW4ksaBiEuQ9ienHF0Mplq7gI7ULgXR
         m/f2UnCNiajrtkNV2kKB/fEcCPbEH30GI9m0Y9sdi1AdyeNTMgcxSd2ZfIjvkQR3ih3U
         cpDnAqOGaSpVf3sgEbPuV+2+NaZy9AzBHcWzI63ZpeS+xMsw9jirMnI5BZPvn2s39fSn
         HEpESd6O7NOxDYv4m2VQzd0culyEqoqL292OrWhdB8T1Llsn8JUwZKPt0e7sdb5ppZfR
         w7sPSM3lsYTBcUJj7nZN+8L0p9EeBY/fmN+G/kpIVT0eQ6MR4I1VF1KJQhHlp4ClLn5w
         d95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717082596; x=1717687396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Orp0px/VZdRVKXidTsVt6FX7MCovpGmHkFGGhRZPJFk=;
        b=i3CM5MB21zBQlF5A5Q6GUzAHCJwacqsDZ7fM/FCd5f5bO9gxlbOnOhyILUEqHWtX7q
         hHLX6+csIOWDRNnRT3PzarJsBjVvJ55xtz+kLbsxzTKDrRKegYZ9dXpKA0kKST5fK3Mu
         BCLWmaGJNoqL4gOshH9KBIG9C1AEG9fSCw/9Faew3RcM2CJLfKeIayXco6nyDb0IFUoF
         EBMhFst4O3j/CvZ6cmvj2DDWgjHpLYMQR/1ipk8mWKDw8q1n494rhEmEuwDFhbI847As
         WKIF2IDjWyATPo3Qb1j/SXpX1sXu2/CPbE+VVBBzi0f7XpYZCJYN+5VZRhP8qRDVbSwL
         OXPw==
X-Gm-Message-State: AOJu0Yw7SfvR6cHFXdMJyu3KQpZerNdP/wA2EAQmXR/EgeWh7px76SL3
	N0PxDMO5wL3op0EYc76Q5uM8p2KJJu0qjVS25sMS295HvgPDKnob1g/gNw==
X-Google-Smtp-Source: AGHT+IGgoLS9UbM6IeGh64KnnQ/A9Io+izD+imuhOJtXEltLMg97+xPJjWmfaB0g91VR3V5aHoxVoQ==
X-Received: by 2002:a17:90b:1056:b0:2bf:5724:9ba2 with SMTP id 98e67ed59e1d1-2c1abc6acc7mr2501111a91.31.1717082596199;
        Thu, 30 May 2024 08:23:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a7788667sm1802980a91.30.2024.05.30.08.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:23:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: [PATCH] hwmon: (shtc1) Fix property misspelling
Date: Thu, 30 May 2024 08:23:11 -0700
Message-Id: <20240530152311.3765049-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property name is "sensirion,low-precision", not
"sensicon,low-precision".

Cc: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Fixes: be7373b60df5 ("hwmon: shtc1: add support for device tree bindings")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/shtc1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 1f96e94967ee..439dd3dba5fc 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -238,7 +238,7 @@ static int shtc1_probe(struct i2c_client *client)
 
 	if (np) {
 		data->setup.blocking_io = of_property_read_bool(np, "sensirion,blocking-io");
-		data->setup.high_precision = !of_property_read_bool(np, "sensicon,low-precision");
+		data->setup.high_precision = !of_property_read_bool(np, "sensirion,low-precision");
 	} else {
 		if (client->dev.platform_data)
 			data->setup = *(struct shtc1_platform_data *)dev->platform_data;
-- 
2.39.2

