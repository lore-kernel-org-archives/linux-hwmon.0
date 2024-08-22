Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1A1386C0
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307759; cv=none; b=r3rGI/Hgo5c0cZPnF5N7tpGLiT5AmpvhRH75mBhn78Nt7j5t4RSBGEQMDZtBJT1774Zgs8klECCm3HSgU40otjDQumbgd1CJRO73S6xStxlVti/uh1zFnRqYvhy3WEJINPXQb6+c6l3dwn/lGwrGYAyCdLS90w3ttfTOgkhhBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307759; c=relaxed/simple;
	bh=XopjOlyfP6aP/RCALuCBScnU2dKMvLx+0o4oiQICrN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4nNlwLfJsyAfF8Jm0IcHoSD0qPPHYkJ7bye7myNvWeiJsKGI5+U7a7eJWhZdMkIyAN5o2f5T3dpJtHlOFZc8uQJqI/sRrPXo6gMKQqr1RIMjggD27EfUFbpvIZPcxgq/IapbmNOA80RTGvIJ3JvJYc27oayB/QcbWpL4lpfu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WqCg43B7gz69Lt;
	Thu, 22 Aug 2024 14:17:52 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C573140360;
	Thu, 22 Aug 2024 14:22:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 6/8] hwmon: (npcm750-pwm-fan): Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:29:54 +0800
Message-ID: <20240822062956.3490387-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062956.3490387-1-ruanjinjie@huawei.com>
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index bc8db1dc595d..db3b551828eb 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -927,7 +927,7 @@ static int npcm7xx_en_pwm_fan(struct device *dev,
 static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np, *child;
+	struct device_node *np;
 	struct npcm7xx_pwm_fan_data *data;
 	struct resource *res;
 	struct device *hwmon;
@@ -1004,11 +1004,10 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 		}
 	}
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = npcm7xx_en_pwm_fan(dev, child, data);
 		if (ret) {
 			dev_err(dev, "enable pwm and fan failed\n");
-			of_node_put(child);
 			return ret;
 		}
 	}
-- 
2.34.1

