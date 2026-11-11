Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413349;
	b=0ivddx5/2XEoDIjx8gV0C4tonosEHgBwEqERp3Ki4vNFw8dKqylzooxqOl2g8H5tGobH
	 fITyuYAi0SXPSwou9b5vQI/NsIjgUrwHVlDW++g++tXI39LTs6qCZL/D7XZTGgza3qzM5
	 eEgP6pM8YfMrb97WERPVdNNsECsfl3/rCyCRjz0YhOvs1Z7lgNhSQQ2ddt6g6iHp3UrBI
	 MXmXZobFX8+1Nz/rCEKSe/4GVrfOIVVDQO4yrW7+3Jf4GWrvEGXrp7qJy43HAE5IbVRXO
	 Puaoxsreiyg1w9v9y2zee7zZkC7tq2hOQ+JknJ5hND/jlMBA3PVVWJLY1xOt1xXBQCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413349;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=XxqQ3JJ/Fk3Q6IXBXP2iWPTLJS5nT9/kMvhI/RWsLuI=;
	b=nHFX26GakVgsIAsiDHU6cLLyo25hxIeEF4TdB9eXgm88vHh31pZqK8TNoAyRkPva7HaP
	 f2uyc5Pbht1/KkMm94H4ZV8Gv3S0KG0aq1foN+PdfVToSMAnqYSKxSW3WpzvxDJ6CPvVq
	 vTwMO7J6XGf/71y2XH6Mfb0mucFXgjXi5YTOd8g/M8NuidUz05jVc1PcgjIgbHjb+x6pQ
	 WqHfIo6dPVPkOO2jE0HA6Dw+I+4OwDuHnelNiHCpZjH6R8k3eN8AxUqoxT61vdWX2D27V
	 joNBSGJtz58ygWysHxDUPSjoCsrxxxEtLZSvmcrqfxeNj21R7eLxluoKtr6yocbJjOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DGnO3KjT;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951B606A335
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5951B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DGnO3KjT
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id QtuIxJruSyb4YRAsnxBYF0; Wed, 11 Nov 2026 16:09:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RAsmxa0YG0288RAsmxjk2J; Wed, 11 Nov 2026 16:09:08 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af49324
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=lPKue7lGnFwZnNjXzdsA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=XxqQ3JJ/Fk3Q6IXBXP2iWPTLJS5nT9/kMvhI/RWsLuI=; b=DGnO3KjTfvL1
	GVstc0vvJ2vWC2pWxwvMiERC0hmklSTnLH5xYhovRoV8VFImrtXS2nQdTQpQIUFIWpmeX582Zn+00
	KpPuqzdviqF2rmMQYoo03DXg/QOrps4PgRXbxADT6pJ7FUm6ajI4lTk182tcraUHriBWJoGXmAABI
	A1ebg7ZzJGS66622VJUBZTIpSkPlxtP0FpTXiCRrcOUyTbVUpE9wzf/zdFNNgV+4RUg1Z0ME646Lv
	TorDa4F/r3AmnIPOCkawGgZ5cPOomoPVQusbrT2z8fOVGWadPZb0Wuqvyf3pNpVaM+W6W78oyppty
	L6Kv/uSx8+vuSYUDFUfzHQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44332)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRAsl-00000000v3M-3yZf;
	Wed, 11 Nov 2026 21:39:07 +0530
Message-ID: <a94c7358-d1f0-4de8-9e77-2d50a47cb8ff@roeck-us.net>
Date: Wed, 11 Nov 2026 08:09:07 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] hwmon: Add NCT6801D EC sensor support for Lenovo
 workstations
To: Jiqi Li <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com
References: <20261111091338.799889-1-lijq9@lenovo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261111091338.799889-1-lijq9@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRAsl-00000000v3M-3yZf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:44332
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHuyKLSojMj5HUldYEurpYzMptaK7jn/HrOcymE6zT4//AQLp24VGvBGnuRlijh21g0YxpjGJMqrwMNu4Y9ic20A0oJJiebC5CD+6mKPJv9Gxpkg2l5h
 ddKQG8h6TKztNA5jLFaMgb8PVJYdgi9ZirPIUXW9dj2bZe/D2dLv9Us7THF7yiPRnd1BKIsl/ViBhaKKOZ3Bm/yluEfhJxOPNzzNp/o9PwGhYpuQGLn8yRT8

On 11/11/26 01:13, Jiqi Li wrote:
> This series adds hwmon support for the fan and temperature sensors of
> the Nuvoton NCT6801D embedded controller used in the Lenovo P3 TWR G2.
> 
> The controller does not implement a hardware monitor logical device.
> LDN 0Bh is the ATXPGD/BEEP/DDR4 block, and the sensor registers nct6683
> expects at 0x100/0x140/0x160 do not exist in the Datasheet at all.
> Adding the chip ID to nct6683 is therefore not enough: it makes the
> controller recognizable, but every reading stays invalid. This was
> confirmed on hardware before implementing patch 2.
> 

As mentioned in patch 2, you lost me here. What is the point of adding
the chip to the nct6683 driver if it isn't really supported by it ?

Guenter

> Patch 1 adds NCT6801D to nct6683 and fixes two problems found on the way.
> The Super-I/O ID was compared after masking with SIO_ID_MASK (0xfff0);
> the existing chips carry zero in the lower nibble so this went unnoticed,
> but this one reports 0x0113, and masked it becomes 0x0110 and matches
> nothing. The new check therefore compares the unmasked value; the switch
> expression remains masked, and val itself is not modified. Separately, an
> unset base address (0xffff) was accepted because only 0 was rejected,
> which registered a platform device at 0xfff8 and exposed garbage instead
> of failing.
> 
> Patch 2 adds a driver that reads the sensors where the firmware actually
> publishes them: the EC shared-memory window of the SHM logical device
> (LDN 0Fh). The base is not hardcoded but read back from the SHAW1..SHAW5
> configuration registers, and every candidate window is checked for
> plausible sensor data before use.
> 
> Testing on a Lenovo P3 TWR G2: the driver locates the window
> (0xfe500200) without any module parameter. Under full load the CPU fan
> goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At
> the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,
> x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent
> sources agree within 1 C. checkpatch reports 0 errors and 0 warnings.
> 
> The layout inside the window is defined by platform firmware rather than
> by the controller, so the offsets in this driver are the ones this
> machine's firmware generates. A machine whose firmware lays the window
> out differently fails the plausibility check and reports no sensors
> rather than wrong ones.
> 
> Changes in v1:
> - Initial submission.
> 
> 
> Jiqi Li (2):
>    hwmon: nct6683: Add support for NCT6801D
>    hwmon: Add driver for the NCT6801D EC sensor window
> 
>   drivers/hwmon/Kconfig          |  17 ++
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++
>   drivers/hwmon/nct6683.c        |  21 +-
>   4 files changed, 543 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/hwmon/nct-ec-sensors.c
> 

