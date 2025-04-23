Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF925D53C
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 01:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745371730; cv=none; b=ezSJ4h7cMMQmKg2xYzGgXRu5msFcvhFYPXi8ZCHGw7fuT7AOiqESLURH+DHlVX779ybZ1WJdm/O6WaxTunfkkBNgKZFbWi8q5TTFvpqIev0ijQ2APv1oQ/vMwl+BtNdnhm2Y0G+q1lXPH45LCD+2L4b93K5WwYEW+E4k3spwEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745371730; c=relaxed/simple;
	bh=jZrcehUrp/PG+QjbkmpHdV+WMbyJnj9NmWJcbOgySuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMT974LEFjzEt+GGL31+QqoCTADgnXNg0xHOrU6KWSRHi3+HKne71a0j0KZXxX4NOpw3/njA0Dm5CvihUw+AGJit86sdO5AFdSHbr/AQtaX7Q8T9S/MsDlU5I65KEkUl2tOwtjGuZ+76h8T440Ex651/VC05ZpSCsMduq/MBvGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq14gMCP; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq14gMCP"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so4132492a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 18:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745371728; x=1745976528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FFwdOMOsl2umLMnO8CGolqVWVXtsoHWTkOZnLU5o/WM=;
        b=Iq14gMCP+4HHQn3hh1Hu05QjNxNr8OY15s2FZbydhFcWZ8YKERqHmoakX5ehEI2wtZ
         VHX2W1uViXCjXXV3IJNTSOKDaveH7aiHMJSGVkIysRgOWnZ4kBhA+MCmxA7feZCKwpyH
         h57Zi017RqXKjGex6fxgDcTXKaUA8J/P/DoOBcjBHtbXRcu4/5+lzZ8lXGuxBL9AsuqX
         WiYUAaRIfCPuQVnKrxyylgRAg0OEqN7hIFCSpLpDp6ztnHmYI2MmUrf2VGZ3HEi575eG
         wuzDUXhSXEIfdbjntJXgKkiORMyxnDf14oxbUOJdIA+KjpMJ2WB1LfB1hCdbnIsEIbls
         CN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745371728; x=1745976528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFwdOMOsl2umLMnO8CGolqVWVXtsoHWTkOZnLU5o/WM=;
        b=KMSnx6SDePaJ3BLAiEXUm9sVK8E3jpaj7/YQgFcie6qYwLhvMs52x5aMpcQYuuP+Vs
         JjQ0okbj3Bmde/7afkZOz27URS+nedwt8jP5H7MLGKIyIZFNEI+R5yF0cJpuiVwXgcjf
         S0LKC78tU7hXajRslszBfZ0/E6LWzBfUPDO6KyNvw4vhNgiztH5IwBucqmhE8nKXbXx6
         EY0BFP9WCW7Bqr1oN7voTZSn4nt3w7IoSY0hy8fXbvsS1vgaJVecgn4nQocCQKmx1wMm
         2QKRqAzeLgHny4R28VM+GO9eBHkKxEC+yW7rxkLTK0NlKR17K+zpgRchCLn392XSHrOw
         gguQ==
X-Gm-Message-State: AOJu0Ywb4KahnRSCcv/+WHwB69sN3YlodIHvOh9TrHVhsYPknC7ea37D
	brVv+vweS6MjqugQMSCRQM1ssqbHd2dsfq9RCKeZP7NRUmfCsT6D
X-Gm-Gg: ASbGncuyFB6HiNS5ns0s35CQEs2C8EClIWJVIrIbbXn9JHmKt8P9UYeWTyU57tfSzQp
	y290bXNChS75ghGfdLYAx1cPtrUA/ZXHcpuhId+lOo6T7fP2xYbYZ+jaSkn6/ty51NsAP/rTv1S
	YqVKPdhYPpwIz+M6Cvx+BJTZn8tMZRLhg85++4q2qyIC5QMXbQhI/sch9QhX9yO3nLDkWAX4MmL
	AyAXSra9tAPpdbsFbk6vjTB8wDus2NPMozLDGuZivyteBhRsYwjtzILmuwTbE7twmn8lTTXtlS/
	eRthMLKs+AANSS1Bvuhc+sxt1lIy6qGrmyWE0cDE7px/1ZFsRQC9R+/bBN9pC57mtHXvnYvB13g
	N8bnS6KDQZEcZOQ==
X-Google-Smtp-Source: AGHT+IHmUiaL2iz3h6FRLgrq/5w4wnrF++SrpCUKzsM+Wc2xVeeiELY/7dw/bXZnBtgE18nOc5OqsA==
X-Received: by 2002:a17:90b:57e6:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-3087bbbccb6mr23834687a91.27.1745371728181;
        Tue, 22 Apr 2025 18:28:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa598ffsm301619a91.31.2025.04.22.18.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 18:28:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d64f2d45-dccd-48d2-9c4c-5f7f639f3456@roeck-us.net>
Date: Tue, 22 Apr 2025 18:28:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (aht10) Drop doctype annotations from static
 functions
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, kernel test robot <lkp@intel.com>,
 Johannes Cornelis Draaijer <jcdra1@gmail.com>
References: <20250416230214.2016863-1-linux@roeck-us.net>
 <aAg9Yf0F3nomKixJ@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aAg9Yf0F3nomKixJ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 18:07, Tzung-Bi Shih wrote:
> On Wed, Apr 16, 2025 at 04:02:14PM -0700, Guenter Roeck wrote:
>> doctype annotations of static functions have little if any value.
>> Drop them to silence 0-day complaints.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504161919.duDL1s2X-lkp@intel.com/
>> Cc: Johannes Cornelis Draaijer <jcdra1@gmail.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 

Thanks!

Guenter

