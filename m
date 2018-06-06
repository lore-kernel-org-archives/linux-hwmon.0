Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41522 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751546AbeFFPjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Jun 2018 11:39:14 -0400
Subject: Re: [PATCH] hwmon: (dell-smm) Disable fan support for Dell XPS13 9333
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Helge Eichelberg <kernelorg@elchenberg.name>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180605173833.27003-1-kernelorg@elchenberg.name>
 <20180606152134.sw77aborznfy6mrj@pali>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e657dc84-f5f9-7ef0-d622-3940195ae011@roeck-us.net>
Date: Wed, 6 Jun 2018 08:39:10 -0700
MIME-Version: 1.0
In-Reply-To: <20180606152134.sw77aborznfy6mrj@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/06/2018 08:21 AM, Pali Rohár wrote:
> On Tuesday 05 June 2018 19:38:32 Helge Eichelberg wrote:
>> Calling fan related SMM functions implemented by Dell BIOS firmware on Dell
>> XPS13 9333 freeze kernel for about 500ms. Until Dell fixes it we need to
>> disable fan support for Dell XPS13 9333.
> 
> Hi! Have you reported this firmware bug to Dell?
> 
> Also we should probably match also BIOS version and do not apply this
> blacklist quirk for BIOS versions in which Dell fixed it.
> 

Is it known to have been fixed ? If so, why report it to Dell ?

If the problem is not known to be fixed, we have no BIOS version to match against.

Guenter

>> Via "force" module param fan support can be enabled.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=195751
>> Signed-off-by: Helge Eichelberg <kernelorg@elchenberg.name>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index bf3bb7e1adab..9d3ef879dc51 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -1074,6 +1074,13 @@ static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
>>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
>>   		},
>>   	},
>> +	{
>> +		.ident = "Dell XPS13 9333",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS13 9333"),
>> +		},
>> +	},
>>   	{ }
>>   };
>>   
> 

