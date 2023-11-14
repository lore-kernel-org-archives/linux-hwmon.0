Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B8405E4
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SorRPTQC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DA7D4D
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 06:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699970944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBPr2/qhlVXy/Hyc/g7DaWfZI781K10TZ78qXMh6iek=;
	b=SorRPTQClY1qco7twF/rVHo1Mr6neAZIk3AraWKp7ywi5MnL6aSGL7BgoKGaWAO20xXxxL
	X3aNgkaMjRgxWGPZVDADo5/M3HvfwjvQYPB7PUSHVIGV/nQkOgzBq6xlcCOKzdDXGnfttM
	Yp3wpCTf55gStJZvVgddhcicfU8ebM4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-cusB0kPHP82E2pvcfDcqdQ-1; Tue, 14 Nov 2023 09:09:01 -0500
X-MC-Unique: cusB0kPHP82E2pvcfDcqdQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-53ee9f409a9so3879053a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 06:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970940; x=1700575740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBPr2/qhlVXy/Hyc/g7DaWfZI781K10TZ78qXMh6iek=;
        b=k2ADw6PhHCG8oeQx3IugZfYPg/vzAnOjUXq20C7+hqF+WSfxi9VImuAW3QYCr9rkQJ
         IqIfMpHu/4VbzOW6LqljRjUtMEaK5XPnYZAWBVg6TN4BuWb8t5JK9+vNu2xw+0Vsdsw0
         pmmDWSktK3p2JyWcXzcjfiy7KsjNod0xfKfFztz4qnQZYVKtp4MVmhhNmlo5yQZgVFs/
         ZGh+okHHx6gzxfYBLqYUphm22wYK1u30t6vrNdOpO+gPLavYDV3viev9WJMggR6z8NVN
         AHduOLySDciQnIVZN8ns6xDEquSZ6dc+nF5ulQRFFivAV15CNyEqljalUw3niW18E1Wm
         Ociw==
X-Gm-Message-State: AOJu0YypWRFlbdpnwldaEL7kgHMEyvCMr89aVg2rwAt/q8Bf2QiRRsJd
	1FOUiHHhpqs3RXpeqXBj6yZAUZdf4vNDt5JVVSSEpRaB7803Wo6/j3vPphu0TCFZlY67bK+zMtx
	9pXr0fBYlm9dI7S4RDW611/o=
X-Received: by 2002:aa7:cd78:0:b0:544:a26b:dfa3 with SMTP id ca24-20020aa7cd78000000b00544a26bdfa3mr6474532edb.6.1699970940444;
        Tue, 14 Nov 2023 06:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTbfNeRRfGbes8c0XvK7c0uIL0u9sxP/QgJnnaVnOeP3LCEOzo5wP7J/yWyaceeceittbAaQ==
X-Received: by 2002:aa7:cd78:0:b0:544:a26b:dfa3 with SMTP id ca24-20020aa7cd78000000b00544a26bdfa3mr6474526edb.6.1699970940203;
        Tue, 14 Nov 2023 06:09:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r30-20020a50aade000000b005434e3d8e7bsm5276674edc.1.2023.11.14.06.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:08:58 -0800 (PST)
Message-ID: <d2cf4587-d6d3-4c77-a263-aefb01d93c5e@redhat.com>
Date: Tue, 14 Nov 2023 15:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM
 interface
Content-Language: en-US, nl
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231106064351.42347-1-W_Armin@gmx.de>
 <3ec0496d-3b89-46f5-9faf-9fcce78f6b38@gmx.de>
 <8c25dfec-b0ca-4e2f-964a-5ae62452e141@redhat.com>
 <149a31b1-f5b8-438c-8883-987cb4224944@roeck-us.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <149a31b1-f5b8-438c-8883-987cb4224944@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Guenter,

On 11/14/23 14:57, Guenter Roeck wrote:
> On Mon, Nov 13, 2023 at 09:17:48PM +0100, Hans de Goede wrote:
>>
>> I plan to review and hopefully merge this and your
>> other series sometime this week.
>>
> 
> What warrants merging this series through your tree(s) instead of
> through hwmon ?

My bad, I was not paying attention to what the patches were touching
(just a quick reply to Armin's status request), I agree that this
should be merged through the hwmon tree, sorry about the confusion.

Regards,

Hans



