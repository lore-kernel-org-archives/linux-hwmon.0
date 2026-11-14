Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675073;
	b=WjoCRx9y20LIjNyn7XOpHINV8k3uotD0bZkQVbnGt+r1SGFG/ziUp5VHP4rfudDPpRCW
	 nKUsETTK+2WvLt1bo9UdJqEHRgrGhA2BPxMQjdpf9kvBeZR7DAt3Ou4eIFjTWJ9bjt6Dk
	 n0rdNXbMeFs3Mo5i52JTOPvr7WRMRMTIgxavRlBJz74K65cmy68dkWzrn852Knr7qUdLd
	 4KqruiuqNKUsJAaOPpCCABnEHStRQSyGfYVDA+Ybm44lTnqJgxXZhWHL9a4GCgWIOzX1R
	 SOWYj5sNcl6EDgkUpXriP+eg1JpxRHzvT4y+9fWSkUPZM2+YE8bQiLbapeCtKUZKdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675073;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=x4mJUjjI/Oh1UCSsTjAERe2/4gGU2vp2ktqLpo6QJMY=;
	b=GRFwOh7HYfDBxow7wPRRdnHAM//37qFhHBOddEzd2skDhBMq0MRzyBWNfpEfpBtKbI/u
	 +XuiPX6jR6aLkWK4zoq9WZUM44LLaBoo8z9kiCb5tDWfkCFANl3oPHXW3pRz1d+b5EHoH
	 cswQIuOXSy78Qh0o84Eji54QBJUmLqKwBKx2kEGeHCwk92ja2RMpYaBxCJOAlhveolkQj
	 t996TAZClD9xHApAnjmtTrC4GS+ehDdMEvouhjIO9OCVE4JHoeNg45AKiDRz94FgWh5vP
	 kx0xMRqeEpHTWy1aOqIleX3C/o07ckLbS5ZFp8emrdtMjNoGfaEQWacdkfqIzhVnj2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bCSE1qb9;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8774606A334
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8774606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bCSE1qb9
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SCwtxzE6BJFmFSGy7xyhi9; Sat, 14 Nov 2026 16:51:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGy7xbZbsdRrRSGy7xluGA; Sat, 14 Nov 2026 16:51:11 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af8917f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=2n3nD9T5GNQZjHGig_cA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x4mJUjjI/Oh1UCSsTjAERe2/4gGU2vp2ktqLpo6QJMY=; b=bCSE1qb9VUvZTnNnxwhVodzeUk
	LGhfRLRTNasZNxW6fqIR56+rtZM5Z99yS+FVTAA9G3wdJ1RlbVmapsJHxunUPj4B63iUipDl1k4UD
	qxhSndc49U/HKUNSiXWV9FLH7tFd37bAkbC5Rd+Eu6KCpqG1VEWniB1QmTl0W/8r/2KwxISSmRzHQ
	iDk9SUXThEsHcrxXo2z0MSEfJyTxtrjI15GNQl3lL8cLqk7TCAmkBwRjaogONhQ8RKnf8+3IyZLZQ
	pTq7S/n0m6lyWSnSfdPJuPLeNOba9QhC1vEsvJHAbnEvIGbNykdHoU0OLFYIFYjN3UfahI6+ORGAL
	dpLD0Upw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33524 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGy6-00000000Nu5-3izz;
	Sat, 14 Nov 2026 22:21:10 +0530
Date: Sat, 14 Nov 2026 08:51:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Clamp the pwm value before scaling
 it
Message-ID: <87a561dd-338b-422d-ac0f-da1125b3068f@roeck-us.net>
References: <cover.1794633179.git.rosenp@gmail.com>
 <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
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
In-Reply-To: <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGy6-00000000Nu5-3izz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33524
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 132
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN3pafcd8tZ4QovJ5y1UZxQfKVpbCawqknuKhZ+8QOMyM3vy7CtZ67hE7GB9Wuxp8baXPwXDY3ZiEandXfJEMr1RlY95v/kap62O1116+8wtt7/xdit4
 SNjLNwk/038WrghDAJXvIn8t8ZWU3mikdDoC5hT43ULXFakbcle6O8N36Pn0vAcfRN8bPSR1RhWlAJxBLreRwul1uBVztvN1Y+qWHkyT70MTOJH+7uvyQzAi

On Fri, Nov 13, 2026 at 10:20:22PM -0800, Rosen Penev wrote:
> dell_smm_write() scales the value written to pwmN with
> 
> 	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)
> 
> before clamping the result to the valid fan states. The rounding adds
> i8k_pwm_mult / 2 to val first, which overflows for values near
> LONG_MAX and wraps to a large negative number. That is then clamped to
> 0, so writing a huge value turns the fan off instead of running it at
> the highest speed. With the default fan_max of 2, writing any value
> from LONG_MAX - 63 up to LONG_MAX selects fan state 0.
> 
> Clamp val to the pwm range of 0 to 255 first.
> 
> Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5ec487843faa..e8b4e8a29e8b 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1030,6 +1030,7 @@ static int dell_smm_write(struct device *dev, enum hwmon_sensor_types type, u32
>  	case hwmon_pwm:
>  		switch (attr) {
>  		case hwmon_pwm_input:
> +			val = clamp_val(val, 0, 255);

Per convention, invalid pwm value writes should return -EINVAL
(because the range is well defined, unlike other limits which
are chip dependent).

Thanks,
Guenter
