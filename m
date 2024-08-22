Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21A136643
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307756; cv=none; b=BjgEZMmdfNyMBYdTzpn/S7czzGeg6h+YwgS/B0UHivksoEdAh7XKOsmo8iuKsSEtRpfeHyZtIqtEtg+OApIq7BVrRnT9ejuj7Tre7NS3AqjtKaUqtvzhN/GhMgW5RAmxrVHrBzMnUAlJ27IR/3wLJs5aLpRc7LBf6DvioUA4CJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307756; c=relaxed/simple;
	bh=iEENZbCtIGoSS5zb7tD/8mwivYf8UZvRQnGcpB7oN7o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DemEI6R59yyCjDNLdfYol3KFPYXbAf4wVtS7XIkuNRTKHbeIjISzxLz/nM7tpx4Upv9tySamE6G6N4SpDgB4mdVEExUAIELE7/64TX1bbgyTuMPmP31ShEOWJeeBktR/RVsAbkjvR+ylBa6b6iKN7A6EF+oVITuYQmRVz3O5yO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WqClf0QGqz13bv7;
	Thu, 22 Aug 2024 14:21:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 171EC1800FF;
	Thu, 22 Aug 2024 14:22:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/8] hwmon: (aspeed-g6-pwm-tacho): Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:29:49 +0800
Message-ID: <20240822062956.3490387-2-ruanjinjie@huawei.com>
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
 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 08a2ded95e45..75eadda738ab 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -456,7 +456,6 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev, *hwmon;
 	int ret;
-	struct device_node *child;
 	struct aspeed_pwm_tach_data *priv;
 	struct pwm_chip *chip;
 
@@ -498,10 +497,9 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node_scoped(dev->of_node, child) {
 		ret = aspeed_create_fan_monitor(dev, child, priv);
 		if (ret) {
-			of_node_put(child);
 			dev_warn(dev, "Failed to create fan %d", ret);
 			return 0;
 		}
-- 
2.34.1

