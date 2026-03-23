Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D420B80B;
	Mon, 23 Mar 2026 06:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246807; cv=none; b=bdAi0NmoYM4AYQbXolDjMJ2NInPCn/HphNRYfGHnVNYqNO1KOOli2OWmzzgC1TScXEANWZzkKo9ADTP28rLmJeb8ZBOZwgPf86jlwpOOb9FxfMeVW354RWuTJKhMRs5yYyGZpoCPS3u6V1wPS8d+Z//0nIuE0iZzmWSYjtj1ZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246807; c=relaxed/simple;
	bh=swy7iJnWpZAWLODB2QQiVmtKfJCyrAhpviE3PBEn4WU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pItGQQGar41du0LtJYqf55a09s3qTINxIappTmVV5hMr6mJaYzZSaN7AId9kdICXVU4Jfze5UpavK0M33n8W1q2IGZ0+xwWJjkpgg6uynJ/I0dVjHxvuWpCzr5bvjVK1qkMNm1FRCeIKtEWnM22CFK42/ZlpqSsxAPAMXMqcNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Vm4YHgDo; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Vm4YHgDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=65
	b3fzbmx71O/PoAIUuT62fVQultmuek7FioI20Cdfg=; b=Vm4YHgDoTsBjC9eyki
	qcz0xlQfcjtFj/o0l0pv6kHH+FHI4UsfQP6RUUBwIK06BXsdU8olfnT0o+ddtyi0
	aOBc3bdhzqkw+81+k+7na/1QDB7ON1lSD3HEfKqzuFK1RbVr7gGrzKgCy3Tmk7p/
	FBF7geXZDhMRvyX+uk/daki8g=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgAXFYVk28BpiPc3Aw--.44583S2;
	Mon, 23 Mar 2026 14:19:17 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH v3 0/2] hwmon: Add support for MPS mp2985
Date: Mon, 23 Mar 2026 14:19:01 +0800
Message-Id: <20260323061901.827025-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAXFYVk28BpiPc3Aw--.44583S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jry5Cw17Jr4rXF4ftr4xJFb_yoW8JF48pa
	1Ikrsxtasrtr429asakF47uFW5Jws5WrWakFnrWwnYvasrZry0q34UtryYv3srAF43AF4I
	qryrtF109F1av3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziGjgxUUUUU=
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIAWaP2nA22X4sgAA3d

From: Wensheng Wang <wenswang@yeah.net>

Add mp2985 driver in hwmon and add dt-bindings for it.

V2 -> V3:
    1. The shifted mantissa be clamped to the range [-1024, 1023]
       before being masked in mp2985_linear_exp_transfer() function.
    2. The PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT
       value are clamped to 0xFFF before being written to the mp2985.
    3. Fix the vout scale issue for vout linear11 mode.

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
 drivers/hwmon/pmbus/mp2985.c                  | 379 ++++++++++++++++++
 7 files changed, 546 insertions(+)
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/hwmon/pmbus/mp2985.c

-- 
2.25.1

