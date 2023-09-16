Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358E7C2BA12
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 16:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjIPQ72 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 12:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjIPQ7M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 12:59:12 -0400
X-Greylist: delayed 945 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 16 Sep 2023 09:59:03 PDT
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76227CE7
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 09:59:03 -0700 (PDT)
Received: from [2a00:23c5:dcb3:cb33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qhYO0-007Csg-PN; Sat, 16 Sep 2023 16:43:12 +0000
Message-ID: <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
Date:   Sat, 16 Sep 2023 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the detailed report, Doug.
Would you be able to test out a fix please?

It's a basic guard line as _alarm attributes are assumed to be there 
when a sensor exists, but the device doesn't have an alarm for in5 (VIN8
on the device)

If you could also confirm that your /sys/class/hwmon/hwmon?/in5_alarm
file is there and showing 0, that would be great.


---
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 02a7124..5470aff 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1753,6 +1753,9 @@ nct6775_show_alarm(struct device *dev, struct 
device_attribute *attr, char *buf)
                 return PTR_ERR(data);

         nr = data->ALARM_BITS[sattr->index];
+       if (nr < 0)
+               return sprintf(buf, "0\n");
+
         return sprintf(buf, "%u\n",
                        (unsigned int)((data->alarms >> nr) & 0x01));
  }
---

More details - if the above patch fixes the issue...

The update of nct6798/nct6799 for additional TEMP sensors required
separating them from the previous set of devices.

Both devices are very similar.
Both do not have an alarm bit for VIN8 (index 5) where the
shift-out-of-bounds check trips.

 >> nct6775_core: doug: nr: 21  ; index 5

Previously in5_alarm was pointing at bit 21 (which is bit 5 in reg
0x45b) which is reserved and *probably* always 0. With the update, 6798
was pointed at the same ALARM_BITS as 6799 as the TEMP bits are
different from other devices.

This is correct and it doesn't need to point back at the old BITS again.
However, now I realise that in*_alarm attributes can't be switched off
separately from their sensor - in5_* are all there except ALARM.

Seems the shift-out-of-bounds check was there prior to this change.
I'm not exactly sure why this didn't come up in my testing on 6.5.0.

This is the only occurrence of non-existent ALARM in the middle of other
sensors, so a simple guard check seems to be the reasonable thing here
even though it may get evaluated more times than it should.

If it's confirmed to work, I can submit a formal patch later.

Above change tested on nct6799 on 6.5.0-rc2+ with no impact or
additional dmesg output.



On 15/09/2023 16:00, Guenter Roeck wrote:
> Hi,
> 
> On 9/15/23 07:28, Doug Smythies wrote:
>> Kernel 6.6-rc1 has an error during boot. The guilty commit is:
>> b7f1f7b2523a6a4382f12fe953380b847b80e09d
>> hwmon: (nct6775) Additional TEMP registers for nct6799
>>
>> There seems to be confusion between the indexes into
>> the NCT6799_ALARM_BITS array or the
>> NCT6779_ALARM_BITS array. I do not understand the code
>> and do not know if it is the indexing that is reversed or the
>> wrong table is being used.
>>
> 
> Thanks a lot for the report. Ahmad, can you look into this ?
> If it can't be fixed quickly we'll have to revert the offending patch.
> 
> Thanks,
> Guenter
> 
>> The error from kern.log (edited):
>>
>> ================================================================================
>> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1757:39
>> shift exponent -1 is negative
>> CPU: 9 PID: 822 Comm: sensors Not tainted 6.6.0-rc1-stock2 #1165
>> Hardware name: ASUS System Product Name/PRIME Z490-A, BIOS 9902 
>> 09/15/2021
>> Call Trace:
>> <TASK>
>> dump_stack_lvl+0x48/0x70
>> dump_stack+0x10/0x20
>> ubsan_epilogue+0x9/0x40
>> __ubsan_handle_shift_out_of_bounds+0x10f/0x170
>> ...
>>
>> I added a "pr_info" line (in the below it was as of the prior commit,
>> 43fbe66dc216 hwmon: Add driver for Renesas HS3001):
>>
>> doug@s19:~/kernel/linux$ git diff
>> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
>> index 33533d95cf48..12e3df84c034 100644
>> --- a/drivers/hwmon/nct6775-core.c
>> +++ b/drivers/hwmon/nct6775-core.c
>> @@ -1727,6 +1727,7 @@ nct6775_show_alarm(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>>                  return PTR_ERR(data);
>>
>>          nr = data->ALARM_BITS[sattr->index];
>> +       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
>>          return sprintf(buf, "%u\n",
>>                         (unsigned int)((data->alarms >> nr) & 0x01));
>>   }
>>
>> And for b7f1f7b2523a got (edited):
>>
>> nct6775_core: doug: nr: 0  ; index 0
>> nct6775_core: doug: nr: 1  ; index 1
>> nct6775_core: doug: nr: 2  ; index 2
>> nct6775_core: doug: nr: 3  ; index 3
>> nct6775_core: doug: nr: 8  ; index 4
>> nct6775_core: doug: nr: -1  ; index 5
>> ================================================================================
>> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1758:39
>> shift exponent -1 is negative
>> ...
>> nct6775_core: doug: nr: 20  ; index 6
>> nct6775_core: doug: nr: 16  ; index 7
>> nct6775_core: doug: nr: 17  ; index 8
>> nct6775_core: doug: nr: 24  ; index 9
>> nct6775_core: doug: nr: 25  ; index 10
>> nct6775_core: doug: nr: 26  ; index 11
>> nct6775_core: doug: nr: 27  ; index 12
>> nct6775_core: doug: nr: 28  ; index 13
>> nct6775_core: doug: nr: 29  ; index 14
>> nct6775_core: doug: nr: 6  ; index 24
>> nct6775_core: doug: nr: 7  ; index 25
>> nct6775_core: doug: nr: 11  ; index 26
>> nct6775_core: doug: nr: 10  ; index 27
>> nct6775_core: doug: nr: 23  ; index 28
>> nct6775_core: doug: nr: 33  ; index 29
>> nct6775_core: doug: nr: 12  ; index 48
>> nct6775_core: doug: nr: 9  ; index 49
>>
>> Observe that the table seems to be
>> NCT6799_ALARM_BITS
>> But the indexes seem to be for
>> NCT6779_ALARM_BITS
>>
>> static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] = {
>>           0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,   /* 
>> in0-in11     */
>>          27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,   /* 
>> in12-in23    */
>>           6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,   /* 
>> fan1-fan12   */
>>           4,  5, 40, 41, 42, 43, 44, -1, -1, -1, -1, -1,   /* 
>> temp1-temp12 */
>>          12,  9,                                           /* 
>> intr0-intr1  */
>> };
>>
>> Now repeat the test as of 43fbe66dc216:
>>
>> nct6775_core: doug: nr: 0  ; index 0
>> nct6775_core: doug: nr: 1  ; index 1
>> nct6775_core: doug: nr: 2  ; index 2
>> nct6775_core: doug: nr: 3  ; index 3
>> nct6775_core: doug: nr: 8  ; index 4
>> nct6775_core: doug: nr: 21  ; index 5
>> nct6775_core: doug: nr: 20  ; index 6
>> nct6775_core: doug: nr: 16  ; index 7
>> nct6775_core: doug: nr: 17  ; index 8
>> nct6775_core: doug: nr: 24  ; index 9
>> nct6775_core: doug: nr: 25  ; index 10
>> nct6775_core: doug: nr: 26  ; index 11
>> nct6775_core: doug: nr: 27  ; index 12
>> nct6775_core: doug: nr: 28  ; index 13
>> nct6775_core: doug: nr: 29  ; index 14
>> nct6775_core: doug: nr: 6  ; index 24
>> nct6775_core: doug: nr: 7  ; index 25
>> nct6775_core: doug: nr: 11  ; index 26
>> nct6775_core: doug: nr: 10  ; index 27
>> nct6775_core: doug: nr: 23  ; index 28
>> nct6775_core: doug: nr: 33  ; index 29
>> nct6775_core: doug: nr: 12  ; index 48
>> nct6775_core: doug: nr: 9  ; index 49
>>
>> Observe that the table seems to be
>> NCT6779_ALARM_BITS
>> And the indexing seems to be for that
>> Table.
>>
>> static const s8 NCT6779_ALARM_BITS[NUM_ALARM_BITS] = {
>>           0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,   /* 
>> in0-in11     */
>>          27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* 
>> in12-in23    */
>>           6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,   /* 
>> fan1-fan12   */
>>           4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* 
>> temp1-temp12 */
>>          12,  9,                                           /* 
>> intr0-intr1  */
>> };
>>
>> You probably need this information:
>> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>>
>> ... Doug
>>
>>
> 

-- 
Regards,
Ahmad
