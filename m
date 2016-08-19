Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39017 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754857AbcHSR50 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2016 13:57:26 -0400
Date: Fri, 19 Aug 2016 10:57:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: Re: [PATCH] hwmon: Enabled device tree for generic pmbus devices
Message-ID: <20160819175724.GA5470@roeck-us.net>
References: <1471579867-16553-1-git-send-email-matthew.weber@rockwellcollins.com>
 <51b82f69-d06e-8a3f-e142-cf1c45e2387e@roeck-us.net>
 <CANQCQpZ1ZiwBaV7+83UvZ5E2KzSky0XRvVFGLeSArpR0GaJX=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANQCQpZ1ZiwBaV7+83UvZ5E2KzSky0XRvVFGLeSArpR0GaJX=Q@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Aug 19, 2016 at 11:15:37AM -0500, Matthew Weber wrote:
> Guenter,
> 
> On Thu, Aug 18, 2016 at 11:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 08/18/2016 09:11 PM, Matt Weber wrote:
> >>
> >> This patch adds device tree based enumeration support for generic pmbus
> >> sensors  ADP4000, BMR453, BMR454, MDT040, NCP4200, NCP4208,
> >> PDT003, PDT006, PDT012, TPS40400, TPS544B20, TPS544B25, TPS544C20,
> >> TPS544C25, and UDT020.
> >>
> >
> > Are you sure this is needed ?
> 
> Good point, always thought it was and just tested and it works
> without.  Was there a point where this didn't work in the same way?
> 
If so, it must have been a long time ago. See patch 9fd0499 ("of/i2c: Generalize
OF support").

Guenter
