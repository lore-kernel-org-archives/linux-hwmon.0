Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846783;
	b=n8RhiCm3VxUIkVoXDYUcuaJF1OWGMAK4BQc5BbROtFWOK15CHr4kYuvkPL4HkZQJBnic
	 jwBqnX7b2cqCFHjFNdCJAJI4TILkA7dcjEtlqnoOcH+fBDoLfOBYKH7YXgODNfpTDUIBa
	 UVK6ShjrqGNT2qhqmvUzDexvZaVq9sEoRrRpCDonIAijDQR27cBj8iqa/bnwCG/UuKpA8
	 wgk3AoPHlYfedw0jr9ly70X/jStyQ+93i2LncslDAH6CnptzBQdPAghgtddBpIYOOgxc2
	 Q/Na78JSMcr9BHs0pQWXADxWsHztvrezm0eXBeLWAsrlqSFcQT3QKZtdZpToVuHO9QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846783;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=PTCezzwhXegCp0HN9dhFnxMs6Dv4psl9EH2T3b5OSj4=;
	b=0qzTpnFuHLloPraW3zFpr+H8NJA+tAhfwkHNrN9be3PVgGDgU758mb3d/OXYmxZwQGac
	 Zq1AVK0H5UKv9hswSMzA6umyrdeFBw9V1yV7Old0M6Z7BIRywO8EYffWy1HpMKZRdhSB1
	 uvNqGhlWMgQuGPJVQIZyTsx5yDTXcIXeHsw0O3xAionKqcIjhvhdG8TxzgmKrcXpezBoW
	 vrEi8JLOJeWFPNYsdC8szVdwG+mTpJO3siix+mBn+gMSxbNgFQJXQ3fSmfJqib/BYD+Wz
	 Kl3Jww6mXUKqidBuEhWOevxI07yG09QvSZBC61oZXVhfqIzhjb3kCuQKMTh/GbPYUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b="N/yTmj+M";
	arc=none smtp.remote-ip=185.136.65.225
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420F606A329
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D420F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=N/yTmj+M
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261116163257e874759e9e0002077c
        for <linux-hwmon@vger.kernel.org>;
        Mon, 16 Nov 2026 17:32:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PTCezzwhXegCp0HN9dhFnxMs6Dv4psl9EH2T3b5OSj4=;
 b=N/yTmj+MkPW56dBM/sVQUibhcIccnpYeh9j2wIYuxOkVUIzyX/xJRTUlHPNe/u1dL6uWc9
 C5Z/HdD0d1vuwFTddmLq50SSnNEFd+t/loROR/4FoTKsV12mZpVkc3PujZWOACruvMTKvIg4
 N79KDlE3gjy+eV7GsFY1BvMbU8i2o8Dka0qbcm8fN/zcGrhaqxZbscE9qioAS4Jg/Ih2H8lq
 knHqqMaZrfSNIFMmTVAQEg6wKNDI7/OMyPynGzQCcA9icblFHjS3gGQ6kA4HexX4yzjZ4NHa
 4OxEzJo+8c2Cr3ugblOi0gIEptWKuxThc9tYsp9utIrsJ2PD11TFImwA==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: benedikt.niedermayr@siemens.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Date: Mon, 16 Nov 2026 17:32:56 +0100
Message-ID: <20261116163257.1303207-1-benedikt.niedermayr@siemens.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Hi,

this patch adds a hardware monitoring driver for the embedded controller on
Siemens SIMATIC IPC BX-54A systems.

The driver loads directly via ACPI "_HID" which is reserved for Siemens.
See commit for more information.

I'm not the original author of this driver but I reviewed it as carefully as
possible and I would step in as maintainer for it.

This patch does not enable the hardware platform on which this controller is
present.
Instead I just routed the enablement through the i2c tree, which is currently
in review [1].
I wasn't expecting the review to take that long, so it's maybe better to route
the platform enablements through this tree instead... I dont know...

[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20261116142351.1228943-4-benedikt.niedermayr@siemens.com/

Best regards,
Benedikt

Benedikt Niedermayr (1):
  hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver

 MAINTAINERS                            |   6 +
 drivers/hwmon/Kconfig                  |  11 +
 drivers/hwmon/Makefile                 |   1 +
 drivers/hwmon/simatic-ipc-ec-sensors.c | 568 +++++++++++++++++++++++++
 4 files changed, 586 insertions(+)
 create mode 100644 drivers/hwmon/simatic-ipc-ec-sensors.c

--
2.43.0
