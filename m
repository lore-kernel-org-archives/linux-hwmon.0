Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D52110F
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2024 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719778835; cv=none; b=Z072FNGNxpcmcs1ZedRTK/7ZiFP0E/xvCRAXF1FNZbS+9yO2+iFME2xdICjrlsFrSce58hY3KDjwTjT+KsmdhnBC7kf9Kfp8ByqXFmG6hrTHg5J3d4EdzhFqsKUyFG0ocNoQJGR6bkYQ412CZnldev4ut/nBGP0cxoGNY97oopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719778835; c=relaxed/simple;
	bh=KnJr0OpC4K01hNPh1uYexfljNn4BosPbcQTW+ct2ln8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LDSqn9ZoxVCA0u3NlsOTLBSKrnBm7QGRq+wmSAy/aIHG/DIyvxXObqZX1odcUVuzXAFYPyIw2wGk7fO2rtPfrbWGjou52IfXAzSjeLFdTdOLhI4AGvdb+Qj2534KMDhYbJ+Wr9UOLMDiNo5lBbNDvMAS1IV6bQMo1odLqK8Kj7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAyzOu1w; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAyzOu1w"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d55ed47cc6so1608026b6e.2
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2024 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719778832; x=1720383632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tyR7SZ3SiVLQkxHQPF4jwVThmZQpI0P92jtq63GAgTQ=;
        b=KAyzOu1wCXAi1tSZPR4uotGwk3h/xzDFnwtntyXXkxuQVf+eYL3CyNUx9anXrNhGsU
         iioUngaRheL8bOXrBwWJjXcctoSwFPve8Y6JQfVXRWOQcMrvH8NyKQSTNJr6RtxsMT3y
         N/+jwpBn1Je8UW33RNs4erD0/HqfUhLfxd8Rt9GYkdsJ6ZMCpw10zNUXuP3j+ef8+XYj
         sf3301pT21YE1aug4PQHi+Yv3X/RnJ0QAYS6zSzDqyL9rRbAFugJyyjVL1s+KSNDmMuR
         hA2uBgY3UIjLe3I7E9dQT6G1u/G/scptLSj8rN7syDdRXfIywZlwaJGA7KYVV1JSVaBs
         v2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778832; x=1720383632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyR7SZ3SiVLQkxHQPF4jwVThmZQpI0P92jtq63GAgTQ=;
        b=am8tUYfsgkrDTaMBxUoBPx4V2orkFEhaCOEEaL51gRBiGWUrTcHsLeR4cG8rq4UawQ
         xr5DrNuEE3RmH/I/uQibZ8E7mKbbmclaoRL7mrnhB2u4JGLOfnqPMKW4l5nQ+rKTsynT
         WS822i8oxizNF2cqYeptCgjTR9jUHM8WTKpHiqHjtqf1MfgMDgmNcwrZwgz67hHSXQ0P
         WgBhDeORLKOXAwfZBy7YRr5fxUicrNp00tt286kjaK6cajOjXjf7LgFtih+oU0NzCUMM
         1/f4ycDVExx0JENttLNVL//DDBun8bvQ8PJqtqzsWZhsGMJZnA/6bPuerWbLkLWyuYjr
         liDA==
X-Gm-Message-State: AOJu0YxF4Kf1Jbp5vSWdJz6R2o7yq3RZ8bFbwZujLLuPjz9clzNtqcaw
	3BEg+4r7pKJHyiCZXA8MA+3Ea+IWUkvWeUwsNVX34wUJWkqK/i5UckhvVA==
X-Google-Smtp-Source: AGHT+IE8AKPLfUJ2TvuCRGYqVX/XCOdc+Rey2TJ6m2fG9iIx5w1tm8Np/opBp+jFr9sBxuu2r2+Q6Q==
X-Received: by 2002:a05:6808:1288:b0:3d6:2da2:2b4e with SMTP id 5614622812f47-3d6b31ebf5cmr6062128b6e.14.1719778832036;
        Sun, 30 Jun 2024 13:20:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044af3b0sm5179573b3a.175.2024.06.30.13.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:20:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jc42)  Strengthen detect function
Date: Sun, 30 Jun 2024 13:20:28 -0700
Message-Id: <20240630202028.1874325-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configuration register bit 5 must read 0 for all JC42.4 compliant chips.
Several capability register bits must be set for all TSE2004 compliant
chips. Use that information to strengthen the detect function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 1180af1b1638..a260cff750a5 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -413,7 +413,11 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
 	if (cap < 0 || config < 0 || manid < 0 || devid < 0)
 		return -ENODEV;
 
-	if ((cap & 0xff00) || (config & 0xf800))
+	if ((cap & 0xff00) || (config & 0xf820))
+		return -ENODEV;
+
+	if ((devid & TSE2004_DEVID_MASK) == TSE2004_DEVID &&
+	    (cap & 0x00e7) != 0x00e7)
 		return -ENODEV;
 
 	for (i = 0; i < ARRAY_SIZE(jc42_chips); i++) {
-- 
2.39.2

