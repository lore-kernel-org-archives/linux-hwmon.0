Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:40300 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbeHJRQB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Aug 2018 13:16:01 -0400
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
 <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b60eb2c2-7626-d6bd-86b9-1c1bed9dbcdc@roeck-us.net>
Date: Fri, 10 Aug 2018 07:45:46 -0700
MIME-Version: 1.0
In-Reply-To: <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/10/2018 02:53 AM, Linus Walleij wrote:
> On Fri, Aug 10, 2018 at 6:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 08/09/2018 03:24 PM, Linus Walleij wrote:
> 
>>> This is a first attempt at providing a kernel-internal
>>> hwmon sensor for ATA drives. It is possible to do the
>>> same for SCSI, NVME etc, but their protocols and
>>> peculiarities seem to require a per-subsystem implementation.
>>> They would all end up in the same namespace using the
>>> SCSI name such as "sd_0:0:0:0".
>>>
>> If the implementation for other drive types needs to be different,
>> how about "ata" as prefix ?
> 
> I was thinking that since through libata all devices on ATA
> are registered to the SCSI namespace, userspace would just
> see sd_N:N:N:N and know "it is some harddrive" and we
> do not need to know if it is SCSI or ATA. This seems to be
> the way the block developers are thinking about it: ATA drives
> are entirely hidden behind SCSI, as are USB mass storage
> drives.
> 
Ok, makes sense. So other drive types would need a different or
enhanced detect function ?

>>> With this driver, the hard disk temperatur can be read from
>>
>> temperature
>>
>>> sysfs:
>>>
>>>    > cd /sys/class/hwmon/hwmon0/
>>>    > cat temp1_input
>>>    38
>>>
>> Did you try the "sensors" command ?
> 
> Nah. OpenWRT and minimum userspace you know. But
> if sensors is cross-compile friendly I can try to look into
> it. Or use some desktop with ATA/SATA I guess.
> 
>>> +     cmd_result = scsi_execute(ata->sdev, scsi_cmd, DMA_FROM_DEVICE,
>>> +                               argbuf, ATA_SECT_SIZE,
>>> +                               NULL, &sshdr, (10*HZ), 5, 0, 0, NULL);
>>
>> (10*HZ) -> 10 * HZ
>>
>> Does it have to be that long ?
> 
> This comes from the smart command path in libata (libata-scsi.c)
> which has this comment:
> 
> /* Good values for timeout and retries?  Values below
>   * from scsi_ioctl_send_command() for default case... */
> 
> Hm copy/paste programming. But it kind of reflects years of experience
> from (slow?) hard drives.
> 
> I suspect rotational media in some cases need to boot onboard controllers
> and spin up drives and this is why it looks like this.
> 

Yes, but doesn't that only apply to situations where data is actually read from or
written to the drives ? This is just a maintenance command, after all.

>>> +     if (cmd_result) {
>>> +             dev_err(ata->dev, "error %d reading SMART values from device\n",
>>> +                     cmd_result);
>>
>> Are those error messages valuable ? To me they just clog the kernel log.
> 
> Depromoted to dev_dbg().
> 
>>> +             id = argbuf[2 + i * 12];
>>> +             if (!id)
>>> +                     continue;
>>> +
>>> +             flags = argbuf[3 + i * 12] | (argbuf[4 + i * 12] << 16);
>>> +             /* Highest temperature since boot */
>>> +             curr = argbuf[5 + i * 12];
>>> +             /* Highest temperature ever */
>>> +             worst = argbuf[6 + i * 12];
>>
>> One of those could be reported as temp1_highest (I would suggest the temperature
>> since boot).
> 
> I wish. These values are normalized to the range 0..100 without any
> standard on what the figures mean, other than that 100 is "good" and
> 0 is "bad".
> 

Sigh. Geniuses :-(.

> Example:
> Vendor Specific SMART Attributes with Thresholds:
> ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE
> UPDATED  WHEN_FAILED RAW_VALUE
> (...)
> 194 Temperature_Celsius     0x0002   062   059   000    Old_age
> Always       -       38 (Min/Max 19/42)
> 
> 62? 59? It's a mess. I guess it can be hacked on a per-vendor basis if
> someone has too much freetime, I will drop a comment on it.
> 
>>> +     /* Any other error, return upward */
>>> +     if (ret)
>>> +             return ret;
>>> +     dev_info(dev, "initial temperature %d degrees celsius\n", t);
>>> +
>>
>> noise
> 
> Yeah I know you are minimalist when it comes to dmesg ;)
> 
> Let's hear what the ATA people think though, it could be kind of useful
> if someone posts a log asking what's wrong with their drive
> and it says the hard disk is 60 degrees on boot. "Man, I think you
> need to look at your fans."
> 

Hmm. But then the temperature should just be high all the time,
and can be reported by just reading it. Your argument pretty much
applies to all thermal sensors in the system. Might as well have
the hwmon core to display those whenever a driver registers itself,
using the same argument.

Drives are not different to, say, ethernet controllers, or graphic
cards.

>>> +EXPORT_SYMBOL_GPL(ata_hwmon_probe);
>>
>> Unless I am missing something, that export should not be needed.
> 
> I also have this intuition, but libata is tristate, and every
> file you compile into a module must have all public functions
> exported. You wouid expect that functions just used inside
> a module would not need this, but my experience has taught
> me otherwise. I think it is something about how the module
> linker works. :/
> 

So, after looking more closely into this:

With HWMON=m, ATA=y, you get

drivers/ata/libata-hwmon.o: In function `ata_hwmon_probe':
(.text+0x8a3): undefined reference to `devm_hwmon_device_register_with_info'
Makefile:1005: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

"depends on (ATA=m && HWMON) || HWMON=y" for config ATA_HWMON
seems to do the trick for me, and it doesn't require EXPORT_SYMBOL.
I tried
     ATA=m, HWMON=m
     ATA=m, HWMON=y
     ATA=y, HWMON=y

with the diffs below on top of your patch.

Guenter

---
diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 8349101c7e53..bee79c08d6ee 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -61,7 +61,7 @@ config ATA_ACPI

  config ATA_HWMON
         bool "ATA S.M.A.R.T. HWMON support"
-       depends on HWMON
+       depends on (ATA=m && HWMON) || HWMON=y
         help
           This options compiles in code to support temperature reading
           from an ATA device using the S.M.A.R.T. (Self-Monitoring,
diff --git a/drivers/ata/libata-hwmon.c b/drivers/ata/libata-hwmon.c
index fa1e4e472625..29e281a81e89 100644
--- a/drivers/ata/libata-hwmon.c
+++ b/drivers/ata/libata-hwmon.c
@@ -417,4 +417,3 @@ int ata_hwmon_probe(struct scsi_device *sdev)

         return 0;
  }
-EXPORT_SYMBOL_GPL(ata_hwmon_probe);
