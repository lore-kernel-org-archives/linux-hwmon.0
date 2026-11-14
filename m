Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697284;
	b=f5pyVzhx646BReFdXueWEbkV16YdPSSCMGv6Abmrk6AUeb7GIrqHyw5+seB4DxlFCkad
	 XmOB1aVpUESkh8xtNF3Cvyflk/3n3ABvF/ZLNoPmUDUwot2YEItNcWI27jwnrB+P/ZsWL
	 Woi1IhRVvnFRlHNvIIbB68NvQftEW1+m/DXbOicCXP5sNCflTkmcDcjSvM9MeJS65xbrd
	 Hj8m1O/x8No8e0Ntg2grMyIlIAM/GGZI1Wu1F3LHomQkhoZ9Y/3wl2KuYAqFuLlb+iKAE
	 6ubZnTJtG/2iDfgzgBbEUnQHjcmHalXisDyTUJbnWX+CsLobRICkvPW6UgYk1P/mQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697284;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=1NGwc1JPwDHdEiu0v8Lwn5lSdaGLpJu9/e3I5X4X/zU=;
	b=3KIJyMSdYk0bJNKm2v/SR0Zefz41kbOxrgPLoXsgZWvuH3L8NpK0jPd0jFYnNuBmQz1y
	 PYtjnXB2LjMxBKsxIuXhL8puedmHVYW0uPyYxOncHS2VJSWZFd/pj4PcoRP5aoSlMTiMU
	 QXWcDdtZymywO1EEID0DaSlBztLwuYLeY9/9AEhTfNa9sIRZfw5eWXvQ9DZ9eODTq0bPw
	 Qva26XqkKMKpKu9GJyZNhaWK+a1NvMqiL3By99Q/x/z/k/ik1PiFuIjc3XtqT1TMkwyZb
	 mpBkQFnvilP+dB/AyMVLJJdz+3zezs3b8XaZ5EZZYz0SsMWTe008edDj9h0xjYySH8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aHpGYPrs;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA6606A897
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 23:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDA6606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aHpGYPrs
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id SHTtxKsf7VK9USMkJxnloe; Sat, 14 Nov 2026 23:01:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SMkIxlHY3laNKSMkJxzX3T; Sat, 14 Nov 2026 23:01:19 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af8e83f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=xdmuYzsaov-w2H670QYA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=1NGwc1JPwDHdEiu0v8Lwn5lSdaGLpJu9/e3I5X4X/zU=; b=aHpGYPrsgUBs
	hcNaeJwk1onR/GZJELL3k6+xL5vvG1aISq1h0/Umhkd12RxtXGyeXmsqAfqj3UfRDGJB1Qo7WU0xh
	WtBRPWWPuortCXhAB1sswVT2eytTXSO4gxwKo+HdJaze3G7tpzPVpVx5NWxdLApe+BaqwW/GlcMoG
	K37uupttpgB5nI9VR/4Q8jtomqyHkDUMcxqXZo2eV88B2vCgVrFFsGJhhDnTfmr1aDro8MiaAxX+t
	LKxyJyF3J63T6TgiabS1eeWobNLZYE1RK8aq6/RQQdnxNhlrJnMbtvCYQZs52GM1IV63Xa07mIRFj
	yF5oJrJlf/fWCG1N6l+VJw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60910)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSMkI-00000003CdU-2pvm;
	Sun, 15 Nov 2026 04:31:18 +0530
Message-ID: <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
Date: Sat, 14 Nov 2026 15:01:17 -0800
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
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
To: Matt Turner <mattst88@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
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
X-Exim-ID: 1xSMkI-00000003CdU-2pvm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:60910
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNvTJb/rtDhWE1hHeqSUyoWwl1eCdtrg3BbAf5pc5IfUba7jbavthOawG87Fr4vqG/QikwZCA7kU3Jx2ZD8+RMIeOP0W2VDfCdtrXc9gs7NOE3QBtm6M
 IXr8fU6/Gdc5mjIJPnrjF+r/g4nh9S0VaOK8mG5QIEdvVBBHiybnPuayYuqlyZQxh0TF9Oa6WTMwaeKPNiUJLEKJj3StD+hJ2FQsLdKqIIu9SwV05ou77AJ8

On 11/14/26 09:39, Matt Turner wrote:
> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
> 
> Assisted-by: Claude:claude-opus-5-5

For all patches: This is obsolete. Please base your patches on the latest
kernel and ask the agent to follow AGENTS.md.

Thanks,
Guenter

> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>   arch/alpha/kernel/err_marvel.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
> index c0c0ccefc467..832567a3ccbb 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -24,7 +24,6 @@
>   static void
>   marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>   {
> -#ifdef CONFIG_VERBOSE_MCHECK
>   	struct ev7_pal_environmental_subpacket *env;
>   	struct { int type; char *name; } ev_packets[] = {
>   		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
> @@ -62,7 +61,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>   		       env->unit_id,
>   		       env->condition);
>   	}
> -#endif /* CONFIG_VERBOSE_MCHECK */
>   }
>   
>   static int
> 

