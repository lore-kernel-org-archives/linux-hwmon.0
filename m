Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240409;
	b=Z7F3wPl9vKrwcb3uM04VZJdtKBI+6KTvlffjcHA94prt0sU2+lPijPcVNm477VBkBibT
	 xTUF3cStYtJMxRVIjWWWrzgyCYRDI4hynnyrT4+87mXybh/8InFIDvkL8mPCR/7A3Mp8H
	 gtH3qv2/tSCgP1TdTkUjY8BQ7E0L64yCl6T/tT0apt0X3CeeFgVPU+hFPbhsqOP2gn11w
	 5eqHhWCuB/8q4sAnMoTrhUSmZ8KnM9XVMKBw2/ZouvxIwS/wOBdFDCDHoZLFAVXJhwDaz
	 iWHdiMO3bRWw0uj0FNvgNQQ8aSmWG5V2HjQdlPoK4gBReUGRkzb/3bsf5hma40v0DzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240409;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=/JEBKMqCbYkY8gT7npKZfTjE4ZsvilkK0DJ+NCBsccQ=;
	b=QJcpvigTSxcTq6HQvXo8taxblq7cHvIHi8xHFUuOsIFJPTHEin3dc8quNvhcgpvfFDQ9
	 PjrRZtOECiwN3BjHalT5dRT9HjMUaOFbXAoc13BzafSI7WjL4VrXJlpqo3Y1r7pmiSvrX
	 csl+9xY6/eDA0+34jl8S3NMjHc21PWe9H8c/GTaCTmVsDWmRP810JY/LlPXHPIHtp+Bav
	 bZNSUpQ2mL6vL4fL1+O4UprJcY/tpSGCEk/6Aud5HsWpPUDpTjwFzrox6Sza6GgwJtPGH
	 jZZuWO2EHOYtXAABVlgVYMIm0YVGYJKlSj3vPGkP9ln8t156/SpKapQgcDCbhJ74G6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Yo9DLNzG;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400C606A325
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 16:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F400C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Yo9DLNzG
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id QQqrxrm5AVK9UQRtQxrwhq; Mon, 09 Nov 2026 16:06:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRtPxemGuuJrPQRtPxlRhp; Mon, 09 Nov 2026 16:06:48 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af1ef98
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=UVmsjvvKQtr-GOCPzRcA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/JEBKMqCbYkY8gT7npKZfTjE4ZsvilkK0DJ+NCBsccQ=; b=Yo9DLNzG4zlC9SWekZgRGG43h0
	meajznK+Hu9x+BZYKfyGdBJrslSnOuFOo1UiFTFJsqefVFHHd3EUWD1g4M4n57E6jn8mbRSFhvXcm
	8Pxqnnjglo5qCxqGZA//X9oT6pGQVfyAjANMP6X0V5QmQg7Y5JXUDI+ejfugZmeVZJG/l3YX/BI1f
	KlPt0f3u89I5aWK/Tlh4W37fEbPnTGUmDgI47m2+k/TDcNM7VlSpBE2Jvnxlh3w8+jGfRl1femn75
	7HRh5MAxXxMkbq5wmKHg+JHUz8eJQumGtjEgE9WdKIMiJmqkmf1TXIMsPfD/3mFBmEGY+my2ZFj70
	BuB9Woow==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52336 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRtP-00000001aex-1KtZ;
	Mon, 09 Nov 2026 21:36:47 +0530
Date: Mon, 9 Nov 2026 08:06:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-hwmon@vger.kernel.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH 2/2] hwmon: (scmi) Configure sensors before exposing
 channels
Message-ID: <a6dedf5b-a15b-4b73-a609-af767d4318af@roeck-us.net>
References: <20261109151927.1672956-1-sudeep.holla@kernel.org>
 <20261109151927.1672956-2-sudeep.holla@kernel.org>
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
In-Reply-To: <20261109151927.1672956-2-sudeep.holla@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRtP-00000001aex-1KtZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52336
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDXycsHvIfrI1f01d+kn63Brbp95DAx6LM60NuucgUYQ7uteki/M8FnReBoCR6tnh6QuEPwnNY0BgDhQ8KV/zT8r8y8IT3k5B7elnew+bLpUWrCpePgh
 c5ynWBmTpnCTZbQXL8RklK+gtQ/C6SLEW2MRU4BrrAYeo++L0bZvdQEew1C40nn7kHXyhTLpUlsVO6zJji2V3M+Gt9P7rUBQzepRHx7T6TzfGciC1G6mgECg

On Mon, Nov 09, 2026 at 03:19:27PM +0000, Sudeep Holla wrote:
> SCMI hwmon enables sensors with SENSOR_CONFIG_SET, but only after
> registering the hwmon device and only for temperature sensors. This
> leaves other sensor classes disabled on firmware that defaults sensors
> to off, and exposes temperature channels before they are ready.
> 
> Configure each supported sensor while building the channel list, before
> registering the hwmon device. Leave failed sensors out of the list so
> their channels remain hidden, while continuing with other sensors.
> 
> Cc: Marek Vasut <marek.vasut@mailbox.org>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-4bdf9a68-22d5-4305-b684-f11fe6d1dbcc
> Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter
