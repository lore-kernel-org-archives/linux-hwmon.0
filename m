Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:34825 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752748AbcKCHft (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Nov 2016 03:35:49 -0400
Received: by mail-yw0-f195.google.com with SMTP id h14so1318888ywa.2
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Nov 2016 00:35:48 -0700 (PDT)
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <20161102224807.GA5653@roeck-us.net>
References: <20161004235102.GA1055@roeck-us.net> <CAN8YU5Oemez-ovyGhmWR0y7D7UUnzuGYjSLTO607U8wrg36F4Q@mail.gmail.com>
 <246c105a-1cad-6b58-dd43-cbfc6a9f87d6@roeck-us.net> <CAN8YU5N7NEg8DH8VGrwP1-AJhfHO_Mj_3NSJahZU08ZLthsDFA@mail.gmail.com>
 <41a63728-762b-8336-823a-17db3522aabd@roeck-us.net> <CAN8YU5PsUDCJ8MhQPusgUfgHg6cN25O2-BYc-KTYrbv6cHDfLw@mail.gmail.com>
 <20161102224807.GA5653@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Thu, 3 Nov 2016 08:35:27 +0100
Message-ID: <CAN8YU5Pi0+m9d6maAYbmxn9wgkFg2hohjoHi32VCRk03YuEy_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 2, 2016 at 11:48 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Nov 02, 2016 at 09:11:35AM +0100, Andrea Merello wrote:
>> On Mon, Oct 31, 2016 at 5:18 PM, Guenter Roeck <linux@roeck-us.net> wrot=
e:
>> > On 10/31/2016 08:27 AM, Andrea Merello wrote:
>> >
>> >>>>
>> >>>>>> +     if (ret < 0)
>> >>>>>> +             return ret;
>> >>>>>> +
>> >>>>>> +     priv->max_alert =3D priv->max_alert || !!(ret &
>> >>>>>> STTS751_STATUS_TRIPH);
>> >>>>>> +     priv->min_alert =3D priv->min_alert || !!(ret &
>> >>>>>> STTS751_STATUS_TRIPL);
>> >>>>>> +
>> >>>>>
>> >>>>>
>> >>>>> I am not really happy about the caching of alert values. This isn'=
t
>> >>>>> really
>> >>>>> common. Usually we report current alert values when reading. I don=
't
>> >>>>> really
>> >>>>> see why this driver should be different to all the others.
>> >>>>
>> >>>>
>> >>>>
>> >>>> OK
>> >>
>> >>
>> >> I've tried to avoid caching, but as soon as I read the status registe=
r
>> >> in the alert handler, the device clears that reg, and it will remain
>> >> cleared up to the next conversion.
>> >>
>> >> So for example if the reader is blocked on poll over the alert
>> >> attribute, it gets unblocked on alert, and it will very likely read
>> >> zero..
>> >>
>> >> The only way I can see for avoiding caching, and for changing the API
>> >> about clearing events as you asked below, is performing a temperature
>> >> read from the temperature registers and doing software compare with
>> >> the limits in show_[max/min]_alert.
>> >>
>> >> Does this sounds OK for you ?
>> >>
>> >
>> > Not really. That could be done from user space by just reading the
>> > temperature
>> > and comparing it against limits.
>>
>> Sorry, I don't see the point here.. Why the fact that something could
>> be done in userspace should suggest we don't want to do it in the
>> driver? We do, for example, a simple calculation to give an absolute
>> value for the hysteresis; we could do this also in userspace, but we
>> do this in the driver in order to support the proper API..
>>
> Datasheet says:
>
> T HIGH : [6] Bit =3D 1 indicates temperature high limit has been exceeded=
 (T A >
> high limit). T HIGH is cleared when the status register is read, provided
> the condition no longer exists.
> T LOW : [5] Bit =3D 1 indicates the is at or below the low limit (T A =E2=
=89=A4 low
> limit). T LOW is cleared when the status register is read, provided the
> condition no longer exists.
>
> This isn't exactly what you are claiming, since it says "cleared ... prov=
ided
> that the condition no longer exists", which would be more in line with ot=
her
> chips.

Yes, I know.. I've also read that on the datasheet.. And I tried
reading the status register in both the alert handler and the show
function, but it didn't worked :/

So I started to suspect the status register got actually clear after
reading up to the next conversion, and to test this, I simply read it
twice in the alert handler. The first read always read 1, as expected;
the second time I always got zero, even if the temperature was still
over-limit.. And I soon got another event, that behaved in the same
manner.

(also I'm thinking about a way to mask events once we know that we are
in a out-of-limit condition, to avoid having a lot of them, but simply
disabling events and re-enabling them after userspace reads the alarm
and find it to be zero, like lm90 driver does, IMHO wouldn't be good
here, because we have a single bit to disable both high and low
limits..)

> The THRM bit doesn't seem to self-clean either, at least not according to=
 the
> datasheet.

I need to test this.. But this doesn't generate any event, it seems
only inteded to drive an external circuit, say a fan, and not to
notify SW.. And currently I even have no show function to read it's
status (now that I'm on it, I think I should add it...)..

If I add it, and this func reads the status reg, then it will end up
in racy clears of the other high/low event bits anyway, since it's all
in the same reg..

Indeed it seems to me that we can rely on chip automatism only for
alarm event generation. And I don't see all that advantage in relying
on HW comparators for reporting alarms in the show functions; IMHO
there we can do our comparisons in SW without any real issue..

>
> This means I'll need to get a sample and/or eval board to test this mysel=
f.

If you want to write your own tests, I will be happy to make them run
on my board and give you the results back. Just pass me the test code
:)

> Guenter
>
>> > If the chip clears the alert bit on read, why would you need a set att=
ribute
>> > to clear it ?
>>
>> That was used to clear the cached value, not the chip reg.
>>
>> > From what you are saying, the next alert should update all
>> > alert bits, meaning they would be auto-updated at that time. User spac=
e
>> > would then always read the current state.
>> >
>> > Sure, you would cache the value
>> > in the alert function to be able to read it in the read function, but =
I
>> > don't see why all the complexity around it in your code would be neede=
d.
>>
>> The next alert is, by definition, an alert, so it will always update
>> the cached value with a '1'. We don't have anything that tell us when
>> the alert is gone. No one would clear the cached value with '0' when
>> the alert is gone. (ok, we have two alert bits, so the _other_ one of
>> them will be set to zero, but that's not the point)..
>>
>> So, in order to report the current alarm value, without relying to the
>> user to clear it, as you asked for, caching seems not an option..
>>
>>
>> > You might want to update the alert status in case there is no interrup=
t
>> > support, though (maybe you do already; I didn't re-check the code).
>>
>> OK, good point, I'll make sure it works event in this case.
>>
>> > The 'sensors' code doesn't know that it is supposed to write into the
>> > alert attribute to clear the status, thus unless you have a special
>> > application, an alert would never be cleared. That doesn't sound very
>> > appealing to me.
>>
>> So, OK to change the API as you said, however I don't see how this can
>> be done except for doing the manual temperature/limit comparison in
>> the driver:
>>
>> When you get into show_[max/min]_alert function you can't rely on
>> reading the status register (because as I said in my prev mail it
>> could have been just cleared by reading it in the event handler), but
>> as I explained above it seems to me that you cannot also rely on a
>> value cached in the event handler with this API, because no one will
>> ever clear it..
>>
>> In other words you will see a status register that could be zero even
>> when we have the alarm, or a cached value that is still 1 even if the
>> alarm has gone time ago.. I could clear the cached value in the
>> show_[max/min]_alert function itself, but this doesn't seems enough to
>> me for reporting to the userspace the _current_ alarm value, as you
>> asked for.
>>
>> Or am I missing something ?
>>
>> >
>> >>>>
>> >>>>>> +     return 0;
>> >>>>>> +}
>> >>>>>> +
>> >>>>>> +static void stts751_alert(struct i2c_client *client,
>> >>>>>> +                     enum i2c_alert_protocol type, unsigned int =
data)
>> >>>>>> +{
>> >>>>>> +     int ret;
>> >>>>>> +     struct stts751_priv *priv =3D i2c_get_clientdata(client);
>> >>>>>> +     bool prev_max =3D priv->max_alert;
>> >>>>>> +     bool prev_min =3D priv->min_alert;
>> >>>>>> +
>> >>>>>> +     if (type !=3D I2C_PROTOCOL_SMBUS_ALERT)
>> >>>>>> +             return;
>> >>>>>> +
>> >>>>>> +     dev_dbg(&client->dev, "alert!");
>> >>>>>> +
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> Any chance to make this a bit more generic and also support
>> >>>>> interrupts ?
>> >>>>
>> >>>>
>> >>>>
>> >>>> May you please elaborate?
>> >>>>
>> >>>> IMHO adding the logic for handling SMBus alerts using IRQs to any
>> >>>> HWmon driver is redundant, because it is already implemented in the
>> >>>> SMBus layer, just right now you need patching SMBus layer for enabl=
ing
>> >>>> it from the DT world (a couple of patches for this are floating
>> >>>> around, but they seems not ready for merge yet)... Using this chip
>> >>>> with a generic interrupt is indeed exactly what I'm doing..
>> >>>>
>> >>>> .. Or am I completely missing your point ?
>> >>>>
>> >>> "just right now you need patching SMBus layer for enabling it from t=
he DT
>> >>> world"
>> >>>
>> >>> So it _doesn't_ work, correct ?
>> >>
>> >>
>> >> I mean, the generic smbus code works for stts751, and the chip seems
>> >> happy. So, in this case, no need to reimplement it elsewhere. It woul=
d
>> >> just end up to be a copy-paste from smbus.c.... Just AFAICT we need
>> >> some mechanism to hook smbus code from DT world..
>> >>
>> >
>> > Ok, then let's just go with it. If it doesn't work in some application=
 we'll
>> > have to fix it up later.
>> >
>> >
>> >>>>>> +
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL=
, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min, S_IWUSR | S_IRUGO,
>> >>>>>> +                     show_min, set_min, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max, S_IWUSR | S_IRUGO,
>> >>>>>> +                     show_max, set_max, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min_alert, S_IWUSR | S_IRU=
GO,
>> >>>>>> +                     show_min_alert, set_min_alert, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max_alert, S_IWUSR | S_IRU=
GO,
>> >>>>>> +                     show_max_alert, set_max_alert, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_therm, S_IWUSR | S_IRUGO, show_t=
herm,
>> >>>>>> +                     set_therm, 0);
>> >>>>>> +static SENSOR_DEVICE_ATTR(temp1_therm_hyst, S_IWUSR | S_IRUGO,
>> >>>>>> show_hyst,
>> >>>>>> +                     set_hyst, 0);
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> Please use standard attribute names.
>> >>>>
>> >>>>
>> >>>>
>> >>>> I can convert the event stuff in temp1_[min/max]_alarm for limits a=
nd
>> >>>> temp1_alarm for the flag, but it's not obvious to be what should I =
use
>> >>>> for the therm stuff.. May you please give me advices about this?
>> >>>>
>> >>>> I'd propose temp1_therm_[max/min]_hyst, but they seems not standard
>> >>>> anyway...
>> >>>>
>> >>>
>> >>> From the chip datasheet, this is supposed to reflect overtemperature
>> >>> conditions,
>> >>> stronger than high/low, thus 'crit' seems appropriate.
>> >>
>> >>
>> >> I see.. I can go with 'crit' :)
>> >>
>> >> Just is there any place where I can document this? Despite the
>> >> datasheet, I can easily imagine real-world usage scenarios, for
>> >> example driving a fan from that signal, where 'crit' might be not so
>> >> intuitive.. Indeed I would like to make it visible the 'crit'
>> >> <->'therm' binding to users. Maybe an additional attribute
>> >> 'temp1_crit_label' or something like that ?
>> >>
>> > You are supposed to provide Documentation/hwmon/stts751, which would
>> > include such information.
>> >
>> > A label applies to a sensor, not to a sensor attribute, so that would
>> > not be appropriate.
>>
>> OK to provide it, but it would be in kernel source tree. Any further
>> hint that we could give to someone that looks at in /sys ?
>>
>> > Thanks,
>> > Guenter
>> >
