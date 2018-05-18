Return-Path: <rail@esenciatech.com>
Return-path: <rail@esenciatech.com>
MIME-Version: 1.0
In-Reply-To: <20180518185133.GA13888@roeck-us.net>
References: <CAOLNbFZoEfG_unGXMpT76ShEyJNpAqWVos44PNFr4v_ZzT6Lww@mail.gmail.com>
 <bded2e5b-5e38-6d15-3405-d3eee14f599d@roeck-us.net> <CAOLNbFZaKrra7Y=ZfNK_j2_H89NkWgQynU2nVsPPWbFPLJV4fw@mail.gmail.com>
 <20180518185133.GA13888@roeck-us.net>
From: Rail Shafigulin <rail@esenciatech.com>
Date: Fri, 18 May 2018 12:06:01 -0700
Message-ID: <CAOLNbFZDzg0T0_33p99=_2+HoNC3OajdA_jgX3J8J_mVp4ZkjA@mail.gmail.com>
Subject: Re: Units for measurements and page 1 temperature for LTM4676A
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, May 18, 2018 at 11:51 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, May 18, 2018 at 11:00:53AM -0700, Rail Shafigulin wrote:
>> On Wed, May 16, 2018 at 5:34 PM, Guenter Roeck <linux@roeck-us.net> wrot=
e:
>> > On 05/16/2018 02:39 PM, Rail Shafigulin wrote:
>> >>
>> >> My team is working on a custom board. We have LTM4676A on it. I'm try=
ing
>> >> to understand what are the units of measurement for a given register.=
 For
>> >> example:
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# l=
s -l
>> >> total 0
>> >> lrwxrwxrwx 1 root root    0 Apr 12 07:51 device -> ../../../1-0044
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_crit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_crit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_highest
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_lowest
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_min
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_min_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_reset_history
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_crit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_crit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_highest
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_max
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_min
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_min_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_reset_history
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_crit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_crit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_highest
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_max
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_min
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_min_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in4_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in4_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in4_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in5_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in5_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in5_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in6_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in6_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in6_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in7_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in7_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in7_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in8_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in8_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in8_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in9_input
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 in9_label
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in9_reset_history
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:51 name
>> >> drwxr-xr-x 2 root root    0 Apr 12 07:51 power
>> >> lrwxrwxrwx 1 root root    0 Apr 12 07:51 subsystem ->
>> >> ../../../../../../../../class/hwmon
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_input
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_max
>> >> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 12 07:49 uevent
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# c=
at
>> >> name
>> >> ltm4676
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# c=
at
>> >> in1_label
>> >> vin
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# c=
at
>> >> in1_input
>> >> 11953
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# c=
at
>> >> temp1_input
>> >> 40937
>> >>
>> >>
>> >> What are the units of in1_input and temp1_input? Are those milli-volt=
s
>> >> (10^-3 V) and milli-celcius (10^-3 C)? Or these are raw values and I =
need to
>> >> do a conversion?
>> >>
>> >
>> > Please read Documentation/hwmon/sysfs-interface. Are the units listed
>> > there ambiguous ?
>> Didn't look at that folder. Went for
>> https://github.com/torvalds/linux/blob/master/Documentation/hwmon/pmbus.
>> Units make sense now.
>>
>> >
>> > The values are values as measured by the chip on the chip's input pins=
.
>> >
>> > The output above is completely messed up. The chip doesn't have 9
>> > voltage sensors. I have no idea how such output would be possible,
>> > unless this is a different chip. An interesting detail is that the
>> > output below (which looks at least almost ok) is from i2c address
>> > 0x41, while the output above is from i2c address 0x44, both on the
>> > same bus. So, whatever the chips are, the output is not from the
>> > same chip. This makes it quite difficult to compare.
>> We have 4 LTM4676A installed on the board. I wanted to try different
>> drivers. Chip at address 0x41 uses pmbus driver
>> (https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/pmbus=
.c)
>> , chip at address 0x44 uses LTM 4676 driver
>> (https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/ltc29=
78.c).
>>
>> I don't know why the chip at 0x44 comes up with 9 voltage sensors. All I=
 did was
>>
>> 1. compile ltc2978.c
>> 2. insmod ltc2978.ko
>> 3. echo ltm4676 0x44 > /sys/class/i2c-adapter/i2c-1/new_device
>>
>> There is another issue. Documentation states that I'm supposed to see
>> temp1_input, temp2_input, and temp3_input
>> (https://github.com/torvalds/linux/blob/3acf4e395260e3bd30a6fa29ba7eada4=
bf7566ca/Documentation/hwmon/ltc2978#L148-L150).
>> Right now I see only temp1_input. Could this be a bug in the driver?
>>
> Sure it could be. Given the odd output with the 9 voltage sensors,
> I would suspect that this is the least of your problems, though.
> My primary suspicion is that there is a header file and/or kernel version
> mismatch, but of course that is just a very wild guess.
>
> Why do you build the file in the first place ? LTM4676 support was added
> a long time ago. If your kernel is that old that it doesn't have support
> for this chip on its own, you would probably have to backport all pmbus
> drivers, not just one.

Hmm... That's odd. We are using 4.9 kernel. Here is the output of uname -a

Linux custom-board 4.9.0-xilinx-v2017.4 #1 SMP PREEMPT Mon May 14
17:06:48 PDT 2018 armv7l armv7l armv7l GNU/Linux. When we run
menuconfig for the kernel, LTC2978 is not part of the driver list. Is
it possible that Xilinx may have forgotten to include it in their
Kernel?



>
> Guenter
>
>>
>> >
>> > Guenter
>> >
>> >> LTM4676A and LTM4676 have 2 pages for reporting READ_TEMPERATURE_1
>> >> register. How do I change a page value? The LTM4676 driver also doesn=
't seem
>> >> to be aware that there should be a READ_TEMPERATURE_2 register. At le=
ast I
>> >> don't see it in sysfs.
>> >>
>> >> I tried using a generic driver, pmbus, and here is what I got
>> >>
>> >> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0041/hwmon/hwmon0# l=
s -l
>> >> total 0
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr1_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_max_alarm
>> >> lrwxrwxrwx 1 root root    0 Apr 11 03:04 device -> ../../../1-0041
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_min
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_min_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_min
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_min_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_label
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_min
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_min_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 name
>> >> drwxr-xr-x 2 root root    0 Apr 11 03:04 power
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 power1_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 power1_label
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 power2_input
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 power2_label
>> >> lrwxrwxrwx 1 root root    0 Apr 11 03:04 subsystem ->
>> >> ../../../../../../../../class/hwmon
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_input
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit_alarm
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_input
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_max
>> >> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_max_alarm
>> >> -rw-r--r-- 1 root root 4096 Apr 11 03:04 uevent
>> >>
>> >> This one does seem to be aware that there is READ_TEMPERATURE_2 regis=
ter,
>> >> but when it comes to READ_TEMPERATURE_1 I see the same problem. How d=
o I
>> >> know for which page this is reported and what are the units?
>> >> > Any help is appreciated.
>> >>
>> >> --
>> >> Rail Shafigulin
>> >> Software Engineer
>> >> Esencia Technologies
>> >>
>> >>
>> >> *ESENCIA TECHNOLOGIES, INC.
>> >> *2350 Mission College Blvd. Suite #490
>> >> Santa Clara CA 95054
>> >> ________________________________________________________
>> >>
>> >> Phone: +1 408 736 8284 Fax: +1 408 519 3475
>> >> http://www.esenciatech.com <http://www.esenciatech.com/>|
>> >> http://www.lnttechservices.com <http://www.lnttechservices.com/>
>> >>
>> >>
>> >
>>
>>
>>
>> --
>> Rail Shafigulin
>> Software Engineer
>> Esencia Technologies
>>
>> --
>>
>>
>>
>>
>>
>>
>>
>> *ESENCIA
>> TECHNOLOGIES, INC.
>> *2350 Mission College Blvd. Suite #490
>>
>> Santa Clara CA 95054
>>
>> ________________________________________________________
>>
>> Phone: +1 408 736
>> 8284 Fax: +1 408 519 3475
>> http://www.esenciatech.com
>> <http://www.esenciatech.com/>
>> | http://www.lnttechservices.com
>> <http://www.lnttechservices.com/>
>>
>>
>>
>>



--=20
Rail Shafigulin
Software Engineer
Esencia Technologies

--=20







*ESENCIA
TECHNOLOGIES, INC.
*2350 Mission College Blvd. Suite #490

Santa Clara CA 95054

________________________________________________________

Phone: +1 408 736=20
8284 Fax: +1 408 519 3475=C2=A0
http://www.esenciatech.com=20
<http://www.esenciatech.com/>
| http://www.lnttechservices.com=20
<http://www.lnttechservices.com/>
