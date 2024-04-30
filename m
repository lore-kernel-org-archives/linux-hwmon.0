Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D906176FAC
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714492318; cv=none; b=bkxvdgxCOD7zYWLE0lgGpksCvw6waCukaV9YTICBpAoY6RN3l4u5jSE3lOc5cuYvEjK73U8+4hueAfoyEhn9ii2mApB2fPz1OQXlRs2XNfylo++NMgVYgmI/vHCDPzfjWCiSlmyapkTb710rH/zHiLUrBpjhwvWM2Z5649LOums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714492318; c=relaxed/simple;
	bh=HYejc/KrKD5IprQ8OkvCAEOUSU5XG0B/gPEdgL6V0n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs5+T6FWjVXFjU+/+2Nr6muDt15HbwZBmngGNUkCAzjzZqZOVWPJNNFflrikd97JzCCIBzeYQ1F0VKobJq2REW/89oOpYBbdZdPIJoEh0Zc/WOEcXS5sDjBMuuHalGdkj5dK/IOp7/6nfVk61NT6expxGn8/BSRe7HvDvyw/Yp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBsD8lWw; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBsD8lWw"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-22ed075a629so2201134fac.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714492315; x=1715097115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2LFfqfkjvcSMUlwrxDJZDKzB25ALWVjQtVe7zcCyKic=;
        b=hBsD8lWw5oFjBUGoOrUJCAlY1rr9QZ+4eQ1zqXacXmp25B/zOgxNlmuAFWdlq/sP3R
         /red8Yw/vnUdnNv9TBU/CVNxaHg/Bt8CmXQwf+cEOCrIJDb9Lp7JEyBroTYuenkY2ZK9
         hRrQ1s13uEUpNDMe8WHkqlSbPxc7vi0KhPMlABzyUkVuADImuxOdeZJIBe0MkuiTgNKe
         iYIkWsUkq+5LdaH9e/uAaVVreTEWZJUZRpBADR/WXc+BR1XyfYOUYWnmoDo3S+H5FiX8
         EalOS+iWGfBDB7IPlvm7NUkb4MoICBKGcUyacGpYnArXCj4sa1LeCzeZ21wiGr7Tsg1O
         xOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714492315; x=1715097115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LFfqfkjvcSMUlwrxDJZDKzB25ALWVjQtVe7zcCyKic=;
        b=CymK/xcIjE5VVevVhhOQ3PJcg1MQNQJ3gbmsQPtIYV9RZpWjurbMaiuvPNFKnyUPuY
         P1M4KUuU3Xex1MG0sFYSLz1SKR4dGAHLlR9WfhRuitlKGt4uZ/ogQ9rIq364QEmFgtge
         cwv72h0z0bK84iikoEjTVoNcztObslAGElKQ24saOhpHXHdDB0RRgtBpksv7A+CdU+SC
         tSMPwrzyMVkKzsjaSGV/sDbrPhe1cp7cnqvmfe3Gz8AAsyK5JPHRPOWSSIllqQk7O9+f
         d/mSwnlvTJoRn5d3881+0IjFYLwslrbbnIRh4Ez8EVFVCW50QGaj7L2clr3vPXi6703d
         vfcg==
X-Forwarded-Encrypted: i=1; AJvYcCXaVC/aLb6OVejmv3G+yWl7cgVar7RL77AacAWQp2dBvgijHAFJ1VXBFJdRL/SDwwc5xag7e/zvi7DpNyiDjd8OjS9iBhvdPScQILY=
X-Gm-Message-State: AOJu0YyKBC9N6qEcVvY5zszNUWAGR+Vz/uQnqGj9DoNECbiiDugc5zr8
	XUdsHics95XXuUUcT/jA3dkAi0ZJypwTnGMxPDxqq8y/4LVdicuS
X-Google-Smtp-Source: AGHT+IG9aWIYk3zhFevZ97+o5p/zSn5c5QWqi82HyNrRsMvXzP+vljfYxkp/o3QIAvKt+ea+oersTw==
X-Received: by 2002:a05:6870:350b:b0:222:a91e:cc1d with SMTP id k11-20020a056870350b00b00222a91ecc1dmr16608407oah.4.1714492315022;
        Tue, 30 Apr 2024 08:51:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 17-20020a056a00073100b006eadc87233dsm21217136pfm.165.2024.04.30.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:51:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1c2cc415-8dd5-4aa9-afbf-45e20d5295a3@roeck-us.net>
Date: Tue, 30 Apr 2024 08:51:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (emc1403) Add support for EMC1438.
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 Lars Petter Mostad <lars.petter.mostad@appear.net>
References: <20240426140937.609172-1-lars.petter.mostad@appear.net>
 <6ea4da26-e20c-45f5-a0b4-85773ae178fa@roeck-us.net>
 <CAC-Dm27uxQR1k0bbpCDNQLiWum8d4B-3xgFqRgSOHYnUhuovxw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAC-Dm27uxQR1k0bbpCDNQLiWum8d4B-3xgFqRgSOHYnUhuovxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/24 04:10, Lars Petter Mostad wrote:
> On Sun, Apr 28, 2024 at 8:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> -enum emc1403_chip { emc1402, emc1403, emc1404 };
>>> +enum emc1403_chip { emc1402, emc1403, emc1404, emc1408 };
>>
>> There is no EMC1408, and if there was it might not be compatible with
>> EMC1438.
> 
> Yes, using the name of a chip that does not (yet) exist is not good. I was going
> on the apparent pattern that the name emc140n was used for things common
> for all emc14xn chips.
> 

I figured that much, but that should not include virtual chips.
You might consider adding support for emc1428 as well, though; unless
I am missing something the only difference should be the chip ID.

>> The 8-channel chips (emc1428 and emc1438) suppport signed data
>> and limit registers. This will need to be handled.
> 
> I see that my glance at the EMC14xx datasheets was way too brief. EMC1438 looked
> like a straight extension of the currently supported chips to 8 channels.
> I totally missed the sign bit.
> 
No problem; I only accidentally noticed it myself.

> I guess sign_extend32 can be used to handle two's complement for signed chips.

Yes.

> This I guess would mean putting some extra info into thermal_data to let the
> show/store functions know whether they are handling a signed chip or not. This
> might make the driver unnecessarily messy, as apparently nobody else has been
> interested in support for the chips with signed data. If so I withdraw this
> patch.
> 
> Should this driver be kept unsigned only?
> 

I'd prefer to have support for the 8-channel chips (and with it for signed
temperature data) added. As mentioned in my other reply, I would suggest though
that you convert the driver to use the with_info API. That would move a lot
of code into the hwmon core and make it much easier to add support for additional
chips, for signed/unsigned handling, and for handling 16 bit wide registers.

In this context, could you send me a register dump of emc1438 (and of any
other chips of the chips supported by the emc1403 driver if you have access
to them) ? I'd like to add module tests for those chips.

Thanks,
Guenter

