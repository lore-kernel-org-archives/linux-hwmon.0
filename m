Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714796;
	b=TBYmKNDRsw0+Uo5c8eu6aEKpuvRgqDaD8RS7umrqNA56/YJ8BmfKXn/1VjC8Mo/Pf+Aw
	 ZHtZClIuya9OIod1LrO3nx4cir6jBH6r/WLG8G8JEFUo/W/pRuCvsfPZuX/NN6YN0u34v
	 Rdr5K8eMHHrmZOAVmMkUM5y7gKqH8tteJ8jP23xqiMlg7mIPIfUVmuO2gj6ZFX2bLUvPP
	 4WVTT/LD+sNe5rQ92rDeKqnUZEOnlEKKbMdElLhBRzY/ag0/0P5c6YJ9DDTFw2g+4Qxep
	 pomO+9GjsZJ5c3ZGsuv1hKZ/QDxC0lJgjBIARELzSNKuzY68bO4xrNiVF3SNKSGMg9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714796;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=t9xteX2xGuMkIJkhxfrkuc80ADp9/4k5b+edGPUq4fc=;
	b=m5uBxiREEhmm2V5pHTQIlNY+6WCiMSz7mzBQxEdpl9RC102+fQ07c3Ls4IpVgknex4KM
	 4B7DLI3T5wrSwE1cFTwVAuVzJ7obXsglGycD+Q9DR1ZCwXsRrfE0oY0DXlVlHoghNBmjw
	 ECt2YvXtU/O0sBTaV7hsRG9J9XcuPv+0j5P9KZN38eoaJl0soRcgdC/KaCR/FKZoFMH7Q
	 +2XQYITI/ioZjvGXed1VmnMLKnMQ5Hdp3KRCWqBiBvICJhNzHQYJI83jBgB/1tJoMgP28
	 iwYJhpupfS51u8zO6tn2A+0WYAxrvAqSqyebU8b4Ht4n9R6bchVB45HKKz00t368pHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WbReQISJ;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E200606EE93
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 14:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E200606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WbReQISJ
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id O4j1xTfIBMylkOF9lx7W6q; Tue, 03 Nov 2026 14:06:33 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OF9kxfeQ03MEFOF9kxUxUe; Tue, 03 Nov 2026 14:06:32 +0000
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=6ae9ea68
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=FzxAIiGUqTgkHgvMK3YA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t9xteX2xGuMkIJkhxfrkuc80ADp9/4k5b+edGPUq4fc=; b=WbReQISJVjZ9SKK4v8Lk919q/S
	QTS26pV4lYlANCIoJX843UZDmeNC13XMJ7bB0Wqvu1IeqMZGLj5gPPTYFPogkSeumAPrkqdhz8JWM
	LBpnM6UXBgskJ8KW5j6JAZg+Av9jqqE5HYXz6jjqepwYxCBr6t6I2+OPEbUUiw5dYY26ictnnczDR
	er9Ur6IHHtxttRzzWkPTX5kgg2WNWpfc0BHUU8S+DnvyLW3c0EF54IayDnqoce1GmzP/i655QgJrp
	tIy7l0Cl4IHGOaziz1OIFk8S/dLVOPMSI9ml6YfTtOCF52l10PVQG3kjzS+h5i4ptuLxI0Bcf3N2a
	l7cITQMA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52734 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOF9j-00000002ZuZ-352a;
	Tue, 03 Nov 2026 19:36:31 +0530
Date: Tue, 3 Nov 2026 06:06:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: Re: [PATCH v3 2/2] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Message-ID: <85bc9a12-9674-4fb0-9dc3-11ef8695599e@roeck-us.net>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-2-6f8963a74def@nexthop.ai>
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
In-Reply-To: <20261030-fs1603-v3-2-6f8963a74def@nexthop.ai>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOF9j-00000002ZuZ-352a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52734
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGf3s3HJ/HX15f1zcwOqi75Eub3Tdg8FR+xPyEBR6+JnScnm3z4Db4ZDJzwSs7pmlLaMyO4VQK1D96wuNmgxJNgOEe8gubRViCXyhTuVGl2um0sG/FaN
 OCXiiSdnCvs8DJdXDdVqxg6lIOfjX0mz602spm6JzGrfkebBazS+0lORlcooVIyWdjoy0NU0TtWe22CZ3nwd3O/63hT7zoRj0Uv8zd3VOrq5EVt+4IJMmalI

On Fri, Oct 30, 2026 at 08:35:38PM +0000, Kevin Jia wrote:
> The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
> an integrated inductor. They report input voltage, output voltage, output
> current and temperature, plus over-voltage, over-current and
> over-temperature status, over a proprietary I2C register map. They are
> not PMBus devices, and their register numbers collide with PMBus command
> codes: 0x21 is a status byte here where PMBus defines VOUT_COMMAND.
> 
> The parts have no ID register, and the FS1606-0600 and FS1606-2500
> presets change how telemetry is encoded: the -2500 uses the 20mV steps
> of the higher voltage parts, and the -0600 needs a current correction
> derived from the IOUT_GAIN register and the output voltage. The model is
> therefore taken from the device name or compatible.
> 
> The over-voltage and over-temperature protection thresholds are
> reported as in1_crit and temp1_crit. The over-voltage threshold is a
> percentage of the VOUT_SET target, so the driver reads VOUT_SET but
> never writes it: VOUT_SET is a two-byte pair, and a partial write leaves
> the part silently ignoring all register writes until its input power is
> cycled. The driver is read-only.
> 
> Power good is not exposed. It also deasserts while the output is
> disabled or soft-starting, so it would report a deliberately disabled
> output as a fault.
> 
> On boards that raise the rail with a feedback divider, VOUT_SET holds
> the feedback-pin target while the output voltage telemetry reports the
> rail. The driver measures the divider ratio at probe from the output
> voltage and the Fb register and scales the over-voltage threshold by
> it, so in1_crit is in the same domain as in1_input. A part whose Fb
> reads within four steps of the output keeps a ratio of one.
> 
> Co-developed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Applied.

Thanks,
Guenter
