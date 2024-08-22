Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD6136E09
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307758; cv=none; b=VvVp56uinijnJ9gdps/F8m2TFCLd1BoHIDH6DNyKRkW3k4hT6IhtfgDxm+6apMrWUXe+6LYZA5RbFL9NKgL9wTZz6fpr83lRoRitH3PXS0DTo6KkPGCcCKHvXLN4KWuYHX+XW5nx8PYuw5QYx3lVBN23+56T4TBndRLmB/qG4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307758; c=relaxed/simple;
	bh=nChb9StTz+kD6AjhpdLfarKf5QitGFIU99nAVFWo9Yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWK59J8qjlQ6LFYGipXtjcwTXpLzbTL8zlOT5YSFd9uKUZMswP8uY3ToBPeq8jMLw/ejrDn21f+T+PKpto7AuRa3kLeTWxbFDY8JOdD7Qld3s779NV/F7TMbHmh1gClw7oniN9nvd1Wba9oUk9gyv9kSPto7oMnucTDSSe9VlRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqCk75YBRzhY63;
	Thu, 22 Aug 2024 14:20:31 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B30A11800D3;
	Thu, 22 Aug 2024 14:22:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 3/8] hwmon: (ina3221): Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:29:51 +0800
Message-ID: <20240822062956.3490387-4-ruanjinjie@huawei.com>
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
 drivers/hwmon/ina3221.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index f0053f87e3e6..1bf479a0f793 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -813,7 +813,6 @@ static int ina3221_probe_child_from_dt(struct device *dev,
 static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
 {
 	const struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int ret;
 
 	/* Compatible with non-DT platforms */
@@ -822,12 +821,10 @@ static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
 
 	ina->single_shot = of_property_read_bool(np, "ti,single-shot");
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = ina3221_probe_child_from_dt(dev, child, ina);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.34.1

