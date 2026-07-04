Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D413AD1C;
	Sat,  4 Jul 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153161; cv=none; b=A/tFbKoh51eMPKd7BD9mnaLXWrafDx9eDpPnuD+g5WzYVxxu1aCnDKXsf0j/EsJtkz5RkGh40LVloR11YvQx8efLcGtRyAx7TzvQMT0ACTUnZ2X9NqaNuVDNjpUGKT+Mh8tlgVttp/qV/rjZZv/gBEc5nork1kLOf6B6bw9f4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153161; c=relaxed/simple;
	bh=YigVI0RRponxqcMjnI6ecaBkBXRO2CZGLjzBCCJ2NF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AKY1chEfWDGiiG+Fq4FrGRElSA7XnCwx5DWHwE30ToJxp12ii1G43BcCUpcQadzMBuoXkvY0svii0N6eCL6CckccekN79z3X8Nk04ErcBwwDtUlL6bDphrIaKz1dLgBCYl+y4oxU6BjDYagi05R/kAeJX5qs3XEIfaUrinvKfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dS5qWLL+; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dS5qWLL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qd
	UgAYRH0slBPylMC4p8lK4cXqw3dRAAsY14tLV1xLA=; b=dS5qWLL+Tv1bG5FbZQ
	OiFClTxEqLZpkejGYeWvi46yVG7LTPE9FzUbKsbVj0vIlfIbGqBwPR7c4KhPAa5I
	C3n1BSYvN5D6OHmgWM/uSJwXGNpuMcu/mYUORjbvkJyk0aZ8XmWr5zMF7Xp+RyUA
	aB9wJwWXNa2cwS/iMEa339Zik=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3f1zKwUhqoqaiAw--.50524S2;
	Sat, 04 Jul 2026 16:18:19 +0800 (CST)
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
Subject: [PATCH 0/2] hwmon: Add support for MPS mpq82d00
Date: Sat,  4 Jul 2026 16:18:10 +0800
Message-Id: <20260704081810.1701587-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3f1zKwUhqoqaiAw--.50524S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrJr15tr13Kw4fZr1xJryftFb_yoWxWrgEkw
	42gFZrJr17JF45WayDCr1rXFyUtF45WFn7X3Z0qFZ8Zry3uwnIqFykXwnrta47GrW7uF98
	ZrZ2gw4fAF1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiOAxQ9GpIwcwNUQAA3j

From: Wensheng Wang <wenswang@yeah.net>

Add mpq82d00 driver in hwmon and add dt-bindings for it.

Wensheng Wang (2):
  dt-bindings: hwmon: Add MPS mpq82d00
  hwmon: add MPQ82D00 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mpq82d00.rst              |  73 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mpq82d00.c                | 249 ++++++++++++++++++
 7 files changed, 342 insertions(+)
 create mode 100644 Documentation/hwmon/mpq82d00.rst
 create mode 100644 drivers/hwmon/pmbus/mpq82d00.c

-- 
2.25.1

