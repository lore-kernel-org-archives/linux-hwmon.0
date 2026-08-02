Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5663ACF18
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679667; cv=none; b=HlWrihLyeSzagy2EyA2IabNGc0gM5ZNGKD/c51jijx3mnVnfl5Uu+ipzxDBOeXFb/1RBcJMBJBF/SKbCRc2umv98+E58IjzKLD9nfAm2Mv3XBG2Uziog+PFcm5WLK8iakf7mWrnzMxg6e7qoqgjlg1cp2SD0RHqYOBtaV+niNnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679667; c=relaxed/simple;
	bh=tiuWDreVpHa7IhoRgmy/on0kPJP71Uv/v40FlnCdReU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwX0ttQhYfAMmKkVLXokZ+jpLMJ02Wjn5Kws2gOrVRJ7EPIGVooThVHgyv8vpAMv/+LKgLJtgaDqAoIBma8AUSSOp+TtLkWFVaJDX9GZSwoF+t+0EhOggZ9pGkxnT0Y2urXAjkOV1cm+m/Mat93StfzTB8zyu/ZIKOvV5p2EVGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASDr8rPx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASDr8rPx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso2145478a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Aug 2026 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785679665; x=1786284465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xu46mScaiG5oMhMbS8Y7mmEBw+5+e1oVmFiLAkoyJNc=;
        b=ASDr8rPxacSN7eWKYRSvP5hD5YIstK58a8K2J2rjq61nFJM69dZFnNMSbwUVBUYl/3
         nLbXS7BRgsdmtxZEe6iqtTqXI3t5V6NO07QxYy/n0EpPhq2zLmEPl5doERdKdxc8hWa4
         yxazDm90Qd0wisOe2zlOi8KI3OFmZJdmYcg6O3A7flGniDo/Ne/+ANTYzasb1NWeaLWQ
         stKprSYT13Srda3rzczorZqRbYVkYBXWib+6zHjbNjPIGijXZcKoX+qQI3K/c+bB5niL
         kNKZDw7EnHflddou2DHraWToxhnTg0sIIIZf2ztOMr3bl5nyn6sfZHct9s+qM1vmvHY2
         cmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679665; x=1786284465;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xu46mScaiG5oMhMbS8Y7mmEBw+5+e1oVmFiLAkoyJNc=;
        b=LfUZU7vsmg/FC1prkofo44U0DXVFbA2yM4qHgNQ8MVabTe/fM+TZJSS/Wi7RgVBZtt
         r4nBYAml6EWumY+4D78RVbj6aoIFCjnkp8rlWA8vbERUZ9DxeG9MvTlSZcshB6TJUGRC
         OyikcuwOReeICB6P/cNbqBUFBS76iTwbD2vETtaCOxICHUibsoFFTCczE0wApRz4tXo0
         PHk6zVx441g9ZHDkz2JDg4DHhf93sjHAyktQ2k36/EzX/FKPqvvueV4mY632XK5X6uHz
         2N1rLJ4T4yGaOVNSH1jP86KEzbso0sOWJ6r3yUut6d+k0h8gckhSfxIuaMNB5JpoiARG
         DYZQ==
X-Gm-Message-State: AOJu0YwAATJjqZ/V9uYXimA6M453AO3IaPxTjBNjD1jqGyxL+wxDTfaU
	1cs9Rd5XUwxreupRqzTe+aNslq0VOyunyXlf9rPHwxLYKvSoO3e6r6XS
X-Gm-Gg: AR+sD12oi0mfgBEeZbG/YxCyOYmC/i9j8H/HfXwP+AZPhZchjLAfnRfoKnWHMxkSXUp
	zm7goyOHVOLtutkE5bgZP7lLNnoUXchGdovMKKgXSV0j6GTzqE/SaQNXFuSVYpwfereIlqiMUVy
	0ZYelQoyk07H0RoIyYwNB0j695ftVLlWk7MSn3MzcKECYlhxyCL7EgY0rOFshjJCgSouR3BIcLM
	DFvDgzGv4xWy2qZZO41P/ivqnLHQSYABbjV52t1w/T1TZl+48+vDQMK8MI/wN7WKxkz9f5aCytn
	bHB1xBVH1+Yn+S9IIrYE9tud/iTS7NIdSezc/EyYu8B9sJauDScWetDzWeZevlMcJYsgT+awqVv
	avfPmp2BFZ+Ng6y5+CZwRBW1cE0wXXF7Y5xHTVqdbE7ZdqvFLfGGuMtC9O1Ew3c3j0NCNWsbDw/
	/ODj8bE3Eul5RURP0b+UVBbm4YukpE9k6zYpJJxTfTpXaIRXKslZa8SzHLCHhcI/NusIWPCa1Ik
	t/41nibGogtCv6/E9yjUhrMe1k8e8iQYaZW1A==
X-Received: by 2002:a17:90b:5605:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-38fbc9f3f25mr5502311a91.3.1785679664822;
        Sun, 02 Aug 2026 07:07:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b663efsm1795076a91.3.2026.08.02.07.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 07:07:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ce13e61b-f908-4bc3-a9c8-88ec94401a38@roeck-us.net>
Date: Sun, 2 Aug 2026 07:07:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Ali Ahmet Memis <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260802145745.6f444fc2@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260802145745.6f444fc2@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 05:57, Wilken Gottwalt wrote:
> On Sun,  2 Aug 2026 12:36:53 +0000
> Ali Ahmet Memis <ali@iusegentoo.com> wrote:
> 
>> corsairpsu_request() sends a rail select command and then the actual
>> read as two separate transfers, both going through the single shared
>> cmd_buffer and wait_completion in corsairpsu_usb_cmd(). The hwmon core
>> serializes its own callers, but the debugfs files call
>> corsairpsu_get_value() directly and never take that lock, so a debugfs
>> read can land between another reader's rail select and its value read.
>>
>> The result is a value from the wrong rail reported as the right one,
>> because corsairpsu_usb_cmd() only checks the command echo and both
>> transfers echo the command it expects. It can also make a caller consume
>> the reply meant for the other one, since raw_event() writes into the
>> shared buffer and completes whoever happens to be waiting.
>>
>> Locking was dropped in commit 4207069edbf0 ("hwmon: (corsair-psu) Rely
>> on subsystem locking") on the grounds that the subsystem serializes for
>> us, which holds for sysfs but not for these files. Take
>> the same lock in the debugfs paths that issue commands, using the guard
>> added in commit d1e720c7328e ("hwmon: Support guard() and scoped_guard
>> for subsystem locks"), as suggested in [1].
>>
>> The lock cannot go into corsairpsu_request() itself: the hwmon core
>> already holds it across ->read, so every sysfs read would deadlock.
>> vendor_show() and product_show() only print strings cached during probe
>> and issue no command, and corsairpsu_get_criticals() and
>> corsairpsu_check_cmd_support() run before either interface is
>> registered, so none of them need it.
>>
>> [1] https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net/
>>
>> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
>> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
>> ---
>> This is the fix Guenter asked for in the May thread, written the way he
>> suggested there. Wilken's patch used a driver private mutex around
>> corsairpsu_request(); that thread stalled and the race is still present.
>>
>> Wilken, does this cover the chained command case you were worried about?
>> As far as I can tell it does: the whole select-rail plus read sequence
>> now runs under the same lock the hwmon core takes around ->read, so a
>> debugfs reader cannot land in the middle of one. If you had a case in
>> mind that this misses, I would rather hear it than guess.
> 
> Yes, I think that is what Guenter asked me to test. There is actually a
> way to get all values from the PSU at once. You can chain together all
> the commands and everything supported should even fit into a single USB
> HID frame (64bytes). That would make everything a bit easier. Though,
> sorry that I did not go on with that. About a day after this someone put
> basically all my open source projects through an AI agent and since then
> I get bombarded with AI slop. I currently have not much energy (and fun)
> left doing my projects.
> 

Welcome to the club. I currently have more than 100 bugs reported by Sashiko
open against the hardware monitoring subsystem, and more than 50 against the
watchdog subsystem. I try to fix the critical issues as well as the security
issues, but trying to fix all of them would be futile (and Sashiko would
probably end up finding more bugs when analyzing the fixes). And, then,
yes, people submit more and more fixes for cosmetic issues reported and/or
suggested by some AI.

> I think I will test it in the next days.

Please let me know if you can find the time (or not). In most cases like this
I end up trusting the Sashiko review.

Thanks,
Guenter

