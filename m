Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77C139D05
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307758; cv=none; b=gtcOuVz8JYsJZH9JebuLudVsFzcb3kVmPrwd5Cehst7y4NfdfFi04J1Bz+UHhULgb5UARtUkldoDcA2hEWqc2vzWj9iAVhiu8k8ucCDzsIRxfxDrazrQ1FPFnpBl4qPPoMNo6kr55XN0UO6MozS64AByZRLZZrbxGu3EIrnlPo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307758; c=relaxed/simple;
	bh=knOvrWTLKjpl/DrSBIpkjIWgtit+HoutsLiwT9GII7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5XjyAm1Qlkbe3MZKEjWcVNUt8A8BT8gTIxykbJXxWCjW0ORRNkxLhmdS19NyzX+AcMBo1x0uPG/ntxNbf9V6CH+O6fLCdFtLGrq5cFRSH6EE05xYb6k3ghUJpAE/T5qVtpn88FGHdQoQBHSdPtzGgxSsLGqLm1bVXhD63+Ibe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WqChk5fRbz1HGxl;
	Thu, 22 Aug 2024 14:19:18 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B94171400FD;
	Thu, 22 Aug 2024 14:22:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/8] hwmon: (aspeed-pwm-tacho): Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:29:50 +0800
Message-ID: <20240822062956.3490387-3-ruanjinjie@huawei.com>
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
 drivers/hwmon/aspeed-pwm-tacho.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 4acc1858d8ac..aa159bf158a3 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -907,7 +907,7 @@ static void aspeed_pwm_tacho_remove(void *data)
 static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np, *child;
+	struct device_node *np;
 	struct aspeed_pwm_tacho_data *priv;
 	void __iomem *regs;
 	struct device *hwmon;
@@ -951,12 +951,10 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 
 	aspeed_create_type(priv);
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = aspeed_create_fan(dev, child, priv);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	priv->groups[0] = &pwm_dev_group;
-- 
2.34.1

