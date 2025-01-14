Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61709224D6
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jan 2025 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736838468; cv=none; b=Gr53ZRDjzaSnS3z1pz3sxtk7RZtYWE/bI3QUN2tIf7NJCxbQTObfo96CZoN+kbq93jk774fQBFdH+apl6JxzfpXG6FKXDDDZeDAvaQaCvwTMFc5nJgBQDfrVhrICEe0l7eDUgykjUcGxMjoFT/hEWFLMYmal3hvvW5RVBEmrd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736838468; c=relaxed/simple;
	bh=hqQ8UNNxhISiaqrtVt8b4QjCQFEQCgLwq62rc+1qnyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/YmPcNpOOQNkee3mARF/dkagYMMIBefGFjCfJeeJCSbjDScr7gjm5MUO3GYCUyY4IPMrCncQSA8v9har5MLl7sJdZtQb6eY37TFWcs7rji3VJQLYwZ04yKGzzZ1OKOb+n24+Vj41ugyZ8ptKwclWWn1kkQMtOQo6UHMxLBr2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=CCm4zXQ2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="CCm4zXQ2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21a7ed0155cso87821925ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 23:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1736838466; x=1737443266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXkdfBiCzrGYpnvVVtQDGZ9y/SMxQvVGGR9ZZy1KBcs=;
        b=CCm4zXQ2yjGsPmgYGbxDl+k+jTURy52EXRkg/zMuiEj17j8RsjoxP0weIVN+oN8ezE
         IFqJVDCC5uzzf4xv7TWNxBTvbCy75X4qJAHsNUawGC0SSgR+/D3v0BRVE+cEGTnyd6/o
         wxVvfHKfZ2VrfGZcjeTlBT+/WzmSiVCgiHEYs1XmD91OiI1NlL23BdOWpTzvRcxXFM4d
         1KziyJdfAW/XwQGrDWVy2/z61W+gyCn7l8HTCNh1IP3hDuAlLu78xPTIkEt8memuG4SZ
         2N7bvIPFyKLzNKmpotsHbL7jaujypV1LwEkAiaYAkXv3AEYWVzz1aca7+Wfk3fXpZ4hm
         blJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736838466; x=1737443266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXkdfBiCzrGYpnvVVtQDGZ9y/SMxQvVGGR9ZZy1KBcs=;
        b=u+SHgU2w8zvMb4Y3Z3no0gZZ0R0R5BMFj98DUBbIx2z92bQ3BWb5k2VzX8if1Hn+x2
         GjCV3PGZyUpr/OyxQe5HH0cpSNKi3YZhaXGnu2AknwCzzmO6fAFTTrS98iKiaZUnNpwA
         Vhev1lVUM3nLjCxd8Cn3UI/11hj/pO1rA9X+ZzIBIF+v4ZN3Nu+zDE8gaQczMbu/D+3V
         iDsmpL/pD6ym/bs/69OOtiiTrnZ4EmUc0MTHLa0idm7p9L3E1i8lXvTls2FbikjGzPqr
         kE4yPRLDAeWOAV/4vB8AMA9AZk3OY3aPAGRpbJJHoZibuM0ROnhyM1XVpz7g+lRxUHjA
         dE0g==
X-Gm-Message-State: AOJu0YzAO1yZJXMelGTY1ZAq6x6NAEBIF3RWcMx797jnHRCsjU60zFD1
	Tu/cxqldrEqb9SltssIJ6bVgxEWP6gf/q+Qk6Az5Y092D91KqQbfxiGeoSnkbQ==
X-Gm-Gg: ASbGncugs2Va6nxMxLWpV8sSPqtGZJdDiW9I76sEUBKUFrbPAGo4YYmV3HjQNAEFUH1
	V0/sZtQfBIbFxR/YG51bv843k5m2jOnjDaakkYtXpr4/7V+K0S4kygBVocl7XQ22wolwHuXD1Ux
	8QQ/6LgMCCAgpSVWn9YnrhvVcuAcW/u+3R1lIUAUm8HEGhyn/GG4B9R1nt7WgL1iud4Ezt8qjMa
	z6JCJVWol2ZQJHFxLWwyxb2y9hL325iYnZOvpNTLHJKesteLv4GEoo624pCGms7P/GtMLD873w/
	1qiBz9wa
X-Google-Smtp-Source: AGHT+IEEH/F5sHgqBuTudOyrlcoq9kazIeLdIBj36R8YXIBbkb8yEurDxtJpRUcPrySPMWCOY59vwA==
X-Received: by 2002:a17:902:f70f:b0:212:4c82:e3d4 with SMTP id d9443c01a7336-21a83fd90e6mr362435745ad.46.1736838465680;
        Mon, 13 Jan 2025 23:07:45 -0800 (PST)
Received: from totoro.local (c-76-132-108-20.hsd1.ca.comcast.net. [76.132.108.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219b97sm62332705ad.155.2025.01.13.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 23:07:45 -0800 (PST)
From: Russell Harmon <russ@har.mn>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	Russell Harmon <russ@har.mn>
Subject: [PATCH] Increase drivetemp scsi command timeout to 10s.
Date: Mon, 13 Jan 2025 23:07:04 -0800
Message-Id: <20250114070704.2169064-1-russ@har.mn>
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

Example:

Normal operation

$ time cat /sys/class/hwmon/hwmon9/temp1_input
28000
cat temp1_input  0.00s user 0.00s system 7% cpu 0.023 total
$ dd if=/dev/sdep of=/dev/null bs=1M iflag=direct  # Generate background load
$ ./openSeaChest_PowerControl -d /dev/sdep --transitionPower idle_a
$ time cat /sys/class/hwmon/hwmon9/temp1_input
0
cat temp1_input  0.00s user 0.00s system 0% cpu 3.154 total
$ dmesg -t
sd 11:0:1:0: attempting task abort!scmd(0x00000000ef8da38c), outstanding for 2098 ms & timeout 1000 ms
sd 11:0:1:0: [sdep] tag#4639 CDB: ATA command pass through(16) 85 08 0e 00 d5 00 01 00 e0 00 4f 00 c2 00 b0 00
scsi target11:0:1: handle(0x0009), sas_address(0x4433221105000000), phy(5)
scsi target11:0:1: enclosure logical id(0x500062b202d7ea80), slot(6)
scsi target11:0:1: enclosure level(0x0000), connector name(     )
sd 11:0:1:0: task abort: SUCCESS scmd(0x00000000ef8da38c)
sd 11:0:1:0: Power-on or device reset occurred
$ time cat /sys/class/hwmon/hwmon9/temp1_input
28000
cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 48% cpu 0.005 total

Signed-off-by: Russell Harmon <russ@har.mn>
---
 drivers/hwmon/drivetemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 6bdd21aa005a..9e465636f591 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -193,7 +193,7 @@ static int drivetemp_scsi_command(struct drivetemp_data *st,
 	scsi_cmd[14] = ata_command;
 
 	return scsi_execute_cmd(st->sdev, scsi_cmd, op, st->smartdata,
-				ATA_SECT_SIZE, HZ, 5, NULL);
+				ATA_SECT_SIZE, 10 * HZ, 5, NULL);
 }
 
 static int drivetemp_ata_command(struct drivetemp_data *st, u8 feature,
-- 
2.34.1

