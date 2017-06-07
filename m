Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41163 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751433AbdFGRhz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2017 13:37:55 -0400
Date: Wed, 7 Jun 2017 10:37:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>,
        Matthew Barth <msbarth@linux.vnet.ibm.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Timothy Pearson <tpearson@raptorengineering.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
Message-ID: <20170607173752.GA7167@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
 <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
 <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
 <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
 <1496817906.8159.31.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496817906.8159.31.camel@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 07, 2017 at 04:15:06PM +0930, Andrew Jeffery wrote:
> On Wed, 2017-06-07 at 12:18 +0930, Joel Stanley wrote:
> > On Wed, Jun 7, 2017 at 1:50 AM, Matthew Barth
> > > <msbarth@linux.vnet.ibm.com> wrote:
> > > 
> > > On 06/06/17 8:33 AM, Guenter Roeck wrote:
> > > > 
> > > > On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
> > > > > Over and above the features of the original patch is support for a
> > > > > secondary
> > > > > rotor measurement value that is provided by MAX31785 chips with a revised
> > > > > firmware. The feature(s) of the firmware are determined at probe time and
> > > > > extra
> > > > > attributes exposed accordingly. Specifically, the MFR_REVISION 0x3040 of
> > > > > the
> > > > > firmware supports 'slow' and 'fast' rotor reads. The feature is
> > > > > implemented by
> > > > > command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (with the
> > > > > 'fast'
> > > > > measurement in the second word) rather than the 2-bytes response in the
> > > > > original firmware (MFR_REVISION 0x3030).
> > > > > 
> > > > 
> > > > Taking the pmbus driver question out, why would this warrant another
> > > > non-standard
> > > > attribute outside the ABI ? I could see the desire to replace the 'slow'
> > > > access
> > > > with the 'fast' one, but provide two attributes ? No, I don't see the
> > > > point, sorry,
> > > > even more so without detailed explanation why the second attribute in
> > > > addition
> > > > to the first one would add any value.
> > > 
> > > In the case of counter-rotating(CR) fans which contain two rotors to provide
> > > more airflow there are then two tach feedbacks. These CR fans take a single
> > > target speed and provide individual feedbacks for each rotor contained
> > > within the fan enclosure. Providing these individual feedbacks assists in
> > > fan fault driven speed changes, improved thermal characterization among
> > > other things.
> > > 
> > > Maxim provided this as a 'slow' / 'fast' set of bytes to be user
> > > compatible(so the 'slow' rotor speed, regardless of which rotor, is in the
> > > first 2 bytes with the 'slow' version of firmware as well). In some cases,
> > > mfg systems could have a mix of these revisions.
> > 
> > Andrew, instead of creating the _fast sysfs nodes, I think you could
> > expose the extra rotors are separate fan devices in sysfs. This would
> > not introduce new ABI.
> 
> I considered this approach: I debated whether to consider the fan unit
> as a single entity with two inputs, or just separate fans, and ended up
> leaning towards the former. To go the latter path we need to consider
> whether or not to expose the writeable properties for the second input
> (given they also affect the first) and how to sensibly arrange the
> pairs given the functionality is determined at probe-time. Not rocket
> science but decisions we need to make.
> 

There are many other examples with one writeable and multiple readable
attributes. Temperature offset attributes are an excellent example.
Next question would be what exactly would be writable. pwm attributes are
commonly completely independent of fan attributes. pwm1 output doesn't
mean that fan1 is the matching input; in fact, most of the time it isn't.
The only question would be numbering (is the pair numbered fan1/2 or
fan1/fan(1+X) ?) which is just a matter of personal preference. However,
everything is better than coming up with non-standard attributes which
can not be used with any standard application beyond the application of the
person submitting the driver. It is bad enough if a non-standard attribute
describes something really driver specific. But a non-standard attribute
for a fan speed reading ? Please no. We don't use outX_output instead of
inX_input for voltage outputs either.

Guenter

> There's also the issue that the physical fan that each element of an
> input pair represents will change as the fan speeds vary, based on the
> behaviour that Matt outlined. I don't feel this maps well onto the
> expectations of the sysfs interface, but then I'm not sure there's much
> we can do to alleviate it either other than designating one of the
> input attributes of a fan pair as the fastest input.
> 
> Regardless, I'll look into it in the anticipation that this is a viable
> way forward.
> 
> Cheers,
> 
> Andrew


