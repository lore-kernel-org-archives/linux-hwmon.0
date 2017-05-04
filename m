Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx02-sz.bfs.de ([194.94.69.103]:36047 "EHLO mx02-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754704AbdEDOgJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 4 May 2017 10:36:09 -0400
Message-ID: <590B3C54.1060700@bfs.de>
Date: Thu, 04 May 2017 16:36:04 +0200
From: walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: Dan Carpenter <dan.carpenter@oracle.com>,
        Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Add missing break statements
References: <20170503193140.zbxcdgda7k3rnr2m@mwanda> <590AD813.6030805@bfs.de> <20170504073109.b2etej6kg3dzt4vb@mwanda> <d0dd78fd-5c40-180f-aa48-000cfe6c0674@roeck-us.net>
In-Reply-To: <d0dd78fd-5c40-180f-aa48-000cfe6c0674@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



Am 04.05.2017 15:42, schrieb Guenter Roeck:
> On 05/04/2017 12:31 AM, Dan Carpenter wrote:
>> On Thu, May 04, 2017 at 09:28:19AM +0200, walter harms wrote:
>>>
>>>
>>> Am 03.05.2017 21:31, schrieb Dan Carpenter:
>>>> Static checkers complain about these missing break statements.
>>>>
>>>> Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/ir35221.c
>>>> b/drivers/hwmon/pmbus/ir35221.c
>>>> index cc7b3b542531..00e4a1e264e2 100644
>>>> --- a/drivers/hwmon/pmbus/ir35221.c
>>>> +++ b/drivers/hwmon/pmbus/ir35221.c
>>>> @@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct
>>>> i2c_client *client, int page, int reg)
>>>>      case PMBUS_IIN_OC_WARN_LIMIT:
>>>>          ret = pmbus_read_word_data(client, page, reg);
>>>>          ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
>>>> +        break;
>>>>      case PMBUS_READ_VIN:
>>>>          ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
>>>>          ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
>>>
>>> Just a remark:
>>> the naming of the variable for pmbus_read_word_data() is unfortunate.
>>> It would be nice to have it like below: val
>>>
>>
>> Yeah.  I thought so too.
>>
> 
> The real problem here is that ret < 0 should return an error without
> rescale,
> which I overlooked. That is a real bug, which isn't fixed by adding a new
> variable to this function. So it would have to be
> 
>     ret = pmbus_read_word_data();
>     if (ret < 0)
>         break;    // or return ret;
>     ret = ir35221_scale_result();
>     break;
> 
> or
>     val = pmbus_read_word_data();
>     if (val < 0)
>         return val;
>     ret = ir35221_scale_result();
>     break;
> 
> or
>     val = pmbus_read_word_data();
>     if (val < 0) {
>         ret = val;
>         break;
>     }
>     ret = ir35221_scale_result();
>     break;
> 
> Out of those, I personally prefer the first. I don't really see how adding
> a variable would improve the code.
> 

the "if" changes everything. Is all about naming the variables. With
ret you give the impression that it may contain an error indicator,
but with val you say "this is a value".

short: if "if" gets added everything is fine

hope that helps,
 wh


