Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029F1A9B58;
	Thu, 19 Mar 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900291; cv=none; b=CJWjojgBs6dYyCV1jvWSPROkns8Ebc5Mx5ApmNjPT473wz85iJNW1emvCkQ0pMJaWR42RLPLbdLK1IiwYZMn84QpGqEJiyN4yQ4r4IggKVzGb+7/sXPoUN5MTMMjkEN5eJxCggpbAmmz+KugvHNG178b6H2NFMKq7PLBH4eU0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900291; c=relaxed/simple;
	bh=xN7sLqYhl9HAKRfWnuVzFxqFn/br0Bl0gFke+of0BDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jcccC3wcBHUcmdgbhdHt0ULNO/ZjBeEf9DEfu3bTGDsvBxEWfnzh3fvEYF11ItcO6pgiQsvcjKloRjCAvMzJdYbBEPMeneQPLQ59W2XsYscYAdu+EC/eLfkA5bz66ugrZSoZt/tuHmX8ec7e+fo68z7AJiZrc8hzjy0cv/idSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mX6gJlGr; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mX6gJlGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sW
	8He8+FwkXyHwTK0tRaDJry9ai8pUezg8lRa+W7Xrg=; b=mX6gJlGrvfSAjNFkW0
	YuZa4W5zpHCJDK0Gzhjz1aRhwf+iEhheui1yro9W3fapf+l/0jT4pgm2UEe+tpjP
	Ehvxn4zmLIbZ7LGkmaVLRUtq4oiwnSHYSQXDptbscx9209GBd7HbBxiEBHsUP5gf
	atQOEhThauUxVeQV382RgHrR4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgCXv5BHkbtpKQHgAg--.61255S2;
	Thu, 19 Mar 2026 14:01:44 +0800 (CST)
From: wenswang@yeah.net
To: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH v2 0/2] hwmon: Add support for MPS mp2985
Date: Thu, 19 Mar 2026 14:01:18 +0800
Message-Id: <20260319060118.643352-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCXv5BHkbtpKQHgAg--.61255S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry5Cw1rKw45Zw43Ww18AFb_yoWftFcEkr
	4xG3sFvF1UGFn3uayDCF1fWryUKw45WFn3J3WrtrZ8ZF1avrsIqr1kXr9rta47GFW7CFn8
	XrWDXan5AFnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKeOJ5UUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNAi-ZGm7kUjfyAAA37

From: Wensheng Wang <wenswang@yeah.net>

Add mp2985 driver in hwmon and add dt-bindings for it.

v1 -> v2:
    1. add Krzysztof's Acked-by
    2. remove duplicate entry in mp2985.rst
    3. clamp vout value to 32767
    4. simplify the code for obtaining PMBUS_VOUT_MODE bit value
    5. add comment for explaining MP2985 supported vout mode
    6. switch back to previous page after obtaining vid scale to avoid
       confusing the PMBus core

Wensheng Wang (2):
  dt-bindings: hwmon: Add MPS mp2985
  hwmon: add MP2985 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2985.rst                | 147 +++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2985.c                  | 377 ++++++++++++++++++
 7 files changed, 544 insertions(+)
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/hwmon/pmbus/mp2985.c

-- 
2.25.1

