Received: from doubleyoutf.uk (doubleyoutf.uk [109.228.47.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735F31D5159
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Nov 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.228.47.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811853; cv=none; b=KIs/Wuxkl2YMSLri1W6c4uizyWMx6vgMwhFRZBvqSZiWnci+UNsKPWpjrh5CNlb2B/qxURsNNsTkykBfUfr6obR0V3mgSK4aaq5EFCZjigHKq/wD/RlpP5pf/uXcCgEpCU9pxOedkYfHAxhhJNuyBqWz0UQGqmUrtFSHEHBPwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811853; c=relaxed/simple;
	bh=gOFCNFnHE5wjys3fGl0fWdxeWq7iObkG7nH7r5cLmHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=faH4TiPejsmxdjQn6DrSAKyOfLW+p6n/cId8P/o7dLa5Ll+9HdFcI9aXOdlcX/6U5pwufLztcEXHdqCI1cA4Yp/Fela6P2lmRh6w7hvJ4t6LKajYKe4ehakoWL9M5kYO1j3G0iFPsb62ETYkZS4g2/dopB7T9KkF1CWr80y5lQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khalifa.ws; spf=pass smtp.mailfrom=khalifa.ws; dkim=pass (1024-bit key) header.d=khalifa.ws header.i=@khalifa.ws header.b=ASxuQQKc; arc=none smtp.client-ip=109.228.47.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khalifa.ws header.i=@khalifa.ws header.b="ASxuQQKc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khalifa.ws;
	s=rsasel; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yEId2RzWlYZ6cB8k+HhSMoBISOIkblh3N5MwnGTcy+Q=; b=ASxuQQKcfYcsnpPOf/nR5SIvnr
	FSRM8bLe6+wycAOBSFwqnLtzrCN76KCAd7YkDz6t4PHnLGG8TZeLhO4gJcDzpGa+H1NksErGtB4WQ
	jc358o9Ynw5/TyCtAToXTV+YdKbabyLZyFj7WaVigZ4DRJ4DSma9TIw+ea0IWEx5bP8c=;
Received: from [2a00:23cc:d220:b33::b56]
	by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <ahmad@khalifa.ws>)
	id 1t8JE3-00Bye7-Ps; Tue, 05 Nov 2024 13:04:03 +0000
Message-ID: <c43b0364-660e-474e-b789-134970ca587c@khalifa.ws>
Date: Tue, 5 Nov 2024 13:04:03 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: Add trivial userspace-configured monitor
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20241102174639.102724-1-ahmad@khalifa.ws>
 <ed296133-4139-4618-b8de-f8826064576f@roeck-us.net>
Content-Language: en-GB
From: Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <ed296133-4139-4618-b8de-f8826064576f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2024 15:03, Guenter Roeck wrote:
> On 11/2/24 10:46, Ahmad Khalifa wrote:
>> Add a userspace-configured driver that can receive IOCTRL
>> commands to monitor devices over IO or ACPI access.
>>
>> - registers a miscdevice at /dev/trim-control
>> - awaits attach/detach ioctrl commands with device details
>> - reads sensor values from: 1. IO select registers, 2. IO direct
>>    registers or 3. ACPI method calls (single arg)
>> - applies basic conversions: multiply, divide, dividend divisor
>>
>> Useful when there is prior knowledge of the device or when
>> experimenting with newer devices using old device info.
>> Another use is for debugging other drivers when raw reg values
>> need to be compared with what the full driver prints out.
>>
>> Drawbacks: Not aware of any device. It's readonly. Readonly does
>> not make it safe as it still writes for address select and bank
>> select. Needs an ioctrl and cannot be modloaded through config
>> or modalias
>>
> [ ... ]
> 
>> diff --git a/trivialmon.c b/trivialmon.c
>> new file mode 100644
>> index 0000000..11e5829
>> --- /dev/null
>> +++ b/trivialmon.c
>> @@ -0,0 +1,844 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * trivialmon - Trivial Hardware Monitor Driver (Trim)
>> + *
>> + * Userspace-configured monitor controlled through IOCTL
>> + *
>> + * DISCLAIMER: Don't run this with other hwmon modules for the same 
>> device.
>> + * You could easily FRY your motherboard! You could also easily FRY 
>> YOUR CPU!
>> + *
> 
> This is way too risky to add to the kernel. I think it is much better kept
> out-of-tree, with lots of disclaimers and users (hopefully) understanding
> what they get into when loading this module.

Understood. Could be considered a "safe" tool if in tree.

> I had thought about something similar some time ago, though limited to i2c
> devices and using some kind of command language, not open ended ioctls.
> I gave up on it for the same reason: For some i2c devices, just reading 
> from
> a register may be understood as command, such as "restore factory 
> configuration".
> If such a command is executed on the wrong chip, such as a power controller
> or a display controller, it can easily make the hardware unusable. It is 
> bad
> enough that this can happen with a kernel driver as well, or with someone
> executing i2c commands from userspace directly. I really don't want to 
> make that
> even easier.

Just curious, how were you thinking of passing those commands? sysfs?
over i2c-dev?

Looking around, the documentation for configfs seemed like it would
could useful for this, but that's not in much use as I can see. (And
involves lots of text parsing)


-- 
Regards,
Ahmad
