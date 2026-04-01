Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C139BFFC
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072562; cv=none; b=X6mGgEBROo+DdamaPY1sUnB4eWPnLmZlvHCOvv9LfXbSTTbcCYUzlUfgJFhRmXy2zbDUhiE+nyHuEccjSG7C8NpISP/0mg+5/Rk2vko5jVwEe085swzSM4GODkukbaT17vPzyx3vbqDcn9OcvPRL6Q/GrUdqtUsO6UUIc/Nkx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072562; c=relaxed/simple;
	bh=po8EspTn1qiuXr7h9W9yUVtsgrPqkg+lbtyap2Hkixs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+AnlrgDxnHWe08AfaH/Cem+xDZpD7rWdEI+eOR6+VJwxlWNxArCD3qSPE2UXPbJb13iJnipegSrZWguixElUXsriBZmsCPZWFVq3Qk5P/ZV9yTe7sanmXWMURGA0lRwvEr6KkOa4goE6uuw8frjVkMF46Hx3TbfKhus9dRHd/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eE01ccG0; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eE01ccG0"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E411E2C03CC;
	Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775072557;
	bh=h9aynR4ONHjj38lUuEUpaG3Y85VVOYu17k7g8zH9Foc=;
	h=From:To:Cc:Subject:Date:From;
	b=eE01ccG06AnGdsgJer+pALdh2rCgCYJHbymZbAB+DPomD7+gGmGepFXQOOevoGzm0
	 +ooPDGIH9ZTZVPRG6oZFQPLQ/lfwhjSNLAp4fR44d/yaKKynoZLSmyxpVYxv/CVXg6
	 EIWPQkIx+wmB8x/LLWbk7p/bOIr22m+lr2Xm6PbJQH6D40kp6y3SzKgOtN0cs65IXy
	 +Uzrkov5rWjvBk0sOwSBj67lt5XOXCx0fszs2d0e5xuGlpKFKo67HoMQHlueMCNH82
	 UOMjPqLKBiBWCsUT/snxbtFj3ph808JTyrnkdIVjkoY7kqDnwCTvUWFRaaFV8JCUn4
	 Ml+YRnoiIpEHw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cd752d0000>; Thu, 02 Apr 2026 08:42:37 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 235C613EE37;
	Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1F7A32804D7; Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/2] hwmon: pmbus: Sony APS-379
Date: Thu,  2 Apr 2026 08:42:31 +1300
Message-ID: <20260401194235.2149796-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cd752d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=RPtVrnf-bw8RX5avTx0A:9 a=3ZKOabzyN94A:10
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
 drivers/hwmon/pmbus/aps-379.c                 | 169 ++++++++++++++++++
 6 files changed, 237 insertions(+)
 create mode 100644 Documentation/hwmon/aps-379.rst
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

--=20
2.53.0

