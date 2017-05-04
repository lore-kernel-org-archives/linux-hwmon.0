Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44673 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751333AbdEDNm6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 May 2017 09:42:58 -0400
Subject: Re: [PATCH] hwmon: (pmbus) Add missing break statements
To: Dan Carpenter <dan.carpenter@oracle.com>,
        walter harms <wharms@bfs.de>
References: <20170503193140.zbxcdgda7k3rnr2m@mwanda> <590AD813.6030805@bfs.de>
 <20170504073109.b2etej6kg3dzt4vb@mwanda>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d0dd78fd-5c40-180f-aa48-000cfe6c0674@roeck-us.net>
Date: Thu, 4 May 2017 06:42:54 -0700
MIME-Version: 1.0
In-Reply-To: <20170504073109.b2etej6kg3dzt4vb@mwanda>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/04/2017 12:31 AM, Dan Carpenter wrote:
> On Thu, May 04, 2017 at 09:28:19AM +0200, walter harms wrote:
>>
>>
>> Am 03.05.2017 21:31, schrieb Dan Carpenter:
>>> Static checkers complain about these missing break statements.
>>>
>>> Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
>>> index cc7b3b542531..00e4a1e264e2 100644
>>> --- a/drivers/hwmon/pmbus/ir35221.c
>>> +++ b/drivers/hwmon/pmbus/ir35221.c
>>> @@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>>>  	case PMBUS_IIN_OC_WARN_LIMIT:
>>>  		ret = pmbus_read_word_data(client, page, reg);
>>>  		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
>>> +		break;
>>>  	case PMBUS_READ_VIN:
>>>  		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
>>>  		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
>>
>> Just a remark:
>> the naming of the variable for pmbus_read_word_data() is unfortunate.
>> It would be nice to have it like below: val
>>
>
> Yeah.  I thought so too.
>

The real problem here is that ret < 0 should return an error without rescale,
which I overlooked. That is a real bug, which isn't fixed by adding a new
variable to this function. So it would have to be

	ret = pmbus_read_word_data();
	if (ret < 0)
		break;	// or return ret;
	ret = ir35221_scale_result();
	break;

or
	val = pmbus_read_word_data();
	if (val < 0)
		return val;
	ret = ir35221_scale_result();
	break;

or
	val = pmbus_read_word_data();
	if (val < 0) {
		ret = val;
		break;
	}
	ret = ir35221_scale_result();
	break;

Out of those, I personally prefer the first. I don't really see how adding
a variable would improve the code.

Guenter

