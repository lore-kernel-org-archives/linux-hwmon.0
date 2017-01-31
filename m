Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51930 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbdAaLx0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2017 06:53:26 -0500
Subject: Re: [PATCH] hwmon: Relax name attribute validation for new APIs
To: Jean Delvare <jdelvare@suse.de>
References: <1485575389-31616-1-git-send-email-linux@roeck-us.net>
 <20170131100711.4e8daaba@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9d36eb30-6a4f-4ffd-5eaf-c11b34a5967c@roeck-us.net>
Date: Tue, 31 Jan 2017 03:53:22 -0800
MIME-Version: 1.0
In-Reply-To: <20170131100711.4e8daaba@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/31/2017 01:07 AM, Jean Delvare wrote:
> Hi Guenter, Dmitry,
>
> On Fri, 27 Jan 2017 19:49:49 -0800, Guenter Roeck wrote:
>> While invalid name attributes are really not desirable and do mess up
>> libsensors, enforcing valid names has the detrimental effect of driving
>> users away from using the new hardware monitoring API, especially those
>> registering name attributes violating the ABI restrictions. Another
>> undesirable side effect is that this violation and the resulting error
>> may only be discovered some time after a conversion to the new API,
>> which in turn may trigger a revert of that conversion.
>>
>> To solve the problem, relax validation and only issue a warning instead
>> of returning an error if a name attribute violating the ABI is provided.
>> This lets callers continue to provide invalid name attributes while
>> notifying them about it.
>>
>> Many thanks are due to Dmitry Torokhov for the idea.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/hwmon.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>> index affff8195fff..53c54a81f7ad 100644
>> --- a/drivers/hwmon/hwmon.c
>> +++ b/drivers/hwmon/hwmon.c
>> @@ -544,9 +544,10 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>>  	struct device *hdev;
>>  	int i, j, err, id;
>>
>> -	/* Do not accept invalid characters in hwmon name attribute */
>> +	/* Complain about invalid characters in hwmon name attribute */
>>  	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
>> -		return ERR_PTR(-EINVAL);
>> +		dev_warn(dev, "hwmon: '%s' is not a valid name attribute\n",
>> +			 name);
>
> May I suggest adding ", please fix"?
>

Ok, will do.

>>
>>  	id = ida_simple_get(&hwmon_ida, 0, 0, GFP_KERNEL);
>>  	if (id < 0)
>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>
> Do I understand correctly that in the long run we will make it a fatal
> error again?
>

Hopefully, after there are no more drivers to convert, and after all converted
drivers fixed the problem.

Thanks,
Guenter

