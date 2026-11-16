Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838928;
	b=vrKl6C0oUbjU0ZZcECSuGwcU5MEgLv7MAIGGoo739gyY5u4oeMU+34YseNb8ePGx/K3g
	 I4rbDyZOZ+inadHabr9Ue1+DhK/mwtqgL1y/LBYRMty6Ule58qeGoPn9cc7ssxGU8Uzhs
	 Gaqx+h7fn53+kFeWVf88rwgODc/vwa+wJXLo/+wgnLnXhaja9iM9VksFpnQnSBfGcMT9F
	 kvK6C1W1fE0fQl0QWudNp2iVcy6EgtfV/aKVbIRVtlH/ua8GFZWpXqIA9uAW0xCWUAljo
	 /2coU5HjHjEQytLXBRsGqoIYrJVrjKhPb0bHN4RhIXWKXd+7NVHcIpkddQ4WF3tAQSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838928;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=pHr200UUB0TdM/xzAsC59U/BiQmmDqgwCX8nyw8baDg=;
	b=snrBMGh8ppG8UMku9+l5zS5G6NbCq5MDMEsfZ2Dnf1nItlx+yBnedME7vyekR50sNNAo
	 kBQa6xdk6USi27PbwHLtal0HBF2TwkoHsJIOL2/TqJ+hg7njkRiuG23ic5OxkH28JEBab
	 En/bvwFOveRcADMwX/lNsM3twZQWXerNC+zWr0GXYq5yORuDIZNzTWZPU1/hl8KXaw9m3
	 Ka7Aevc2ApIislIzhI+F0A9FfkFVfir5wVtNIh7ZaRWSCf0q7faCiwruqKY9hdfAh9TfA
	 o5lF3zQs3ZaOAkZja+KrEoAohhdTqfXc9QaTNoiy6EFL2bYIADXgmDxiaBp5N2SlKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vBkqzhGD;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A26606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 14:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vBkqzhGD
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id SuvfxMjWERiNxSxasxNVu1; Mon, 16 Nov 2026 14:22:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SxaqxigN0FhzrSxaqxPgTM; Mon, 16 Nov 2026 14:22:00 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6afb1189
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=8k6WQxmsAAAA:8
 a=bRKHd9K0sBOEL0JpGpkA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pHr200UUB0TdM/xzAsC59U/BiQmmDqgwCX8nyw8baDg=; b=vBkqzhGDWxjxLmMaiGxW84ANX9
	3Ib6z7xR3YEz3Y3dx2w4XUMRUal80rm44tViLWGTZOP44UKJp6BbTvznSzE7kF6F//9u3kkSkMam5
	0HG2er46cYN2xrpKfaF6vd4nbZh6/4MwkwTcxlw6ZZ/X7j+R8XCd+wcN7a0SM0W6WIClHhzUJwXjL
	H950w4h3gF1QHHlNxh+h2uiwmKLKkbCYSj8R4t4VADvdNj5gpGFDU0KBRVwrtW7fUu6gEzXivLVm1
	nT9QuaYtsT/8FXUavDfwf5hWnGOA223NUMIFL4YGA4x65VAzKDNYCmZOVCniNfAso8ot5f8adPJ2s
	3PQrHaOQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45118 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSxaq-00000003lLw-0Fn5;
	Mon, 16 Nov 2026 19:52:00 +0530
Date: Mon, 16 Nov 2026 06:21:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiqi Li <lijq9@lenovo.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 1/2] hwmon: Add driver for the NCT6801D EC sensor
 window
Message-ID: <d7fdc27b-4209-4b9e-a5b6-7e48b4b354f6@roeck-us.net>
References: <20261116120411.994284-1-lijq9@lenovo.com>
 <20261116120411.994284-2-lijq9@lenovo.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120411.994284-2-lijq9@lenovo.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSxaq-00000003lLw-0Fn5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45118
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJK7FwEEwmS7wuXeSHblN/Ff8lujlbxiSK47A0vT5VDZ5UHxILu7Y7VRuCnO28j76ApGpDK9RfNFGQpnbJqXn8I++TkNpAvYqQ+oD1YGrD/R/isQ8dOC
 9YL901YMrW6pEaJ+poT234mCNdze0u6rmxSRrYmjSjOKDe6g7ywhVeAxNy2ngsHmO5/OsZnl7E2xEj1lDT67rkpGUv++85bcvjUZ0w74PuOD3EM0rgGuRxLM

On Mon, Nov 16, 2026 at 08:04:10PM +0800, Jiqi Li wrote:
> The Nuvoton NCT6801D embedded controller does not expose a hardware
> monitor logical device in its Super-I/O configuration space: LDN 0Bh is
> the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window that
> nct6683 relies on does not exist on this part.
> 
> Fan and temperature values are instead published by the EC firmware in
> one of the shared-memory windows of the SHM logical device (LDN 0Fh),
> which the platform firmware maps as
> 
> 	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)
> 
> The window base is not hardcoded: it is read back from the SHAW1..SHAW5
> configuration registers (indices F7h-F4h, FBh-F8h, E3h-E0h, E7h-E4h and
> EBh-E8h of LDN 0Fh), as documented in the Datasheet. Several windows are
> normally enabled, so each candidate is checked for plausible sensor data
> before it is accepted.
> 
> The layout inside the window is defined by the platform firmware rather
> than by the controller: the Datasheet specifies the window mechanism but
> no fan or temperature register block inside it. The offsets used here are
> the ones the Lenovo P3 TWR firmware generates, so the layout is selected
> by DMI rather than by the controller ID:
> 
>   0x24/0x26/0x28  TD0..TD2 thermal diodes
>   0x30            CPU temperature
>   0x32            PCH temperature
>   0x50            10 fan tachometers, 2 bytes each, big endian RPM
> 
> The window is read directly. The DSDT also defines WQD1..WQD5, which read
> the same offsets under the MWMI mutex, but they are gated by FAAS bit 3
> in the WMIM region. FAAS is written by the BIOS and currently clear. The
> driver reads it at probe time and refuses to bind if ACPI has the
> interface enabled, so the two access paths do not run concurrently while
> the flag stays clear.
> 
> Verified on a Lenovo P3 TWR: the driver locates the window (0xfe500200)
> without any module parameter. Under full load the CPU fan goes from 808
> to 2920 RPM and the CPU temperature from 32 to 100 C. At the same moment
> ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C, x86_pkg_temp 100.00 C and
> coretemp 101.0 C, i.e. four independent sources agree within 1 C.
> Readings return to idle values when the load is removed.
> 
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>

Applied.

Thanks,
Guenter
