Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37270 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbdIENfg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 09:35:36 -0400
Subject: Re: [PATCH] hwmon: (k10temp) Add support for family 17h
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
 <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1e168fdb-862f-60f1-d119-918e00aac1f5@roeck-us.net>
Date: Tue, 5 Sep 2017 06:35:33 -0700
MIME-Version: 1.0
In-Reply-To: <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/04/2017 11:47 PM, Clemens Ladisch wrote:
> Guenter Roeck wrote:
>> Add support for temperature sensors on Family 17h (Ryzen) processors.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> Some of this is guesswork, but afaics it is working. No idea if there
>> is a better way to determine the temperature offset.
> 
> The reported value is not an absolute temperature on any CPU.
> 
> As far as I know, the offset is not guaranteed to be fixed for any model,
> i.e., it would be pointless to apply the offset observed on one specific
> chip.
> 

What we should do then, as we did for coretemp, would be to collect the various
temperature offsets (and temperature limits, for that matter) and apply per-CPU
adjustments. Are the offsets documented somewhere ?

>> @@ -25,6 +25,10 @@
>>   #include <linux/pci.h>
>>   #include <asm/processor.h>
>>
>> +#ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
>> +#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>> +#endif
>> +
> 
> Please move this down to the other symbols.
> 
Done.

Thanks,
Guenter
