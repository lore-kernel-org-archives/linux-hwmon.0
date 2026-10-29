Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294484;
	b=VV6UeR0xEKaPldyR1iMFuqJ1sE58dq3c68iJXUfKwiUGPfPJvuM19dt5aIpnHCVpp4WR
	 pZ6+4EQJNcNhRZRzqTbM6jWPtd8aProqP8m5YYVY6NzHQSOTpgiWfPSaHi5FHIKE5T9oS
	 Q7H76CbVW6ZibaivSE4rGXeBrTT6bzMzTx6KugZa669KIZRBfdwtsjtI31o+9GRT+wq7b
	 MLS9rfy2gF/NVTu0wRkcmSm2U+UQjNmHhhuNVoioO4W89VEz6YeUw+xVywdtaMINktY1M
	 O3t/QmVJmaP4Xk1CIg3UMVKMpoqZCJGsLLvz5klT5HRLsZPTiQ4E4FES9tSxd2y+e+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294484;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=TgNeBHsknHj0wzoAxUWE7QektXUSWiHy+TF+yx5mrrI=;
	b=NZd0656w69sf9KB8Kn4Tmg3JQBVd5f7N9UGZU4YyhTRZg5i6YzJroVNikF3HOTCdA2Qk
	 fy3j0xwFA5naxftf8vdc53DXsqg+ks4jfMCyAziuEM+OkpNvC9ax2umVOEirAbmYnVUsH
	 g6/xKWFcZwBL9Z+exa2g+Osk5X3mdHzyNQNFwyBzEwrd+f1+1JTWFlsKgnxS5HG+0Ng72
	 dyZxrHoapJ8xoBFVAny4OlcPpZyKMRBczEI0xoCCdzZz5tyRE3PFzB4z5bIC+N+K7I0A4
	 gouYm8FZ+brv9ww0NNFraxwqSTFb1v1yJjBABaUljiRahpGEOfvTTFv2CTdrm2+Cgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Nq9dyxYn;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC322606A31A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 17:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC322606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Nq9dyxYn
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id MJ5sxOo6yc3XsMToZx3hAu; Thu, 29 Oct 2026 17:21:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MToYxZvWCQfwNMToYxCzfz; Thu, 29 Oct 2026 17:21:22 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae38092
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=VQ8kBUOwJ9iVmVjqGIYA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TgNeBHsknHj0wzoAxUWE7QektXUSWiHy+TF+yx5mrrI=; b=Nq9dyxYnqJLYGid9u042rSqtkZ
	byNcIobryJ+YXGbg0mAm7UUvDLSCBd1q/pX4VxpvxXk96no5UO5kkR8yAXg8/fkeqtfG0xdncZVJ8
	ywH1MvAOh6LcwA6xm/3WSZmecvq3JNazu0Z5Eqw1uzNEpx9J1Z8w8BH+YAwcsSlRx3fSZBcqjJAIZ
	HEbf9HJh9bmYZEU/XGYm76sWY20cTY4o3puFmG3w195eoaTCavVdOjbvuBxF1GLbB+Pv6uPC2P0wG
	78Duj95nPk9jL0tEBRR2+IWo12Vvug5z344bompnXjysyw1PVHTkS915PCDW5j/N0K0IyVf3lRh0A
	K5W04eSg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47456 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMToX-00000002CM1-44C0;
	Thu, 29 Oct 2026 22:51:22 +0530
Date: Thu, 29 Oct 2026 10:21:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mike <mikedeuchar@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: Precision 7670 SPD5118 resume -ENXIO with confirmed SPD Write
 Disable: supported temperature monitoring without weakening protection
Message-ID: <9cfafb7c-8f9a-4736-ab38-4f46eb5b0d0e@roeck-us.net>
References: <CAD2WtuOZEtLGkncdKA45T7mV+udX4jt7cZpqqz+xUZ_Z9UVGsQ@mail.gmail.com>
 <650722d0-5f7e-46ab-9044-5fbb133a7967@gmx.de>
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
In-Reply-To: <650722d0-5f7e-46ab-9044-5fbb133a7967@gmx.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMToX-00000002CM1-44C0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:47456
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKr5Zv309QyKrqnXH1SR1Se0dJ3rn+vRw1xQtk0+/YHyn6lNUHmsTt1db/JE3zG7NwJpgm2MN49QCze3ytKI6q5sc1Ry4XMzPqUtQsedIsjm//QdSP6+
 HQJOqQRkADB0+Y9RhR7cYw5JiTRymyx5Zq0kpu7Yg4UGvnfDfuZpHQu3/UXr0TMXV5N2519Wj8T1CtPPeRNHm3DXEBWEKQK/NazINSUf9RJHgYyhyCLvXSSD

On Thu, Oct 29, 2026 at 03:08:48PM +0100, Armin Wolf wrote:
> Am 29.10.26 um 12:31 schrieb Mike:
> > Hardware: Dell Precision 7670, BIOS 1.41.0, i7-12850HX, original 2x16
> > GB DDR5-4800. Passed Dell advanced diagnostics preserved. Kali kernel
> > 7.1.5+kali-amd64; spd5118 in-tree module.
> > Boot: i801_smbus 0000:00:1f.4: SPD Write Disable is set
> > Boot: i2c i2c-0: Successfully instantiated SPD at 0x50
> > Boot: spd5118 0-0050: DDR5 temperature sensor: vendor 0x06:0x32 revision 1.6
> > On each of two completed s2idle tests:
> > spd5118 0-0050: Failed to write b = 0: -6
> > spd5118 0-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
> > spd5118 0-0050: PM: failed to resume async: error -6
> > 
> > Temperature sysfs attribute readable after first resume, 30000
> > millidegrees C. This is not independently validated against
> > register-page state or another thermometer. No direct SMBus write
> > tests performed, no protection changes, no module blacklist.
> > 
> > Aware of maintainer concerns in August/September 2026:
> > read-only/skipped-restore proposals cannot guarantee valid sensor page
> > selection after firmware activity. Neither proposal installed. We
> > require protection and reliable monitoring retained, not silent error
> > suppression.
> > 
> > Request: is there a supported firmware interface or driver design to
> > validate sensor register-page state and provide reliable read-only
> > monitoring on this platform? If firmware cooperation is required, what
> > specific documented behaviour should Dell provide? Please distinguish
> > unavoidable read-only limitations from a correctable resume callback
> > error.
> 
> Dell could either modify its BIOS software to not set the write-disable bit
> _or_ it could expose the SPD as a ACPI thermal zone.
> 
> The upcoming 7.4 kernel should contain a fix that disables the spd5118
> driver on platforms where the write-disable bit is set, so the error during
> resume should disappear.
> 

Correct. Until then, I would suggest to block the spd5118 driver.

Guenter
