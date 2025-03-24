Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B425D205
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Mar 2025 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805993; cv=none; b=e98LeI9Afcb199iv3I+ifFkrfzeHkVXbOTV+y395V4czwKjqVzegRhxGY+NI+T6VbgRyBIkURnljfHVPj4R7yxE9PnZqWbHxGPTOKBCmJGOmJJwVEKGknTdVqYGKeAyt3knPAfiibq6//S0WSeZfNJixwrUaBsUsb0EkM0AcNVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805993; c=relaxed/simple;
	bh=jwdkoU9qf7L3xQmvToLDBoVpWQWWo3JURJ8rCPJK9T0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aLAXHWNWwHyr71tckPm6B/+5hQ0Koo7wORbm0Qx/nMCfmH4EWq9BR3jq6XW+fz7VirPVoknyO5caznAAq+vlKIORzpxD75Jfao8G+g5cTI5Ka9ESyjO+Etbd8zcw4UWOmaO7JF7lzovOM34oWrlAIaNw/crPTvQZm16UqISbxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3869:6636:1af3:7cec])
	by baptiste.telenet-ops.be with cmsmtp
	id UYmN2E0090LH2Jv01YmNxG; Mon, 24 Mar 2025 09:46:23 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1twdRu-0000000FNQK-2SmJ;
	Mon, 24 Mar 2025 09:46:22 +0100
Date: Mon, 24 Mar 2025 09:46:22 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Guenter Roeck <linux@roeck-us.net>
cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: correct list and scope of LTC4286 HARDWARE
 MONITOR
In-Reply-To: <ad1f8871-def1-4a45-9b15-d968fc96e439@roeck-us.net>
Message-ID: <51f7f88b-6694-b767-2690-66f00d4ce83c@linux-m68k.org>
References: <20250317091459.41462-2-wsa+renesas@sang-engineering.com> <ad1f8871-def1-4a45-9b15-d968fc96e439@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

CC Delphine

On Mon, 17 Mar 2025, Guenter Roeck wrote:
> On Mon, Mar 17, 2025 at 10:14:49AM +0100, Wolfram Sang wrote:
>> This entry has a wrong list, i2c instead of hwmon. Also, it states to
>> maintain Kconfig and Makefile which is not suitable for a single driver.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Found because I was wondering why each and every pmbus patch was sent to
>> the i2c-list... I'd love to have this in 6.14, if possible
>
> Applied.
>
> Thanks,
> Guenter
>
>>
>>  MAINTAINERS | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 896a307fa065..68e312bcd006 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13750,12 +13750,10 @@ F:	drivers/hwmon/ltc4282.c
>>
>>  LTC4286 HARDWARE MONITOR DRIVER
>>  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>> -L:	linux-i2c@vger.kernel.org
>> +L:	linux-hwmon@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>>  F:	Documentation/hwmon/ltc4286.rst
>> -F:	drivers/hwmon/pmbus/Kconfig
>> -F:	drivers/hwmon/pmbus/Makefile
>>  F:	drivers/hwmon/pmbus/ltc4286.c
>>
>>  LTC4306 I2C MULTIPLEXER DRIVER

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
