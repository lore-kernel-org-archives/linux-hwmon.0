Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57793 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754087AbdEJUJx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 May 2017 16:09:53 -0400
Date: Wed, 10 May 2017 13:09:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tommi Rantala <tt.rantala@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Handle frozen hotplug state correctly
Message-ID: <20170510200946.GB5628@roeck-us.net>
References: <alpine.DEB.2.20.1705101624460.1979@nanos>
 <CA+ydwtqrZ0GVN24M8zEZhWuTqvRASpqSHTYWfoDrTHFAJZGp5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+ydwtqrZ0GVN24M8zEZhWuTqvRASpqSHTYWfoDrTHFAJZGp5Q@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, May 10, 2017 at 10:16:33PM +0300, Tommi Rantala wrote:
> 2017-05-10 17:30 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> > The recent conversion to the hotplug state machine missed that the original
> > hotplug notifiers did not execute in the frozen state, which is used on
> > suspend on resume.
> >
> > This does not matter on single socket machines, but on multi socket systems
> > this breaks when the device for a non-boot socket is removed when the last
> > CPU of that socket is brought offline. The device removal locks up the
> > machine hard w/o any debug output.
> >
> > Prevent executing the hotplug callbacks when cpuhp_tasks_frozen is true.
> >
> > Thanks to Tommi for providing debug information patiently while I failed to
> > spot the obvious.
> >
> > Fixes: e00ca5df37ad ("hwmon: (coretemp) Convert to hotplug state machine")
> > Reported-by: Tommi Rantala <tt.rantala@gmail.com>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Many thanks, I can confirm that it works well!
> 
Ok if I add your Tested-by: ?

Thanks,
Guenter

> -Tommi
> 
> > ---
> >  drivers/hwmon/coretemp.c |   14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > --- a/drivers/hwmon/coretemp.c
> > +++ b/drivers/hwmon/coretemp.c
> > @@ -605,6 +605,13 @@ static int coretemp_cpu_online(unsigned
> >         struct platform_data *pdata;
> >
> >         /*
> > +        * Don't execute this on resume as the offline callback did
> > +        * not get executed on suspend.
> > +        */
> > +       if (cpuhp_tasks_frozen)
> > +               return 0;
> > +
> > +       /*
> >          * CPUID.06H.EAX[0] indicates whether the CPU has thermal
> >          * sensors. We check this bit only, all the early CPUs
> >          * without thermal sensors will be filtered out.
> > @@ -654,6 +661,13 @@ static int coretemp_cpu_offline(unsigned
> >         struct temp_data *tdata;
> >         int indx, target;
> >
> > +       /*
> > +        * Don't execute this on suspend as the device remove locks
> > +        * up the machine.
> > +        */
> > +       if (cpuhp_tasks_frozen)
> > +               return 0;
> > +
> >         /* If the physical CPU device does not exist, just return */
> >         if (!pdev)
> >                 return 0;
