Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:56872 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388788AbeIUHYq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 03:24:46 -0400
Message-ID: <5BA44B89.6090006@huawei.com>
Date: Fri, 21 Sep 2018 09:38:17 +0800
From: zhong jiang <zhongjiang@huawei.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: remove redundant continue
References: <1537431070-38261-1-git-send-email-zhongjiang@huawei.com> <20180920173045.GA15272@roeck-us.net>
In-Reply-To: <20180920173045.GA15272@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 2018/9/21 1:30, Guenter Roeck wrote:
> On Thu, Sep 20, 2018 at 04:11:10PM +0800, zhong jiang wrote:
>> The continue will not truely skip any code. hence it is safe to
>> remove it.
>>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> The proper subject line would be
>
> hwmon: (scpi-hwmon) <summary>
>
> Since it now happened several times that I got a patch without proper
> subject (ie where the subject does not even mention the affected driver),
> I am no longer going to accept patches if the affected driver is missing,
> sorry.
I will fix that and resend.  Thanks

Sincerely,
zhong jiang
> Guenter
>
>> ---
>>  drivers/hwmon/scpi-hwmon.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
>> index 7e49da5..111d521 100644
>> --- a/drivers/hwmon/scpi-hwmon.c
>> +++ b/drivers/hwmon/scpi-hwmon.c
>> @@ -286,10 +286,8 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
>>  		 * any thermal zones or if the thermal subsystem is
>>  		 * not configured.
>>  		 */
>> -		if (IS_ERR(z)) {
>> +		if (IS_ERR(z))
>>  			devm_kfree(dev, zone);
>> -			continue;
>> -		}
>>  	}
>>  
>>  	return 0;
>> -- 
>> 1.7.12.4
>>
>
