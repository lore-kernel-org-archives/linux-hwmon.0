Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F5139D09
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307758; cv=none; b=GphtxRZ5BGJ7IVTibjgBnFMxHtCKZCGnis+xxkQyCqisixo8jb+W5ynBdIHiEJYSevAZozTpYWViYYrkIROCVTdbSDNAAQNQ9/Mlk+SNwtkmjnLB4d5qOCPCgiqktzpQ8BpaCcfiGJ7lZWp8qfKh2IejoMlKnULjAP8G3nfdt6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307758; c=relaxed/simple;
	bh=5CYnxhI+wP8NNLcOtcK/jbWI/Gpq0JmtZoFxE8JekcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jovx3Y0h0G69GWbCOesNq93VkWhZi7B6AIyrltMkEYccSe17mDxuF0STFz7QN2w7VkBiqwnkyoCnlTsJ0YcotAW6BaTyKIrQgz8VeTatB1/ic6KSioVnG46hT+dEWsD4u+zr/yDDrVPCjM58doRjcycZbpbc8aeeKxUAWbZ6VX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqCkj6dn4zpTbW;
	Thu, 22 Aug 2024 14:21:01 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 87D7B1800FF;
	Thu, 22 Aug 2024 14:22:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:33 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 5/8] hwmon: (nct7802): Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:29:53 +0800
Message-ID: <20240822062956.3490387-6-ruanjinjie@huawei.com>
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
 drivers/hwmon/nct7802.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 5e83504800a3..8c9351da12c6 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -1129,17 +1129,14 @@ static int nct7802_configure_channels(struct device *dev,
 {
 	/* Enable local temperature sensor by default */
 	u8 mode_mask = MODE_LTD_EN, mode_val = MODE_LTD_EN;
-	struct device_node *node;
 	int err;
 
 	if (dev->of_node) {
-		for_each_child_of_node(dev->of_node, node) {
+		for_each_child_of_node_scoped(dev->of_node, node) {
 			err = nct7802_get_channel_config(dev, node, &mode_mask,
 							 &mode_val);
-			if (err) {
-				of_node_put(node);
+			if (err)
 				return err;
-			}
 		}
 	}
 
-- 
2.34.1

