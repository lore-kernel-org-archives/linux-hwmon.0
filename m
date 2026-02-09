Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BFA284898
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Feb 2026 16:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770653385; cv=none; b=GELgsHkGB1KJ6Xii79SBNnFuDfzRufRVcfFsdvDgdjzs/Lziogww83CcxUJhPop+NtKRLj9ujQ8QgFdkAzOKlPb8LhjcWUvkO95EJXbUBymxe0jwKdkZwAGxcKg5J844K5IsGB5dsMX5jIc79Zu3y9rvU9OswVSGCwZTEG+4G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770653385; c=relaxed/simple;
	bh=x23B6GizLVDZsuyoSM1xBG6dBw5dt7tNDmNlRvlJwik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doBPoz1/H3nwezFaDC3HbvGoqiQ/aVuCR2BiwL3qBL6huYdYCvgj4bfaob8OW7pQt717cZJlFMGy5r7DACUa6+R2WpSHubWvrPKoWv4A5xG4nAHiwifeeV++tdUYyadL78z48Zg3hnhmY0VLNp82Z8jozbyDlcs7rtis4t0+ABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNW4Eg6q; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNW4Eg6q"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b785801c93so7835451eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Feb 2026 08:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770653384; x=1771258184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=avYfqMHCJo+KZqUl2SP1UKiIRcfHhUX2kRVWwEPX4Ys=;
        b=KNW4Eg6qKm7f36edmicKnyxkgjvDUNaXz2jgdQN0kbie+mnYx0+2gMMcZJyvpSxXxu
         oBKQGYq8scYSxIFnGylc/iCBV3WV4fJziILcgj188MwDv2IHMDHR1NHTO5sJt+rGIPeA
         4l75M8eWQj0FH1+fe0AOW3G3uVl3sojIGHHOiEfiGr2o/nCHyxDMxdJDCPmG0dZcvhrj
         40Lxxi9tN8MQSebr6i3236c4g5253VrWOoPKpluEGMkMq9IZHJAjylpj+vnSiThumo6a
         v3v5CRmJEGWdvJjgs1NIB/7C4RLMKCYROYspQxFHdhtr3zsmh+9Jg+pQPfeFrtY5RR2R
         Gtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770653384; x=1771258184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avYfqMHCJo+KZqUl2SP1UKiIRcfHhUX2kRVWwEPX4Ys=;
        b=JOMUuY3nLmWpb2JoexxqQEyiEvBvbcP7NUzpqP5NWEQGlV/o10M7LImK7UBro06sy0
         deRn0Fw0lK24dGvQSXpEfgKQRhAxECTprDWS05RGqrnfEqvD0ZSg+IBSeu7LCuQVcjQW
         TsWU7hcQRs7sSesUd0VFFqTNtnmeI6rtskzXyGcMhehq3bO4hHqPm4n3nhsx/VIs4fn8
         sRPrUv0+nTvbDl4TXtgZOcPq6VnwgUWHjxQsLJmlUg9vqZ79/hpDcvBJl7QcHV/NQY5w
         a8GOHT9nZ8vGtyRVDLrCB8IreDxOwsSHm7zzNnIM5r2At+yhktck7Qm6ZCMa81Ry6tro
         pGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXl/zK0RzLHHPruuwrhwi/NP45dVWO/NAMT/MBx0fToeNEu3FHA6XT1h4NHVbfrYKdyrEWxQhwYHFY+Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9e586zFxYthH1nzU08Acs2HQ5gACt6POmoA6P+/8eAsqQYZkJ
	/jtW+1nhvgCDZLAA+8QfM3jK3uibMN82IOwA3FuWCt0hLu0I7FKp3wgG
X-Gm-Gg: AZuq6aKTkHbBWyN3khy485fERv2O+Sey9SWRiHVfC1GNOhbesQUvPRfjgvdW3K3lf2n
	5xJd03fzBBnG8aBU5HCHibTpCn+nLetW7EUTqJcq9FKWPblxyxcD3ypJCZjXhQ3b4XUVV7fofut
	wKb3D6RuTimYDzGY/lE/J+cqvxkzpWDHLzShAsWSdEgOeCztcqwQnRPQw6e7XKqRIZykSuOp4o4
	u3RDUoUX7PeDijtr/hwnzAo3hj5wqzSBYHkYHEQqpHw9IH5anJhgFSet6vro2ipWArJ147uU9bl
	Xtmz5GH2qfiY/rXKf7I3Sn/QQfXHKd075OebBEGaNYmuMNwiUYYpssNhUTRYcLkcn9de5q0lCtX
	vJcR6G6mCApx0aIoQOuGx8QIgUKq3YNPGWwvuvEuf9K3+cLYxZEcSduIS3stIu0avf8/F9KogGl
	I3zwyQ1zLdVEBR9o1n2hZD7R+k8TahQuzE9gExox9SpvsH/CARuGcXr17TQkZne8Gd7BshD+XB1
	NPcASj9KcQ=
X-Received: by 2002:a05:693c:25c1:b0:2ba:7404:f587 with SMTP id 5a478bee46e88-2ba7404fd75mr1653117eec.21.1770653383851;
        Mon, 09 Feb 2026 08:09:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c8a8f6sm7670772eec.32.2026.02.09.08.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 08:09:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <045c408f-6d52-4135-ae82-bc8598c41fab@roeck-us.net>
Date: Mon, 9 Feb 2026 08:09:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
 <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
 <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net>
 <CAJKbuCYUCr-R-91Ou1y6XDEPdqabSDvCxUypc-YmW=-EPxgNyQ@mail.gmail.com>
 <787ffcff-28cb-43e0-97db-19dd7a996d13@roeck-us.net>
 <CAJKbuCav7iCdpph7HYW4=QxEmJ5+vuwadRmaQVUxT-TBSBBGVg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJKbuCav7iCdpph7HYW4=QxEmJ5+vuwadRmaQVUxT-TBSBBGVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/8/26 21:04, ashish yadav wrote:
> Hi Guenter,
> 
> I hope you are doing well.
> 
> Please find my response inline.
> 
> With Best Regards
>    Ashish Yadav
> 
> 
> On Mon, Feb 2, 2026 at 5:59 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/22/26 03:42, ashish yadav wrote:
>>> Hi Guenter,
>>>
>>> Please find my response inline.
>>>
>>> Thanks & Regards
>>>      Ashish Yadav
>>>
>>> On Tue, Jan 13, 2026 at 8:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 1/12/26 23:24, ashish yadav wrote:
>>>>
>>>>>> The need for this, especially why it would only be needed for PMBUS_READ_VOUT
>>>>>> but not for any other VOUT related commands, is still insufficiently explained
>>>>>> (and I failed to understand the rationale provided earlier).
>>>>>>
>>>>>
>>>>> It is specifically needed for READ_VOUT as it is being used by
>>>>> external controller to monitor the rail health.
>>>>> Other Vout related parameters are used internally in the IC to for
>>>>> output voltage related protections and does not impact any external
>>>>> decision making.
>>>>>
>>>>
>>>> Sorry, that doesn't really make sense. How would the chip know to match
>>>> VOUT with its VOUT limits if both don't use the same scale ?
>>>>
>>> The chip telemetry would still show Vout as 0.7V as it does not know
>>> about the external feedback resistors.
>>> Hence, no need to scale internal Vout related parameters.
>>> This scale is only for external vendor use to tweak their telemetry
>>> output voltage reading.
>>>
>>
>> You fail to explain why VOUT_SCALE_LOOP - which is supposed to handle such
>> situations - can not be used, and why it would be acceptable for other VOUT
>> related attributes such as VOUT_MIN, VOUT_MAX, VOUT_MARGIN_LOW, VOUT_MARGIN_HIGH,
>> and the various VOUT fault limits to show the wrong values.
>>
>> For reference:
>>
>> VOUT_SCALE_LOOP:
>> "Used to account for any external attenuation network on VOUT sense
>>    feedback and provide correct VOUT reporting."
>>
> 
> TDA38725A/TDA38740A has only two options of vout_scale_loop. These are
> 1 and 0.5.
> If the output voltage is directly connected to the output rail, then
> vout_scale_loop = 1 as there is no resistor divider in the feedback
> and feedback voltage is equal to the actual output voltage.
> 
> If vout_scale_loop = 0.5, it is recommended to use a resistor divider
> (top & bottom – 499ohms each) with a ratio of  0.5 in the feedback
> path.
> In this case, feedback voltage will be 0.5 x actual output voltage.
> As the vout_scale_loop is set to 0.5, IC would use this
> vout_scale_loop internally to provide the correct telemetry data.
> 
> If a customer uses a resistor divider of 2.21k (top) & 22.1k (bottom),
> the divider ratio would be (2.21/22.1 + 2.21 = 0.09).

Is that theory or practice ?

> This is not an option available in the IC as it can only identify 1 and 0.5.
> In this case, they configure the IC in vout_scale_loop of 1 and use a
> multiplier in Linux code to correct the READ_VOUT telemetry voltage.
> 
> Why can vout_scale_loop not be used?
> Using vout_scale_loop for correction will also impact all the Vout
> related parameters and makes it cumbersome.

No, it causes the other values to be reported correctly. There is nothing
cumbersome about that. It would be not cumbersome but troubling and
potentially critical to have the chip report adjusted voltages but raw
limits.

> To simplify the linux code, customers prefer changing only Read_Vout
> value and accept that IC would still operate based on vout_scale_loop
> value configured to 1.

That explains why vout_scale_loop can not be used, assuming that the
use case is real. It does not explain why it would make sense to only
adjust READ_VOUT but not all the limits, nor does it explain if this
is an actual use case or just theory.

I am inclined to suggest that a devicetree property should only
indicate if vout_scale_loop is 1:1 or 1:2, and that all other
adjustments should be handled in the sensors configuration file.
What is completely unacceptable, customer desire or not, is to just
adjust READ_VOUT and not all other VOUT related register values.

Thanks,
Guenter

