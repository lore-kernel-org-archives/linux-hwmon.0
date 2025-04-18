Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C63FFD
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Apr 2025 01:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744939311; cv=none; b=FpVv/F0dFBc/b5nfWEje02jMTVWHgPPUqfqSdZOPtrD5yHo6HO1JXTu5A0PueXcMRMXwBtT7wHwW1mwSiSOsNBZQo1ksOYILegH2M/9BIhYaAYMCRWoob6D9FUVaDPciqNj+gboJBLux40JFkqA4tjGOo5pd1Va4rnV+Mp8dQfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744939311; c=relaxed/simple;
	bh=16L6biUykWAlzzPiLULHukQSvUzbPRn6DPecRvxecVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrQLcQFQ0x8v1k1X4TfEv4uroHSGxUI9qlBnxXic8P3WuxbRd3CkruGx0n5VPelYN7f0c5jyJtie+27jukTdLGP3pVsRi1Ox/d+o01iadlfoQltiMhnF9S2rkohcfdL5s6VXK8eCQN+Xt+MFLvBaFM5iA62yGcnD+C8pQkNnS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XasRaXkv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XasRaXkv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1124202a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Apr 2025 18:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744939309; x=1745544109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B2/H1GF1px3soqq8j3SIPpZ6FPZ7geE6FZpwqZX7C5I=;
        b=XasRaXkvNLetJRmTv2+c61G3DUMVOSkXomVBn6A1Ig/mRkWf0SOV4GgeBWUYfsuLRh
         ZwottUsIoqxcRgoigjApVywbfb2/yG5RtGG/+yaASvbvM7A1Fpjyc5g0tJzNRX6CF4xR
         LyQYHJec2T1CcD70QkBuO4Q3k6Ga7dcepbQ9h+EnMMeXTLZeo3BnjbmuoFtYrwdeOKvS
         DvS1LzodUou6O4oULPBhdOCuOZipJRI9AGRcOXMgYse91p87XNRv7HrCw1AmoqnCsOA1
         A1U/SXO0gR8BUpw0IqEXHmR/pHA1YLqi8MResMdtbSKYk/OaLbOMXVU6+PmOrGwQsN+F
         KGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744939309; x=1745544109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2/H1GF1px3soqq8j3SIPpZ6FPZ7geE6FZpwqZX7C5I=;
        b=Mm5jQxC2B9p+ZkZNp4T3sJrXh958X4eoDJLZA0zjWr2ssL0Wgqu16Xru68U2vU1Zgc
         whc+FtAFsyfRbkxjDKHRI9+sLi/xkSoiqHb9Nr8LQtqlcKJ017P0O9iASwXz/zTnvqps
         FtPYkZ7XXD2X8GiqdGsIMkvK1QbqzSK9GpW75zOp7RLWPB/WGoMI23kIqOs89z7DabS4
         4ecJ9VdsaLGdSBS2ET/Y5w6JTyDdMJ+zQzzFTTGyNiT2PcR9MLonnBzniFX79yUPfmf8
         Oxa9Sb53qBK+lU5ezoP2TqgpE0s7EjkP3zuNBeUzeuv9Ioj9VEiwM6zKqOfChOXacB+t
         FZnQ==
X-Gm-Message-State: AOJu0Yzl1Z+ZzjBEPCRfdGLh1YnqEcNKIFeu86LYGAH1UIb+GhULj0lN
	/3QvUw5WBRsMPZZWKu5or3Eju62BJhZCdC91Shk8BNJ0TgYJCinq0YXMKQ==
X-Gm-Gg: ASbGncs/jrKJkmPLzNKiT4jUIW2eLYa7J2eVmC9o8dnIfPPrQC1xy+G3S1F/HRiyVtE
	lqQi/10rwmS+Hd1VCBmzMiH0Yzu7HDYgajczDgflHUkPwAmwUQS4U9zpVVOaU2/oLBbnC1qZC9h
	uNS3OmzzjS1+bNdLojweViZUnJ1g+ZcMdv4DI86TOCoaqe5jYxvnPI0fJU2js6yLYsBuUYGV3kn
	Z1phpeSadM6h/4uFZn2C7+7dOCEarnI8XO13CiSrtOCyVUsqxzm19isntZvKChs071tp9aTzaaH
	zh+unECghTZKyudjQFRMrbsOkQUddPJzxxOcfxH2cJerfuQfL3ruQc49aFMUo5lfuXIPoCWDzVh
	Ls+pM3d2S2+q6EA==
X-Google-Smtp-Source: AGHT+IFB+K5LrzUi8rZZETiOA2IY0tqJmdwKx/Q1RSGrbwMC9rLedEDkf/ZrhTxYbjvgUeYIQPjSWg==
X-Received: by 2002:a17:90b:37c5:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-3087bb3e830mr1298325a91.1.1744939308757;
        Thu, 17 Apr 2025 18:21:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0feac1sm108488a91.33.2025.04.17.18.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 18:21:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
Date: Thu, 17 Apr 2025 18:21:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: linux-hwmon@vger.kernel.org
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/25 11:14, Matt Corallo wrote:
> 
> 
> On 4/17/25 2:00 PM, Guenter Roeck wrote:
>> On Thu, Apr 17, 2025 at 11:39:14AM -0400, Matt Corallo wrote:
>>> When adding the PMBus entry for a FSP520-20RAB (actually FSP Twins Pro but
>>> it appears to be identical hardware with a provided SMBus -> USB adapter and
>>> it self-reports as an FSP520-20RAB when queried over PMBus using the old
>>> pmbus_peek.c script) with `echo pmbus 0x59 >
>>> /sys/bus/i2c/devices/i2c-3/new_device` I got the following BUG_ON (on
>>> Proxmox's 6.8.12-8-pve kernel). Its redundant and reports back fine on 0x60
>>> and 0x59 for both of its modules (using pmbus_peek.c) and I'd already added
>>> 0x60 and it BUG'd adding the second module at 0x59.
>>>
>> ...
>>> Apr 17 15:31:19 rackchill-refresh kernel:  i2c_smbus_read_block_data+0x116/0x120
>>> Apr 17 15:31:19 rackchill-refresh kernel:
>>> pmbus_check_block_register.constprop.0+0x77/0x100 [pmbus_core]
>>
>> Interesting. That function reads into a buffer which is larger than the
>> largest valid PMBus transaction. I can only imagine that the controller
>> returns invalid data in that transaction, where the first returned byte
>> is not the length of the transfer but something else.
>> i2c_smbus_read_block_data() does an unconditional
>>     memcpy(values, &data.block[1], data.block[0]);
>> which of course will go haywire if data.block[0] (or in other words the
>> first data byte returned from the device) exceeds the size of the
>> data buffer. Do you happen to have a datasheet ?
> 
> I do not, sadly (though FSP support has been rumored to help out at least marginally, though they haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script has no issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). pmbuss_peek.c says the following:
> 
> root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
> PMBus slave on /dev/i2c-3, address 0x59
> 

pmbus_peek supports reading up to 255 bytes into the receive buffer.
Anything above 32 bytes violates the SMBus specification. I found that
the I2C controller driver should block that. If it doesn't, all kinds
of chips could trigger this problem. Do you know which I2C controller
is used by that system ? You mentioned an SMBus - USB adapter. The drivers
for the adapters I am aware of (Diolan, Devantech) do validate the return
length, so I assume you use something else or maybe an out-of-tree driver.

Please let me know the adapter you use. If the driver is not upstream,
a pointer to the driver source would also be helpful.

Thanks,
Guenter

