Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF52248A3;
	Mon,  8 Dec 2025 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765180182; cv=none; b=CRKVfStMYc18jJA7ostQ2Q53vl/mCXFeBzXWSfunp4lZCYpr0me8UwXxrA1mxe1z1i/Be8Rmmzj0fl87oxRbIf/3ru2VT2EiCm8WF05q0dN6XuG0rHJlSE49SRwLqHIX/mRl3HWAtDrolmz2WcL4syL3QQF1WOWQq75VlZmqiao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765180182; c=relaxed/simple;
	bh=rthhf8HQv2qhdG9MKRtm+/CGJi9t1z9c7P2CetvVjrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdbE3YXhqSaoevKGBfxi+kZsnK3TENWOeTaoZg/DZztSr1Sa+PBspEmVPJ++iHzTJoeu2TKR5PzDrwhuLzY0TLGFozNeINf8Tp3YK8jtSAxzZ88Y1HCg4kdhMK4z4+C5KVYvlaa86CK52ILOXv78S9gP1Z4RXKEwWv2gqcW4hyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=09mRb3HC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="09mRb3HC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UHcykWMocqFN3+gEbGbTK7g+Z4rDiwDCQ20zAsl1FtQ=; b=09mRb3HCq0HyPpIQundNVcRe/Y
	C0g9DVwpt22ZaHgWxdhwL/2KovP0AOxMruqC9q6UOyYME2QQnYoMXpnOO24OolFY3fnEbi62LmJIf
	58qZrw7sjvVYMvdIzyvtQkztbGgjpt8Rsv6ODqLvOUBxJTMNhQidoVS7ZisL6FU8JOiLQL2I4cFyC
	gy5pZ11sjXQDALNVVUOITI8tyx+g1MGvw11TeCrRQbwOt47I+WX64G4guV3fYOICwz+9wcVq1JVao
	q0J//ieb9Zf36mcodMdObkEqPTqd8TE0BapCwU87DedqLyH250yYTM1eR4PaQFq/ZAYmPidoZQ99Q
	FVobz7wA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSW01-0000000CmqM-39C8;
	Mon, 08 Dec 2025 07:49:37 +0000
Message-ID: <2adbb279-3939-44c3-9849-ecbc33b2613d@infradead.org>
Date: Sun, 7 Dec 2025 23:49:35 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: add mp5926 driver
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, linux@roeck-us.net,
 corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
 <20251208071659.1157-3-Yuxi.Wang@monolithicpower.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251208071659.1157-3-Yuxi.Wang@monolithicpower.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/7/25 11:16 PM, Yuxi Wang wrote:
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..0a6699fa976a 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -472,6 +472,15 @@ config SENSORS_MP5920
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp5920.
>  
> +config SENSORS_MP5926
> +	tristate "MPS MP5926"
> +	help
> +	  If you say yes here you get hardware monitoring support for Monolithic
> +	  MP5926.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called MP5926.

	            mp5926.
(don't want to confuse anyone)

-- 
~Randy

