Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45150 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751465AbcFYBYF (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 21:24:05 -0400
Subject: Re: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
To: Nishanth Menon <nm@ti.com>
References: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
 <576D401D.80700@ti.com> <576D4421.8080704@roeck-us.net>
 <576D49AA.8020406@roeck-us.net> <576D505E.3020308@ti.com>
 <20160624163604.GA21447@roeck-us.net> <576D75B8.2050406@ti.com>
 <20160624181827.GA11632@roeck-us.net> <576D7A25.1040000@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <576DDD32.7050907@roeck-us.net>
Date: Fri, 24 Jun 2016 18:24:02 -0700
MIME-Version: 1.0
In-Reply-To: <576D7A25.1040000@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/24/2016 11:21 AM, Nishanth Menon wrote:
> On 06/24/2016 01:18 PM, Guenter Roeck wrote:
>> On Fri, Jun 24, 2016 at 01:02:32PM -0500, Nishanth Menon wrote:
>>> On 06/24/2016 11:36 AM, Guenter Roeck wrote:
>>>> On Fri, Jun 24, 2016 at 10:23:10AM -0500, Nishanth Menon wrote:
>>>>> On 06/24/2016 09:54 AM, Guenter Roeck wrote:
>>>>>> On 06/24/2016 07:30 AM, Guenter Roeck wrote:
>>>>>>> Hi Nishanth,
>>>>>>>
>>>>>>> On 06/24/2016 07:13 AM, Nishanth Menon wrote:
>>>>>>>> On 06/23/2016 07:28 PM, Guenter Roeck wrote:
>>>>>>>>> By registering a cleanup function with devm_add_action(), we can
>>>>>>>>> simplify the error path in the probe function and drop the remove
>>>>>>>>> function entirely.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>>>>
>>>>>>>> I dont seem to have a cover letter to reply to... but anyways..
>>>>>>>>
>>>>>>>> Before: http://pastebin.ubuntu.com/17801376/
>>>>>>>> After all 5 patches: http://pastebin.ubuntu.com/17801824/
>>>>>>>>
>>>>>>>> Fails on beagleboard-X15 with:
>>>>>>>> [   36.781509] tmp102 0-0048: No cache defaults, reading back from HW
>>>>>>>> [   36.795940] tmp102 0-0048: unexpected config register value
>>>>>>>>
>>>>>>>> I have'nt bisected down on the specific patch in the series. Have you had a chance to test the series?
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> Thanks for testing. Yes, I did test it. Maybe different chip revisions, or different
>>>>>>> initial config register values and I messed up there. Can you send me the output
>>>>>>> of i2cdump (word wide) ?
>>>>>>>
>>>>>>
>>>>>> Before 5 patches:
>>>>>>> # i2cdump -f 0 0x48 w
>>>>>>>       0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
>>>>>>> 00: 7912 b062 004b 0050 c018 e006 0000 0000
>>>>
>>>> [ ... ]
>>>>>>
>>>>>> After 5 patches:
>>>>>>>   i2cdump -y 0 0x48 w
>>>>>>>       0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
>>>>>>> 00: 5024 a060 004b 0050 c018 e006 0000 0000
>>>>
>>>> [ .... ]
>>>>
>>>>> I can try and debug the series once I get some spare time, might be
>>>>> over the weekend or next week.
>>>>
>>>> The register map, at least the initial one, is pretty much the same as mine
>>>> and as expected. The configuration register in the second map is messed up,
>>>> possible because of a write with wrong endianness.
>>>
>>> Got a few mins skipping lunch.. ;)
>>>
>>> I did a quick bisect, and it is indeed the patch #5 that breaks.
>>> added http://pastebin.ubuntu.com/17812044/ and got:
>>>
>>> tmp102 0-0048: regval = 0x0000ffff
>>>
>>> That was weird. Does'nt look like endian-ness swap thingy
>>>
>>> So, did the following hack to see all messages flowing in and out from
>>> 0x48 at bus controller driver level: http://pastebin.ubuntu.com/17813093/
>>> / # dmesg|grep XXX
>>> / #
>>>
>>> Before patch #5 (and on next-20160624):
>>> the same diff gave:
>>> http://pastebin.ubuntu.com/17813303/
>>>
>>>
>>>
>>>> I bet the regmap_read() of the configuration register returns 0xa060 (or
>>>> 0xb062) instead of 0x60a0 / 0x62b0 on your system. If you find the time,
>>>> it would be great if you can confirm by printing the register value with
>>>> the "unexpected config register value" message (guess I should have left
>>>> that in place - I used it during testing ;-).
>>>>
>>>> If that is the case, I'll probably have to drop the regmap changes, at least
>>>> for now. It would mean that regmap is broken for chips like the LM75 (ie
>>>> for all chips with 16-bit registers) on controllers supporting I2C_FUNC_I2C.
>>>
>>> It does look like everything is getting cached out and no actual reads
>>> are actually getting through to the bus controller driver even.
>>>
>> Yes, that is really weird. It also seems to fill the cache with 0xffff,
>> which is even more weird.
>>
>> Ok, looks like converting drivers to regmap isn't a good idea. I'll need
>> to get a system with an adapter supporting I2C_FUNC_I2C and do some more
>> testing.
>>
>>> I tested on next-20160624 and used omap2plus_defconfig for the test.
>>>
>>
>> Thanks a lot for the information, and for testing this with your system.
>
>
> here is more:
> http://pastebin.ubuntu.com/17814261/
>
> Looks like return for is_writable etc should probably be true or false
>

But it is. The result of "reg != TMP102_TEMP_REG" is a boolean. Even
if that was not the case, the function return value is bool, so per
C standard a non-boolean return value would be auto-converted to 0 / 1.

> [   32.609935] at24 0-0050: 4096 byte 24c32 EEPROM, writable, 1
> bytes/write
> [   32.751560] rtc-ds1307 2-006f: SET TIME!
> [   32.857593] palmas_pwrbutton
> 48070000.i2c:tps659038@58:tps659038_pwr_button: h/w controlled
> shutdown duration=12 s
> econds
> [   33.047265] rtc-ds1307 2-006f: rtc core: registered mcp7941x as rtc0
> [   33.135774] tmp102 0-0048: No cache defaults, reading back from HW
> [   33.538655] rtc-ds1307 2-006f: 64 bytes nvram
> [   34.202107] omap_rng 48090000.rng: _od_fail_runtime_resume: FIXME:
> missing hwmod/omap_dev info
> [   34.211191] omap_rng 48090000.rng: Failed to runtime_get device: -19
> [   34.217869] omap_rng 48090000.rng: initialization failed.
> [   34.229190] omap_rtc 48838000.rtc: rtc core: registered
> 48838000.rtc as rtc2
> [   34.371375] omap_i2c 48070000.i2c: XXX MSG[0]: add=0x0048, len: 1,
> flags: 0x0
> [   34.378893] omap_i2c 48070000.i2c: XXX:[0] 0x00jjjj
> / # [   34.457000] omap_i2c 48070000.i2c: XXX MSG[1]: add=0x0048, len:
> 8, flags: 0x1
> [   34.464476] omap_i2c 48070000.i2c: XXX:[0] 0x23
> [   34.469255] omap_i2c 48070000.i2c: XXX:[1] 0xa0
> [   34.473999] omap_i2c 48070000.i2c: XXX:[2] 0xff
> [   34.478775] omap_i2c 48070000.i2c: XXX:[3] 0xff
> [   34.483518] omap_i2c 48070000.i2c: XXX:[4] 0xff
> [   34.488282] omap_i2c 48070000.i2c: XXX:[5] 0xff
> [   34.493022] omap_i2c 48070000.i2c: XXX:[6] 0xff
> [   34.497788] omap_i2c 48070000.i2c: XXX:[7] 0xff
>

The problem is that the read is a multi-byte read across more than one
register (length 8). That won't work. If you look closely at the result
from the above, the read returns two bytes (probably the temperature),
and then lots of 0xff, probably because the _chip_ does not understand
the i2c protocol but only the smbus protocol. This explains the configuration
register value 0xffff, which is index 2 and 3 from the read. The chip
specification mentions nothing about reads or writes crossing register
boundaries.

Ultimately, it means that regmap-i2c is broken for chips with a register
value length of 16 bit on adapters supporting I2C_FUNC_I2C. If you want to
hack regmap, you could fix the problem by changing regmap_get_i2c_bus()
as follows.

--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -257,7 +257,8 @@ static struct regmap_bus regmap_i2c_smbus_i2c_block = {
  static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
                                         const struct regmap_config *config)
  {
-       if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
+       if (config->val_bits == 8 &&
+           i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
                 return &regmap_i2c;
         else if (config->val_bits == 8 && config->reg_bits == 8 &&
                  i2c_check_functionality(i2c->adapter,
                                          I2C_FUNC_SMBUS_WORD_DATA))

Note that there is another bug in upstream regmap - I2C_FUNC_SMBUS_WORD_DATA
only works if val_bits == 8. The patch to fix that problem may not yet be
in -next. See https://patchwork.kernel.org/patch/9191185/.

> I probably have to stop now, since I am behind on an internal
> deadline. Do let me know if you want me to dig further, I can try at a

Sorry ... but thanks a lot for your help!

Guenter

