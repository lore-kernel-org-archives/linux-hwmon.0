Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932135;
	b=rOqB2EmtbethODyHoamhqo9cb1PuizwDPmeqU+jS70taW6Pie9Jgsbvnjrp+Pmorw8xH
	 3cevarw+GdxGoWP3+YJAxWae6AI6lwxxZFHLUw5UWsU4IgULxC4hOrwcZrNXquWaFMfOZ
	 Hruj7Shjk882iPuMdZKsBIVgGsYM+I79oCqVZLuQP+XmYC3xRJUHyaSC0E1vQPiuA8oYC
	 jqrz38asK68DL0nngpyO7Zet1lAVfjlihZu30Bb06poVY9dEEGB206YmoYH+Yd1kmoV3Z
	 LkvMtruWbojE63+rClyLmbB/No/DUb8LGLDAl5ENyxCK5ovpcBZ1IX37da3cRboIw/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932135;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=21uwyhK8JmBlIUfmHQQ+VjWlYOEC0r1gMhQecRYaLFM=;
	b=EVAez077Ts2VD/+yp+Vf9J/fU90xCUbIWCE5z6r8AvnRym6rJdRG467BELYcVJp6l+UP
	 fVkES2NTxLGjXDWrPbOnW2Sd07g3hdeq74AcgVjo4nE1bRdr6nYTebLsfDj7nvPGMoq0c
	 vNlBdopv4Qrt0Cz9FXQ/DI2dHevQ+SyipQjvxVu+pFoJHW9PJtSV6I5PCHoNEo59wR0R+
	 8gDGPekgnI/w2t1RzMugi6tugjdNvenHe/s2+Dcns3GR0r0nOSZFfZe9kvZl8/Q145j7P
	 PESnDjWfFY3tutbZwdVi1k3zPp6NaQrJ9GlURUxk31jdwd9hCEPZUKVATYmtd8eXA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UUIexu1Z;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C1606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 16:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UUIexu1Z
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id TIsOxAv3XJFmFTLqIxLLWz; Tue, 17 Nov 2026 16:15:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TLqHx2UheuJrPTLqIxbVMW; Tue, 17 Nov 2026 16:15:34 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afc7da6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=b5QGJjtLcb-mCnj7-7AA:9 a=CjuIK1q_8ugA:10 a=-9iV-VeuuNk-bLVfMm8F:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=21uwyhK8JmBlIUfmHQQ+VjWlYOEC0r1gMhQecRYaLFM=; b=UUIexu1Z/6ajA70591u+emoB+A
	NFgcIJJxchmtKtwHn1sBL+W7zASFTdiLVFoSxvIZPr2VR1MZhdR4EJTEZPBlqH8bTRIRQTIA7Lbcx
	oJOaWlWp8MnJNgWlSy5k2Cnk5WojAymvaB2/JQ4XG2IgASm9K75Tk+5ZyqVflRqJcN7vp4HpLskYl
	BM46yO440z9As55X9MD+xvA7SxcutojXY+Aa61FmjspW4E64S3BaNO8MemLF1wpESxHZsDWADCa0U
	UMqXdBpvaRZtsJqQmbQmRSL6ZBMoSV1L8Sbhd5zuBDQGJrTkgAag8etcZqhoV7/EVtCmB3zFCRdCq
	ovw3t8NA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59090 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTLqH-00000003N50-2FPj;
	Tue, 17 Nov 2026 21:45:33 +0530
Date: Tue, 17 Nov 2026 08:15:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525-S
Message-ID: <e39b0288-a2ff-4e6f-a31d-350cf5ffaa74@roeck-us.net>
References: <20261117133038.40996-2-glance@ac2.se>
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
In-Reply-To: <20261117133038.40996-2-glance@ac2.se>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTLqH-00000003N50-2FPj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:59090
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC24kScN9mi85znw3YK+WBun3fgWkDsBN1wl2EumL4Po1SevXrbOcZm0IigV+XUZE/lt9IhBF3MOSpD/ETzCt2kpibNndgS/2Pc9NSVwZkrlqli/WG/P
 SswLaSPbo8QwURs+sLnzUgXs9ybl5P4olFZ3xejB2N77EvlPfRWNh2AM44hQz6hOSHrTeg9fuNTEgffO9rLRnVBReIZN+14ygKO0VLNcnvF8eyNamXkNeO/j

On Tue, Nov 17, 2026 at 02:30:39PM +0100, Anton Lundin wrote:
> It's a newer revision of NCT5525 with new id.
> 
> Signed-off-by: Anton Lundin <glance@ac2.se>

Applied.

Thanks,
Guenter
