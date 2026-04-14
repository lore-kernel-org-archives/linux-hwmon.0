Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95134B697;
	Tue, 14 Apr 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158948; cv=none; b=rNjTA/uoLlm0zrUFZ6UdFHs1gUOTITPWEiXADX+8ZpBixibab1ouoLNQc+eVdnlM2FTtFEGFyElYcpolVFni2doGwuCF4TPPhUxY9vR5c+y5wJaPnkugMiMUV2kM812zqynuQ55mWuRMvvr3S6ijzH1cAL7mgefwZsEpq77w/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158948; c=relaxed/simple;
	bh=BHh94iDH303xPPEyHqxFetHEQxkP4hXjMyV35TzkVVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XmcuEYNUnal4rfhZBfKVeCMXtt5XoVGUPI1JsXZWkgHwumbyxlq8yWs3oUXtloUHLOOX0/edwlrA1Y6Lmmjf3g/MlpnNaDkjW4XtUURG+V46QutPlW0JgZqSit52jGBCi1AV9AWBwfXa+iU3WDSVGjaZGhZLlalSwLIdU25ACH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ifvKXRZy; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ifvKXRZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=i2
	I6/sTob74Cp5v+dFlS8BBO/xK0rtQuG6vo7faa6mY=; b=ifvKXRZyUZFravWgwz
	tW0GtDOJDM+44oY2IYtawD78l8qaZPYvWzuzTf+BDX671CGuW1DaZAT+r2Wpjick
	5Ce5qjsy8wu0XabOXi0OURAqZfiAyYKClhATh6DiulVwp9hKwxU5t2t4DlbfqxUc
	+ZG8U1Zg6te50IxPBQiSrZ8qY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgC3BRSnCN5pYxRhAQ--.9211S2;
	Tue, 14 Apr 2026 17:28:08 +0800 (CST)
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
Subject: [PATCH v4 0/2] hwmon: Add support for MPS mp2985
Date: Tue, 14 Apr 2026 17:28:01 +0800
Message-Id: <20260414092801.1067470-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgC3BRSnCN5pYxRhAQ--.9211S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1rtr1rGFWUWry7Wr4rZrb_yoW8Gry7pa
	18Crs3tF9rtr429asakF4xWF45Jws5WrWakF9FgwnYya4DZr92q34UtryYv3srAr4avF4I
	qryrtF109F1av37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zidWrAUUUUU=
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIgg+4mneCKh5pgAA3+

From: Wensheng Wang <wenswang@yeah.net>

Add mp2985 driver in hwmon and add dt-bindings for it.

V3 -> V4:
    1. Avoid mantissa data overflow in mp2985_linear_exp_transfer()
       function.

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
 drivers/hwmon/pmbus/mp2985.c                  | 402 ++++++++++++++++++
 7 files changed, 569 insertions(+)
 create mode 100644 Documentation/hwmon/mp2985.rst
 create mode 100644 drivers/hwmon/pmbus/mp2985.c

-- 
2.25.1

