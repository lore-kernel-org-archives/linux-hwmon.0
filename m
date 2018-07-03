Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gateway23.websitewelcome.com ([192.185.50.164]:41298 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934273AbeGCRUv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 3 Jul 2018 13:20:51 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 56A232A68B
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jul 2018 12:20:50 -0500 (CDT)
Subject: Re: [PATCH] hwmon: Mark expected switch fall-throughs
To: Jean Delvare <jdelvare@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180702213017.GA27242@embeddedor.com>
 <20180703095118.5f08abd6@endymion>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <7e0579e7-9b13-44de-0d41-008e1ad6837f@embeddedor.com>
Date: Tue, 3 Jul 2018 12:20:26 -0500
MIME-Version: 1.0
In-Reply-To: <20180703095118.5f08abd6@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean,

On 07/03/2018 02:51 AM, Jean Delvare wrote:
> Hi Gustavo,
> 
> On Mon, 2 Jul 2018 16:30:17 -0500, Gustavo A. R. Silva wrote:
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
> 
> That's a great initiative, thanks for doing that.
> 

Glad to help. :)

>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>  drivers/hwmon/emc1403.c | 2 ++
>>  drivers/hwmon/nct6775.c | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
>> index 1ea7ca5..aaebeb7 100644
>> --- a/drivers/hwmon/emc1403.c
>> +++ b/drivers/hwmon/emc1403.c
>> @@ -443,8 +443,10 @@ static int emc1403_probe(struct i2c_client *client,
>>  	switch (id->driver_data) {
>>  	case emc1404:
>>  		data->groups[2] = &emc1404_group;
>> +		/* fall through */
>>  	case emc1403:
>>  		data->groups[1] = &emc1403_group;
>> +		/* fall through */
>>  	case emc1402:
>>  		data->groups[0] = &emc1402_group;
>>  	}
>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>> index 3714990..c6bd61e 100644
>> --- a/drivers/hwmon/nct6775.c
>> +++ b/drivers/hwmon/nct6775.c
>> @@ -2541,7 +2541,7 @@ static void pwm_update_registers(struct nct6775_data *data, int nr)
>>  	case thermal_cruise:
>>  		nct6775_write_value(data, data->REG_TARGET[nr],
>>  				    data->target_temp[nr]);
>> -		/* intentional */
>> +		/* fall through  */
> 
> Do you know which -Wimplicit-fallthrough level we will be using? Level
> 1 would be happy with the initial comment, no change would be needed.
> If level 2-4 then yes the change is needed.
> 

We are trying level 2, so we can perfectly use annotations like this one (else: fall through):

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9b10000f4921e9f9f8231f9ceecae4446928844a

>>  	default:
>>  		reg = nct6775_read_value(data, data->REG_FAN_MODE[nr]);
>>  		reg = (reg & ~data->tolerance_mask) |
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 

Thanks
--
Gustavo
