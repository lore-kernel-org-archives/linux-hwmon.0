Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975132;
	b=BZWy7EKMfoBQIP0t+jfpOjDIKrPsg3xQ/DsGWvrP5HjWwQd7QexyQVFsVVPuPlt/P2LR
	 lBPArOu6JijGJhrV3PMqcg8Ox0APzNGmR7jisy9Kl7rrMqh8QfgXv7unroaeaJa716YNl
	 5yZtyKGuPy7KZzvJQRtdWwWEYlfqFGmtRL3kH0LogEvtvMEFfvDHA/49R0lHUxSowXc/n
	 U0kD0vAA8khK49tBBW0In3Hv6ftYzjgylbFHTRxYnNGmZqjl5Zx8cZ1DM+8Ue6Wlukpsp
	 x82siKSk3hQDd29efBD7z9nsDUVL9+hasNOyJ2Qrg2uj8aiHwYjETlWleEamPaVsDwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975132;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=VphI7JUFI/3F1m4eijqre2xO3YMSQ/TqmxpCWPGKBP4=;
	b=JpdNaDLDOOG4LjmTRiwvJNX3BYJ62TWJu/fx2pHSSSegeqcninW3SDy5269aOueo8GYC
	 T/730bglpp/gNqf/yNKm45+u8uuozRE1xRNA46u0FCsuRrWdJHH5L4Vow2YYcZaoM7hal
	 psrtqNshWhdyMI9oPi4D9Ep/CBY3p12FdlKvpL46ginEZSa0sx0fon1wEb9MRiUEMAE/7
	 9I5rQioZXQWjwtHMlPVlB5d4oJD23F/m2cDMBZfCfSYs1EK9Y5WnXOKsQ/SoKN98/dkHH
	 NHPEmkku7nQnoA7TclQVU7CMG5+QQg8olfRmas4UXiNzDI1aIHlvhOBuBime5QZmTOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IoMy5ia2;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F88606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 04:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IoMy5ia2
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id TSz8x4kBPAR1iTX1nxqNNN; Wed, 18 Nov 2026 04:12:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TX1mxyvgMlaNKTX1mx1IBY; Wed, 18 Nov 2026 04:12:11 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6afd259b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=1XWaLZrsAAAA:8
 a=xS3XOnisiAP57bjn5aAA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VphI7JUFI/3F1m4eijqre2xO3YMSQ/TqmxpCWPGKBP4=; b=IoMy5ia2SYULkoOQRDVS5q92xP
	dLEBupWp0gl5iDNn8lk2u2XdsvbBuW43TPwWoMrj47BDZgvHWdwGbQ3q0zd5pblm3bS5pqagoNQ8L
	gbj2kgd8mtTdpx1DlHsmI1ytLVsB5NF29wIOJs9R2GqkYsObXif8Hvfuw1ZksZR+tmi3FtrOXOjS7
	0Iy2ormybMiRzF9O6g9RHmMUmfubJLuIAi7qE97h1MjUKj9ScWVT9mKLRt6Mvf9RhBkeFvMldLuI9
	fKyvW21W2KC8YZqwo9DwvlP/54LSESXjvp61W1FToAeT0gZJhDMBVVi8iirBBAk2yNa59EXIvsGhY
	hiRVyTGA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38800 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTX1m-0000000473i-1rEa;
	Wed, 18 Nov 2026 09:42:10 +0530
Date: Tue, 17 Nov 2026 20:12:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) Clear only CML invalid command fault
 during probe
Message-ID: <69fad729-5c15-4c4f-920b-f92fd421e5a2@roeck-us.net>
References: <CAJ5cSJH7_tCDCeN8XkQcMQLgANLVAf9xozKHp=e+2fLX7CSo=g@mail.gmail.com>
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
In-Reply-To: <CAJ5cSJH7_tCDCeN8XkQcMQLgANLVAf9xozKHp=e+2fLX7CSo=g@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTX1m-0000000473i-1rEa
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38800
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfD8bFpL4jg2XK/7laGt3kxJHQo6MXWywNyISWkuguARKmS+H3BvAaolU8WWRrJ7R+c+nJdrntesxzYjR4k+/W6IDdaHxmVaJGof204AiKge975vbjKoe
 CAEUOwVG7BIydps2bNBXJkCJEUug/nJUJRWc/wbQTcEBZEc40BjMsTT+aP8IRMB8n2NegaNaHRlExxVXo/8VrwYa452L/4TSUKQxQnLRupbmQFtx08N6sYCe

On Tue, Nov 17, 2026 at 07:20:59PM -0800, Arthur Korn wrote:
> During driver initialization and register capability probing, pmbus_core
> sends CLEAR_FAULTS (0x03) to clear any communication or command faults
> triggered while probing unsupported registers. However, CLEAR_FAULTS
> unconditionally clears all latched fault status bits across the device,
> including hardware power fault registers such as STATUS_WORD,
> STATUS_VOUT, STATUS_IOUT, and STATUS_MFR_SPECIFIC. As a result, a BMC
> reboot or driver re-probe erases pre-existing voltage regulator fault
> telemetry before monitoring or diagnostic tools can inspect it.
> 
> Simply omitting fault clearing during probe is not viable because
> probing unsupported commands (such as PMBUS_PAGE on single-page PMBus
> devices) asserts PB_CML_FAULT_INVALID_COMMAND in STATUS_CML. Leaving
> that bit latched causes pmbus_check_status_cml() to fail subsequent
> capability checks (including PMBUS_VOUT_MODE and sensor discovery) with
> -EIO.
> 
> Starting with PMBus Revision 1.2, individual bits in STATUS_CML can be
> cleared via Write-1-to-Clear (W1C), a mechanism pmbus_core already uses
> in pmbus_get_boolean(). Introduce pmbus_clear_cml_fault() and
> pmbus_clear_cml_faults() to write PB_CML_FAULT_INVALID_COMMAND to
> PMBUS_STATUS_CML during device initialization and register probing on
> PMBus 1.2+ devices, while preserving all other latched fault bits and
> falling back to pmbus_clear_fault_page() on PMBus < 1.2 devices.
> 
> Tested on BMC hardware across 130 hwmon devices (isl68137/raa228228,
> tda38740/xdpe1a2g5b, adm1266, ltc4286/ltc4287, and generic single-page
> pmbus regulators), verifying that all devices probe cleanly with no -EIO
> regressions. Also verified via unbind, fault injection, and re-bind on
> PMBus 1.3 devices that PB_CML_FAULT_INVALID_COMMAND in PMBUS_STATUS_CML
> is cleared on probe while other STATUS_CML and STATUS_WORD fault bits
> remain preserved.
> 
> Signed-off-by: Arthur Korn <akorn@google.com>

Applied.

Thanks,
Guenter
