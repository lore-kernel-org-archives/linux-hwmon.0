Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3312D46BB;
	Fri,  5 Sep 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104929; cv=none; b=u0cLHBlFaOL6bhgc05qGmWsXEvGQOatPRywOZGlfO1QAMZGDCTqflWC3wDa5l2TrdcyBCTNlzflvu2jh7t+Z3S/CvxMq9YJYGCB8iG6JF+8tdbhxzc6OJ0QKCKRfT+9yQexXY91hA+Vdh0ZyTNr4zy4/cWbiNcVZr/yu/u6sdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104929; c=relaxed/simple;
	bh=FwqMGezHCUAyy3PT/l27sfRUFZ7e5YLPcNkqD9TSlIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT6JGcB4ATQH2NRht8+MZxqbY4uspWVvHd+3nOkfdduISDSwlkr4fIOVzy3peYYh2hph+8b3OPrB2hgOjGPBsOBLQIfyRaO1RhLcMtOXEZYP8DFV+2imGEf0oRxLzhnLakHH4zXFUyAm3TqzKfs0La6zk3Q2zQhSa+9eLtWeeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHnBUCFw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHnBUCFw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24879ed7c17so20467425ad.1;
        Fri, 05 Sep 2025 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104927; x=1757709727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3J96DFZJVjd+KyrwGCOuefxQ5V3LmGx5ZkaX0CJG9Q=;
        b=EHnBUCFwrfZSFZJXntpvK3Lhj1FT6nDgBsKNPUc4/mmgczRt0OK0akUgn/bJYqqIhC
         9S8njuxjo8/IXoQSgGOkhj5L3fSOT955EQjoGagRxLy+z/T4IKq5O9Vgn/ZvXwsg7tHj
         zl2XufmsSfVGh/NU6RZuyHD8shLTQll2asnfBe+ysdXyjEEBGFgkRpzOE1r6Qqu/zEdp
         ovNA9MLbHWPqkcKedPCLScTnYSx+/CDH+ECOlkfjC53P2evCp2kZNdejzEM/BHF66wZF
         W73hZ8aAAxSrMgUNXJpwsG6vM5UtfTU/kFtbhKsueydwnURbrMd+5jOzvmELPqM3QFPr
         zJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104927; x=1757709727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+3J96DFZJVjd+KyrwGCOuefxQ5V3LmGx5ZkaX0CJG9Q=;
        b=FpmvRTTDCfNwZBqeToAV9GWZQbnyQN/LYMl1zYMV0i3y972mqoZRfTZxzOCwPJJZNY
         oc16OnkwaLCTQB0v6R4DUz7mTfSHVVGEbivDQ2KbIEbpyFRb/2ST0S16IchJMbH9eVDg
         bppOHm8fP9QO7C7C/R3y4Uo04rh+SeNraM0V46NLuNgjd1cGpX6dP/XpvZdXtKkmitPi
         RBZbYwL5ui1xbYlIewMcIkVthHLLYCbGiMvjH+JDdEYfD/L5H5siRU76AAMnCxfRPHBu
         Wh3M6NeJI0K6NJIYqAQ3qvUnuGaboULAW7SweZ2eX/9B0trB1gy5F3dZjtKAFTet2Y5f
         tqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjsm2IqcaJzvwuF9/QmZgRPln8eh6mndwONopAU+5Rs75sLlGA8bbKp1fi0G2LC19q8GTJU9Ibh8V@vger.kernel.org
X-Gm-Message-State: AOJu0YxDu3MV/CpUvJoLEXtbKIrC5Tg+cp+xt9fdduZibFt2ioGwrcti
	21VRa+vI+e2hfyolItvEnhmNb/8ztCaLuj7nUAoL+gcp5v84b58AGMLway8Q9yxK
X-Gm-Gg: ASbGncs1M2nh29KdfQHOyg13Vc4bShNSHnVLFt2pvSp9Sin32TQNYMd7LfdVMr3Lpd1
	xwZeMunsoOU95rzkTPSHLk9QA+o4Cxchq5UZfUZQDlHYnEIxq6YdbOVyBZ+LhrWm0H9UmloogrL
	7LQTuIan/4bHmreoi0gK8b/YBz4XTw5mrGNsRPrcKejV2QrlEAri797JQHdzaTrJiqPLv+L8Yk4
	xKbs/gXHXmChdquM8EoJE768VmpTn/ylU+HGazYPcmmqWaXgdnKiN8qwb9ER2A+/yl2KOPddYP+
	QjcHnFxhOyCU4fDGTbJTpMFVeVQIFBadQYPA8tdSbCyR8qQ6Dm0Y0Ubi/TZ1pcJTHOKQ4UGqHlS
	/2nwXhDADd0MSRMQeKXgb954Bw73s85CQl2hNQe28yVnfmg==
X-Google-Smtp-Source: AGHT+IEw5mjG62l2LLqs73OC+EpQK4FybzuhCrh0dvweePfGMx/FjuLSt+uALyQNZvJf3RPPM+LA/g==
X-Received: by 2002:a17:902:eb8d:b0:24a:fab6:d15a with SMTP id d9443c01a7336-2516ee5cf66mr381145ad.20.1757104927442;
        Fri, 05 Sep 2025 13:42:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm13444148a91.21.2025.09.05.13.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/17] hwmon: (ina238) Drop pointless power attribute check on attribute writes
Date: Fri,  5 Sep 2025 13:41:45 -0700
Message-ID: <20250905204159.2618403-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is only a single writeable power attribute, and it is very unlikely
that the chips supported by this driver will ever require another one.
That means checking for that attribute during runtime is unnecessary.
Drop the check. Rename the write function from ina238_write_power() to
ina238_write_power_max() to reflect that a single attribute is written.

No functional change intended.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 22e2b862fb33..23195dead74f 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -503,14 +503,11 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 	return 0;
 }
 
-static int ina238_write_power(struct device *dev, u32 attr, long val)
+static int ina238_write_power_max(struct device *dev, long val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
 	long regval;
 
-	if (attr != hwmon_power_max)
-		return -EOPNOTSUPP;
-
 	/*
 	 * Unsigned postive values. Compared against the 24-bit power register,
 	 * lower 8-bits are truncated. Same conversion to/from uW as POWER
@@ -628,7 +625,7 @@ static int ina238_write(struct device *dev, enum hwmon_sensor_types type,
 		err = ina238_write_in(dev, attr, channel, val);
 		break;
 	case hwmon_power:
-		err = ina238_write_power(dev, attr, val);
+		err = ina238_write_power_max(dev, val);
 		break;
 	case hwmon_temp:
 		err = ina238_write_temp(dev, attr, val);
-- 
2.45.2

