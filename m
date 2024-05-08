Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8751292E9
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188455; cv=none; b=Dcjh7e4BZ02wcPq/upnffPWcyNov1zFMKBaXceGfdOkcmW9wBABwdwq0hVeBeulmKAVLuZqc4lxph4Sps0JntYwGtzPmU7zQTPpna/RygUGj1rBXud1BIxURtw1+GBb+nntVPd+9s1dTpajiKr5got68OTRNUx2qgOqXbxwZqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188455; c=relaxed/simple;
	bh=W8j83Ea3GVr160getEMTkfwK8jToX2Yy/9+67CqUuPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMDTn+irB0yvzr0tDwRP3/4ni6WTbZJLZ94vqSpp4IJ7Wyl7yYyRA0OpFcGcnLQY2VhIZ09BagqjMCnm1R9+ENORCke60N0J4qun33uoU4Dl/PBQP4ffLiCSU4Vz2O+8+i5aJ3HNGtpSHRXDUxdoD+7t6MraY+w2APxuahV55GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Qwf9Djb2; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Qwf9Djb2"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 16C512C0184;
	Thu,  9 May 2024 05:05:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1715187948;
	bh=K6i1inkk1HdZG0RAxFC807dO0ylhV1wxNEJo/OBI1xs=;
	h=From:To:Cc:Subject:Date:From;
	b=Qwf9Djb2RMAun6OB2Y6eBQb2o3Rv2anmPlu3G+XWcSXwSNISlf/lzMAg3qnKDPHgF
	 UBHOAlszfWetHpUJlt/KHO4oJenK7PfittF1dPiAYDyulzorDS+vbXzvxLcPBrFGRV
	 eV2C6kS0xm0GCYfCEplYWwgWQspyYvD8xZo+ELx5KVR5KVHa1N8ocm6JfwCW0DVXlJ
	 PBU8ROrIhWVYm1t26vKdI6NVpG906ZCWhO4Z/9/lc17oSlOtHSbufqyFEb/To4Knbb
	 hFQjZbB1uOkpGH5NLbJJgGdS/AiOsxqKoxTmh1IsGNe6xO2W86X+jxm8zExx6hiVHt
	 NNTzkKt0Jsocw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B663bb0eb0000>; Thu, 09 May 2024 05:05:47 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C5FAA13ECD2;
	Thu,  9 May 2024 05:05:47 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id C02B528091F; Thu,  9 May 2024 05:05:47 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (adt7475) duty cycle configuration
Date: Thu,  9 May 2024 05:05:41 +1200
Message-ID: <20240508170544.263059-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=MfrPuI/f c=1 sm=1 tr=0 ts=663bb0eb a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=TpHVaj0NuXgA:10 a=IntvOMply_uMlCww3fEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

I have a system that has very over spec'd fans so the amount of noise whe=
n they
run at 100% duty cycle is considerable. We have userspace monitoring tool=
s that
will configure appropriate fan control parameters but there is a bit of a=
 delay
between the kernel loading the driver and the userland tools catching up =
to
configure the fan control. This series adds device properties that allow =
the
PWM duty cycle to be specified via device properties so the PWM duty cycl=
e can
be reduced as soon as possible.

Chris Packham (2):
  dt-bindings: hwmon: Document adt7475 PWM initial duty cycle
  hwmon: (adt7475) Add support for configuring initial PWM duty cycle

 .../devicetree/bindings/hwmon/adt7475.yaml    | 26 ++++++++-
 drivers/hwmon/adt7475.c                       | 56 +++++++++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)

--=20
2.43.2

