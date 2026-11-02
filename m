Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632367;
	b=mnxELNY5rvRM/W/WTb4J7a8oztDSBk0J2kT4Q2ylc3Xxq9PYO+Kh6iYp2ntGoM8EAuNJ
	 OHUYGOi1Gee96+xXqi4hQ28CoezcUfFJ3FmizexoKz4oblndG52yfIATj3n+jHcTQWG+F
	 bfpxlK/ZfhyvndT42+sYXfxqxzbJeBw0wAMJIxGdZWRoT8MFWGUosvMxy2eg9LERRwCbv
	 hCsKKj5E/MKVoBTaSMgOWQixk6xQiakNa6jkszhX28XU1pXYUohgq5KCPk6dSy+L/bQ9T
	 W1FbcabdguhU6G5RSRDhld7kP4LzsBlwrjKEgV3Wfy/B+INRF+B0jiZ1B8IZbT3tAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632367;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=iT471OHb++350gojiGPG6EeKjyPHbJgzUi1RhBEFrAQ=;
	b=08ev+kJheru2IL10ZcLSMnNFrjzg8BkbYni7lhUtDHemzS7M7BWD4+tCJHzJBOHITZoL
	 AXqEKQ9BEQCrgXEtIfOMpXf84Bi565qe5R/FH1iSvPpdKAd/uRk5BBOoM8hQzQ66GXT7P
	 vqKwk+QgpjzLN1pbufx9v+/dHSYaq691ClodsinW1kk9HCLU8euQTOed8x2RUgmNZEmKD
	 6HnBnG10s31gaXsOphwpneKEbWoNkA1YvV5Xh7ULQYSVeYeAvncPhUJsYkDPxNzPF3Dhv
	 7/w7x/rzV2FoN5tfaez3Y/idDXXdsNVsy5u4RdJhsp3O8kmEjwFBtD8+MGGWLiRZaHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=giKywmcA;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C06074645
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 15:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769C06074645
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=giKywmcA
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id NqL8xCSWkusRSNtiJxpL3J; Mon, 02 Nov 2026 15:12:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtiIxO35Ie0duNtiIxoD83; Mon, 02 Nov 2026 15:12:46 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae8a86e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=HDcbOG6ISNxgg7Lf4R8A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iT471OHb++350gojiGPG6EeKjyPHbJgzUi1RhBEFrAQ=; b=giKywmcAOdywOnZWDIV34vtZLp
	49pFt/EWUh3NJWUkAQYAIwo3AvRlrZfPJi8oOJ8pf+3fCSSOnPFmgy1R7tYdIcnLofJqnsyz27ksX
	HrcMx0GapG/RwI1KmGhKdFOPk25mFFRRaznN+RIR0lyZSD3oaXYHuEVl/eICkGhe9l1Zsv7ELmEB3
	1PjA+7rDCBQXxUHbHgMfWIvc5sUFY1TWrW499Ai6xnNPjGm6uzmsshKoCRMzvB9CARYpXAK4PWzl8
	gXJNGN8mYTA9beuTul6R2OTK8MJvi9MbrV4HNRXzr8ofT6yaKoZPmP3UxsND1mezbtS/YbUBZ4uOK
	yViLNRtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39546 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtiI-00000003yBZ-0IyJ;
	Mon, 02 Nov 2026 20:42:46 +0530
Date: Mon, 2 Nov 2026 07:12:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ismael Ojeda Perez <iojedaperez@proton.me>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (it87) Add support for IT8607E
Message-ID: <165a18bd-81ac-4a0b-bc52-3c38d468dc44@roeck-us.net>
References: <179357826986.881874.2370184949108951928@proton.me>
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
In-Reply-To: <179357826986.881874.2370184949108951928@proton.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNtiI-00000003yBZ-0IyJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:39546
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 33
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLXa+lE2/12Gv6nGTIg4wV/c0ouj7NPcePR3bWjWHS4qSWqNku7zcCIeWMsC/rkebbhFdHaPkC4hMu7lfEVNOPhXv5wPOuDfXkRGvW/hhhJxzUdsVKLq
 ISVUus8YGNSt+gAjIYTlPQgBT1BiM37lOlXVrcrp5LadEEWUiiXGmvq5crrigr5R7pGb1+dd3OjbmWUEg8mBleWu2bq9w/JFN+cj6JXga2BN6HW50Qe20E2P

On Mon, Nov 02, 2026 at 12:11:12AM +0000, Ismael Ojeda Perez wrote:
> The IT8607E is the Super I/O of the Intel NUC6i3SYB and, according to
> Intel's product specification, the NUC6i5SYB (BIOS SYSKLi35.86A). Its
> environment controller is hidden from ACPI (HHMD._STA returns 0), so the
> chip is only reachable through the LPC configuration ports, and the ACPI
> resource check must be bypassed with ignore_resource_conflict=1.
> 
> No datasheet is available. The register layout was compared against the
> IT8603E, and the BIOS fan setup (IT8607PeiInit and FanPei PEI modules of
> SYSKLi35.86A.0071) was disassembled to confirm it programs the same
> "newer autopwm" registers (0x68-0x6d for pwm2). Features are therefore
> copied from the IT8603E.
> 
> Tested on a NUC6i3SYB (BIOS SYSKLi35.86A.0042, chip ID 0x8607, rev 2):
> temperatures agree with coretemp, +3.3V reads 3.31 V, the 3VSB and VBAT
> inputs read plausible values, fan2 tach and pwm2 respond to the
> automatic-curve registers (start 74 C, full speed 92 C, as programmed by
> the BIOS) and to manual mode, and the original values are restored.
> 
> The tachometer was not compared with an external tachometer and the
> voltage scaling was not compared with a multimeter; the values above are
> only cross-checked against coretemp and the expected rail voltages.
> 
> Signed-off-by: Ismael Ojeda Perez <iojedaperez@proton.me>

Applied.

> ---
> Changes in v2:
> - Add .reg_pwm = IT87_REG_PWM and .num_temp_map = 4 to the it8607 entry,
>   copied from it8603. v1 left them out, which would dereference a NULL
>   reg_pwm on hwmon-next (reported by sashiko-bot, thank you).
> - v1 had only been run-tested with the it87.c of 6.18. This version was
>   built from hwmon-next and run on the NUC6i3SYB: all 87 sysfs attributes
>   read without error, pwm2_enable and pwm2_auto_channels_temp written and
>   restored, no oops.
> 
> v1: https://lore.kernel.org/all/179357707375.834227.595814448085536071@proton.me/
> 
> Observation, no change needed: on this BIOS the registers 0x68-0x6d of
> pwm2 read 81 4a 5c 59 06 02. With the newer-autopwm layout of it87
> (base+0 fan off temperature, +1 start, +2 max, +3 start pwm, +4 slope,
> +5 hysteresis) that is: fan off temperature -127 C (0x81, the lowest
> value, so the fan is never switched off), start 74 C, max 92 C, start
> pwm 89, slope 6, hysteresis 2. pwm2_auto_point1_temp therefore reads
> -127000 and pwm2 reads 89, matching the registers.
> 
> Based on the hwmon-next branch of groeck/linux-staging.git (file contents
> as of 2026-11-01). The Super I/O is found at 0x2e, chip ID 0x8607,
> revision 2, hardware monitor at 0xa40; ACPI reserves that range, hence
> ignore_resource_conflict=1. Is that acceptable, or would you prefer a DMI
> quirk for the NUC6 boards?

No quirk needed, it is up to the user to accept the risk.

Guenter
