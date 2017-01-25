Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56869 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdAYJto (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2017 04:49:44 -0500
Subject: Re: [PATCH] hwmon: Update documentation to clarify rules for the
 'name' attribute
To: Jean Delvare <jdelvare@suse.de>
References: <1485318394-24773-1-git-send-email-linux@roeck-us.net>
 <20170125101459.7b092226@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <566913d7-01f2-61f9-8c31-37031804e7a0@roeck-us.net>
Date: Wed, 25 Jan 2017 01:24:18 -0800
MIME-Version: 1.0
In-Reply-To: <20170125101459.7b092226@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/25/2017 01:14 AM, Jean Delvare wrote:
> Hi Guenter,
>
> On Tue, 24 Jan 2017 20:26:34 -0800, Guenter Roeck wrote:
>> Clarify that the name attribute must report a valid name, and the rules
>> for valid names. Also clarify that the name parameter must be provided
>> for all supported API functions.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  Documentation/hwmon/hwmon-kernel-api.txt | 4 ++++
>>  Documentation/hwmon/sysfs-interface      | 5 +++--
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
>> index 2505ae67e2b6..41bc15b34737 100644
>> --- a/Documentation/hwmon/hwmon-kernel-api.txt
>> +++ b/Documentation/hwmon/hwmon-kernel-api.txt
>> @@ -89,6 +89,10 @@ the call to devm_hwmon_device_register_with_groups or
>>  hwmon_device_register_with_info and if the automatic (device managed)
>>  removal would be too late.
>>
>> +All supported hwmon device registration functions only accept valid device
>> +names. Device names including invalid characters (whitespace, '.'. '*',
>
> Typo: should be , after '.' instead of . .
>
> I am confused as to why '.' is forbidden. The code in
> __hwmon_device_register() does not reject that character, and I can't
> see how this would cause any problem to libsensors.
>
Maybe I should read the code ;-).

Thanks, I'll send an update !

Guenter

>> +or '-') will be rejected. The 'name' parameter is mandatory.
>> +
>>  Using devm_hwmon_device_register_with_info()
>>  --------------------------------------------
>>
>> diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
>> index 2cc95ad46604..89f0bcbcaa18 100644
>> --- a/Documentation/hwmon/sysfs-interface
>> +++ b/Documentation/hwmon/sysfs-interface
>> @@ -86,8 +86,9 @@ given driver if the chip has the feature.
>>
>>  name		The chip name.
>>  		This should be a short, lowercase string, not containing
>> -		spaces nor dashes, representing the chip name. This is
>> -		the only mandatory attribute.
>> +		whitespace, dashes, or the wildcard characters '.' and '*'.
>> +		This attribute represents the chip name. It is the only
>> +		mandatory attribute.
>>  		I2C devices get this attribute created automatically.
>>  		RO
>>
>
>

