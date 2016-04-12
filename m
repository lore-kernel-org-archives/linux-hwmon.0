Return-path: <jic23@jic23.retrosnub.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Apr 2016 09:52:42 +0100
From: jic23@jic23.retrosnub.co.uk
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Andrew F. Davis" <afd@ti.com>, Jonathan Cameron <jic23@kernel.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald <pmeerw@pmeerw.net>, Marc Titinger <mtitinger@baylibre.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare
 <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] iio: adc: Add driver for the TI INA3221 Triple
 Current/Voltage Monitor
In-Reply-To: <e5bf29a1db784fa428235b59b812d666@jic23.retrosnub.co.uk>
References: <1460139580-11865-1-git-send-email-afd@ti.com>
 <570A3FB2.7000600@kernel.org> <570BC74B.3000208@ti.com>
 <20160411163843.GA27218@roeck-us.net> <570BD530.8060508@ti.com>
 <20160411180839.GA10942@roeck-us.net>
 <e5bf29a1db784fa428235b59b812d666@jic23.retrosnub.co.uk>
Message-ID: <407039041933d24868e518f277f6d277@jic23.retrosnub.co.uk>
List-ID: <linux-hwmon@vger.kernel.org>

On 12.04.2016 09:34, jic23@jic23.retrosnub.co.uk wrote:
> On 11.04.2016 19:08, Guenter Roeck wrote:
>> On Mon, Apr 11, 2016 at 11:47:44AM -0500, Andrew F. Davis wrote:
>>> On 04/11/2016 11:38 AM, Guenter Roeck wrote:
>>> > On Mon, Apr 11, 2016 at 10:48:27AM -0500, Andrew F. Davis wrote:
>>> >> On 04/10/2016 06:57 AM, Jonathan Cameron wrote:
>>> >>> On 08/04/16 19:19, Andrew F. Davis wrote:
>>> >>>> The INA3221 is a three-channel, high-side current and bus voltage monitor
>>> >>>> with an I2C and SMBUS compatible interface.
>>> >>>>
>>> >>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> >>> Hi Andrew,
>>> >>>
>>> >>> My immediate thought on this one is whether it would be better off in hwmon.
>>> >>> I'm not convinced either way from a quick glance at the data sheet, but the
>>> >>> question needs to be addressed.
>>> >>>
>>> >>
>>> >> I was on the fence with this also, I was leaning towards hwmod until I
>>> >> looked onto how the ina2xx driver has been ported to iio. This is almost
>>> >> the same part but the ina3x has three monitors vs one. In addition it
>>> >> looks like NVIDIA has written a hwmod driver for this part
>>> >> (https://github.com/Bogdacutu/STLinux-Kernel/blob/master/drivers/hwmon/ina3221.c)
>>> >> but then also ported it over to IIO (although doesn't appear to be
>>> >> upstream ready or ever has been submitted for such)
>>> >> (https://github.com/SuperPichu/shield-tablet-kernel/blob/master/drivers/staging/iio/meter/ina3221.c)
>>> >> So I figured this was the way things are moving, but I have no problem
>>> >> working this as a hwmod driver. The IIO work is already done here, I'll
>>> >> write the hwmod version also but keep working this, I see no reason we
>>> >> cant have both if needed. (unless using this and just using iio_hwmod.c
>>> >> if needed is more acceptable?)
>>> >>
>>> >
>>> > You can not have both since they would conflict with each other.
>>> > ina2xx has possibly created a bad precedent. I am not inclined to accept
>>> > a hwmon driver if an iio driver already exists. If you want an iio driver,
>>> > fine with me, but then you (and its users) will have to live with its
>>> > limitations when it comes to hardware monitoring.
>>> >
>>> 
>>> Hmm, my plan was an MFD device core, that then could mediate the two
>>> sub-drivers, but I'm not sure about this yet.
>>> 
>> mfd is intended to separate multi-function devices, not multiple
>> linux subsystems accessing the same logical functionality in a chip 
>> just
>> because the subsystems don't have a means to communicate with each 
>> other.
>> I don't think using mfd for this purpose is a good idea; someone would
>> have to work hard to convince me that it is.
>> 
>>> > I don't really mind if things are going all towards iio if that is where
>>> > the community wants to go. However, if that is the case, I would suggest
>>> > that someone should spend the time to define a clear sense of 'limits'
>>> > as well as alert handling in iio, in a way that is exportable to other
>>> > subsystems (hwmon and thermal come into mind).
>>> >
>>> 
>>> I agree. I think both frameworks offer useful interfaces, so I would
>>> hate to limit users to one, but for now I'll just post the hwmon 
>>> version
>>> here in a bit and live with that until someone requests the IIO 
>>> support.
>>> 
>> Ultimately it might make sense to create a hwmon->iio bridge in the 
>> hwmon
>> core (just like it would make sense to create a hwmon->thermal 
>> bridge).
>> This way drivers could be implemented whereever it is more convenient,
>> and where the primary use case fits best. The basic idea would be for 
>> a
>> hwmon driver to register with a flag such as "register with the iio
>> subsystem as well".
>> 
>> However, that would require substantial structural changes (or call it
>> modernization) of the hwmon driver core API. Unfortunately, that is 
>> unlikely
>> to happen anytime soon - I don't have the time, and no one else seems 
>> to
>> show much interest in hwmon lately. So instead of doing that, people 
>> end up
>> writing drivers for the same chip in multiple subsystems, and end up 
>> with
>> limitations one way or another. ina2xx is a perfect example.
> The aim from the IIO side was to take a kind of different approach to 
> this.
> Original suggest was Mark Brown's (I like to blame him whenever 
> possible ;).
> His usecase was SoC ADCs where one single ADC is commonly used to do a 
> whole
> load of parallel tasks.  It's not uncommon to have one logic block 
> doing,
> touchscreen, hwmon and general purpose ADC channels.
> 
> Anyhow, what he brought up is that, as we were adding the ability to 
> have
> other consumers of IIO data in the kernel we can separate the backend 
> from
> the front end.
> 
> The backend :
> * Handles the hardware providing any of:
<sorry, managed to hit a keypress I didn't know about in my webmail>
- polled data access (possibly including faking this when the driver is 
in an
   exclusive push data mode - which is common)
- pushed data access - demuxing to consumer drivers so they only see the 
channels
   they want.
- events (not yet done) - demuxing included.
  * Doesn't provide any userspace interface at all - other than tools to 
create
    soft mappings of channel sets to client drivers.

The frontend (IIO one)
* Userspace side of things
- including say kfifo's for pushing out data.
- sysfs interfaces for polled reads
- event chardevs and buffers etc.

There are more complex cases where the split gets really tricky such as 
devices
with block based user transfers.  Those may never fit into this 
framework and
may effectively always have to have an IIO front end. We can probably 
work out
how to do this in kernel if there is ever a usecase but right now none 
of our other
likely consumers are going to want these data flows!

Thus the IIO front end is at the same level as iio-hwmon, iio-input 
perhaps
iio-thermal etc.

There are clearly several steps to do this. The current iio->hwmon 
bridge
driver was step one.

1) Event support.
2) Bindings that the device tree guys actually like (tricky!) or
3) Userspace configuration of such mappings (configfs probably? - just 
possibly
the media framework stuff...

So to take an extreme case of an typical SoC ADC we'd have data flows 
such as:
* IIO backend receiving channel setup data from IIO front end (which 
channels, events, other stuff)
* IIO backend pushing data to IIO front end
* IIO backend being pulled by IIO front end
* IIO backend pushing out of band events to IIO front end.

* IIO backend receiving channel setup data from INPUT front end (which 
channels
    + configuration - note that we'll need to work out arbitration rules 
if
    incompatible requests are made)
* IIO backend pushing data to the INPUT Front end
* IIO backend being polled by INPUT front end (unusual case probably).
* IIO backend pushing out of band events to INPUT front end (note that 
in input front
   end these will be merged back into the data stream)

* IIO backend receiving channel setup data form HWMON front end (which 
channels etc)
* IIO backend polled by the INPUT front end (usual case here)
* IIO Backend pushing out of band events to HWMON front end (which will 
typically
   cash them or fire off the relevant poll event)

If we keep it the rules simple initially this should be too hard.  Later 
one we have
stuff like different pushed data rates to different drivers to handle.

Making the IIO front end explicitly request which channels it is using 
also allows
for useful info on what is actually being used - thus we can work out if 
a channel
needs to be cached when in push mode (as it has been requested in a form 
that allows
pull and that consumer hasn't currently set up for push).

What fun,

Any volunteers? This was kind of my main target, but these days I get 
very little
actual kernel code written unfortunately...

Jonathan
> 
>> 
>> Guenter
