Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704B2DCBF8
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179251; cv=none; b=XpBviLfNfet0PcneSNGyBNiAu4Yh2QpqUcCT+emYU5HHmmG4pq9WjShCA0I1a3gJpCW55pB5M8LRR3KHunwep7c2Xr9er5sHhBFSgzrPyOAoItAT5fYw+cgfPzXgYulIPgfCk/ihK2E7zPdOVmMu3PIVU77PU03uDOb4UUh4Mb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179251; c=relaxed/simple;
	bh=zjDOP3NHulARR2kqdfP944Coj1RRGVQg0ZnOEHzm3f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhKazOBlShG5hPEXbwBmybBd8dZ8AFRRHMmzJjSlpPTJag6hbBRt1dq8vRjjx3ziakUbbEW00sUX8xQsZy1o3vny7YkXXT7n3v1FGUYTIPb9H6lJ70ys4KLHAWjaLnIkq9frDfDhThv3KKkbtycxokaC1UF65lNlWyVsNOt6XmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxyP3AQq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxyP3AQq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8584e80d59so341150a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179250; x=1780784050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6ghhOvtg7q/Al+on674pSbRPZIg9s82qrJB8nX7dcc=;
        b=hxyP3AQqL5rMTJdFrGz7iLJQXtEjJFkJLvv2yEooX2VHYxZP899nAbLch3FSCj9r/D
         YJSuDPFSgYQx6eY0QHWbSCdDKBzy4eTyANaSy08PSbADdQiWHh3hHVADgu4enG3E3lvf
         WK8qA4I5DlvE8unG+ZJbw5MIkrTEoiRoVMHQNpZTnn4LipMrjjPZUtOV95N/642rVO1I
         ROAhUEHH1U0sYKVYe5vxkxNqqki5qBjICSIDfJI4UcthAUmL1ljfjp6sVvmFemBXs9On
         EHCiQHv91Kc/OywTaCl0NXJx80lm76yKGAi0F4NF8ImGQFUiLfO0sPASqE2fsM+ynNO6
         llVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179250; x=1780784050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6ghhOvtg7q/Al+on674pSbRPZIg9s82qrJB8nX7dcc=;
        b=S/JJtwGFawxStGTvSSQltEle2G0tWhh5T3dTa3Hlr7mUS4LZiTgBo8Y3jqJudH3fiB
         jDxvX4bn8OXI4PqqL+z2UVcuxy+vNT/eE+yrRzaLYqleozFtQ/NqPm9/Hi4UBRs9D+r5
         baHadX11e6QqgNdXvRf6+kxNKkiujG29mGarywTXGsMLlGk9sB83C1VsV5g6KrEmeiv3
         DKdDBMZQEgZRdH0xx6XGjiGk+0h3qzsv1KYKhnS5A2Qk2v2JnsiNh84EewW1ejPI0nc4
         GAeKYXrEiV3d1Lo4+QvCevagxvMXNaHTq5FVCTu5FDqy/ZpgGKRodWarj8lLDcNr5smu
         sICA==
X-Forwarded-Encrypted: i=1; AFNElJ+rVIsQ41mMAWvdFPatoNbEvH6+k7NOD01/PG526shhYGtc8LVpsoN5o5b1qNDVvI/n3BSIY73uvHk19w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurTv5bBOEgXv6Gsc/PCi3QmPIFuyC7sm5o/9mJ89A8sdyq0AC
	AmuCYyrAYLLY+GAThK5dRN7xwgPKLXW5NzYHtLq+qpr7duoKnQKj2z25
X-Gm-Gg: Acq92OH8Vno8+7VfqL4FQ3sBWELJ8sNXdAOgEU0ImusY0nTJc/hZhMQnrUIeYbL2TMq
	YHJpgaM+VNkaiyd69uCfVjFNRmVLS6SXx00pdX0ExwOEQ/FhNK8phd8xF0AunOxmdQo1f8hxY+v
	WZUDpkvqpBCxAYopc83dCscKteLaBD5UP11QH1V98QbfmUIhi2DwtAZeAB+lnhlNQ85bBw5FThU
	J2r1/wOxIhM3ln4rDE6wwa+8qesCHcwnY/27gCfV1l6qefis+iIESfoWzE/0SNSozJwEoDQRxTS
	EacPm1UuJMvnQDMXjWHzlMxXFktp+Npt7rrBiKP9tMNXjsto4Ds59Ug1mC80QmG/ygusB58rQfl
	FZ2XdhC2VGWhm011mWEp34V9kcPnw59p3xQ1vbgqK0Jjs0ZOICpYaqmwZ52hs0SVlXE/q4YFwSt
	YTErqnKuQEMPdJVd6eMLmKfk4S/IWqMsJQWCPDh28pO9SBew1B0UxCi4rTQ398cpOC5YtfKMnVX
	ATV
X-Received: by 2002:a05:6a21:6497:b0:3a2:dabf:fef6 with SMTP id adf61e73a8af0-3b427f5b066mr4882922637.35.1780179250110;
        Sat, 30 May 2026 15:14:10 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:09 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 1/7] hwmon: drivetemp: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:46 +0000
Message-ID: <20260530221353.159461-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use empty brace initialization (={}) instead of explicit memset()
to zero-initialize stack memory to simplify the code.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/drivetemp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 002e0660a0b8..b75cd5f5246e 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -161,11 +161,10 @@ static int drivetemp_scsi_command(struct drivetemp_data *st,
 				 u8 ata_command, u8 feature,
 				 u8 lba_low, u8 lba_mid, u8 lba_high)
 {
-	u8 scsi_cmd[MAX_COMMAND_SIZE];
+	u8 scsi_cmd[MAX_COMMAND_SIZE] = { };
 	enum req_op op;
 	int err;
 
-	memset(scsi_cmd, 0, sizeof(scsi_cmd));
 	scsi_cmd[0] = ATA_16;
 	if (ata_command == ATA_CMD_SMART && feature == SMART_WRITE_LOG) {
 		scsi_cmd[1] = (5 << 1);	/* PIO Data-out */
-- 
2.43.0

