Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:38904 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbdILTVX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Sep 2017 15:21:23 -0400
Received: by mail-pg0-f49.google.com with SMTP id v66so22991325pgb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Sep 2017 12:21:22 -0700 (PDT)
Date: Tue, 12 Sep 2017 12:21:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
        Kun Yi <kunyi@google.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
Message-ID: <20170912192117.GA28181@roeck-us.net>
References: <20170911224155.146738-1-venture@google.com>
 <CACPK8Xedi=nffTNUFOrdzKdNc9EXbwVi_dGK6fYZCB_-6ANiTg@mail.gmail.com>
 <CAO=notx_s9wYV2W7MXdXesmF_4icqur8UuTH5=vi2ctOWB8aGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notx_s9wYV2W7MXdXesmF_4icqur8UuTH5=vi2ctOWB8aGw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 06:41:56PM -0700, Patrick Venture wrote:
> On Mon, Sep 11, 2017 at 4:56 PM, Joel Stanley <joel@jms.id.au> wrote:
> 
> > Hi Patrick,
> >
> > On Tue, Sep 12, 2017 at 8:41 AM, Patrick Venture <venture@google.com>
> > wrote:
> > > The previous value reduced the time required to determine
> > > the fan value, however, it's also used as the final timeout
> > > mechanism.  The prevous value would work for any fan speed
> > > greater than around 3k RPM.  This increased value, lets the fan
> > > speeds return quickly but will wait longer to handle speeds below 3k
> > > RPM.
> >
> > Given you've had to tweak this value a few times, should we instead
> > make it a device tree property?
> >
> > We could still use the result of your findings to provide a sensible
> > default, but machines that have specific fan configurations could use
> > the property to tweak the driver.
> >
> 
> I had a todo item in my last commit for this field to do just that -- make
> it a variable.  I'm perfectly willing to head down this path.  I found that
> my previous value was too aggressive for those slow speeds for the
> timeout.  This path addresses that.  I think though this new value, does
> make for a good default value as you've commented.  I have some cycles
> coming up to move this value into something that can be set in a device
> tree.
> 
You'll have tto find a means to explain that this is not a configuration
parameter but a system property.

Either case, I am hesitant to update this again. This seems to be an endless
exercise. How do I know that this won't go on forever ?

Guenter

> >
> > Cheers,
> >
> > Joel
> >
> > >
> > > Testing: this value was determined through experimentation on the ast2400
> > > on the Quanta-q71l.  This configurations runs 8 fans attached to the
> > > controller.
> > >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > ---
> > >  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> > b/drivers/hwmon/aspeed-pwm-tacho.c
> > > index 69b97d45e3cb..f914e5f41048 100644
> > > --- a/drivers/hwmon/aspeed-pwm-tacho.c
> > > +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> > > @@ -161,7 +161,7 @@
> > >   * 11: reserved.
> > >   */
> > >  #define M_TACH_MODE 0x02 /* 10b */
> > > -#define M_TACH_UNIT 0x00c0
> > > +#define M_TACH_UNIT 0x0210
> > >  #define INIT_FAN_CTRL 0xFF
> > >
> > >  /* How long we sleep in us while waiting for an RPM result. */
> > > --
> > > 2.14.1.581.gf28d330327-goog
> > >
> >
