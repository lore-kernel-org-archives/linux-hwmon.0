Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4D3CCA18
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919232; cv=none; b=r7V2tpbq/jLgzMrFxyUKNIqEWg8w4wpkmEoo2NzXLRpT3cEe7aBh4uAyRTXV+wukjq5BYYURzShfo3ahfcTN1+o14FyPLPptn11Zk8rU61zIw8eO+Lszln5iTHE+bpF/43pCMLazO1mMbWAHCSLU7uusb3yEW0GKLtfSc20mi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919232; c=relaxed/simple;
	bh=GhkLxLYPCxpc9PsKwvhUrQ5yGIUbYUQfRhs89HYd+aA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=OoduDA6ffV6BCePFki3fWm9GMVH0ssOWqSoyqk92s899NJsN0HoEFdrc3RVh9rA9K60HefllKGfGjeWVsPImATcXRa0JoirTmolnfhXFfNRqOhtVKMXdVZSS43VwwS+wo3RsUkT8EY8ykH0PHzcGnhEUrcoOoapar42CMIAhrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N912/xRI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N912/xRI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b04b4974abso7353065ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773919229; x=1774524029; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BX7UhLamXYXi9uao0OdKXRisI2hK+iFiIkDipABqS14=;
        b=N912/xRItiKMuMp0iu25KMwfDFYVrFFDk9jZSndCWuIDTHe3aB5bNJjaeoV/+4VVf9
         72h19e3BV5ppSBDhAvYMCPMFa2UDY1mrB5ktND0o6EiKb4FndtoslFRYtLeGkLRe/is0
         oljm8XGeynW5vMun/UeyUMCSB2px9J6VEV1q9xx0Z5STdp7FIhwcj7fy7iAEJ19gVkVZ
         D+Qp74StcoRRB3wP3TX76vpjUyn7Al/zR046rm1EEJ6ZvoiLNBxk7LN9UygINqKBt72Z
         vqlvKeCbyfFDtR0/k6dieJQMDWX3HIQO80QjohGTqw2EiLoBjSvA1PMA/FR8hffS1D8i
         FH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919229; x=1774524029;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX7UhLamXYXi9uao0OdKXRisI2hK+iFiIkDipABqS14=;
        b=ruLc8U0NGnddVYvCF6H91Q9flk7mWSrd6hcacsz4RZ8nTf4AOwQeCcHNzGLTSTGWTk
         W/PAAlk5nxEaVAqMlvr2L/eGVXOf6ThUPJPqlBgjxy5Snh+3dDiLUMrd8jA9hKQbGR4s
         wwxDu8G4N3m1aIDqUbvBFr3Ryp1D1EIKH1jJzSIujCedqLzjjud6bpqm0Zqzx7peJE+R
         8WsS+luWfzYQ7Jh7qV3UmgTAF4f/5Nz9kmeCpIuZt/2oaIbUAz+wjlIQnzkkupiDE+6S
         m+ZJhH9gAmrsugowpE2wakXvuvE3qs+EFr/nJ9PaEQSbZVmVdRPmKXt0RFooxIqCcbJU
         aO0w==
X-Forwarded-Encrypted: i=1; AJvYcCUFwBxQvcdaRX9PSoNEexvq8kICmXC0i8rQ3/HA1FR6By7WjFqjxHHJxqbhHb05BJmvOTpXGzN6hERl0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Gbj/9UAf/tqDKoa3yRaOLRPlYsIXJri/CSMXCHXWegI5NouK
	K6FmQiPE7XwRTWqt21VBxNzU/gmRJnLY6daVVUbpFZkchMaQGYKjrdRO
X-Gm-Gg: ATEYQzys5DDSkKZLj1Mczn1hLjwCwLfQqIamRvVh3IBGgpUZ0veC2BDVyXakDdQaNKO
	bICgriJ+TijtsHp87h0dKCasfw+PadjB7N7in8HoJ+U3g4MWOSm6hyQrOm5zVRtMf8c+wTBER7d
	7c0L36C1Y/H7TLGytEVHWwZEeDB6bnA/67qlaiUZH1Aey7yej9R9GpkgN6zdLdhkd+wqClwrJdZ
	1r8Q8tUSmcUbgJKzxdYugTZEBggejQCEP7wicxVz/Deurpp/eIbKAYFxbiOpy8kuWan32/Y7ZyG
	qeeKchhE/zmPQuEMkbWq4AaOx1EzcwTVLT5IPNOA/6qeHzZQuKNVwLKoy0gehjLv0SLWtNbArNZ
	4jvukYZNXcpTNcZZpIzXXeOx+zxwMt09eOR5ojaPL6eJgR9qpNvj8zH74jWWOcP3oXj4r/Is3y7
	PVAekfSaevMvetiSLZK6he7cYRbwBqxY3DUa0UTAFcn1282SIi45dc
X-Received: by 2002:a17:902:e88e:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b06e3528bamr62547695ad.16.1773919229455;
        Thu, 19 Mar 2026 04:20:29 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199easm76524585ad.5.2026.03.19.04.20.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:20:29 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH 3/3] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Thu, 19 Mar 2026 19:19:46 +0800
Message-Id: <1773919186-17515-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773919186-17515-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add support for GXCAS GXHT30 sensor to the sht3x driver. The GXHT30 is software compatible with the Sensirion SHT3x series.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..4e2e5671610a 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,13 +934,26 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht3x" },
+	{ .compatible = "sensirion,sts3x" },
+	{ .compatible = "sensirion,sht85" },
+	{ .compatible = "gxcas,gxht30" },
+	{ }
+};
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
@@ -948,5 +961,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Your Name <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

