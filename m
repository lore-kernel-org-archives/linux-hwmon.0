Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:33288 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750918AbdGZT0i (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2017 15:26:38 -0400
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] hwmon: (it87) Reapply probe path chip registers
 settings after resume
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ff384622-ed3d-836f-c18e-5b962103634f@maciej.szmigiero.name>
 <e359e68b-213a-dc55-192c-0f7daae60462@roeck-us.net>
Message-ID: <83b6dea2-c2fb-68d5-8ec0-382885fb2c57@maciej.szmigiero.name>
Date: Wed, 26 Jul 2017 21:26:15 +0200
MIME-Version: 1.0
In-Reply-To: <e359e68b-213a-dc55-192c-0f7daae60462@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 26.07.2017 04:17, Guenter Roeck wrote:
> On 07/24/2017 12:37 PM, Maciej S. Szmigiero wrote:
>> After a suspend / resume cycle we possibly need to reapply chip registers
>> settings that we had set or fixed in a probe path, since they might have
>> been reset to default values or set incorrectly by a BIOS again.
>>
>> Tested on a Gigabyte M720-US3 board, which requires routing internal VCCH5V
>> to in7 (and had it wrong again on resume from S3).
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>> Changes from v1: Move code of common probe / resume steps to new functions
>> so we don't need to make large parts of probe function conditional on a
>> newly added 'resume' parameter.
>>
> 
> Much better. Please split cleanup and pm functionality addition into two patches
> to simplify review.

Will do.

>> @@ -2986,8 +3027,6 @@ static int it87_check_pwm(struct device *dev)
>>                    "PWM configuration is too broken to be fixed\n");
>>           }
>>   -        dev_info(dev,
>> -             "Detected broken BIOS defaults, disabling PWM interface\n");
> 
> I don't think this is a good idea. Besides, it only removes one message.

That one message was moved to probe path only since otherwise it could be
misleading.

Specifically, if we hit this registry values on resume where we should
disable PWM interface (but where this interface was previously enabled)
we would print that we are "disabling PWM interface" but we won't actually
do it (since doing this would at least involve a removal of some already
registered hwmon groups which seems not possible with the current API).

> I would suggest to check for enable_pwm_interface in the resume function.
> If it is not set, don't bother calling it87_check_pwm() again.

Will do.

>> @@ -3140,9 +3183,77 @@ static int it87_probe(struct platform_device *pdev)
>>       return PTR_ERR_OR_ZERO(hwmon_dev);
>>   }
>>   +static int it87_resume_sio(struct platform_device *pdev)
>> +{
>> +    struct it87_data *data = dev_get_drvdata(&pdev->dev);
>> +    int err;
>> +    int reg2c;
>> +
>> +    if (!(data->in_internal & BIT(1)))
>> +        return 0;
>> +
>> +    if (has_in7_internal(data))
>> +        return 0;
>> +
>> +    err = superio_enter(data->sioaddr);
>> +    if (err)
>> +        return err;
>> +
>> +    superio_select(data->sioaddr, GPIO);
>> +
>> +    reg2c = superio_inb(data->sioaddr, IT87_SIO_PINX2_REG);
>> +    if (!(reg2c & BIT(1))) {
>> +        dev_notice(&pdev->dev,
>> +               "Routing internal VCCH5V to in7 again");
>> +
> I don't think this message provides any real value.

It helps to know that the workaround was done on resume (just like the
original message did on probe path), but I can change it to dev_dbg() to
not make the driver more noisy unnecessarily.

> Besides, it isn't always VCCH5V.

In datasheets of all three chips in which this routing override is set
(it8720, it8782, it8783) it is explicitly stated that this bit controls
an "internal voltage divider for VCCH5V".
Also all these three chips have VCCH of 5 volts.

I can change the message on probe path to print the voltage name as
VCCH5V in all 3 chips in the cleanup patch so there is no longer
an inconsistency here.
  
>> +        reg2c |= BIT(1);
>> +        superio_outb(data->sioaddr, IT87_SIO_PINX2_REG,
>> +                 reg2c);
>> +    }
>> +
> 
> Problem with this code is that it applies to _all_ chips.
> The original code only applied to it8783 (this message), and
> only if bit 2 of register 0x27 was set, or to it8720 and it8782
> under certain conditions (though there the message is about VCCH).
> 
> I understand you try to cover that condition with the checks above,
> but there is no guarantee that this works for all chips (and that
> it will continue to work going forward as new chips are added).
> 
> Please consider adding a flag such as "need_in7_reroute" instead.
> That would simplify the checks here and make it more explicit.

Will do.

Maciej
