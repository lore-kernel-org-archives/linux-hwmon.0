Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99432938D
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784263; cv=none; b=DhNe6yZBr4k9C/I+pwo4yt83mUsGRe4hWFshNFVPPSqoMm4MMwYS8PFJ6oPWv0t2GrvNTAjByrJylY0su7WiNu2HgV8oGwLpaY+P0HBaOhhBggqb9cD7eTPndZNiASGqin0WGUIDkl8WpylYDBdZcDmAyOtzS27UwvR84xUH/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784263; c=relaxed/simple;
	bh=lYTJpzUsQSE3ElhLciR8NTlcLUJxR6alPUv64KB+UGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMrsR7FeNJYHX49YP4Z1G0k13XvCO25npk7ZhTA3HY6BzVg8SIy1W8beW+f/PlbEugOTUBe+rSDqH9B1j8vuYa5xEh4xAuv5SpMa1wIsQsEpSHfqOnQ4FoJKTwmJVfj3jqKkS6PpQREgHR582h4q8fP4S39o6xUSWZs4OJim+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=f3tpgaCD; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="f3tpgaCD"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C4EED2C06DC;
	Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775784257;
	bh=NwXfzP/ij3/azWc5M8CNkch8Et2CILLA13FYgY75C8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=f3tpgaCDixa97rlv4urwVoy3Etp0jvrRXQYnA90tnrmgJkXejiUAWRsy4s71MHtjE
	 pyir7L52jWSuUjANG45uCTyYQVdJR7APDUgBHKz8RHeBzoz4xVSKx+SVaEHXU0Cznb
	 ohw/xaYr1UVKRWUaldIC2zkaFX0NtOa2Qg2/avFloEKSN96co4JAgtX7FbiYv6DNoE
	 wh6iiDk0fhAcdXfhKUU9Ctu85jjjVP4Q/EEQ7VsC+tNPXgWGhA03RQ8XZ5ZT1BFYPD
	 0KMAt0RuFvPAurMNDAGS11xjrXhVVIoJ3ZUpuM/xDwTsRuRXpRHjxKagD70TtLrqUr
	 2gFG7+/E8li2g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69d851410000>; Fri, 10 Apr 2026 13:24:17 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 7ADAD13EE44;
	Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 76D9D2804D7; Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/2] hwmon: pmbus: Sony APS-379
Date: Fri, 10 Apr 2026 13:24:10 +1200
Message-ID: <20260410012414.2818829-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69d85141 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=RPtVrnf-bw8RX5avTx0A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series add support for the PMBus hwmon on the Sony
APS-379 power supply module. There's some deviations from
the PMBus specification that need to be dealt with.

Chris Packham (2):
  dt-bindings: trivial-devices: Add sony,aps-379
  hwmon: pmbus: Add support for Sony APS-379

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/aps-379.rst               |  58 +++++++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/pmbus/Kconfig                   |   6 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/aps-379.c                 | 155 ++++++++++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 Documentation/hwmon/aps-379.rst
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

--=20
2.53.0

