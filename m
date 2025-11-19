Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA823817E;
	Wed, 19 Nov 2025 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566566; cv=none; b=C95NLb1F6R7nKiD/Aa9qBsm410dPX2KFRZVzLwyl05XW/jvnXN6sgTKHKKwjIStzhrMIsjl5rmHI/hsZKNrU2w+3Gh1xM/0DA071THRu+B7T6VVOJ/txSJZyl8mYIdnWdPtNr7mJGxLCkLbCs3xNcOmTuIDvs63huZEJpirzsZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566566; c=relaxed/simple;
	bh=cTm2l/IIaC7kiC5i/v85lhU+MuQDWnePBeqeHTLAeS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hi5cxEWy7SNJ0sC3bbfXgJPk7vc06a7icCRSDWoZWlyIAQI/tRNLW8ZGDkWRRHC8FpCvuBHLdY+o1zdiyy8Cf9zYF12fV8PF54O3b7n5BW2ScaQZR5FkuPLqfjGQc0Ehdv+4qE+ENqYvjVxRt3q4VK6nyI2ii4yM5zWMYaUU53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+U5LM5r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+U5LM5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF87EC16AAE;
	Wed, 19 Nov 2025 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763566566;
	bh=cTm2l/IIaC7kiC5i/v85lhU+MuQDWnePBeqeHTLAeS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+U5LM5rmyrcqv1+BEZ5UGGpuR3oDf5vaWXab0xMvgJ85tL3PverRwIk6CuMBZLmI
	 Irf6nqlRJGH270R1L9BrBlWQ1WAlTs06LRWtfbH6LcHkOq1tSvymAuUbPO78wJWVPd
	 ltovYfbD994jMIL4Ak2duoTzpn9yOiK83n6O3fcn8EV9hi/Uscsd+Dr3a7C1ZwE/JP
	 HSYRacJi4wbYx1+xAUUPlr5i/uwn6ojh3wRYVuZRPo6t7x6b47dLTpjEWN0U02Qe9H
	 rQvjg+JDDrHUQ5c5txa/efamPTFsu1kzTpg1v8l2wICypg+xYRj7BY4mxxhwpfuW6S
	 oqLAKZXSNVwdw==
Message-ID: <0b5c4926-f1b8-4da0-bd04-b985738667ec@kernel.org>
Date: Wed, 19 Nov 2025 16:36:01 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power and
 modules attributes
To: Armin Wolf <W_Armin@gmx.de>, Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-5-lkml@antheas.dev>
 <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com>
 <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
 <f66159f7-2811-c093-4871-5a7153398e79@linux.intel.com>
 <CAGwozwHPeWEk+MGjf39obC9dCNfpkk=zcr6--gux1fDjeZGu-A@mail.gmail.com>
 <0daff739-f8a7-4042-af6d-e7dbe5aa6720@gmx.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0daff739-f8a7-4042-af6d-e7dbe5aa6720@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thank you for your work on supporting these handheld gaming devices.

On 18-Nov-25 3:06 PM, Armin Wolf wrote:
> Am 18.11.25 um 13:58 schrieb Antheas Kapenekakis:
> 
>> On Tue, 18 Nov 2025 at 13:32, Ilpo Järvinen
>> <ilpo.jarvinen@linux.intel.com> wrote:
>>> On Mon, 17 Nov 2025, Antheas Kapenekakis wrote:
>>>> On Mon, 17 Nov 2025 at 11:30, Ilpo Järvinen
>>>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>>> On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:
>>>>>
>>>>>> The Ayaneo 3 features hot-swappable controller modules. The ejection
>>>>>> and management is done through HID. However, after ejecting the modules,
>>>>>> the controller needs to be power cycled via the EC to re-initialize.
>>>>>>
>>>>>> For this, the EC provides a variable that holds whether the left or
>>>>>> right modules are connected, and a power control register to turn
>>>>>> the controller on or off. After ejecting the modules, the controller
>>>>>> should be turned off. Then, after both modules are reinserted,
>>>>>> the controller may be powered on again to re-initialize.
>>>>> If wonder if the ejecting could/should be made to turn it off without need
>>>>> for an explicit off command?
>>>> Perhaps in the future, this driver leaves the possibility open for it.
>>>> However, that'd require a secondary HID driver to handle the full
>>>> ejection process, with a shared function hook for this driver.
>>>>
>>>> The eject sequence consists of sending a HID config command to start
>>>> the ejection, followed by a secondary config command to turn off the
>>>> ejection bits and then waiting for two ready bits to report that the
>>>> ejection is finished. Then, the controller is turned off. Apart from
>>>> turning off, all of this is done through HID (so HID ready races the
>>>> controller_modules value).
>>>>
>>>> The module status of this driver is only used to check when the
>>>> controller should be turned on again and to provide visual feedback
>>>> about which modules are currently connected while unpowered. When
>>>> powered, there is full status reporting over HID, including which
>>>> specific modules are connected[1].
>>>>
>>>> The end-to-end sequence is currently in userspace[2]. However, the EC
>>>> ports are shielded from userspace so these two specific accesses must
>>>> happen through a kernel driver.
>>> So can the other features be used without this part?
>> Yes. The patches are independent.
>>
>>> I'd prefer to
>>> postpone this power/modules thing and have the ejection done properly.
>> The ejection process is done over vendor HID commands, not through the
>> EC, so it would need a new driver. This new driver would not conflict
>> with this patch, perhaps a new "auto" value for controller_power could
>> be added to have that HID driver control this.
>>
>> But, I do not personally have plans to develop such a driver. I will
>> not oppose one of course but I cannot justify the engineer effort on
>> it. The userspace implementation works quite well and this is a niche
>> device.
>>
>> Since these two registers are in protected ACPI space, they need to be
>> accessed through this driver, so this patch is necessary for that.
>>
>> Antheas
> 
> I am OK with using a userspace application to connect the HID interface
> with the EC, as the ejection process already requires userspace intervention.

Ack, I was wondering about this and the controller modules are sunk into
the surface of the handheld and pop out after sending a software command
which tells the hw to do something to release the modules after which they
pop out, see:

https://youtu.be/tO48dzIjMMw?t=240

So this will require a special userspace app to send the eject custom HID
command and that app can then also set the new sysfs power setting correctly.

Since this needs special userspace support anyways I do not see the need
for an in kernel HID driver, especially since interfacing between the pdx86
and HID drivers is going to be tricky inside the kernel. So leaving
coordinating the HID commands vs the power sysfs setting up to the special
userspace app sounds good to me.

Regards,

Hans





>>> -- 
>>>   i.
>>>
>>>> Antheas
>>>>
>>>> [1] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded5718e4fe3/src/hhd/device/ayaneo/base.py#L90-L117
>>>> [2] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded5718e4fe3/src/hhd/device/ayaneo/base.py
>>>>
>>>>>> This patch introduces two new sysfs attributes:
>>>>>>   - `controller_modules`: a read-only attribute that indicates whether
>>>>>>     the left and right modules are connected (none, left, right, both).
>>>>>>   - `controller_power`: a read-write attribute that allows the user
>>>>>>     to turn the controller on or off (with '1'/'0').
>>>>>>
>>>>>> Therefore, after ejection is complete, userspace can power off the
>>>>>> controller, then wait until both modules have been reinserted
>>>>>> (`controller_modules` will return 'both') to turn on the controller.
>>>>>>
>>>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>> ---
>>>>>>   .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
>>>>>>   MAINTAINERS                                   |   1 +
>>>>>>   drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++++++
>>>>>>   3 files changed, 127 insertions(+)
>>>>>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>>>>>>
>>>>>> diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>>>>>> new file mode 100644
>>>>>> index 000000000000..4cffbf5fc7ca
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>>>>>> @@ -0,0 +1,19 @@
>>>>>> +What:                /sys/devices/platform/ayaneo-ec/controller_power
>>>>>> +Date:                Nov 2025
>>>>>> +KernelVersion:       6.19
>>>>>> +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
>>>>>> +Description:
>>>>>> +             Current controller power state. Allows turning on and off
>>>>>> +             the controller power (e.g. for power savings). Write 1 to
>>>>>> +             turn on, 0 to turn off. File is readable and writable.
>>>>>> +
>>>>>> +What:                /sys/devices/platform/ayaneo-ec/controller_modules
>>>>>> +Date:                Nov 2025
>>>>>> +KernelVersion:       6.19
>>>>>> +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
>>>>>> +Description:
>>>>>> +             Shows which controller modules are currently connected to
>>>>>> +             the device. Possible values are "left", "right" and "both".
>>>>>> +             File is read-only. The Windows software for this device
>>>>>> +             will only set controller power to 1 if both module sides
>>>>>> +             are connected (i.e. this file returns "both").
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index c5bf7207c45f..f8ab009b6224 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
>>>>>>   M:   Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>   L:   platform-driver-x86@vger.kernel.org
>>>>>>   S:   Maintained
>>>>>> +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
>>>>>>   F:   drivers/platform/x86/ayaneo-ec.c
>>>>>>
>>>>>>   AZ6007 DVB DRIVER
>>>>>> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
>>>>>> index 697bb053a7d6..a0747e7ee43a 100644
>>>>>> --- a/drivers/platform/x86/ayaneo-ec.c
>>>>>> +++ b/drivers/platform/x86/ayaneo-ec.c
>>>>>> @@ -8,6 +8,7 @@
>>>>>>    */
>>>>>>
>>>>>>   #include <linux/acpi.h>
>>>>>> +#include <linux/bits.h>
>>>>>>   #include <linux/dmi.h>
>>>>>>   #include <linux/err.h>
>>>>>>   #include <linux/hwmon.h>
>>>>>> @@ -16,6 +17,7 @@
>>>>>>   #include <linux/module.h>
>>>>>>   #include <linux/platform_device.h>
>>>>>>   #include <linux/power_supply.h>
>>>>>> +#include <linux/sysfs.h>
>>>>>>   #include <acpi/battery.h>
>>>>>>
>>>>>>   #define AYANEO_PWM_ENABLE_REG         0x4A
>>>>>> @@ -32,9 +34,18 @@
>>>>>>   #define AYANEO_CHARGE_VAL_AUTO               0xaa
>>>>>>   #define AYANEO_CHARGE_VAL_INHIBIT    0x55
>>>>>>
>>>>>> +#define AYANEO_POWER_REG     0x2d
>>>>>> +#define AYANEO_POWER_OFF     0xfe
>>>>>> +#define AYANEO_POWER_ON              0xff
>>>>>> +#define AYANEO_MODULE_REG    0x2f
>>>>>> +#define AYANEO_MODULE_LEFT   BIT(0)
>>>>>> +#define AYANEO_MODULE_RIGHT  BIT(1)
>>>>>> +#define AYANEO_MODULE_MASK   (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
>>>>>> +
>>>>>>   struct ayaneo_ec_quirk {
>>>>>>        bool has_fan_control;
>>>>>>        bool has_charge_control;
>>>>>> +     bool has_magic_modules;
>>>>>>   };
>>>>>>
>>>>>>   struct ayaneo_ec_platform_data {
>>>>>> @@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
>>>>>>   static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
>>>>>>        .has_fan_control = true,
>>>>>>        .has_charge_control = true,
>>>>>> +     .has_magic_modules = true,
>>>>>>   };
>>>>>>
>>>>>>   static const struct dmi_system_id dmi_table[] = {
>>>>>> @@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_supply *battery,
>>>>>>        return 0;
>>>>>>   }
>>>>>>
>>>>>> +static ssize_t controller_power_store(struct device *dev,
>>>>>> +                                   struct device_attribute *attr,
>>>>>> +                                   const char *buf,
>>>>>> +                                   size_t count)
>>>>>> +{
>>>>>> +     bool value;
>>>>>> +     int ret;
>>>>>> +
>>>>>> +     ret = kstrtobool(buf, &value);
>>>>>> +     if (ret)
>>>>>> +             return ret;
>>>>>> +
>>>>>> +     ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
>>>>>> +     if (ret)
>>>>>> +             return ret;
>>>>>> +
>>>>>> +     return count;
>>>>>> +}
>>>>>> +
>>>>>> +static ssize_t controller_power_show(struct device *dev,
>>>>>> +                                  struct device_attribute *attr,
>>>>>> +                                  char *buf)
>>>>>> +{
>>>>>> +     int ret;
>>>>>> +     u8 val;
>>>>>> +
>>>>>> +     ret = ec_read(AYANEO_POWER_REG, &val);
>>>>>> +     if (ret)
>>>>>> +             return ret;
>>>>>> +
>>>>>> +     return sysfs_emit(buf, "%d\n", val == AYANEO_POWER_ON);
>>>>>> +}
>>>>>> +
>>>>>> +static DEVICE_ATTR_RW(controller_power);
>>>>>> +
>>>>>> +static ssize_t controller_modules_show(struct device *dev,
>>>>>> +                                    struct device_attribute *attr, char *buf)
>>>>>> +{
>>>>>> +     char *out;
>>>>>> +     int ret;
>>>>>> +     u8 val;
>>>>>> +
>>>>>> +     ret = ec_read(AYANEO_MODULE_REG, &val);
>>>>>> +     if (ret)
>>>>>> +             return ret;
>>>>>> +
>>>>>> +     switch (~val & AYANEO_MODULE_MASK) {
>>>>> Thanks for adding the mask.
>>>>>
>>>>> Now when reading this again, I also suggest changing variable name from
>>>>> "val" to e.g. "unconnected_modules" as that would make the reason for
>>>>> inversion more obvious.
>>>>>
>>>>>> +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
>>>>>> +             out = "both";
>>>>>> +             break;
>>>>>> +     case AYANEO_MODULE_LEFT:
>>>>>> +             out = "left";
>>>>>> +             break;
>>>>>> +     case AYANEO_MODULE_RIGHT:
>>>>>> +             out = "right";
>>>>>> +             break;
>>>>>> +     default:
>>>>>> +             out = "none";
>>>>>> +             break;
>>>>>> +     }
>>>>>> +
>>>>>> +     return sysfs_emit(buf, "%s\n", out);
>>>>>> +}
>>>>>> +
>>>>>> +static DEVICE_ATTR_RO(controller_modules);
>>>>>> +
>>>>>> +static struct attribute *aya_mm_attrs[] = {
>>>>>> +     &dev_attr_controller_power.attr,
>>>>>> +     &dev_attr_controller_modules.attr,
>>>>>> +     NULL
>>>>>> +};
>>>>>> +
>>>>>> +static umode_t aya_mm_is_visible(struct kobject *kobj,
>>>>>> +                              struct attribute *attr, int n)
>>>>>> +{
>>>>>> +     struct device *dev = kobj_to_dev(kobj);
>>>>>> +     struct platform_device *pdev = to_platform_device(dev);
>>>>>> +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
>>>>>> +
>>>>>> +     if (data->quirks->has_magic_modules)
>>>>>> +             return attr->mode;
>>>>>> +     return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static const struct attribute_group aya_mm_attribute_group = {
>>>>>> +     .is_visible = aya_mm_is_visible,
>>>>>> +     .attrs = aya_mm_attrs,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct attribute_group *ayaneo_ec_groups[] = {
>>>>>> +     &aya_mm_attribute_group,
>>>>>> +     NULL
>>>>>> +};
>>>>>> +
>>>>>>   static int ayaneo_ec_probe(struct platform_device *pdev)
>>>>>>   {
>>>>>>        const struct dmi_system_id *dmi_entry;
>>>>>> @@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>>>>>>   static struct platform_driver ayaneo_platform_driver = {
>>>>>>        .driver = {
>>>>>>                .name = "ayaneo-ec",
>>>>>> +             .dev_groups = ayaneo_ec_groups,
>>>>>>        },
>>>>>>        .probe = ayaneo_ec_probe,
>>>>>>   };
>>>>>>
>>>>> -- 
>>>>>   i.
>>>>>
>>>>>
>>

