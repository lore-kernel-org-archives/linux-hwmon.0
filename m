Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([198.47.19.12]:39766 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751211AbcFXPcK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 11:32:10 -0400
Subject: Re: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
References: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
 <576D401D.80700@ti.com> <576D4421.8080704@roeck-us.net>
 <576D49AA.8020406@roeck-us.net> <576D505E.3020308@ti.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <576D524C.2030202@ti.com>
Date: Fri, 24 Jun 2016 10:31:24 -0500
MIME-Version: 1.0
In-Reply-To: <576D505E.3020308@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/24/2016 10:23 AM, Nishanth Menon wrote:
> On 06/24/2016 09:54 AM, Guenter Roeck wrote:
>> On 06/24/2016 07:30 AM, Guenter Roeck wrote:
>>> Hi Nishanth,
>>>
>>> On 06/24/2016 07:13 AM, Nishanth Menon wrote:
>>>> On 06/23/2016 07:28 PM, Guenter Roeck wrote:
>>>>> By registering a cleanup function with devm_add_action(), we can
>>>>> simplify the error path in the probe function and drop the remove
>>>>> function entirely.
>>>>>
>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> I dont seem to have a cover letter to reply to... but anyways..
>>>>
>>>> Before: http://pastebin.ubuntu.com/17801376/
>>>> After all 5 patches: http://pastebin.ubuntu.com/17801824/
>>>>
>>>> Fails on beagleboard-X15 with:
>>>> [   36.781509] tmp102 0-0048: No cache defaults, reading back from HW
>>>> [   36.795940] tmp102 0-0048: unexpected config register value
>>>>
>>>> I have'nt bisected down on the specific patch in the series. Have you had a chance to test the series?
>>>>
>>>>
>>>
>>> Thanks for testing. Yes, I did test it. Maybe different chip revisions, or different
>>> initial config register values and I messed up there. Can you send me the output
>>> of i2cdump (word wide) ?
>>>
>>
>> Before 5 patches:
>>> # i2cdump -f 0 0x48 w
>>>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
>>> 00: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 08: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 10: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 18: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 20: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 28: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 30: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 38: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 40: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 48: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 50: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 58: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 60: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 68: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 70: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 78: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 80: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 88: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 90: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> 98: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> a0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> a8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> b0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> b8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> c0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> c8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> d0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> d8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> e0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> e8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> f0: 7912 b062 004b 0050 c018 e006 0000 0000 
>>> f8: 7912 b062 004b 0050 c018 e006 0000 0000 
>>
>> After 5 patches:
>>>  i2cdump -y 0 0x48 w
>>>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
>>> 00: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 08: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 10: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 18: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 20: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 28: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 30: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 38: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 40: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 48: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 50: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 58: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 60: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 68: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 70: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 78: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 80: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 88: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 90: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> 98: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> a0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> a8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> b0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> b8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> c0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> c8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> d0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> d8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> e0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> e8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> f0: 5024 a060 004b 0050 c018 e006 0000 0000 
>>> f8: 5024 a060 004b 0050 c018 e006 0000 0000 
>>
> 
> 
> 
>> Also, beagleboard uses the omap i2c controller, correct ? I'll have to check
>> if regmap handles endianness conversion properly for controllers supporting
>> I2C_FUNC_I2C. If some other i2c controller is used, please let me know (or
>> sene me the output of i2cdetect -l). Recent kernels have a bug in regmap
>> which affects chips with 16-bit registers if I2C_FUNC_I2C is not supported.
Forgot to send you -l output:
root@BeagleBoard-X15:~# i2cdetect -l
i2c-0   i2c             OMAP I2C adapter                        I2C
adapter
i2c-2   i2c             OMAP I2C adapter                        I2C
adapter
root@BeagleBoard-X15:~# i2cdetect -F 0
Functionalities implemented by /dev/i2c-0:
I2C                              yes
SMBus Quick Command              no
SMBus Send Byte                  yes
SMBus Receive Byte               yes
SMBus Write Byte                 yes
SMBus Read Byte                  yes
SMBus Write Word                 yes
SMBus Read Word                  yes
SMBus Process Call               yes
SMBus Block Write                yes
SMBus Block Read                 no
SMBus Block Process Call         no
SMBus PEC                        yes
I2C Block Write                  yes
I2C Block Read                   yes


>>
>> Maybe I should get a beagleboard. The X15 isn't available yet, though. Do the
>> available boards (eg Rev C) use the same i2c controller ?
> 
> yeah there are variants of omap-i2c controllers, but basically they
> work in the same way.
> 
> I can try and debug the series once I get some spare time, might be
> over the weekend or next week.
> 


-- 
Regards,
Nishanth Menon
