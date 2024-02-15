Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EBED9
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 01:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707959074; cv=none; b=ZOp81IHetaKHV8HNqKWMVzi4fcyXepCmxzy+V+QK0phtZHnR4crAeSjaaqLTOQbjvUBzsF0GCrR2ixYzv3mof36rkuP/fT34ojTBw4QYDsLtg6V2Gg113qxnbIlJ5wQEySjfX5ebNXb+G1qEoTv55NwHdElfiu7I7tXP6veHuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707959074; c=relaxed/simple;
	bh=f81tBoYoKFtffLb2EbFW1JiePAs0J2SG/XjJgPbND6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlv7xzJA2juGDYpV3Q+jQ8VHFu8OhifEPXevzJEpGE18H0poL4YwJl+gcSucJmi8bLGVfVwKwsMqFp1vkQELeUIsZ3ZWToYs1EMVM//67+fuJyYH/YhLrR0+Hsx0iNie2Bkla5YtA7C+ch0RsFO06OpuvkJR3QdA01jOUFf5rQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=bpNFTgFs; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="bpNFTgFs"
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 339B5A19;
	Wed, 14 Feb 2024 17:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1707959066;
	bh=ABVDAUI9ipDUBBLFXXOcoJTP3tuz+EiGjPRGg+g7Lzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpNFTgFsBCsN8VNnZiKZYKuHYlT4JwkmX+OSWjlZNAaIjTo7F0/VRHXCgh9vnv9Lq
	 UNBA0J0bHCt8XwTJHVkkp8Dcsv8z9movbbpOuJnJrpsHgRkeFvG1IeunySSsKddn1K
	 yDw8Rlmql1RxNUS6qCzgmg6n6VM7q5elPcHjNwfI=
Date: Wed, 14 Feb 2024 17:04:24 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH 2/3] hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to
 declare regulator
Message-ID: <8669f426-38a6-4ea8-ae4b-0d29c1d09a29@hatter.bewilderbeest.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240214194342.3678254-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240214194342.3678254-3-linux@roeck-us.net>

On Wed, Feb 14, 2024 at 11:43:41AM PST, Guenter Roeck wrote:
>If a chip only provides a single regulator, it should be named 'vout'
>and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
>that happen.
>

Hi Guenter,

This will necessitate a DTS update on at least one platform to maintain 
compatibility (Delta ahe50dc BMC, [1]).  I'm not sure offhand if there 
are process/policy rules about mixing code changes and device-tree 
changes in the same commit, but changing either one without the other 
would break things.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts?id=8d3dea210042f54b952b481838c1e7dfc4ec751d#n21


Thanks,
Zev

