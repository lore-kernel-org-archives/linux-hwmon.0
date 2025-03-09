Received: from mx03lb.world4you.com (mx03lb.world4you.com [81.19.149.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA0D3208
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741555382; cv=none; b=mnJYBWhy49n6ZAV3lLt/1KdjFzbwsBOy4rqsxDkHXEA+CASai8xDPnB2Vdcvqkp5RcMsazNhBT+NLrxGJ13lkZMUoGDG5402//pZd0Bh6kYkFuS9Eykj3CzjDfb7d+6raIKM/TxrbyB075dTwazIAJUHyZra8BGzues7RLL4/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741555382; c=relaxed/simple;
	bh=Bjy8NYVsp9xlqv9EaKoFmlvfl7rBlsE/S2WGptlqhxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPVaUwT5Jai5/vS7DsfY7U/pB6Tofq1zMH24Wc/vyXF4nLIDkfqHUva79sxcjAhaTdf9zCe/bfXAuhcPStgV1lp1NSnfU9M641zH2IzhyJQC9xWts3FLvL04WGVbCGHyTGc/+4LOeTVXaSVYRx/UN9jp6l0MfVmpPhMSkK3CTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=Rb25pbI1; arc=none smtp.client-ip=81.19.149.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="Rb25pbI1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=veIJcQnYC72ybTiAGSjLRT1nJjeuDqQdS+FncncpUhw=; b=Rb25pbI1lMf4t8adtzinDy6L0o
	T3EXzuRyufvepEZFh6AgtxsHKeP5tPsBNfGZepLRQSjYiTH/C4tekJsXcpqrWTMXqnvWTgrV+YWjm
	IwVtt3KqqhlvW4eVsROJU+tabTPBbAsn7yyyamJuBP+WyOG01nN6L839UdHG8RFcm63E=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx03lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trNiK-000000008M2-0crE;
	Sun, 09 Mar 2025 21:57:37 +0100
Message-ID: <65ae604d-956e-4da9-9915-90dd39f6b657@engleder-embedded.com>
Date: Sun, 9 Mar 2025 21:57:36 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
 <59e6ea7e-eb9a-49c4-9b43-4c6be4586530@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <59e6ea7e-eb9a-49c4-9b43-4c6be4586530@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes

On 09.03.25 15:50, Guenter Roeck wrote:
> On 3/9/25 00:23, Thomas Weißschuh wrote:
> 
>>>>> +static const struct hwmon_channel_info *kbatt_info[] = {
>>>>> +    HWMON_CHANNEL_INFO(in,
>>>>> +               /* 0: dummy, skipped in is_visible */
>>>>
>>>> Why?
>>>
>>> For compatibility reasons, as the out of tree version of the driver did
>>> start with index 1 and there is software which rely on that fact. But
>>> I'm unsure if this is a valid argument for mainline code. Guenter Roeck
>>> also commented that, so will discuss this in the other thread.
>>
>> Ack, lets' discuss with Guenter.
>> However I don't think it's going to fly.
> 
> This kind of argument is often used by those who want to implement non- 
> standard
> code. Implement it out-of-tree first and then say "sorry, we have to do it,
> the out-of-tree code does it and our userspace depends on it". That is 
> completely
> unacceptable. If that is what you want, and you are not willing to 
> adjust your
> userspace code, keep your code out of tree.

I'm sorry that I created the impression that I don't want to change
driver code and user space code. This is not the case, I'm will remove
that dummy and start with 0.

> On top of that, I don't even know what the attribute means. An alarm 
> attribute
> is supposed to indicate that a value is out of range. The implementation 
> suggests
> that this is is not the case. What is "battery ok" ? Voltage out of range ?
> Battery failed ? The term itself suggests that it may reflect a failure.
> It might be a "fault" attribute, and even that would not be a good match.
> I'll need to see the actual description to determine what if anything is
> acceptable. It will most definitely not be in1_alarm.

I will try to provide a clear picture in the other thread.

Gerhard
