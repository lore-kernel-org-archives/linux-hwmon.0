Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3760C3A8D7
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500032; cv=none; b=ROGXgEmCgnVZ2k4cCmtt1QwFqllXTIJfdkbjZLwlJ6j4kw4KIKANbGsYyPyfLHyAs98s1psLymeQuYSNJRu8v0VupzFgmEVmYTk8J9Oj5/txhE2kgTWN3gZ2taJscf/hzz+18WHPz5TRDgzrGpsbp21U65MeMh8qqDBpIZmmWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500032; c=relaxed/simple;
	bh=ous2wXNGHzyfCnEriHhA/EETAeKpeZ5rkiqT8+Ea328=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ks8XmYj5yeyKN9ueP94I8PjQFEo0rxatHXvZ+Nno199HrestLwn+SQWcpFh/o4hTQDP+Ls6fLmHA6owNGwEELklE1q3CJVTlbj2Ifl5Z/ZvVTgLOeFeb17oqSlCxgCkP2OY6oIHNYJdbeCuxBiTKtpa96cpayLdVUsxuqKVV7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtEb0vsn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtEb0vsn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d746ce7d13so43357205ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Feb 2024 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500029; x=1709104829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XU0PFDPTPdMjZvJAAziFv5OXOF0+LU/UnWzuebJL940=;
        b=LtEb0vsnfqCuOPswsD4H1eh8HVrZJaJpYvEbAuJkHXosSH64kQFU3zPx5UNPCwsY9Y
         3iVkz3g3kf12UkS+BM2BvpDhHzc5J6YWNW2qtjCiyfvp1XedYYsULSPcFYH1EEAKwBh7
         6/4Hg1nnlgWWJJe/brbUkWoPZt9jpcd9ya5YKWi5B+iX2Xiwqaxk+vdjat9IZMEA/X/E
         P830VhD2ZqpRXG09fWa1WYd3iekl4c2ayDGO1835tYF81bF47+DpwXGwuN3LS/qYQPj5
         qA5odpHyC4e73qVMEghMjhp9xxc3R5luDJ4DbmAI22DoxXx799IuiLENrAA1IoEaareR
         kPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500029; x=1709104829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XU0PFDPTPdMjZvJAAziFv5OXOF0+LU/UnWzuebJL940=;
        b=qAjkCkwXAFqt41aTSJKW90zwXMA38Fy4YtWzzfQlS8gIzJyiwBn6qY0NUXoLmwNwkn
         KBi2RV4Wgs4fO78+0EADoBf28K1In1Xr3Ah555p+f235Z4UVKCh14FUUEseGviN80kDR
         lNcQUXMCjvc/+WUvcA/l2/nGpg2PGisCIjktDWcWdmqEsPUjeId1fP4SqR7x+5M894SY
         ADUuk5H9isLsx4TAm8DA7a8M7Gj9rdSLpbN8ccOkreBe6Lh631IyDs1nE/7wVg1tbmZS
         xEwooJiwm/H2uYmccTN4AzuLuG1Xp6lBn54n7a53/hNEu/VMt35ERbyN195NcgAt08VV
         ia3g==
X-Gm-Message-State: AOJu0Yz+x4fkJhCWdHPxSAdLpS7eC2HGoSOsgcSaLiZXUxQpn9/wU/lp
	4FMv48irAzjiUzjXE/FR3KkOLzSQ7BiXKAe80eeqkSlM6Oy6T+pI
X-Google-Smtp-Source: AGHT+IFGEcaD2nvBrUtA8hAE/+S5lvAh6Ru+Uhuj4xXNFg1pNb6Aa8/6Qlf7+H2Z6wl9Cx9NaPRrBw==
X-Received: by 2002:a17:903:246:b0:1d9:af94:9f3d with SMTP id j6-20020a170903024600b001d9af949f3dmr24482036plh.28.1708500029481;
        Tue, 20 Feb 2024 23:20:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z2-20020a170903018200b001dbf2d899c4sm4895849plg.225.2024.02.20.23.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 23:20:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d51181d1-d26b-42b2-b002-3f5a4037721f@roeck-us.net>
Date: Tue, 20 Feb 2024 23:20:27 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9
 [nct6775_core] (kernel 6.8-rc5, amd64)
Content-Language: en-US
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: linux-hwmon@vger.kernel.org
References: <20240220140110.311652f6@yea>
 <324097c7-05c3-47b5-b0ca-3593ce25ebbf@roeck-us.net>
 <20240221014152.53b995d4@yea>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240221014152.53b995d4@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/20/24 16:41, Erhard Furtner wrote:
> On Tue, 20 Feb 2024 07:45:18 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> 
>> Would it be possible to run the stack trace through scripts/decode/stacktrace.sh ?
>> I am having trouble associating the backtrace with the actual source.
>>
>> Also, did you by any chance try the same configuration on the same system with
>> a pre-6.8 kernel ? The source code locations I did find (unless they are completely
>> off) point to code that wasn't changed on after v6.7, so it would help to understand
>> if this is a new problem or one that is exposed by your board.
> 
> Hi Günter!
> 
> I tried v6.6 just now and got the issue there too.
> 

Thanks for confirming. That makes more sense. Yu should actually see the problem
all the way back to (at least) v5.15.y.

> ./scripts/decode_stacktrace.sh /boot/vmlinuz-6.8.0-rc5-Zen3 < ~ef/dmesg_68-rc5_zen3_v01
> 

The log is again from 6.8, though.

Anyway,

> gives me:
> 
> [...]
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> BTRFS info (device nvme0n1p7: state M): use lzo compression, level 0
> loop: module loaded
> ==================================================================
> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core

This would be the important location. To get that, you would have to provide the
modules directory as second parameter to decode_stacktrace.

After compiling a kernel with your configuration, it does point me to a line
in the source code (drivers/hwmon/nct6775-core.c:4207).

                        data->reg_temp_config[src - 1] = reg_temp_config[i];

The range of "i" is 0..11, and the size of the reg_temp_config[] array is 2. Oops.

I'll work on a fix.

Thanks,
Guenter

