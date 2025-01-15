Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7F241695
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946873; cv=none; b=Zgo1iJ3bgw1ui6wasz4QT0lvuoe1EQ8C5AKCrMvweqJTuRg7XxJzm4PRMsHdAGcqx34M39y5agDMgML53TeETsS/COznrzqnIX2FTA2ODOZ5xLPNKyE0OYl21iRW6jUHcj8yLqhjzQiKAWigqjYGVg4afDvtSrmOA4HIov/WsN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946873; c=relaxed/simple;
	bh=8/M2k5kt5xn7mMjP1QIkM8evk5wLyA83yTB8+llP/e4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KDFqgXqh1zzBlkJIUdQYoX+23beMqAwrraZLOhkxz680eUUzBHTeEaqC1bJpMs/WQz5s+T3YouAY0O2pQBS/qzesT58020/a6apH7Kfe8tYrPGDHtp0SqWW9Ph9hjiT/HqRx6/z18WGBpzLezMSzLCcE1BRp4aiwEk3Ji6dUu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=tmcaajDL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="tmcaajDL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21628b3fe7dso114826875ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 05:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1736946870; x=1737551670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFxqwdxvbmzFeNjYgIwyItyb97yd+3Liidm6Njhh/YM=;
        b=tmcaajDLpZ2+oMe+wMNH+TJbtUCEK3V84lV5pg+tACOZ2+CvWUGAO3c4MlyVwQ4TON
         vNGXS62EOD1sNu7T6xSntxhZLtgORj2QDbQfRiId3Sre9EGboDiP1KsIP1tHWMHQTOdJ
         xuGwkN0kfEH1WVwdbS3nsbgsmS5OJbvW40UsNAsUSHfZi17dr4hpQ5Fey/ru5FcIP/Id
         D6tJr5QcAlrM1Rwy7rLuzdQGle0CKRVBUoYEPs1le95/yEQOqX8Ns1AGsMe4BkKgJizj
         x69qjj6CT0eIK9rAydJItYDem65tusJUBKvAJiSNrAGT7JVoofOtOAn/NE+gVwRpV3ZC
         Mkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946870; x=1737551670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFxqwdxvbmzFeNjYgIwyItyb97yd+3Liidm6Njhh/YM=;
        b=Ztw6nG73fORqYcOM5Em+zhb46fwFbH6BNvRlYR9KV9hWMhaMLClZ7PI9XQpQ74qTsv
         3vkWvwPJfi/9fCR5zZWcA8nM1MWC0sVZXLcZw9cD0xUdbgdjiZhzG3pJP1xkMM3dmFTF
         lAqOJB+wGJHkRl/OqFiYPhJ+FjeIOxdxwLSOHPDqehOrNCHBFyIPgFRiM05bi/e1xc5b
         xioBWyK4OIWwjSLPwmrqED7e2yZ9YWG/WBr+QUbwc68DnnwuDI8fCWW0znnI4SKfcUrm
         wFabgMo6XRVajdBA+vymhKNxkYoAFLhLxpGpM3cSWnvqtGW8aJS67IkL/L46CdvuLc0R
         1Y8w==
X-Gm-Message-State: AOJu0YweLvUW+vpM1lGAs2VFft52M+R+l2edK28GRRU7NshCga5lkgLn
	pZtZi/lf2zdP25E1/530rYHqRbdRdvLbd6UC3si/CKsf+UoNXt2pI8nxymIVbE5+DFx2btmuq6U
	=
X-Gm-Gg: ASbGncvE5xPQwQtWRwhF9D/qyRoTEL+CblHJNP/h7FrCspvTbhuM/sEZYnAB7a3IHbu
	8TkqvQQu/PRZyWKkxwTmR3ArU98o1VjtC70kGk/P/l00ZznmKiQCYvh2kSYrdTNSxIaxoqR7G3Y
	yacK5laop3GrO/kmGhIFnZ0/eoCu1F1X3CtMEZoFl5K1lSAHawlwZUa+bKrIzTCt9TI8ZWh+9YA
	pgIER7/KSAKtSaLpKdw4rcCCBUHC3GB0S0J+v7lio76UGSZ2/SjE7AHNRheuYh4bg1O7VTFNmPU
	S5mr9JGV
X-Google-Smtp-Source: AGHT+IEtBhNT9M0Hr4NWxVpHDetPRmPrjZ6SCxOKJjxzUc0xpGGGFMAJwMJDQZQJyYcH+/p+f4mIhw==
X-Received: by 2002:a17:902:ecc5:b0:215:75ca:6a0 with SMTP id d9443c01a7336-21a83f5e51dmr512671415ad.29.1736946870516;
        Wed, 15 Jan 2025 05:14:30 -0800 (PST)
Received: from totoro.local (c-76-132-108-20.hsd1.ca.comcast.net. [76.132.108.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12a741sm82889075ad.56.2025.01.15.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:14:29 -0800 (PST)
From: Russell Harmon <russ@har.mn>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	Russell Harmon <russ@har.mn>
Subject: [PATCH] hwmon: (drivetemp) Set scsi command timeout to 10s
Date: Wed, 15 Jan 2025 05:13:41 -0800
Message-Id: <20250115131340.3178988-1-russ@har.mn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's at least one drive (MaxDigitalData OOS14000G) such that if it
receives a large amount of I/O while entering an idle power state will
first exit idle before responding, including causing SMART temperature
requests to be delayed.

This causes the drivetemp request to exceed its timeout of 1 second.

Signed-off-by: Russell Harmon <russ@har.mn>
---
Here's a test case reproducing the issue:

$ time cat /sys/class/hwmon/hwmon9/temp1_input
28000
cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 7% cpu 0.023 total
$ dd if=/dev/sdep of=/dev/null bs=1M iflag=direct &  # Generate background load
$ ./openSeaChest_PowerControl -d /dev/sdep --transitionPower idle_a
$ time cat /sys/class/hwmon/hwmon9/temp1_input
0
cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 0% cpu 3.154 total
$ dmesg -t
sd 11:0:1:0: attempting task abort!scmd(0x00000000ef8da38c), outstanding
for 2098 ms & timeout 1000 ms
sd 11:0:1:0: [sdep] tag#4639 CDB: ATA command pass through(16) 85 08 0e
00 d5 00 01 00 e0 00 4f 00 c2 00 b0 00
scsi target11:0:1: handle(0x0009), sas_address(0x4433221105000000),
phy(5)
scsi target11:0:1: enclosure logical id(0x500062b202d7ea80), slot(6)
scsi target11:0:1: enclosure level(0x0000), connector name(     )
sd 11:0:1:0: task abort: SUCCESS scmd(0x00000000ef8da38c)
sd 11:0:1:0: Power-on or device reset occurred
$ time cat /sys/class/hwmon/hwmon9/temp1_input
28000
cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 48% cpu
0.005 total

 drivers/hwmon/drivetemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 2a4ec55ddb47..291d91f68646 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -194,7 +194,7 @@ static int drivetemp_scsi_command(struct drivetemp_data *st,
 	scsi_cmd[14] = ata_command;
 
 	err = scsi_execute_cmd(st->sdev, scsi_cmd, op, st->smartdata,
-			       ATA_SECT_SIZE, HZ, 5, NULL);
+			       ATA_SECT_SIZE, 10 * HZ, 5, NULL);
 	if (err > 0)
 		err = -EIO;
 	return err;
-- 
2.34.1

