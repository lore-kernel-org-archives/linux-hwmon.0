Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DD1AB52F
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728913969; cv=none; b=fqDMGxlKVpdfZvUFIfSCrXyE/2X0iw+n+YmClUzVsPxHc4MTc/Bo8ckSNGCFHvrFk49ydasldHynkpsjwqz9hS/PscOcgiKfWABlfMdsx0g1y+ptS+LCGbOkRtCaYtb4d8zJRvablBDRdcUJcKHZs1qPk3Z4mRs7Nf/ZN63L3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728913969; c=relaxed/simple;
	bh=cvZ45xt1Zdy40OLzcas7nXrRRLFDEi3mNij5HGrTRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6s0k+4hwTUPWw43AM1lumEu5SrRrYpdcRz0TJ/MyLMjAzFlmFnYb8MjuJVwu0caKAfAh1Hm8PAG8pbtal9Arv2zzZUU/McyBbhmQ57OJZ3bc+mh99Q2WsVQyG0BRl5KB49Lakc8Ghzt0i5nriBGY5qoQhAp5XrZbVqq6c316jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkLlLa2y; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkLlLa2y"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso2689674a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913967; x=1729518767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JyHAbs9c+qq4FOxHNG7gejbhdNwxGQtyOp/KoXKN+B4=;
        b=RkLlLa2y+FIBR6QW/7MeW6qUjT+wQBZWYW3N2vHVLZ3xRWF7vm+ldV/VZkGjQPw5Hu
         9QTdUah7LHgaeKlfDqTh6p6PJuT3QPanalQ4Jd6rTRcjFu2YE6ZInJ5JBUtbLp/3KriG
         +W/+yGgPvqzCeq9k46h0IneESfKUD2voiHgEBFqmowHqAQYQKGMs/MWxwApZC7nKl+iK
         xz70z9W02MEm2gCKq+RDc1kD949cF09f9guEcE38bGzCZClOfty4eaPRSSBR8uyOeC/4
         lJDEmgQxUW6HRf9gWnWG4QUfHZVCrOTlqcbEIuECYLWTh6BOA53P6scxc3y7yeH+T1YG
         wQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913967; x=1729518767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyHAbs9c+qq4FOxHNG7gejbhdNwxGQtyOp/KoXKN+B4=;
        b=Hweb4879AXpmP8eqWXW5w3z0BQwiiGT9tqXYp9JuZ6J6kqsJ4YbDwrAWmcDcYNSgXR
         rGpRX25okhLrVbQN+SSSCH+5oCd9x5j1OI1OIuC26aWvViokEF1zO55v9zIIF+xPb/9N
         0liDNLZeDf7/zGsN8jbwRLXj2/TVCucu98WoV5Aj2uzq2WwSMqixT+84Z8uOwxZfHLID
         IOLDJpUsDCRYJmrD+HuovID9jValnI6gljfqo7x8hIyPkx4jMq1BAZKy55prVVRp/aMn
         veCNViSnZQUAHlzeow9/8DxlSfr2dqsQ2xNeH0PcdWVs0Ah0UdHc0dOSvmTMIqSSfuSL
         g0wQ==
X-Gm-Message-State: AOJu0YyY1DvZRIafFgmWKE/tv8ahdwmj6ufNze33VyjBr2QRjBokCKnp
	LuhpyJEcD+nF7GtoGiWW++ps1HpDlLmAJWCMLRQ3x/dyXbRiDRcqvfXqwg==
X-Google-Smtp-Source: AGHT+IFR3UmWNZz5UQC68V9FmTfoiAIPzqYNxb2toh8PhnOuhUMW9pwbP2X8i+LYt7lcM+K8wobHmA==
X-Received: by 2002:a05:6a21:38f:b0:1cf:7123:86a6 with SMTP id adf61e73a8af0-1d8c96ba856mr14312626637.49.1728913967251;
        Mon, 14 Oct 2024 06:52:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c356250sm66232145ad.299.2024.10.14.06.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 06:52:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b33ea745-5acd-4019-aeff-59bee4d50e5a@roeck-us.net>
Date: Mon, 14 Oct 2024 06:52:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (jc42) Strengthen detect function
To: Jean Delvare <jdelvare@suse.de>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240630202028.1874325-1-linux@roeck-us.net>
 <20241014141204.026f4641@endymion.delvare>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241014141204.026f4641@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/24 05:12, Jean Delvare wrote:
> Hi Guenter,
> 
> On Sun, 30 Jun 2024 13:20:28 -0700, Guenter Roeck wrote:
>> Configuration register bit 5 must read 0 for all JC42.4 compliant chips.
>> Several capability register bits must be set for all TSE2004 compliant
>> chips. Use that information to strengthen the detect function.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/jc42.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
>> index 1180af1b1638..a260cff750a5 100644
>> --- a/drivers/hwmon/jc42.c
>> +++ b/drivers/hwmon/jc42.c
>> @@ -413,7 +413,11 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
>>   	if (cap < 0 || config < 0 || manid < 0 || devid < 0)
>>   		return -ENODEV;
>>   
>> -	if ((cap & 0xff00) || (config & 0xf800))
>> +	if ((cap & 0xff00) || (config & 0xf820))
>> +		return -ENODEV;
>> +
>> +	if ((devid & TSE2004_DEVID_MASK) == TSE2004_DEVID &&
>> +	    (cap & 0x00e7) != 0x00e7)
>>   		return -ENODEV;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(jc42_chips); i++) {
> 
> I have a user reporting that this change is causing the jc42 driver to
> no longer bind to his memory module temperature sensor devices after
> updating to kernel v6.11. I asked for a register dump:
> 
>       0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> 00: 7f00 0000 0000 0000 0000 6ac2 091b 3022
> 
> After swapping the bytes, I see that this is a TSE2004-compliant device
> (devid = 0x2230) and the capabilities register reads 0x007f. This
> doesn't pass the 0x00e7 mask test you added, as bit 7 isn't set in his
> case.
> 
> The JEDEC standard indeed says that bit 7 should be set, but apparently
> this isn't always the case in the real world.
> 
> Also note that I looked at the Renesas TSE2004GB2B0 datasheet and it
> shows bit 2 (RANGE) as not always set. The ST STTS2004 datasheet shows
> bits 0 (EVENT) and 2 (RANGE) as possibly reading 0. So I wonder how
> much we can rely on these capability bits being set in the detect
> function. Unfortunately I don't have any TS2004-compliant device at
> hand to verify, nor do I own register dumps of such devices. Would it
> be OK with you if we relax the check to at least ignore bit 7, and
> possibly also bits 0 and 2?
> 

Sigh. I guess it would have been a miracle if vendors followed the standard.
Let's ignore all three bits, with explanation. Care to send a patch, or do
you want me to do it ?

Thanks,
Guenter

