Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68938F66
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Jan 2025 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840778; cv=none; b=UdQHgy0mVNJMaFdQSc/Wy/vfXetGllgDmgPfJix2nxUxqJCGCufh84YGb4ACKWfuLiHuLsKpy4tyNy5UvxrqlLRnATyQVffmUrsr/ZnLkNha3s13Wwe2wKAa09vCnPPo+3cgJoY3krf5U2356wXE1l3+b8jaBVxtrgRLkqzckgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840778; c=relaxed/simple;
	bh=8adqYawUNYSMGUMPUz08UncqWome1lgrmigUBHmV53w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QKn7Mq1ScxnlMrOeNW3t5UBr4KefzlRfyujsPMC7TIJ7qaP6Ene8sSlY6gSkjloUdcSL/QQ8KyxzPbSIanSxbUrC99N8z9dmnQTEjg7nqIJrQjaDcl2R25UjN86RyGBGeDLOuG1ijlrg34EEfI1CNYm3Ti8s35wKc/t0qXr5MMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JXLZeQLI; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JXLZeQLI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E66CF10408F95;
	Thu,  2 Jan 2025 18:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735840773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ps7JI5EpP897e67kv8Jn2THdW5QI1XZFbF/Z3t3Jxyw=;
	b=JXLZeQLIC8VAIzlUGKfbAIJjripfHHpexuUW886pf2hRzhYVMk2+QZ70uiL3G2p9KUL/v6
	YzCTFvlR2fDhA4M3giUVs4SzzOAXhKwcv/XXTXwc8HJy2p4fCPa4+LYFdSfDT6cfIpw9MB
	GRfHsH/LUL+Xx7ZMqMV007fvue0gkvDzX9dF7kSOv1CEvvxZy7BpHVOfwV+UQW8QClJccU
	4OHdF+At97JzyC7a7BnkLjQX+YUo/oM1edTPxsdr5nWk9HTJnV7RqxP6D03TlIttC+p0u8
	qPe9Hwub6a97R/ozRXiMdVhqXoq+JvD04XD/7IzSFOlccS2alMcCSaTLbZWniQ==
Message-ID: <8f98e89e-47c8-439c-bcfc-eff973901d25@denx.de>
Date: Thu, 2 Jan 2025 18:46:51 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pwm-fan): Make use of device properties
 everywhere
To: Peter Korsgaard <peter@korsgaard.com>, Guenter Roeck
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250102170429.791912-1-peter@korsgaard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250102170429.791912-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/2/25 6:04 PM, Peter Korsgaard wrote:
> Commit 255ab27a0743 ("hwmon: (pwm-fan) Introduce start from stopped state
> handling") added two of_property_read_u32() calls after the driver was
> reworked to use device_property_* in commit dfd977d85b15 ("hwmon: (pwm-fan)
> Make use of device properties"), so convert those as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks
