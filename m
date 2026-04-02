Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CA1E32D6
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097672; cv=none; b=enMeghy4QVKqtVczmpOXBVXzya9UKx9aZCtIw2Nx31pno3JnpgjVtZiyl41tLMbbUnop06Cg55OxxTPV8GUT7e50u0mGxuQ7XEqtEEYv3kEszrooRXD2r9bbfZSQ18Z48vHrbsjizFXTfjcZkdisG6V8QGW7H1DpBVsU+fxgwrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097672; c=relaxed/simple;
	bh=uBq3wy+ZkRfRU6a8NfLXf7qFVhOvHNrWrhBb0Qowdds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZsmC8YzLqU8F935OpipqOAjthND06EF4HXeLIwhodA27dHlA8SW0ICdk/z6FiZllg+P45C3W2ShCut90JMYBy4L5kxMY3DadQhtZ8v/RUKWxa0oKXKeLCN0qUTP7yKBST+CxqzGtTOyARuxhDAjOwDa7KiHiED7K6fubVq4Jt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=FQCqTe8k; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="FQCqTe8k"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BB1132C0453;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775097667;
	bh=d5wE9VJa1070n7d6nhlkbBW4peM5MBKHmKNDf/i37oM=;
	h=From:To:Cc:Subject:Date:From;
	b=FQCqTe8k1MO4CbQNqYdjC8v+LHOv6pm94v4NR5zFzns2Mj/9rOl5Zyr/LZ8ILtK9G
	 F2X2Fmig4skecatoGJlEaRh9Nv/9id8jKokS8zfyfYucYFxn9oyMTviG/VVALbjPmX
	 edO6qY/gOMcSoYBHb5Y5GZLpElymWwlNOrAr7FYBl4elonJeZ55Vr6NpA0gUnjdPaB
	 oL2jxQzAWfhjtI5sfLC3NkRorb4P3uiwDW0K6+aWqHTPw7Jiz9QQY34n3ueYUwvf2V
	 R6fAgkEUsp1er9UzEagfR8ru1PDTJTHr4d1fqVNBeQIOpb5+SCU2+4hW9LK1uYoIfl
	 8HjJ26NdWi06Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cdd7430000>; Thu, 02 Apr 2026 15:41:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 7B9F413EE37;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 75E502809B9; Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
Date: Thu,  2 Apr 2026 15:40:58 +1300
Message-ID: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cdd743 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=RPtVrnf-bw8RX5avTx0A:9 a=3ZKOabzyN94A:10
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
 drivers/hwmon/pmbus/aps-379.c                 | 178 ++++++++++++++++++
 6 files changed, 246 insertions(+)
 create mode 100644 Documentation/hwmon/aps-379.rst
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

--=20
2.53.0

