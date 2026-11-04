Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834601;
	b=4Zh+f7790i8e05iNxSpdBISTWwvz4rfkCMi5ZNkFWMplLMm7UQ3kaFeJ9SzAxYQJ/myn
	 dnr+cZckY+hbauFKQpv/XiRKXoRBnqd3EDrX0YH47ci7NOoFf90kO5TaLWqCbvdlUYwwn
	 9MruRaACRc7XsZdafEbAIcm3OLZQ5Aj+eELZQlzVqvP2em+kHqINbwwhCqRaG9IGf8WkN
	 QcFbEDwMhYne3aRUTPmC5/batQM7TsTkOwnFjkHJLUjYd9hZsXYu5peHQz75OBCorzI0M
	 0X7TZyZIEafv6JuYWqcO8nxjCNkRUtCyT7zknNpTglv5lJSXf22WV+IObNuHOS67U0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834601;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=4adyBlLdVi5msyI8kDjuQ5BAfRehV0yE12KsQNfCTuE=;
	b=5gz1jevBJp5VeoW2KBNp8eFClcMBb7z0uuoeci1WcUAjmC6ZsRBVa5e7F5XsLZMMzVYb
	 CCL1fV10sgRT2q7AtvDVvDo9g9N3fpSTK4epxMCUU7XJ1Yhh4GACs52SBADRsQOdcMqNV
	 5zQ9e2M3QShmU4SiIN0JtS0OzPFPLfNaFornW36aLJlfBZ96rpCodGfNvCGS26ngwXpMX
	 3ktN/z/1iy4jEbX1A1SqFe7ke7+BPjd2IkdWlzij08adyoQL3JO2tcEskcn+aFUXOAjSJ
	 ko3Rn4lYwTcNPX6NRSbTBBEL7720UBcs2GBilaz3wJUvL5yvPiFUNzDdXS01AAzjy4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IGSEwRAO;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A3C606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 23:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IGSEwRAO
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id OfHIxYpzdVK9UOkK8xJQLP; Wed, 04 Nov 2026 23:23:20 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OkK7xtaXQxqjjOkK8xgP3H; Wed, 04 Nov 2026 23:23:20 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6aebbe68
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=0ogU7NcLSlclAW-9CXQA:9 a=QEXdDO2ut3YA:10 a=WfCSls34T8PcalPlSTFI:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=4adyBlLdVi5msyI8kDjuQ5BAfRehV0yE12KsQNfCTuE=; b=IGSEwRAOsOVm
	3S+V/y7mnIucbxkpcCBSSXGY+p+EtOklmKK07UZKkiS6eIfNp20rAongbRC9UWLD428AqVnbw0ArO
	4lYMrv7s/AZrcwYrN5Fp+NXlft4Xu/4r1edvyGUBE4AYhRO2HHA4OQjJ/xERPtgwAhMoTDAevq+s/
	Dc555OYMI1CxlE3CjQ6fPwvQd2Wwoy96Y2XRpuC4gtd3pmcXmOMmjaSnhdMoMHw3Gyvkk/rigHcb5
	HvN+rutDNiniY5jOekJIVa5OuJZ00xgyRDO2MReexwdhomiwRRfSlcgMrcBPnSx5OPVEtyYNnH4Cn
	YmFZ9U2A/HuCbW961y3VAQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35844)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOkK7-00000001dKU-2RVi;
	Thu, 05 Nov 2026 04:53:19 +0530
Message-ID: <6d490e67-82a2-44b0-be16-3aa46e7c0430@roeck-us.net>
Date: Wed, 4 Nov 2026 15:23:18 -0800
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
Subject: Re: [PATCH 1/2] devres: add managed timer shutdown helper
To: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CADZg-m3Mnk_QJ44HrH4SkCm+pN5QteeQv8zY9Q7EE7RQv65O8A@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADZg-m3Mnk_QJ44HrH4SkCm+pN5QteeQv8zY9Q7EE7RQv65O8A@mail.gmail.com>
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
X-Exim-ID: 1xOkK7-00000001dKU-2RVi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35844
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG3e9V7+5vGVEF72mxBa6N4jPQBYFQ5UbgB6ffC5QJpikqF3HYlapar0gZX0B+PdpJbVtguFb0Y7tPJJXHPg2prsjMHwsraf3E7sLnmQomtZ/Jz8kAGg
 /d+FyAmqB2qg1lttMHl1NMRynWKgcIE+KKJnBYUEiIquc9RVm4b+4e9W6uyk+nQguSJbxjlkMp/zDfQAT1MSjSrVHwZ5OL20LDP73B+nApnVZLn8Uq+VWCwC

On 11/4/26 15:03, Kirtikumar Anandrao Ramchandani wrote:
> Provide a devres action for initialized timers. The action calls
> timer_shutdown_sync(), draining the callback and rejecting later rearming
> before device-managed storage is released.
> 
> Use devm_add_action_or_reset() so a failed action registration shuts the
> timer down immediately.
> 
> Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>

I see no benefit in this patch. The calling code now calls
devm_timer_autoshutdown() instead of devm_add_action_or_reset().
That does not really make a difference. Sure, we could add similar
code for every instance of devm_add_action_or_reset() in the kernel,
but what would be the point ?

Guenter

> ---
>   include/linux/devm-helpers.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 708ca9131..ffe8b68b7 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,8 +24,33 @@
>    */
> 
>   #include <linux/device.h>
> +#include <linux/timer.h>
>   #include <linux/workqueue.h>
> 
> +static inline void devm_timer_shutdown(void *res)
> +{
> +	timer_shutdown_sync(res);
> +}
> +
> +/**
> + * devm_timer_autoshutdown - Shut down an initialized timer on resource release
> + * @dev: Device whose lifetime the timer is bound to
> + * @timer: Initialized timer to shut down
> + *
> + * Register a timer_shutdown_sync() action. Register this action before
> + * arming the timer, and after resources that its callback may access.
> + * The timer is shut down immediately if action registration fails.
> + *
> + * The callback's resources must remain live until shutdown completes. Any
> + * independent user of the timer must stop before the timer's storage is
> + * released. Devres actions run in reverse registration order.
> + */
> +static inline int devm_timer_autoshutdown(struct device *dev,
> +					  struct timer_list *timer)
> +{
> +	return devm_add_action_or_reset(dev, devm_timer_shutdown, timer);
> +}
> +
>   static inline void devm_delayed_work_drop(void *res)
>   {
>   	cancel_delayed_work_sync(res);

