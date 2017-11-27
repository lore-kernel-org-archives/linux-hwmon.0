Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:43369 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbdK0WIN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 17:08:13 -0500
Date: Mon, 27 Nov 2017 14:08:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Lippert <rlippert@google.com>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, linux-kernel@vger.kernel.org,
        Xo Wang <xow@google.com>
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Swap low/high current
 coefficients for LM5066(i)
Message-ID: <20171127220810.GA3848@roeck-us.net>
References: <20171122220728.17861-1-rlippert@google.com>
 <20171122232816.GA4615@roeck-us.net>
 <CAFRv3wz0GDBNSBDFu_aYdrHJCQ6dwSXxW85JVJdA++c0_yDxAQ@mail.gmail.com>
 <91322e5e-23e3-ea6a-04bd-1c23fedadbf7@roeck-us.net>
 <CAFRv3wy0yL704Y1=v3yOJtPMEjObPHcQuHaETh2FRmEHgpTi6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRv3wy0yL704Y1=v3yOJtPMEjObPHcQuHaETh2FRmEHgpTi6A@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 01:51:35PM -0800, Rob Lippert wrote:
> On Wed, Nov 22, 2017 at 5:17 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > Hi Rob,
> >
> > On 11/22/2017 03:39 PM, Rob Lippert wrote:
> >>
> >> On Wed, Nov 22, 2017 at 3:28 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>
> >>>
> >>> On Wed, Nov 22, 2017 at 02:07:28PM -0800, Robert Lippert wrote:
> >>>>
> >>>> The _L low-current mode coefficient values should reference the
> >>>> datasheet rows with CL=VDD but it seems were mistakenly pulled from
> >>>> the rows with CL=GND.
> >>>>
> >>>> This causes the current/power to be reported as approximately double
> >>>> the actual value when CL=GND and half the actual value when CL=VDD.
> >>>>
> >>>
> >>> This would affect all chips supported by this driver. Hmm, and I was sure
> >>> I tested this. I'll have to dig out my hardware and confirm.
> >>
> >>
> >> I'm still not 100% convinced this commit is correct as I haven't been
> >> able to validate the measurements against an external probe yet (and
> >> my test board uses a non-standard sense resistor which means it needs
> >> additional massaging of the data anyhow).
> >>
> >>>
> >>>
> >>> The code currently only uses bit 4 of the DEVICE_SETUP (D9h) command
> >>> to determine which current limit setting to use. Looking into the
> >>> datasheet, it looks like it also has to evaluate bit 2, and I wonder
> >>> if there is a means to determine CL if bit 2 = 0. Any idea ?
> >>
> >>
> >> On my test board CL=floating (equivalent to GND) and the value of
> >> register 0xD9 is all zeroes.
> >>
> > Are you sure that floating is equivalent to GND ? I didn't check the
> > datasheet, but it is more common for chips to have an internal pull-up.
> >
> >>>
> >>> Does bit 4 report the CL pin value if bit 2 = 0 ?
> >>
> >>
> >> I can't tell by reading the datasheet that 0xD9 bit4 will ever report
> >> the pin value as the language is difficult to parse :)
> >
> >
> > Same here.
> >
> >> But I don't have any hardware setup with CL=VDD to test...
> >>
> >
> > I do have various evaluation boards, so I should be able to do some testing.
> > I hope I'll get to it over the weekend.
> 
> Actually turns out my board does tie CL=VDD as recommended by the
> LM5066i datasheet to improve the current/power reporting accuracy.
> But the value in 0xD9 is always zero so it seems there is no way to
> read this CL pin setting from the device.
> 
> I think my commit is technically correct but it seems will likely
> break the readings for most boards that follow the datasheet typical
> circuit which recommends CL=VDD.
> 
> Would it make sense to remove the code trying to read the CL setting
> and default the coefficient values to the "low current limit" CL=VDD
> setting?  (and maybe something in devtree or module param to pick the
> other coefficients?)
> 

The code should also check bit 2. If bit 2 is not set, it is ok to assume
CL=VDD. We can add a devicetree property if/when needed. Question though
is still how to handle the problem for the other chips supported by the
driver; if we change the code we should fix the problem for all chips,
not just for one. Wonder if we can just swap the defines to minimize code
changes.

Unfortunately I spent the entire weekend in bed with a cold, so I didn't get
to do any tests with my eval boards :-(.

Guenter
