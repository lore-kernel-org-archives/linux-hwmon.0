Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43230F801;
	Tue, 18 Nov 2025 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457128; cv=none; b=WV7xjhQ5Nv4f3MvTLYimF/p2dfeXDGyTWbj7VUG2dDplYVtZOmLvlHHOeZYGuirNeKKEHrejjxOf4xV/ZrS1A2Uu7fMKHzuWyN1WKFXVAFg0mM5unP1o2TLVStFm97s32MLt/T2b0MdA/ze/ZOFxWeXSsKKeDRV7kFavQ0ClTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457128; c=relaxed/simple;
	bh=ej2x2zXWoa7QtHmm0Xcp6bZn7Ld93lchW1+uF4w0usU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mTJm6xvl5RW2IjFmPJAGMKZgIvRZhcbomVWhcin3LbycseaqqVgZ3uO8Pm5Q75dWOMXtTcB+cS07OWjxK+4ls54s134X2AZgG7ykeLsvKVpk5EHgjUK8J4/Wjd/ZDM33z9a6ZghS++dcmR1GvC9LDBwha1prsAc90ozg8iqaD4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Nov
 2025 17:11:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 18 Nov 2025 17:11:54 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 18 Nov 2025 17:11:54 +0800
Subject: [PATCH v2 2/2] hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible
 string
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251118-upstream_pwm_tach-v2-2-4d9bc13d34f9@aspeedtech.com>
References: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
In-Reply-To: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763457114; l=856;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=ej2x2zXWoa7QtHmm0Xcp6bZn7Ld93lchW1+uF4w0usU=;
 b=HnxO8GIocP2qBsRGLBMEi8vf3FJlYvoCW5pB3v60VhbJxGm37cTh5O2iarpOooBe9rEzus7kj
 L4wG2WFuOmhBrsfpRo7dj0kDOf3agmQp05Q11mME78z+/lHOu1sltQj
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Extends device tree support to include the AST2700 chip variant by
adding its compatible string to the device match table.

The AST2700 PWM/TACH hardware is compatible with the existing driver
implementation used for AST2600.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 4174b129d1fc..44e1ecba205d 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -528,6 +528,9 @@ static const struct of_device_id aspeed_pwm_tach_match[] = {
 	{
 		.compatible = "aspeed,ast2600-pwm-tach",
 	},
+	{
+		.compatible = "aspeed,ast2700-pwm-tach",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);

-- 
2.34.1

