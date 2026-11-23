Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464615;
	b=yxrdH/aWIw9vb/ASSA62FccRdlv8fFAx0QYhZtUJ5yoSE+M9iFgE/HRSTX7n7U+bwo+w
	 xTbQIKyG92jHV7Cp13U8nLAGKF0xBrIQ2dQb2tsSpW5oTBCRTuTEtdwOMM44knDCum5zd
	 KXV+HgTXslkVBhSbbOy0JkvSgMNW7+rLgH/DNF9JmexVF8eWVDGv8H8VsYF2e8C6EQT/X
	 sducf/b+/jgMo0XhzIiCDJTa0DmDH03I5F4uRZKUjnbR8pjrgY+YwFZp1Pe/uPjhIe2v0
	 MJ6/KN825ufNIRpa1c40ES0+DLPzKwBNnpACiQeFvsRqfiyT8P2zAwkI97puLMfMV5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464615;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=oB8jInRqxrT8+bMAGSsEnTkXCVNWvpOra6OyLl+Rabs=;
	b=21qSawt41P71lY0V0qiwbsacS8VN3ic5v9k/MjJNuC7rc43l1PGWzwz23tH4UVMcCQ/A
	 iUre15ziNQ6hSdNzwON3rFpwUp1nWn2KIafLHe7OSZr7yG+SWjRYZA3RrysHWSJI4XHj7
	 lcumw37nGpXoMdly/9hyckcthsNE5BTOR1ectmfIv3gLfhjrqUKo605v1VC1GFz+yHtUG
	 tKInlSemColxiUHYN0/4SzcJb2oTvEVgRJfa5z0yb7lNoFnarj0axIX7/q+xwu0KDrfJ6
	 zsIU9o42+DjyvZMUf+jONB2X5UVGAOu1P+kXCm16LoBrxxYn3QLI6O/dgsvS6wia3OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=xXJH5ruu;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D05606A321
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=xXJH5ruu
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id VXOfxwGSQ4vCDVaMgxDvEp; Mon, 23 Nov 2026 20:10:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaMfxjzs7dRrRVaMfxMDyV; Mon, 23 Nov 2026 20:10:14 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6b049da6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=uVdVLZTCkz4LskrGX3MA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oB8jInRqxrT8+bMAGSsEnTkXCVNWvpOra6OyLl+Rabs=; b=xXJH5ruudW7Epgs1dINfyiku0W
	c/Rc1x0XII9/hrQ0ce27iuTMPbWoutJO1n2Qm07e8EtP7KB+8WfsYLhXI8M2+f4dQgx9NS0/2yzZY
	92se5tbOfFX2i32PfatQaJBN/OfvYUChYXyVSguXC0qnML1+eRkmt2wHI6VKZOS3y7jDh0Hdkaby9
	2PcbDEDS5M0YfQMqrABxTcllUytOwVVz8JfZ3R7sDGFMQ0bIv0eSLvZ1lX4brPSUazn5dVovK1WQV
	HvY14KRmS3AifFb9ARzdYkcWuQ1R+rsKoIy45B3jWQMl/aC8qKKjlcqVIcX/8NBo3PyeIC6w+SL9u
	JTo20gvA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52560 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaMf-00000001d85-1T5A;
	Tue, 24 Nov 2026 01:40:13 +0530
Date: Mon, 23 Nov 2026 12:10:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH hwmon-next] hwmon: (it87) Add support for IT8686E
Message-ID: <4b68f139-94b5-421f-a4a8-79473c4c3aeb@roeck-us.net>
References: <20261123074813.18577-1-rosenp@gmail.com>
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
In-Reply-To: <20261123074813.18577-1-rosenp@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaMf-00000001d85-1T5A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52560
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 17
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIMAoMc7c36aGJGmWRlOT6EmsL3eb4Rj2Av94W+gW/RQHVWbFVdLYV8jVCGomeh/lQKdwwInSpgPa/B6G/POWWmG7E11DQKEjDg1ivbVR4Aw+rqdxDmi
 3rXZsxMZUqgIXeXqh7WjMeQrv1Oc8eUpbHwAXFrgfW2SorWicde+hQtf4+oEl8vqbMW9p4SVIQmiM5bZao+oE6pEHfIlC0k9g0YIePHHW9Vb6Y7SEJG6KBJa

On Sun, Nov 22, 2026 at 11:48:13PM -0800, Rosen Penev wrote:
> The IT8686E is the main Super I/O chip on many Gigabyte AM4 and LGA1151
> boards, often paired with an IT8792E. Its hardware monitoring block
> matches the IT8689E: 12 mV ADC, 16-bit fan counters, six fans, six PWM
> channels, six temperature inputs and the newer autopwm. The fan and
> PWM pin multiplexing is read from the same GPIO registers.
> 
> Unlike the IT8689E, where AVCC3 is always present on in9, the IT8686E
> only measures AVCC3 when bit 0 of the PINX2 register is set. Hide in9
> when it isn't.
> 
> Tested on a Gigabyte X470 AORUS ULTRA GAMING (IT8686E rev 2 at 0xa40,
> IT8792E at 0xa60). All six temperatures, fan1/fan2 and pwm1-pwm4 report
> sensible values; the CPU temperature tracks k10temp. in9 is hidden,
> since the board's BIOS does not set PINX2 bit 0. The board's BIOS
> claims the chip's I/O ports in an ACPI OpRegion, so testing used
> ignore_resource_conflict=1.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied.

Thanks,
Guenter
