Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F80361DA2
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011396; cv=none; b=qbtjJBxfUwc6VJvBnjo/8yhcPpYrXa86Qcr0Qusnj54eFFhqB5X1AQkCEB0dTiazAaGVroAp8jQtooedwrwnFvCFBdEfKf2P1sPsjCCZDUUqR0t5+6YJ7DODyL+U266be3jyqkp1VgC+tnnDLxSOC07oVUDQ1tuDWXSfzBzYCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011396; c=relaxed/simple;
	bh=mN6SvbDYuiOAIeaTMLAJHjaUWvsWZZyU3ehOwvK9whU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txJBtk842MrG21gqzIryacuM4l9REB0lxCyxGvcEf6MEQ+LAjpNoq9a8mLVpiv/LaoOM4/aRI7Bq6GJAwDchwv2KmniEgvOSNRkh1wUAxsSILZ4o4A6a14y/7aS9HMiXccSoBD+TaUYktza1zeyswMM4tgfWSmZrPGV8zrVBGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=p8GbZq1P; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="p8GbZq1P"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D18A2C02FF;
	Wed,  1 Apr 2026 15:42:54 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775011374;
	bh=rYqtXifKa6DbawZqCwZ1hU7Qv8dt4KZY90gl9wzLlVM=;
	h=From:To:Cc:Subject:Date:From;
	b=p8GbZq1PCynVHN/tcJM0zmsgSd6X6VPIxQ64uAFbMhwQgh0O9S/1DZjdlvxP5PNsR
	 86M0IOCjlCOzXlbZVGYajd8WAHiVE6Tu0bFOjyFAIywA3twksqG7CAxMK9pmsNQudl
	 Pql4+3ljOPfNIMovI1bS5j/yYeTAeEFnk8crgfrIXjC5sLgQZuhLPig3AzWx7NTg4n
	 3XD7BeWeTjfkf/a5+vQrODOaqj6G6MItOI0t08NsJmkrSuLaVuf1iuM8oCctIhDJ4w
	 d+fJ7SF35tBFtTztgT7wpAEOrK29NuIK6zDq7p62SZpCTIzzQ2YatkxTbMcs+SJJk+
	 A7qYS4v82xATw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cc862e0000>; Wed, 01 Apr 2026 15:42:54 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 012CA13EE36;
	Wed,  1 Apr 2026 15:42:54 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id F143828153E; Wed,  1 Apr 2026 15:42:53 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] hwmon: pmbus: Sony APS-379
Date: Wed,  1 Apr 2026 15:42:10 +1300
Message-ID: <20260401024214.804237-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cc862e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=RPtVrnf-bw8RX5avTx0A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series add support for the PMBus hwmon on the Sony
APS-379 power supply module. There's some deviations from
the PMBus specification that need to be dealt with.

Chris Packham (2):
  dt-bindings: trivial-devices: Add sony,aps-379
  hwmon: pmbus: Add support for Sony APS-379

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/aps-379.rst               |  58 ++++++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/pmbus/Kconfig                   |   6 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/aps-379.c                 | 168 ++++++++++++++++++
 6 files changed, 236 insertions(+)
 create mode 100644 Documentation/hwmon/aps-379.rst
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

--=20
2.53.0

