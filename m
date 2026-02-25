Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A553876C3;
	Wed, 25 Feb 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011022; cv=none; b=h+Ap2DYiVhXoSQ+WKWKv+giHbZSwRuiciIIgmKOBXSsVnO6Pm67rLmM8Y9eWM47HMwUDaWRRufrDlOXW2bYDpLDO9YVPUhI97KfukBBKcYD7rE4AJ1N+rgqM6OkHhnl05rCMPjy7KRlVZARZ8U0V1SumviS+DyEJOorMacTyXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011022; c=relaxed/simple;
	bh=sNRZTgcpPZsCz8cbvJZ1jYH553XMDNPh5UO71mwzKGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kqoqv3W1nb0t+rBG5FXpk211Ig3XNgx3JvH/NcSd/zPOjcuGKUNXTSfx5HP8PZpw5K8MfcPyoSZ6xGhh+OAGxZZGTLQM4FLcZseE0DWOETsK7llCbu9cftTRSLtJlwdEbO0fgj9aK0h7RVXg1g5p5yzOUWyd98PSsq0BLnfcxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bMH2MptT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bMH2MptT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n1
	lgB1V0njyOaXZ1h1qR2iYhAyIhn7WxWnI2uSp8gco=; b=bMH2MptT8hf4knr8gv
	hDrllPJaILUrE+4MFTGTZ1Spl4MqgNcHGqoeWNGJMIZQiaP7CZp6+6hQM9iMYzrP
	RPHiMRw6P+xEefS1Tui7GvhB3Ahbl3U1N/4ZeBz94wQrkKs5DIzTn5LPEWGIKW74
	PLYySTmynFrqPmBatnj0cNxmk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3z4_vuJ5pMJ2HAQ--.42176S2;
	Wed, 25 Feb 2026 16:55:12 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 0/2] hwmon: Add support for MPS mp2845 chip
Date: Wed, 25 Feb 2026 16:55:01 +0800
Message-Id: <20260225085501.164819-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3z4_vuJ5pMJ2HAQ--.42176S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RHrWFUUUUU
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNBFsEWmeuPE+7wAA33

From: Wensheng Wang <wenswang@yeah.net>

Add mp2845 driver in hwmon and add dt-bindings for it.

Wensheng Wang (2):
  dt-bindings: hwmon: Add MPS mp2845
  hwmon: add MP2845 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2845.rst                | 143 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mp2845.c                        | 493 ++++++++++++++++++
 7 files changed, 657 insertions(+)
 create mode 100644 Documentation/hwmon/mp2845.rst
 create mode 100644 drivers/hwmon/mp2845.c

-- 
2.25.1

