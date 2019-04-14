Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CFBC10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D55B20848
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaYc5Qa3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfDNVue (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:50:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36735 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfDNVue (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:50:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id ck15so7584287plb.3
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+5iXR/0/Kq57POVFj2Vl5ZgXYq4mhqxa1ItrUDIaI3s=;
        b=FaYc5Qa3MuZHJYEhVxhPmIFZyWLXuVlqPC4si7V8dw5gzjoX7OJcd+SlpOTHw5USNA
         Rnya0I6Worai4dM9AJHg2HdF8w2KEKr4mEou1cTPBRZU5b4K8R5niMA/EYSksvpqoSGh
         0N0uXcMYpvmm7oJUdxwxriTbofsoTc2k+b1Ch3hjGom398K1OJit5wbN3ZwlfUkGzgmU
         nJCm3J8zETzpnj5yA1IoHUnvn36B5hrfAhV9272O1zitEHvgtbYzHXW1xmY78AfyZM8c
         kXAbVvyduTwR47f5wCv2L99KwS62/LShTp3ULGnJXOeOuKDVo1T0v6j6pX35DTmwAxRy
         TFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+5iXR/0/Kq57POVFj2Vl5ZgXYq4mhqxa1ItrUDIaI3s=;
        b=QGtxJxugvzGy5Gf7qa+uIp63eBfONlAlr8YRYe9CL2fPMf+3htoA/b5eVW2kg3nWRD
         Hq8yGgw2t9tzsaSV/a+qXJJpRdi/hKLDM+jYDDSTsWZN1Wsbq0T30CDIJRslTmZKy9Vx
         TL0iRD9bF3E5VeXpF3OXS0/WfZMJL55X+U5wgkyvqZGO8OpKAGp9sdldFy3XYB7tkhlj
         ew2I3dDxvfmOIM4DLePSvAl6kmun7DAqsJBgqqUHCIxxIp4E4WZOXBA8VWDYdG3f2rFq
         KQgId9wWZawoisufL7SOV18gQpZXxv5ftKEmL3al9g6VjvuAEq+gcQ0e5o2bWO4j8Ltx
         nP7Q==
X-Gm-Message-State: APjAAAVCPOX/CZJC6ki6aydbkAnJJ7Mbud76tk/tIEoJeQGHSahKqy57
        xNjX5UinW5ESg/OdZ16C7G0=
X-Google-Smtp-Source: APXvYqyItVbjcKX4M+VegIYJFT9gi6bpnAz40EgjK+CPxLdS671j5rPWTjjxFJofT+B4X7GQWpPK4w==
X-Received: by 2002:a17:902:f81:: with SMTP id 1mr72394265plz.216.1555278633389;
        Sun, 14 Apr 2019 14:50:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c22sm53418154pfn.136.2019.04.14.14.50.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 14:50:32 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <8b52d91c3b182d54d9cc523d2542bbca413927d1.1555171278.git.krzysztof.adamski@nokia.com>
 <57f99b8f-f4e8-eda0-432c-21ecb0346a52@roeck-us.net>
 <20190414190042.GA15303@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b6a0d515-43e9-ee53-803e-057dfa060b65@roeck-us.net>
Date:   Sun, 14 Apr 2019 14:50:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414190042.GA15303@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/14/19 12:00 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Sun, Apr 14, 2019 at 07:37:35AM -0700, Guenter Roeck wrote:
>> On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>> Manufacturer specific SAMPLES_FOR_AVG register allows setting the number
>>> of samples used in computing the average values (PMBUS_VIRT_READ_*_AVG).
>>> The number we write is an exponent of base 2 of the number of samples so
>>> for example writing 3 will result in 8 samples average.
>>>
>>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>> ---
>>>   drivers/hwmon/pmbus/lm25066.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
>>> index 53db78753a0d..b560d33db459 100644
>>> --- a/drivers/hwmon/pmbus/lm25066.c
>>> +++ b/drivers/hwmon/pmbus/lm25066.c
>>> @@ -26,6 +26,7 @@
>>>   #include <linux/err.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/i2c.h>
>>> +#include <linux/log2.h>
>>>   #include "pmbus.h"
>>>   enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>>> @@ -39,12 +40,15 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>>>   #define LM25066_CLEAR_PIN_PEAK		0xd6
>>>   #define LM25066_DEVICE_SETUP		0xd9
>>>   #define LM25066_READ_AVG_VIN		0xdc
>>> +#define LM25066_SAMPLES_FOR_AVG		0xdb
>>>   #define LM25066_READ_AVG_VOUT		0xdd
>>>   #define LM25066_READ_AVG_IIN		0xde
>>>   #define LM25066_READ_AVG_PIN		0xdf
>>>   #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
>>> +#define LM25066_SAMPLES_FOR_AVG_MAX	4096
>>> +
>>>   /* LM25056 only */
>>>   #define LM25056_VAUX_OV_WARN_LIMIT	0xe3
>>> @@ -284,6 +288,10 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
>>>   	case PMBUS_VIRT_RESET_PIN_HISTORY:
>>>   		ret = 0;
>>>   		break;
>>> +	case PMBUS_VIRT_SAMPLES:
>>> +		ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
>>
>> 		if (ret < 0)
>> 			return ret;
>>
> 
> Good point. However the convention for this switch is to break instead
> of returning early. I would stick with that if you don't mind.
> 

I don't mind if you want to use
		if (ret < 0)
			break;

instead, but I do mind if you want to convert an error code into an undefined value.

>>> +		ret = 1 << ret;
>>> +		break;
>>>   	default:
>>>   		ret = -ENODATA;
>>>   		break;
>>> @@ -398,6 +406,11 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
>>>   	case PMBUS_VIRT_RESET_PIN_HISTORY:
>>>   		ret = pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
>>>   		break;
>>> +	case PMBUS_VIRT_SAMPLES:
>>> +		word = clamp_val(word, 0, LM25066_SAMPLES_FOR_AVG_MAX);
>>
>> 0 is not valid, and ilog2(0) returns -1 (or is undefined).
> 
> True, I'll clamp with minimum 1 to fix that. I don't think it's worth
> returning an error for 0. Do you?
> 

The whole point of using clamp() is to avoid returning an error. Returning an error
for values <= 0 but clamping large positive values to 4096 seems inconsistent.

Guenter

>>
>>> +		ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
>>> +					    ilog2(word));
>>> +		break;
>>>   	default:
>>>   		ret = -ENODATA;
>>>   		break;
>>> @@ -438,7 +451,7 @@ static int lm25066_probe(struct i2c_client *client,
>>>   	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
>>>   	  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
>>> -	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>>> +	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
>>>   	if (data->id == lm25056) {
>>>   		info->func[0] |= PMBUS_HAVE_STATUS_VMON;
>>>
>>
> 
> Krzysztof
> 

