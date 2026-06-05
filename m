Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7023C503;
	Fri,  5 Jun 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641111; cv=none; b=rgKkLkwSBpNg/MHmDp+Ou7NNrtge1/o0goUwMFdiOaHzIVDTL3+fyqOk6rgToQ4bmVhA6onpJpUEMhLuPJKJkeAhlfNNMFz5OGToIO7FlLWnrJUH85wAoqv/zNnSxn9iv0FWzbG95buLliEvezYQUxP/gF9xW7E1gYxs/iSUyRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641111; c=relaxed/simple;
	bh=73FRZF/4c5P/OZbkjqs2tZHoVESwbh4x8lUlyv4D1eo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bf8fqBnf1L59CVlg7F1myelUVIUa6HjYlWXefadwFU1p3ToyNEOfCNjd/cR1vYBXj0Lhl5oqQan2+adJ8+d37eXw6z9oHHORj1ezL2n9+l0LJ4JifpaRodLEIMUpuTbNeUukzT2H4HHqmFqDgE+38lXuDAUZFwGVbVPSg9in2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QPPPQNve; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QPPPQNve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mP
	mjgmrJvCvzzYdz1q5RdVyg+H4wTZTIoBitYWi6j5Y=; b=QPPPQNve0NTpEwqb+l
	+KM7tbC1L+7j6t9PpTDO2fYA+/HAT/5a3jeF7cJC3m5Tv5OrfgzIQDdzUuXps1KZ
	H9tEtm63mp7i8xghwXyJSANDsqEmNPfIxwpUQRyWpADFleBz1MHTNpeo0ZOMk3FC
	HXW/iB5CXiQtXVeqvwEktNgnk=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnl3AjbSJqJU+5BQ--.9698S2;
	Fri, 05 Jun 2026 14:31:00 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v2 0/3] Add support for Silergy SQ24860
Date: Fri,  5 Jun 2026 14:30:39 +0800
Message-Id: <20260605063042.91776-1-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl3AjbSJqJU+5BQ--.9698S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWrZr47Xr17Gw4xJFykAFb_yoWkWFgE9w
	4fWa9Fyw17JF45Wayjyr4ru398Xr45K3Z7Z3WDta9xZr43XanxWFykJry7J3W7WrWxuFy3
	Zan7Xws5JF47WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1smR5UUUUU==
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCwASHgGoibSTTCAAA3Z

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Changes in v2:
- Validate silergy,rimon-micro-ohms before programming the current
  calibration gain.
- Avoid underflow when programming PMBUS_IIN_OC_FAULT_LIMIT.
- Replace brittle samples limit calculation with SQ24860_MAX_SAMPLES.
- Update the current/power scaling comment to match the implementation.
- Fix the documented DT property name in sq24860.rst.

Ziming Zhu (3):
  dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
  hwmon: pmbus: Add support for Silergy SQ24860
  hwmon: Add documentation for SQ24860

 .../bindings/hwmon/pmbus/silergy,sq24860.yaml |  74 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sq24860.rst               |  96 ++++
 drivers/hwmon/pmbus/Kconfig                   |  19 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/sq24860.c                 | 432 ++++++++++++++++++
 6 files changed, 623 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
 create mode 100644 Documentation/hwmon/sq24860.rst
 create mode 100644 drivers/hwmon/pmbus/sq24860.c

-- 
2.25.1

