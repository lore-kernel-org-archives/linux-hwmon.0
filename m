Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C02374190;
	Mon,  9 Mar 2026 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046936; cv=none; b=AhaoQA4PMD57GCMYC9/1uuaMWO8SyKf9hjSsmzypRKgvJd0MwI83bh999bYW/Yc2hBXo0ro/vIco0TFcns6F29oObhbROXCDu5tLo3gX7OBn+LY2H1QSXRkfhiuJ5lAYEbjtvsbdp/+0wDqK67nEkP5dSRgspV6UWPLHL19hMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046936; c=relaxed/simple;
	bh=GCDqrPRCXFTdWh35bAM+17bmnu6IgDRQEohAFFbNoZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lFUgRRwhxK1vBRmDaFljNNisNLayPgMj8nYZ1mBcBgYqjlp4pbRnk6YyJIyrmicLYgfB55LgZS2K4avKEd03AxbD8Wbr2mbgIMoO2khsPH1C/MscQzPpjDY9p+Xt4wkGy2Sc/P8z1USC7bzV1BNQ4s+Jqd3ayp9esdwoLBQfetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OICbRMpf; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OICbRMpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zq
	+BzsYb2auBqEfNT1YlsOSoWEADxJSRa92NA2Iakvc=; b=OICbRMpfU1IArSTbvF
	N9G9dvS8jYuT8Ox448U17SzhY9QON/dmZst0AwPXrnL1qtrejw0FYScVIr6wwk5H
	wU6rTROsSwiNLVSHehBKkK8cgZWNwYjyhYAfwcghm+6yQBWjI4hZKH49Wgp9M+or
	cVKKLljdSQvZCI94ru6dC0r0E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgD3f_VIjK5pwRNoAg--.8168S2;
	Mon, 09 Mar 2026 17:00:57 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 0/2] hwmon: Add support for MPS mp2985
Date: Mon,  9 Mar 2026 17:00:41 +0800
Message-Id: <20260309090041.452957-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3f_VIjK5pwRNoAg--.8168S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrJr15tr18Cw45Kw45ZFyxZrb_yoWxXrgEkw
	47Was2vr1UJF4fWFWDCr1fXryUtFWrWF97X3WrtrZ8Zry3XwnIgrykXwnrJ3W7GFW7uFn8
	ZrWkJ395AF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKNVy3UUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiOAk732mujEmLHwAA3D

From: Wensheng Wang <wenswang@yeah.net>

Add mp2985 driver in hwmon and add dt-bindings for it.

Wensheng Wang (2):
  dt-bindings: hwmon: Add MPS mp2985
  hwmon: add MP2985 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2985.rst                | 151 ++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2985.c                  | 355 ++++++++++++++++++
 7 files changed, 526 insertions(+)
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/hwmon/pmbus/mp2985.c

-- 
2.25.1

