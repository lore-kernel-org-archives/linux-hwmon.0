Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C43369217;
	Thu, 11 Jun 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163868; cv=none; b=Ouw94ri0OTW04m7/1MB+GxebwHeATeDI4WWD9o6kRNRYJkuht44jt7k3XW4xAb3nUnd2JzJq1YMZpYl3einW4GktVUaj7JSoWTj27QnLiUJJQDI6Xe4W9UnXM/jvrc8LbF/suV5+k8/mA6tge3qy7I8E99o4BpPx9nFk98IeliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163868; c=relaxed/simple;
	bh=jdtZgwe7NYlJ+5fp6xjdH+kqGQa2JnRPx0F7n9kTkdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TFSYPP/MIehyMBIsPxOsKZojQH8LEC4yDecUeVt4PtKo3xahYNuEhfdrJn3gxfEZGLn8Y9rZddKxyQlcDCSD979grmJ7MYbUtYKiNQN3ZqVqmUC5uo3pfSKyJCgB15FHvWUIXBIsdQO9QWHcGPymo4u+fmgrKuqlmjC2SlU34VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mvJqFNJB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mvJqFNJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=42
	LYPuJsnjlkHJxHjNhe9RhRHJyyVgPC83eS53Wa25k=; b=mvJqFNJBipt77zo2LL
	ZrrXV+znfQ5MgLVtBlvVy587l0AGsW8VWr9E4hBn2pB6N/mrsYkzPsYlWn0QB65Q
	KjZQ374CGJwntmfVzYbR4Q3coqhRD+dZiwGCKbckdZP9DEhCI2ezr/V88NFNA3PM
	SSnzvKQY7xIoU7lZIa6cz3s7k=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3PvcqZypqI94RCw--.19273S2;
	Thu, 11 Jun 2026 15:43:38 +0800 (CST)
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
Subject: [PATCH v3 0/3] Add Silergy SQ24860 support
Date: Thu, 11 Jun 2026 15:43:32 +0800
Message-Id: <20260611074335.4415-1-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PvcqZypqI94RCw--.19273S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18KrW7Xr4xAw1UXw13urg_yoW8WFWfpa
	ykurZ3ta4DJr17Xwsayw48WFW5Ar18Xw4YkFyDJ3WSvFn5ZFyIvrW3KF98Z3srCr1fJF12
	vF95KrnY93Z7AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNtxDUUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCvwsJAmoqZytHpgAA3S

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add devicetree bindings, PMBus hwmon driver support, and documentation
for the Silergy SQ24860 eFuse.

The device provides voltage, current, power, and temperature telemetry.
The driver also supports peak, average, and minimum history reporting,
sample count configuration, and maps the manufacturer-specific VIREF
register to the generic input over-current fault limit attribute.

Changes in v3:
- fix remaining checkpatch issues in the SQ24860 driver
- use C comments consistently in the driver
- drop unused header files
- make GIMON a constant in the gain calculation helper
- use proper 64-bit division for the calibration gain calculation
- return -EINVAL when the calculated gain does not fit
- reject PMBUS_IIN_OC_FAULT_LIMIT values outside the hardware range
- treat malformed silergy,rimon-micro-ohms as an error
- sort sq24860 correctly in Documentation/hwmon/index.rst

Ziming Zhu (3):
  dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
  hwmon: pmbus: Add support for Silergy SQ24860
  hwmon: Add documentation for SQ24860

 .../bindings/hwmon/pmbus/silergy,sq24860.yaml |  74 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sq24860.rst               |  96 ++++
 drivers/hwmon/pmbus/Kconfig                   |  19 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/sq24860.c                 | 430 ++++++++++++++++++
 6 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
 create mode 100644 Documentation/hwmon/sq24860.rst
 create mode 100644 drivers/hwmon/pmbus/sq24860.c

-- 
2.25.1

