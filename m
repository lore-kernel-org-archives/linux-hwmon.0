Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45896 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754989AbdFWUrq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Jun 2017 16:47:46 -0400
Date: Fri, 23 Jun 2017 13:47:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
        Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
        peterh@google.com
Subject: Re: [PATCH 1/2 v2] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Message-ID: <20170623204743.GA2010@roeck-us.net>
References: <20170623150525.7014-1-venture@google.com>
 <20170623152923.GA10652@roeck-us.net>
 <CAO=notw-J0655d6=1Y2cXO_fE_rC3+AwFX8sz27ZJubVRz6adA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notw-J0655d6=1Y2cXO_fE_rC3+AwFX8sz27ZJubVRz6adA@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 23, 2017 at 12:33:47PM -0700, Patrick Venture wrote:
> I changed the commit message. Since you said you never received this patch,
> it was prudent to resend it. However, since I had sent it and you said you
> didn't receive it, I assumed it was being merged with the previous patch
> that had been before using a patch-set was required. So I modified the
> commit message so I could bump the version so you'd likely see it this
> time; whereas before it was getting clumped with the previous fodder.
> 
> I was deliberately trying to be helpful. I didn't know you needed the
> history and couldn't just use the latest patch version.
> 
2/2 does not have a change log either.

> Patrick
> 
> On Jun 23, 2017 8:29 AM, "Guenter Roeck" <linux@roeck-us.net> wrote:
> 
> > On Fri, Jun 23, 2017 at 08:05:25AM -0700, Patrick Venture wrote:
> > > Reduce the fan_tach period such that the fan controller uses a shorter
> > > period to measure the rpm.
> > >
> > > Testing: Tested on an ast2400 sitting on a quanta-q71l.
> > >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> >
> > Please provide change logs, and keep version numbers consistent
> > for a series even if one patch doesn't change.
> >
> > Now I'll have to go back, find the flurry of older versions, and try
> > to find out what changed and why. This takes time which I don't have.
> > I'll probably only get to this after the next commit window, sorry.
> >
> > Guenter
> >
> > > ---
> > >  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> > b/drivers/hwmon/aspeed-pwm-tacho.c
> > > index 86e2ea8287a7..b2ab5612d8a4 100644
> > > --- a/drivers/hwmon/aspeed-pwm-tacho.c
> > > +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> > > @@ -160,7 +160,7 @@
> > >   * 11: reserved.
> > >   */
> > >  #define M_TACH_MODE 0x02 /* 10b */
> > > -#define M_TACH_UNIT 0x1000
> > > +#define M_TACH_UNIT 0x00c0
> > >  #define INIT_FAN_CTRL 0xFF
> > >
> > >  struct aspeed_pwm_tacho_data {
> > > --
> > > 2.13.1.611.g7e3b11ae1-goog
> > >
> >
