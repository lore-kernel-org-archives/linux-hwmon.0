Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8B4657D6
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999171; cv=none; b=gsBGft/9PRmIbeNWgsAKFbB7fXmM0ciFNebRZSTiwznqDdPg0ZKbG1Z3BSm5H1mKFMtzVZCAzwDYdZikcV4IzOLXcR9kA6HIjWuB1zICaihD2Y8PoqY+whDuQ45hX1iJkY5pvjkuwRWQcUkrOYNNsD0bz9XshaDLUKzupXj8+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999171; c=relaxed/simple;
	bh=5jK8GcVu1vSZwUFJ8czxSX0PHhJofNRdkC6TilUwZdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Btx7MMvNQ5bSzPFhkiDQ6106WBDZ12rtO8rDM2ZBW7pQsmNdAfrGahhpLyN34TF+GYXTAcDZfLsqhg+A0k2C1pg/trk96LgnRXqjPGBKtF4kPwbpdcL+cUkjpAfztscABdrZe554h6F8JL5EdeXFw8Vogg/1/9Z5cxpxvWTeqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Cgk2vEmD; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Cgk2vEmD"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DB9912C046F;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1774999165;
	bh=oIhU8F0u3bMco9H5yKNEmxDtoEsOH18S7pDwsiTk314=;
	h=From:To:Cc:Subject:Date:From;
	b=Cgk2vEmDGKOezVrNaHJoF+4N4T01gcHsHoWJT2GpluLy+YjqM2rD4Hx+MTxVI5cON
	 9CWuHOOkJ3oZj+QvyneWYM6rzD7oYqdBEbQLfkJOHAHcy7NETgr+dFdxFhDc8TUDy8
	 UCkPbAOIkGqVnjj7eLxFkkQRwBjPfpUTCufWOXY3Ww3HDD+kOaBUvvUyPpFghiLgS3
	 8Ntfihm/RMAg37msTZE2YuIIkthyAgHDRbgwIIQDW5mPyGp9/sSyV2583gimAe5aZK
	 S1AByYdtno0Wr1WLCqRGxqJUHEHIKO0yiEJbFx/MfNcc5k+TyvsiepFyYs6Skm0l/n
	 DscoKUR87p0yg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cc567d0000>; Wed, 01 Apr 2026 12:19:25 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 88F8913EE44;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 81AEA2807C8; Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: pmbus: Sony APS-379
Date: Wed,  1 Apr 2026 12:19:11 +1300
Message-ID: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cc567d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=RPtVrnf-bw8RX5avTx0A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series add support for the PMBus hwmon on the Sony
APS-379 power supply module. There's some deviations from
the PMBus specification that need to be dealt with.

Chris Packham (2):
  dt-bindings: trivial-devices: Add sony,aps-379
  hwmon: pmbus: Add support for Sony APS-379

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 drivers/hwmon/pmbus/Kconfig                   |   6 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/aps-379.c                 | 196 ++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

--=20
2.53.0

