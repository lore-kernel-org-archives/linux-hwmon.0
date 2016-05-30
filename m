Return-path: <gabriele.mzt@gmail.com>
Subject: Re: [Experimental PATCH] dell-smm-hwmon: Add support for disabling
 automatic BIOS fan control
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463917836-12985-1-git-send-email-pali.rohar@gmail.com>
 <830c86c9-af25-b31a-0526-4c1bc0232c53@gmail.com>
 <20160530093204.GR29844@pali>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
 Andy Lutomirski <luto@kernel.org>, Jethro <xtompok@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Message-ID: <a7c67a4d-b234-d772-2035-9f854851608b@gmail.com>
Date: Mon, 30 May 2016 17:26:36 +0200
MIME-Version: 1.0
In-Reply-To: <20160530093204.GR29844@pali>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On 30/05/2016 11:32, Pali Rohár wrote:
> On Friday 27 May 2016 14:11:11 Gabriele Mazzotta wrote:
>> On 22/05/2016 13:50, Pali Rohár wrote:
>>> This patch exports standard hwmon pwmX_enable sysfs attribute for enabling
>>> or disabling automatic fan control by BIOS. Standard value "1" is for
>>> disabling automatic BIOS fan control and value "2" for enabling.
>>>
>>> Currently there is no way to check if BIOS auto mode is enabled (at least
>>> it is not know how to do it), so hwmon sysfs attribute is write-only.
>>>
>>> By default BIOS auto mode is enabled by laptop firmware.
>>>
>>> When BIOS auto mode is enabled, custom fan speed value (set via hwmon pwmX
>>> sysfs attribute) is overwritten by SMM in few seconds and therefore any
>>> custom settings are without effect. So this is reason why implementing
>>> option for disabling BIOS auto mode is needed.
>>>
>>> So finally this patch allows kernel to set and control fan speed on
>>> laptops, but it can be dangerous (like setting speed of other fans).
>>>
>>> This new feature is highly experimental, uses Dell SMM calls, so does not
>>> have to be supported by all laptops BIOSes. It was tested on Dell Latitude
>>> E6440 with BIOS A5.
>>
>> Tested on a Dell XPS13 9333. Changing the value of pwm1_enable appears
>> to have no effect here.
> 
> Can you check what i8k_enable_fan_auto_mode() returns? Error code or not?

No error. However, independently on the value I set, the BIOS always
overrides the speed of the fan.
