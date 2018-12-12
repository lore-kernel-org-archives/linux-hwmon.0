Return-Path: <ranshalit@gmail.com>
Return-path: <ranshalit@gmail.com>
MIME-Version: 1.0
References: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
 <20181211211318.GA3004@roeck-us.net>
In-Reply-To: <20181211211318.GA3004@roeck-us.net>
From: Ranran <ranshalit@gmail.com>
Date: Wed, 12 Dec 2018 10:54:19 +0200
Message-ID: <CAJ2oMhKE1fQStNKiEUgH3UNhJDVr88A2kDgAUY8QhaSuU=B6Ow@mail.gmail.com>
Subject: Re: How to detect which device is mapped to hwmonX ?
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Dec 11, 2018 at 11:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Dec 11, 2018 at 10:30:58PM +0200, Ranran wrote:
> > Hello,
> >
> > I have several nodes /sys/class/hwmon/hwmonX ,
> > but checking the fields I could not find yet a way how to identify a
> > device (for example i2c address) to the given mapping of hwmonX.
> >
> > Is there a way to find out which device is mapped to which hwmonX ?
> >
>
> Maybe libsensors would work for you ?
>
Thanks , I will check that.
But I was looking for something to check in /sys or /proc to get the matching.
Probably if libsensor somehow knows the mapping it also looks there, No ?

> Guenter
