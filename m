Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <20161104160141.GA28466@roeck-us.net>
References: <246c105a-1cad-6b58-dd43-cbfc6a9f87d6@roeck-us.net>
 <CAN8YU5N7NEg8DH8VGrwP1-AJhfHO_Mj_3NSJahZU08ZLthsDFA@mail.gmail.com>
 <41a63728-762b-8336-823a-17db3522aabd@roeck-us.net> <CAN8YU5PsUDCJ8MhQPusgUfgHg6cN25O2-BYc-KTYrbv6cHDfLw@mail.gmail.com>
 <20161102224807.GA5653@roeck-us.net> <CAN8YU5Pi0+m9d6maAYbmxn9wgkFg2hohjoHi32VCRk03YuEy_A@mail.gmail.com>
 <20161103211612.GB25939@roeck-us.net> <CAN8YU5P6po9drKjvGb=RLU=fKDNCAXeFp-9LuY5CF5jfnYW6Tg@mail.gmail.com>
 <20161104150942.GA12009@roeck-us.net> <CAN8YU5O5n6b6r3DenzDf9BRDQ=9w=Q2+957nKTXjDhFsav=e=g@mail.gmail.com>
 <20161104160141.GA28466@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Wed, 9 Nov 2016 08:09:44 +0100
Message-ID: <CAN8YU5MzmauC8z+EqKxzZqsxCr2OGSku3Zt8AH6WY_wZvxvkJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Nov 4, 2016 at 5:01 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Nov 04, 2016 at 04:43:46PM +0100, Andrea Merello wrote:
>> On Fri, Nov 4, 2016 at 4:09 PM, Guenter Roeck <linux@roeck-us.net> wrote=
:
>> > On Fri, Nov 04, 2016 at 09:24:25AM +0100, Andrea Merello wrote:
>> >> On Thu, Nov 3, 2016 at 10:16 PM, Guenter Roeck <linux@roeck-us.net> w=
rote:
>> >> > On Thu, Nov 03, 2016 at 08:35:27AM +0100, Andrea Merello wrote:
>> >> >> On Wed, Nov 2, 2016 at 11:48 PM, Guenter Roeck <linux@roeck-us.net=
> wrote:
>> >> >> > On Wed, Nov 02, 2016 at 09:11:35AM +0100, Andrea Merello wrote:
>> >> >> >> On Mon, Oct 31, 2016 at 5:18 PM, Guenter Roeck <linux@roeck-us.=
net> wrote:
>> >> >> >> > On 10/31/2016 08:27 AM, Andrea Merello wrote:
>> >> >> >> >
>> >> >> >> >>>>
>> >> >> >> >>>>>> +     if (ret < 0)
>> >> >> >> >>>>>> +             return ret;
>> >> >> >> >>>>>> +
>> >> >> >> >>>>>> +     priv->max_alert =3D priv->max_alert || !!(ret &
>> >> >> >> >>>>>> STTS751_STATUS_TRIPH);
>> >> >> >> >>>>>> +     priv->min_alert =3D priv->min_alert || !!(ret &
>> >> >> >> >>>>>> STTS751_STATUS_TRIPL);
>> >> >> >> >>>>>> +
>> >> >> >> >>>>>
>> >> >> >> >>>>>
>> >> >> >> >>>>> I am not really happy about the caching of alert values. =
This isn't
>> >> >> >> >>>>> really
>> >> >> >> >>>>> common. Usually we report current alert values when readi=
ng. I don't
>> >> >> >> >>>>> really
>> >> >> >> >>>>> see why this driver should be different to all the others=
.
>> >> >> >> >>>>
>> >> >> >> >>>>
>> >> >> >> >>>>
>> >> >> >> >>>> OK
>> >> >> >> >>
>> >> >> >> >>
>> >> >> >> >> I've tried to avoid caching, but as soon as I read the statu=
s register
>> >> >> >> >> in the alert handler, the device clears that reg, and it wil=
l remain
>> >> >> >> >> cleared up to the next conversion.
>> >> >> >> >>
>> >> >> >> >> So for example if the reader is blocked on poll over the ale=
rt
>> >> >> >> >> attribute, it gets unblocked on alert, and it will very like=
ly read
>> >> >> >> >> zero..
>> >> >> >> >>
>> >> >> >> >> The only way I can see for avoiding caching, and for changin=
g the API
>> >> >> >> >> about clearing events as you asked below, is performing a te=
mperature
>> >> >> >> >> read from the temperature registers and doing software compa=
re with
>> >> >> >> >> the limits in show_[max/min]_alert.
>> >> >> >> >>
>> >> >> >> >> Does this sounds OK for you ?
>> >> >> >> >>
>> >> >> >> >
>> >> >> >> > Not really. That could be done from user space by just readin=
g the
>> >> >> >> > temperature
>> >> >> >> > and comparing it against limits.
>> >> >> >>
>> >> >> >> Sorry, I don't see the point here.. Why the fact that something=
 could
>> >> >> >> be done in userspace should suggest we don't want to do it in t=
he
>> >> >> >> driver? We do, for example, a simple calculation to give an abs=
olute
>> >> >> >> value for the hysteresis; we could do this also in userspace, b=
ut we
>> >> >> >> do this in the driver in order to support the proper API..
>> >> >> >>
>> >> >> > Datasheet says:
>> >> >> >
>> >> >> > T HIGH : [6] Bit =3D 1 indicates temperature high limit has been=
 exceeded (T A >
>> >> >> > high limit). T HIGH is cleared when the status register is read,=
 provided
>> >> >> > the condition no longer exists.
>> >> >> > T LOW : [5] Bit =3D 1 indicates the is at or below the low limit=
 (T A =E2=89=A4 low
>> >> >> > limit). T LOW is cleared when the status register is read, provi=
ded the
>> >> >> > condition no longer exists.
>> >> >> >
>> >> >> > This isn't exactly what you are claiming, since it says "cleared=
 ... provided
>> >> >> > that the condition no longer exists", which would be more in lin=
e with other
>> >> >> > chips.
>> >> >>
>> >> >> Yes, I know.. I've also read that on the datasheet.. And I tried
>> >> >> reading the status register in both the alert handler and the show
>> >> >> function, but it didn't worked :/
>> >> >>
>> >> >> So I started to suspect the status register got actually clear aft=
er
>> >> >> reading up to the next conversion, and to test this, I simply read=
 it
>> >> >> twice in the alert handler. The first read always read 1, as expec=
ted;
>> >> >> the second time I always got zero, even if the temperature was sti=
ll
>> >> >> over-limit.. And I soon got another event, that behaved in the sam=
e
>> >> >> manner.
>> >> >>
>> >> > Question is if the event bit is set again after the next conversion=
; this would
>> >> > be relatively easy to handle (cache the status register for one con=
version
>> >> > time).
>> >>
>> >> Yes, I meant the HW does exactly this. But it seems to me that cachin=
g
>> >> could end up in subtle races here..
>> >>
>> >> For example suppose that user is reading the lower limit alarm file,
>> >> or therm, and this will trigger read of the status reg; but a
>> >> conversion is just ended and set the high limit alarm just before
>> >> reading the status reg. Then the event handler is invoked but it will
>> >> find out the status reg to be (incorrectly) zero, (or rely on a value
>> >> cached when reading the lower limit, that was zero); thus a thread
>> >> blocked on poll on the high alarm would not be woken up. (ok, this
>> >> probably will happen in next conversions, but this doesn't sound quit=
e
>> >> sane to me..).
>> >>
>> > Good catch and thinking, but there is a workaround. If the cache time
>> > has not expired, just logically or the cached status value with the cu=
rrent
>> > value in the alert function, and update the time stamp. This way nothi=
ng
>> > gets lost.
>>
>> Hmm, it seems OK; thanks for suggesting this :) I'll try to go this way.=
.
>>
>> BTW I would say that the cache time for the alert should be
>> coservatively a bit longer than the conversion time (to avoid early
>> expiration when the status register has been not restored yet). On the
>> other hand for the temperature reading I'm using a cache time that is
>> shorter (I think it is 1/4) than the conversion interval, so that the
>> user gets a reasonably fresh value (becasue the chip sampling freq is
>> asyncrhronous wrt the reads we do). Do you think it's worth to keep
>> doing this (so we have two different cache time for alarms and temp
>> value), or do you think that it's pointless, and better to unify it
>> (at the longer one, I would say)?
>>
>
> I would suggest to use a single cache time, in line with the real cache t=
ime,
> using the maximum as per the datasheet and possibly rounded up. If the us=
er
> wants faster readings, that can be made configurable using the 'update-in=
terval'
> attribute. If the chip is configured to only read the temperature once pe=
r,
> say, 16 seconds, this is what the user wanted, and real-time accuracy is =
not
> guaranteed anyway.

Ok, I'll come back with a new version of the patch changed as discussed.

Thanks
Andrea

>
>> >>
>> >> >> (also I'm thinking about a way to mask events once we know that we=
 are
>> >> >> in a out-of-limit condition, to avoid having a lot of them, but si=
mply
>> >> >> disabling events and re-enabling them after userspace reads the al=
arm
>> >> >> and find it to be zero, like lm90 driver does, IMHO wouldn't be go=
od
>> >> >> here, because we have a single bit to disable both high and low
>> >> >> limits..)
>> >> >>
>> >> >> > The THRM bit doesn't seem to self-clean either, at least not acc=
ording to the
>> >> >> > datasheet.
>> >> >>
>> >> >> I need to test this.. But this doesn't generate any event, it seem=
s
>> >> >> only inteded to drive an external circuit, say a fan, and not to
>> >> >> notify SW.. And currently I even have no show function to read it'=
s
>> >> >> status (now that I'm on it, I think I should add it...)..
>> >> >>
>> >> > Yes. Note that this pin might be wired to an interrupt.
>> >>
>> >> IMHO it isn't straightforward to handle this..
>> >>
>> >> AFAIK what is done by the smbus code to allow handling smbus events
>> >> lines with regular interrupt lines is to briefly disabling the IRQ
>> >> line until the event can be acknowledged with the ARA (in non atomic
>> >> context).
>> >>
>> >> But here is even worse because there is no ARA; it seems that the
>> >> therm line can't be "cleared" at all.
>> >>
>> >> Maybe it's possible to do hacks similar to what the smbus code does,
>> >> but keeping the IRQ line disabled (given that it must not be shared).=
.
>> >> Maybe if the IRQ controller could be set in edge-triggered mode it
>> >> would be easier..
>> >>
>> >> But does it really worth struggling supporting this scenario? There's
>> >> the event pin explicitly designed for events, and there is code that
>> >> make it possible to use this even with regular IRQs.. Using also the
>> >> therm pin as interrupt seems honestly a bit pointless and
>> >> inappropriate..
>> >>
>> > Correct, one would use an edge triggered interrupt in this case. But
>> > you are right, this should only be implemented if that use case is
>> > actually encountered.
>> >
>> > Thanks,
>> > Guenter
