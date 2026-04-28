Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783633F2110
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374599; cv=none; b=QWlDuDsxvugDD2afOxdHbM1D/hFp0ax/qB9LtcEghxvE249Sr942+zPaClY1KTVPza+Qw5D/F0ZslGdaMOSJH/vsXP68NSIKa3vCXBcJpE5pKmeaZvLBfCQdTjX8hAtKOVTc7x1JZX6uz/7BucaxDTEguZOG0grQhG+4zJOFG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374599; c=relaxed/simple;
	bh=suAsRTHjFrIOqwv3lU2Jbx+BstiSTswg+OLRbvjhTRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nCQ68xE8fGhY8nTXImSajMMXoXPBAmywF3ZMwimiI+nfx8GVI5ColY1+8vKvXLRPu43Rwz1zjYVIUh5lEiXy7xlc11wKgIsaGzMYweoJ4JtmFH9EnVZBVH6vdgm8ooDZP68bptu0A5aBlKxAGdLLVnbZv/UCE+Xutm0miv8jr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dsmgvwhh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dsmgvwhh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso3351160a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374597; x=1777979397; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrQZFdee6AdXqtxvEmtEoQ/GrYT0udvFIVRX406KnNU=;
        b=Dsmgvwhhy9WB2zGNzf0Ni3oPx2zAlmB8E5FfVRJ81CorVQB6p3S3QoaqNUsrbSQEmT
         /sNTJ0aYCW+2OaCLW5tu0lk8cVytf3faS+i42MvuVTouutdyqhP9eX41pngg+tGRNX00
         02aufaz4qT8sdAsZlRSGkuI0R3yHgK6Oz8ctbDT204aOTtjMtKZIWFl0rNTPIMs5qjSR
         QXmCH/fGrpAfOV5q6cZ1IG1jMEuRvU8oBsbXZhAqJoo3R11kZbmB8VcF7Gi4f722tIyp
         M4KTAJT59wgiplf9ci4ig0iNR/lDTpPwFfq90Nzgaobotjx1t9llc/V5NxUKKGMYZ4nQ
         9TXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374597; x=1777979397;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrQZFdee6AdXqtxvEmtEoQ/GrYT0udvFIVRX406KnNU=;
        b=qkNkKHBctVexQDJ2Jh982GsVAv6cMDcFlpC9yY+vtH1+mw+5/dq0T50nj6Sn/zIzfV
         TxhfZGIN0Jd98QUWVwhmV09QxD1uc+k5cZE22hIPlqmBDSzlDwUaIS6Bzcodejy1iKZF
         2OpaO5qRXkKlKJAr3FxMK6B9R36y3AmmBTZxlm/xgx4sQvr+MkXd6VKjOnBKTCsDxam/
         L49IgTuonIgt+zAPxifp6yimiYS39nV8suJrvJx3SdgP9AsubegCIlxLq4wuct0Sx7sd
         2DFsndRAPU8ZG14Rt7e4qWBU8rLbYpsUhFEbtgNbUXaOO4MiUhJx7a/prF45y7ytMvNb
         KH6A==
X-Forwarded-Encrypted: i=1; AFNElJ+qxku/hLl4lGoaxzbdCiUYQv9J4wEI58tUvwJfi+Dk+GMKO9BAbVRaFH2fpZXE7isO3PlqdoAy1abPtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/RILzq88RPa5H1HVo0aRD9CZZ9yC4/TLuheqOaRNkrRS8BF4J
	yHubiHaz8SxmE61CjTu8os+09ktgz7c47Eq31kt2CQ7GK44RxnXiy57A
X-Gm-Gg: AeBDiesUa33tB6PhynYa0kUAe0G8wCsbodcbCzgQ51of76wTFizj/lt9TCbMgAI5F2C
	aP6C4+UfJPFgcOCmbyjr7UrAe+6E6D768ejaLVcMulu1dsdyxOr/RT6cZZrG7EFKeZvRwP3n9V1
	XeVudRYUf1IABUwDc7LqnTRSiZks43Y1ht70KS8CiDnf7sDwoWEdGfR7vbODxywSUtIxUpcpW/z
	wdiTI5Ag1vtnMdqIokpv55USb/ikG7jqUCzbPY6LLSCc/S0XDaRt/ijXxHsRJTwbqV/4QCdOfEx
	0w10awoMtZtNRR2EDKHKFf+HLpn6aEPH79eGPi8Hp13yArmq3h6vFPwioGy7/29MGCbOI7q37NQ
	Oo45FdFvHnPDUztBEed9jyXIlhf2qTRPYTqpDfSLu7antlYrZ9DC6y4xq2WN8W2TronTbuZmlKn
	XbRhbuyJGy9bXp+LXFh5dyORM5YGmAEIeAH/vNCAlWSbanFlm7k+tmD/etAd3HM0I=
X-Received: by 2002:a17:903:1b2e:b0:2b4:5d0c:7a85 with SMTP id d9443c01a7336-2b97bd5a7a0mr24741225ad.3.1777374596559;
        Tue, 28 Apr 2026 04:09:56 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:56 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 3/4] hwmon: (sht3x) Add devicetree support
Date: Tue, 28 Apr 2026 19:09:28 +0800
Message-Id: <1777374569-59233-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add of_match_table to support devicetree based instantiation.
Specific match data is used to distinguish between temperature/humidity
(SHT) and temperature-only (STS) sensors.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..6437568aaf73 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,25 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht31", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht35", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht85", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts31", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts32", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts35", .data = (void *)(uintptr_t)sts3x },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.34.1

