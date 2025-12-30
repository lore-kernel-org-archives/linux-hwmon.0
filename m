Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7F29BDAE
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096701; cv=none; b=SUKCG1MqMBKEkIq6n90iVpSnUR+4l4zkI24dPOzGR6WtD5xkeb/Zz8Cl++MrR6za7yF6pG1mSzOzaQZkj1fAdjZkQShYrc1s7eB/LdS6kOBVbKo3yAimqdupM84m7KF4Hj9LcF0GvuU8dPJS7oPAKgrbMntVgPZQobid03M9+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096701; c=relaxed/simple;
	bh=bYwPh/r59Kdg8UF2Y8E9sVfS/EBt2eYuOMhRqwL5mYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gfzj8o3PImMvyE6ukY2ii42sT1dpm/qbHw/o55xd2i3UVDT8XuGMMMsP4HOFRNfQXZMMM3Vo8gFZf48ruV2OUyoON38DF3CwE6dmw2I82dzGr9cp7yg+D8NOURe44yd6TBm1DgjLZisAa0aZhomfBlVJlpM0z6FwL150kurSKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmUGxT4P; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmUGxT4P"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34b75fba315so10912128a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 04:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767096698; x=1767701498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg2RSLDr50+8D3pVCAL17x6JULMvf+H6c/F/QmhwLYQ=;
        b=SmUGxT4Pca9PZ1NntO8k1up5zjdFFpxhnSHZIOz2dxkuI+9dOOslznnFw45SSGh5D1
         7ibKBtR+peOKEeggkvwcIavu6xaCsdgBwgmMv3B5pbwIEZ++8m77HNlpAi7LVmulpcwS
         sUirO7VahWWGwBvNiUSWoCWx835Ys+utTk5HyR37UNfhpC9zW5jTMyJN9blq/LbZVUWw
         xukR1kzRqbgjBvkBz16pUk39sp+2hgCwqh8OYGOuK8EXBoLyIFG6JNQFxvfSoXldGj9v
         Bi8USrehkil2sFbxzLERtf9Ry+qiTxpqvly4wNFHEISdHbs0GPD/+Xb2hyfML4cfCnGD
         0hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767096698; x=1767701498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg2RSLDr50+8D3pVCAL17x6JULMvf+H6c/F/QmhwLYQ=;
        b=MK8SGtcV7HNsHXAi6lmKHNL9meCXsEMQ7DmgcCBWJBcZSvScxCJYxzStApQrXY+fh9
         6BnHFqxSrtin9Z2APvUE5bqcvZV4aijVr8NGXNVX4NX34vnop3PwT8F1T7w+J0DijsOm
         Hom8M1p8hod0wqy4jQ/NBZqW9OSbwRutSuHPNkjalSeop2tL9QmkKsG+u3dItbPV1afO
         L0z6YU7+5ho4mw5aiXaRdpfDXTaMA4ACsxF2FIcYEMsRSmn60AFWQDkJpxaEc7TB/eQK
         Ahhw5AdNUsetOTAr7jceVlavKiGZrVrImuz7JRWxTUbHgOoxtP74Zpy71w88TIGwmPRa
         eWWg==
X-Gm-Message-State: AOJu0Ywb/T02s1cM0+TfBR8k3NnQH1eotJs4SivKExSMdU/cXut9sba6
	G/RqoFEBmQPNw5jhGLunmPpV6OLa/4XWwLfqOH89dH3l8lzMNjCrdgmt
X-Gm-Gg: AY/fxX4NNOFEKLc4bGowvWhozR5LCrep4sl5XPIcRLBrHWCOAyUWyZWIEDUMZn0FRNk
	Z+EiMTSJO4Vmu2rdVU6p5W5JSAAOfJK60id/y4S382NO95HtspwxPrgvzk6vYCIuJKZbYoXHPeM
	MAU1ZNTXGrYAPtErUli7d/NrRIo+/M8Rpzf+Xlp3MaK41g3hzCVkbst/cnbDouV/iz97+5xXzpX
	jNIXBus8XCacQC6b1O2r+YeZPKbOiii+rZY/jSoq1Ks79FlHtpgtz67UxRJZKcMOeDpTYtQlFfx
	78cyLSyugS9WBjXf6QRtRwL1WFjwnoGtIdKCAK/4rXTWvfvXgm+QV41DePLu2daN4nvV99aGeJ5
	TzRpDWGOW8L/8ou+E9PlnqIA7ZxqPj/RR0ssLP3cdx6cYzVbxGEciMq1x6S5XDZlOcL87HltyCW
	AXm83Bs1Ge6InrZLIsTVMKsT1QqZTk7OFX9nA=
X-Google-Smtp-Source: AGHT+IFsA4ByogfMPMDsyAcE+PWG8R83FWQ4jtwa8BfM2ldpe6mZ5mSKioruKfLYtMyB+/2wt4BrXg==
X-Received: by 2002:a17:90b:2d81:b0:334:cb89:bde6 with SMTP id 98e67ed59e1d1-34e9212a469mr28339734a91.4.1767096697749;
        Tue, 30 Dec 2025 04:11:37 -0800 (PST)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c2e20a646e8sm13383628a12.11.2025.12.30.04.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:11:37 -0800 (PST)
From: SeungJu Cheon <suunj1331@gmail.com>
To: ray.huang@amd.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] hwmon:fam15h_power Use div64_u64() for 64-bit divisor
Date: Tue, 30 Dec 2025 21:09:59 +0900
Message-ID: <20251230120959.199139-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tdelta is u64, but do_div() truncates the divisor to 32 bits.
Use div64_u64() to handle the full 64-bit divisor correctly.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 drivers/hwmon/fam15h_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 8ecebea53651..5e3692606516 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -241,7 +241,7 @@ static ssize_t power1_average_show(struct device *dev,
 		}
 		tdelta = data->cpu_sw_pwr_ptsc[cu] - prev_ptsc[cu];
 		jdelta[cu] *= data->cpu_pwr_sample_ratio * 1000;
-		do_div(jdelta[cu], tdelta);
+		jdelta[cu] = div64_u64(jdelta[cu], tdelta);
 
 		/* the unit is microWatt */
 		avg_acc += jdelta[cu];
-- 
2.52.0

