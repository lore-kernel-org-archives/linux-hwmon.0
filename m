Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C313136643
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2024 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307753; cv=none; b=LXY3cG2Qv8Co7yjVlHEZVO7Qy7kTw/frf1m07Gww5LtBfdLiFjVX8GXRyC5+7sgWkkAJU8e/usRGLby5besXeKj7t8XVIdKiZCzPpxr35dwnwck7Eas1YPlzvKRviQr/7qKs9Kt9KDNYlLXL3zM5sJqaStf5mbLVBa6icej3/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307753; c=relaxed/simple;
	bh=HiBORPfnJhfII7pPrenSeFcP1Vk6hn0FGfO8z3uyrhc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bEZXePm7ivGQjYnCcZ60t18OkVYJR0xpsynZaS7wPqnYvxyIXUn6K3gTX96l3cJncsBqQWT+VNtO7bQLa6m9wzu11FeuvCNR4k/bC/cWKdT6GbXwpcFd64ZQ+qiuIEQowaCYbFQ+zN+q1l5uVBxw/Rpr/gNoghQ1L9SckH3ucfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WqCmG4bT2z1S8TZ;
	Thu, 22 Aug 2024 14:22:22 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FB89140447;
	Thu, 22 Aug 2024 14:22:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/8] hwmon: Simplify with scoped for each OF child
Date: Thu, 22 Aug 2024 14:29:48 +0800
Message-ID: <20240822062956.3490387-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Jinjie Ruan (8):
  hwmon: (aspeed-g6-pwm-tacho): Simplify with scoped for each OF child
    loop
  hwmon: (aspeed-pwm-tacho): Simplify with scoped for each OF child loop
  hwmon: (ina3221): Simplify with scoped for each OF child loop
  hwmon: (lm90): Simplify with scoped for each OF child loop
  hwmon: (nct7802): Simplify with scoped for each OF child loop
  hwmon: (npcm750-pwm-fan): Simplify with scoped for each OF child loop
  hwmon: (tmp421): Simplify with scoped for each OF child loop
  hwmon: (tmp464): Simplify with scoped for each OF child loop

 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
 drivers/hwmon/aspeed-pwm-tacho.c   | 8 +++-----
 drivers/hwmon/ina3221.c            | 7 ++-----
 drivers/hwmon/lm90.c               | 7 ++-----
 drivers/hwmon/nct7802.c            | 7 ++-----
 drivers/hwmon/npcm750-pwm-fan.c    | 5 ++---
 drivers/hwmon/tmp421.c             | 7 ++-----
 drivers/hwmon/tmp464.c             | 7 ++-----
 8 files changed, 16 insertions(+), 36 deletions(-)

-- 
2.34.1

