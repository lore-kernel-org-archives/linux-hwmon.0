Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B042475CF
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770958712; cv=none; b=kfBVZplVv9bqcpJLj3qDSWsxweKA5EFDpQPsF5sDgyXIXQFKQOM6zx8hrrw1scLQN+pPg1HDORx2dx4+3ILZfBV5sLZF1BLY7hnVY1Ib/TBG9rZp+E/VlGugFrIHWRSkg4qdlhGmtUduD8pUuoKJl8RO3/784P9ye6PNzDe3S2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770958712; c=relaxed/simple;
	bh=eRvFQXt0bkK7pDKSapaD6W78pFPmc8Voh9Ptsr0FL6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkYfi+mk6Ow+5n/VoS4C7hoxsXCy4EsV2B7VFwIUgdqSs874G5XL9pxrf9GPmb41BzuwZ1Yw5qctPwYoOq1SFUmB+rk/K3DrLBi2fGHYIF8yeU/ZzZBpv2YpEZKhhAG0crfJOvxNmwYfRnjSBxgKdTiBV7b2sPLNe0qgkHXPYLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDUlBCqf; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDUlBCqf"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b740872a01so1039509eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770958710; x=1771563510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iGoHd6Wwp0UoOk5RmQ7t22wxxGbD4/6f+sXmlD85vTI=;
        b=LDUlBCqfaXoYprRmNmNTuJxgLFyFLWLujRXyBRLqMziRH4X5gwSHlmVZG2Csrh0sr3
         voEav7JvKWOwMroAzaw8Lqw39SnrlK3ys6BauWNPuh3SwpUOrbKoMH2DcNrGnUn9lr3y
         UeO6MekMjR3eCVp79662bNBZ+YrufCGoNfVVuMYXp/J44yfuJC9uxXkha0mLERFr7P8t
         OTggAerC5+wne52mlvo9b487eXHgMZoP7rJzXzMFN37Z1318PTvxv0Q54lPAoZ6CtR0x
         utUk9SD3eg2qmaxIjiubZ+D+VlRbumyg6Qnbvz8iCiBBNSv168mBqvB2LpjNba8mEdNa
         QtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770958710; x=1771563510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGoHd6Wwp0UoOk5RmQ7t22wxxGbD4/6f+sXmlD85vTI=;
        b=EBErZpCiCbl9EEAFJG7vDzm+NMnsjfW1CtBcq+ZmSj5xJxdI6pADfk53i6HWO67LpL
         3layBS9klx1qKusGtCLrATOB5JaFaQyYsZ+TWeFwbAHTAX7yVL+wTpRbmVMdR0oMeGgR
         7P/T/j1xCRtR21zglLYrVi3qxrfxRl9hjYc87u56FtabGo5m9SrPnlMe9V+iSASDImLm
         A1w90PQ9jhlo+4EaPfrNw7komfN7J2bQGQIsb4BydctSg5v1MlqCVhphKHoKy44dWBS3
         hNOGHJFMEfSk3Ck6/dUGFnbOYlDjcVD4SauTudKyNqOCUsCCB+lpxQGNTTrbbRiqHtUp
         +cow==
X-Forwarded-Encrypted: i=1; AJvYcCWZfv8SdsZ633OCeOcPD0oM6gxxL3/0PWcsF37wzN/VoIzA0pSIFlt1Vznl5Ko039mF0rWD1U84mnkShA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzseq36GRKGPH3I8IQuJ1EpCzTxaksBOC/FOQFEoWzlbI4GsNlg
	gkY7iVyJyUcA7IMRuEOA0CpBP3HIDl8tUNVbjRSNEt9G79aDqK+y0QXn
X-Gm-Gg: AZuq6aKziwKwAL+q7ZmNGCusP+pBRe+oJmE7R8A4JzOKW5H7O2AoGSVM0rf65qjRJi9
	LnLLqefz1AHpNVGVZp08EPV9aUa9yHQVplwhYMekCkqL7/zvoe8upCrfQZ5qh20Mo9HcCqP9K99
	07visEcnlYrEfUOHpxxT0kBlDj8s7xG7WtvoEX3nVGO6tPRN5FlWMwVwR0Pmqsp17OU7L8vwm2X
	KzQyL0PzkI3JMofFBovsXEunB0tE91K7EEF9juBRF6oupVgFKbSosAAetThPgK4s80To7IhEDeo
	iC4Ea36FVewMXJf3alLBLCezCQf67yDC4Avd8QceJsjZN+QRLuuHVYgjzg6HuB6HRFhFHImS4KY
	lDRAkI+yoACvPXNKENWsWDVwmj7aQX1PRh9YRmKLaHgRjDi3rvYUXsCDMUEImnbK5+eSb1Z78hu
	SgrQA2UN+wpl2NADJw/sCTOcjhnzWErH1+1EUSvXJzFnulfYtS9usTEk3jx5Te1hknk0HiQTPDs
	393DOEd3sM=
X-Received: by 2002:a05:7301:fa10:b0:2ba:7717:2bdd with SMTP id 5a478bee46e88-2babc46ea54mr267397eec.27.1770958709451;
        Thu, 12 Feb 2026 20:58:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dbd6524sm4833351eec.12.2026.02.12.20.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 20:58:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b1ab525-8a60-4980-90f4-c7a761cf1536@roeck-us.net>
Date: Thu, 12 Feb 2026 20:58:26 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ashish Yadav <ashish.yadav@infineon.com>
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-3-Ashish.Yadav@infineon.com>
 <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
 <CAJKbuCan+5AMuGuqKg4V1qs5HYZQ9zgS9S1rDDJ1usjJAjEGqw@mail.gmail.com>
 <CAJKbuCavMxc7xc4-QW95NfCaUCbLZck5nP1+iMtVxOt4LZ5esg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJKbuCavMxc7xc4-QW95NfCaUCbLZck5nP1+iMtVxOt4LZ5esg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/12/26 19:45, ashish yadav wrote:
> Hi Guenter,
> 
> I hope this email finds you well.
> 
> I am reaching out to request your assistance with a specific inquiry
> regarding the handling of loops/pages for different VOUT modes
> independently.
> The challenge I am facing is that the Linux kernel provides a single
> "PSC_VOLTAGE_OUT" for the chip, which is not page-specific, making it
> difficult to handle these different modes independently.
> 
> I would greatly appreciate it if you could provide me with more
> information or guidance on how to address this issue, as your
> expertise in this area would be invaluable in helping me find a
> solution.
> 

Best idea I have at this point is to announce a single mode for all pages
and convert values for pages with other modes. We _could_ enhance the pmbus
code to support per-page modes, but that only makes sense if more than a
single chip is affected and if this is a real problem.

Practical question is if the chip supports this. So far I have not encountered
a chip which does. Unfortunately Infineon doesn't provide datasheets for these
chips, so it is impossible for me to determine if this is a real or a theoretic
problem.

Guenter

> With Best Regards,
>    Ashish Yadav
> 
> 
> On Thu, Feb 5, 2026 at 2:20 PM ashish yadav <ashishyadav78@gmail.com> wrote:
>>
>> Hi Guenter,
>>
>> Thank you for taking the time to review and provide feedback.
>> I appreciate your input and insights.
>> Please find my comments inline below.
>>
>> Best regards,
>> Ashish Yadav
>>
>> On Mon, Feb 2, 2026 at 9:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 2/2/26 00:03, ASHISH YADAV wrote:
>>>> From: Ashish Yadav <ashish.yadav@infineon.com>
>>>>
>>>> Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
>>>> XDPE1A2G7B controllers.
>>>>
>>>> XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_MODE
>>>> command.
>>>> XDPE1A2G7B controller supports Linear and VID Data format for VOUT using
>>>> VOUT_MODE command.
>>>>
>>>> In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_version
>>>> is supported:
>>>> Vout = 5mV * (VID-1) + 195mV
>>>>
>>>> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
>>>> ---
>>>>    drivers/hwmon/pmbus/Kconfig      |   9 +++
>>>>    drivers/hwmon/pmbus/Makefile     |   1 +
>>>>    drivers/hwmon/pmbus/pmbus.h      |   2 +-
>>>>    drivers/hwmon/pmbus/pmbus_core.c |   4 ++
>>>>    drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 +++++++++++++++++++++++++++++++
>>>
>>> Driver documentation missing.
>>>
>>     ACK, We will take care of this in the next release.
>>
>>>>    5 files changed, 130 insertions(+), 1 deletion(-)
>>>>    create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>>> index f3fb94cebf1a..c6750bce446d 100644
>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>> @@ -684,6 +684,15 @@ config SENSORS_XDPE152
>>>>          This driver can also be built as a module. If so, the module will
>>>>          be called xdpe152c4.
>>>>
>>>> +config SENSORS_XDPE1A2G7B
>>>> +     tristate "Infineon XDPE1A2G7B"
>>>> +     help
>>>> +       If you say yes here you get hardware monitoring support for Infineon
>>>> +       XDPE1A2G5B and XDPE1A2G7B.
>>>> +
>>>> +       This driver can also be built as a module. If so, the module will
>>>> +       be called xdpe1a2g7b.
>>>> +
>>>>    config SENSORS_XDPE122
>>>>        tristate "Infineon XDPE122 family"
>>>>        help
>>>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>>>> index 349a89b6d92e..620f24baa289 100644
>>>> --- a/drivers/hwmon/pmbus/Makefile
>>>> +++ b/drivers/hwmon/pmbus/Makefile
>>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)       += ucd9200.o
>>>>    obj-$(CONFIG_SENSORS_XDP710)        += xdp710.o
>>>>    obj-$(CONFIG_SENSORS_XDPE122)       += xdpe12284.o
>>>>    obj-$(CONFIG_SENSORS_XDPE152)       += xdpe152c4.o
>>>> +obj-$(CONFIG_SENSORS_XDPE1A2G7B)     += xdpe1a2g7b.o
>>>>    obj-$(CONFIG_SENSORS_ZL6100)        += zl6100.o
>>>>    obj-$(CONFIG_SENSORS_PIM4328)       += pim4328.o
>>>>    obj-$(CONFIG_SENSORS_CRPS)  += crps.o
>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>>> index d2e9bfb5320f..3ddcb742d289 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>> @@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
>>>>    #define PMBUS_PAGE_VIRTUAL  BIT(31) /* Page is virtual */
>>>>
>>>>    enum pmbus_data_format { linear = 0, ieee754, direct, vid };
>>>> -enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
>>>> +enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
>>>>
>>>>    /* PMBus revision identifiers */
>>>>    #define PMBUS_REV_10 0x00   /* PMBus revision 1.0 */
>>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>>> index be6d05def115..4d7634ee6148 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>>> @@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *data,
>>>>                if (val >= 0x0 && val <= 0xd8)
>>>>                        rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
>>>>                break;
>>>> +     case nvidia195mv:
>>>> +             if (val >= 0x01)
>>>> +                     rv = 195 + (val - 1) * 5;  /* VID step is 5mv */
>>>> +             break;
>>>>        }
>>>>        return rv;
>>>>    }
>>>
>>> The core change needs to be a separate patch.
>>>
>> ACK, We will take care of this in the next release.
>>
>>>> diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
>>>> new file mode 100644
>>>> index 000000000000..79b12b56e7b6
>>>> --- /dev/null
>>>> +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
>>>> @@ -0,0 +1,115 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
>>>> + * and XDPE1A2G7B Controllers
>>>> + *
>>>> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/err.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include "pmbus.h"
>>>> +
>>>> +#define XDPE1A2G7B_PAGE_NUM 2
>>>> +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step is 5mV */
>>>> +
>>>> +static int xdpe1a2g7b_identify(struct i2c_client *client,
>>>> +                            struct pmbus_driver_info *info)
>>>> +{
>>>> +     u8 vout_params;
>>>> +     int i, ret, vout_mode;
>>>> +
>>>> +     vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
>>>> +     if (vout_mode >= 0 && vout_mode != 0xff) {
>>>
>>> What if vout_mode < 0 ? Also, what if the mode is different for page 1 ?
>>
>> ACK, We will take care of this in the next release.
>>
>>> Also, if I understand patch 0 correctly, executing this function is not needed
>>> for XDPE1A2G5B.
>>>
>> ACK, We will take care of this in the next release.
>>
>>>> +             switch (vout_mode >> 5) {
>>>> +             case 0:
>>>> +                     info->format[PSC_VOLTAGE_OUT] = linear;
>>>> +                     return 0;
>>>> +             case 1:
>>>> +                     info->format[PSC_VOLTAGE_OUT] = vid;
>>>> +                     break;
>>>> +             default:
>>>> +                     return -ENODEV;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     for (i = 0; i < info->pages; i++) {
>>>> +             /* Read the VOUT_MODE register for VID Code Type. */
>>>> +             ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
>>>
>>> Given that there are only two pages, reading PMBUS_VOUT_MODE for
>>> page 0 twice is a bit of a waste. On top of that, the need for the loop
>>> suggests that the mode can be different across pages. That needs to be
>>> supported: Bailing out in that case is not acceptable. Worse:
>>> What if the mode is linear on page 0 but vid on page 1 ?
>>>
>> ACK, We will take care of this in the next release.
>>
>>>> +             if (ret < 0)
>>>> +                     return ret;
>>>> +
>>>> +             vout_params = ret & GENMASK(4, 0);
>>>> +             switch (vout_params) {
>>>> +             case XDPE1A2G7B_NVIDIA_195MV:
>>>> +                     info->vrm_version[i] = nvidia195mv;
>>>> +                     break;
>>>> +             default:
>>>> +                     return -EINVAL;
>>>
>>> This warrants an error message and an explanation (comment) why other modes
>>> are not supported by the driver. The detailed datasheet is not public, so
>>> you'll have to help out here. As mentioned above, bailing out because the
>>> mode on page 1 is linear is not acceptable.
>>>
>> ACK, we will provide comments in the next release.
>> Additionally, please note that the XDPE1A2G7B Controller only supports
>> the 'nvidia195mv' vrm_version in the VID Data format for VOUT.
>> We will ensure that this limitation is properly documented and
>> commented on in the next release.
>>
>>>> +             }
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static struct pmbus_driver_info xdpe1a2g7b_info = {
>>>> +     .pages = XDPE1A2G7B_PAGE_NUM,
>>>> +     .identify = xdpe1a2g7b_identify,
>>>> +     .format[PSC_VOLTAGE_IN] = linear,
>>>> +     .format[PSC_TEMPERATURE] = linear,
>>>> +     .format[PSC_CURRENT_IN] = linear,
>>>> +     .format[PSC_CURRENT_OUT] = linear,
>>>> +     .format[PSC_POWER] = linear,
>>>> +     .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>>>> +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>>>> +                PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
>>>> +                PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
>>>> +     .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>>>> +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>>>> +                PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
>>>> +};
>>>> +
>>>> +static int xdpe1a2g7b_probe(struct i2c_client *client)
>>>> +{
>>>> +     struct pmbus_driver_info *info;
>>>> +
>>>> +     info = devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*info),
>>>> +                         GFP_KERNEL);
>>>> +     if (!info)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     return pmbus_do_probe(client, info);
>>>> +}
>>>> +
>>>> +static const struct i2c_device_id xdpe1a2g7b_id[] = { { "xdpe1a2g5b" },
>>>> +                                                   { "xdpe1a2g7b" },
>>>> +                                                   {} };
>>>
>>> Please use more lines and less indentation.
>>>
>> ACK, We will take care of this in the next release.
>>
>>>> +
>>>> +MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
>>>> +
>>>> +static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] = {
>>>> +     { .compatible = "infineon,xdpe1a2g5b" },
>>>> +     { .compatible = "infineon,xdpe1a2g7b" },
>>>> +     {}
>>>
>>> ... just like here.
>>>
>>>> +};
>>>> +
>>>> +MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
>>>> +
>>>> +static struct i2c_driver xdpe1a2g7b_driver = {
>>>> +     .driver = {
>>>> +             .name = "xdpe1a2g7b",
>>>> +             .of_match_table = of_match_ptr(xdpe1a2g7b_of_match),
>>>> +     },
>>>> +     .probe = xdpe1a2g7b_probe,
>>>> +     .id_table = xdpe1a2g7b_id,
>>>> +};
>>>> +
>>>> +module_i2c_driver(xdpe1a2g7b_driver);
>>>> +
>>>> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
>>>> +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_IMPORT_NS("PMBUS");
>>>

