Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46093 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbeJCJut (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 Oct 2018 05:50:49 -0400
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Cao Van Dong <cv-dong@jinso.co.jp>, broonie@kernel.org,
        geert+renesas@glider.be, linux-hwmon@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
 <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
 <84db03da-fb58-0f77-cfb4-317b434376f8@jinso.co.jp>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <aada98e3-fedd-6f8e-2e95-9a924fc871da@roeck-us.net>
Date: Tue, 2 Oct 2018 20:04:21 -0700
MIME-Version: 1.0
In-Reply-To: <84db03da-fb58-0f77-cfb4-317b434376f8@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/02/2018 06:33 PM, Cao Van Dong wrote:
> Dear Guenter-san,
> 
> Thanks for your comment!
> 
>>> In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
>>> Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
>>> Recently, the developer has replaced the parameter NULL as the device by the actual device.
>>> This causes the "No sensors found" error. This patch is to fix this error.
>>>
>>> This patch is based on the v4.19-rc3 tag.
>>>
>>
>> NACK.
>>
>> This is wrong. The passed device is the hwmon driver's parent device. Using that device's
>> parent would be wrong. Indeed, that device could be a platform device with no parent.
> Maybe I did not know all problem. If I'm wrong, sorry for the inconvenience.
> 
>> The problem must be fixed in the calling code.
>>
> I will see the feedback from Marc-san.
> 

The "No sensors found" message is from the "sensors" application.
The device type associated with the passed device is unknown to
libsensors (it is parsed from the parent device subsystem name -
what is that, anyway ?). This could be addressed in libsensors,
or the thermal subsystem could attach itself to a known subsystem,
or the thermal subsystem must pass a pointer the parent device.

Again, trying to address the problem in the hwmon core is simply wrong.

Guenter

> 
> Regards,
> Dong/Jinso
> 
>>> ---
>>>   drivers/hwmon/hwmon.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>>> index 33d5128..7c8d3cb 100644
>>> --- a/drivers/hwmon/hwmon.c
>>> +++ b/drivers/hwmon/hwmon.c
>>> @@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>>>         hwdev->name = name;
>>>       hdev->class = &hwmon_class;
>>> -    hdev->parent = dev;
>>> +    hdev->parent = dev->parent;
>>>       hdev->of_node = dev ? dev->of_node : NULL;
>>>       hwdev->chip = chip;
>>>       dev_set_drvdata(hdev, drvdata);
> 
