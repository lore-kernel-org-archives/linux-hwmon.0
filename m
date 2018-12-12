Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Wed, 12 Dec 2018 11:33:52 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Ranran <ranshalit@gmail.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: How to detect which device is mapped to hwmonX ?
Message-ID: <20181212113352.6ea13059@endymion>
In-Reply-To: <CAJ2oMhKE1fQStNKiEUgH3UNhJDVr88A2kDgAUY8QhaSuU=B6Ow@mail.gmail.com>
References: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
	<20181211211318.GA3004@roeck-us.net>
	<CAJ2oMhKE1fQStNKiEUgH3UNhJDVr88A2kDgAUY8QhaSuU=B6Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 12 Dec 2018 10:54:19 +0200, Ranran wrote:
> On Tue, Dec 11, 2018 at 11:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Tue, Dec 11, 2018 at 10:30:58PM +0200, Ranran wrote:  
> > > Hello,
> > >
> > > I have several nodes /sys/class/hwmon/hwmonX ,
> > > but checking the fields I could not find yet a way how to identify a
> > > device (for example i2c address) to the given mapping of hwmonX.
> > >
> > > Is there a way to find out which device is mapped to which hwmonX ?
> > >  
> >
> > Maybe libsensors would work for you ?
> >  
> Thanks , I will check that.
> But I was looking for something to check in /sys or /proc to get the matching.
> Probably if libsensor somehow knows the mapping it also looks there, No ?

libsensors looks in /sys indeed but it's not trivial and libsensors
does not offer an API for it. I remember writing a libsensors-based
name look-up tool years ago. I'm a bit in a hurry but I have copied
what I have at:

http://jdelvare.nerim.net/devel/lm-sensors/patches/

Maybe we can revive the idea if there is a need.

-- 
Jean Delvare
SUSE L3 Support
