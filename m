Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F06A000
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707992081; cv=none; b=h1Gm1Na+khmQaKZ79PtSJtyVSt5fJsZ75tVYJQlhQftcRlbb1KSyydGMc/OIkz9/BepU7z2WdRL/VPMAIGlxJQUWtEyYyhtsdlNheYVgVKMiVffQyBkdv76VAYWHSM4LbzLUz8gts9qjxM9ZmyGAZ1JyT8d5OzlrkMyGGGCPz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707992081; c=relaxed/simple;
	bh=te7vMGEWX3i71/Obs2P3B6TyFwzd2sExaC0voNn97E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQYL23DtwxWqR6w0qlL7HN2OzyGoXxJCzVqTtQvktzhpxngl9CGss6QL2xtchDQh2AhyB0/LdvdXBvST/cN/wAyoNL8rlRfOsDQHEHUR+SiuvfzhwL5wQQNVfLLL0fSKgdqjDlVpbtLCkoWb7/ChrZ7C+OYug2WsPKhk4HAHD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=h2YD4aBh; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="h2YD4aBh"
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B394FA19;
	Thu, 15 Feb 2024 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1707992078;
	bh=MJ2U0zDwwONRn+6XArYoYh5m0x+6UNPGXPyEpUaRfPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2YD4aBh04Bqne88cCCHXuix7dr1m89wJfJxzY7XeoDj+L7rDC18rz629ihvTsv1v
	 fkFyAo71JwGp8Q+92TrCKe8VoaMBKRHM1bQmXt1aTfKU2HJMJ0eRvB9gfrCCdElbn+
	 jweENwfJLVX9h9iBeXyRWhVA7QwqU0Sj0GkjfH1g=
Date: Thu, 15 Feb 2024 02:14:37 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH 2/3] hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to
 declare regulator
Message-ID: <ec7914ac-64a2-445c-b896-71a0087fb33e@hatter.bewilderbeest.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240214194342.3678254-3-linux@roeck-us.net>
 <8669f426-38a6-4ea8-ae4b-0d29c1d09a29@hatter.bewilderbeest.net>
 <a3b6f833-b8a1-44af-b90b-ed7370b12815@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3b6f833-b8a1-44af-b90b-ed7370b12815@roeck-us.net>

On Wed, Feb 14, 2024 at 05:22:35PM PST, Guenter Roeck wrote:
>On 2/14/24 17:04, Zev Weiss wrote:
>>On Wed, Feb 14, 2024 at 11:43:41AM PST, Guenter Roeck wrote:
>>>If a chip only provides a single regulator, it should be named 'vout'
>>>and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
>>>that happen.
>>>
>>
>>Hi Guenter,
>>
>>This will necessitate a DTS update on at least one platform to maintain compatibility (Delta ahe50dc BMC, [1]).  I'm not sure offhand if there are process/policy rules about mixing code changes and device-tree changes in the same commit, but changing either one without the other would break things.
>>
>>[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts?id=8d3dea210042f54b952b481838c1e7dfc4ec751d#n21
>>
>>
>
>Sigh. Agreed, especially since changing the dts file in the kernel
>won't change the dtb files on actual hardware.
>
>I really have no good solution for this. We (Well, I) didn't realize that
>there are regulator naming conventions/restrictions when we introduced
>regulator support into PMBus drivers. My bad. Let's see what others say.
>
>Guenter
>

Well, perhaps mitigating that slightly: I don't see any obvious cases of 
any other platforms' device-trees having any dependencies on the 
regulator naming that would be affected by this (judging by 'git grep 
vout0 arch/*/boot/dts' anyway), and at least with OpenBMC on the ahe50dc 
(the primary and AFAIK only user of that device-tree) the dtb would also 
be updated along with any kernel update.

So I wouldn't expect it to cause anyone any actual problems if we went 
ahead and changed it anyway; as long as the dts & driver do stay in sync 
with each other, maybe we could let it slide if it's otherwise a 
desirable change to make?


Zev

