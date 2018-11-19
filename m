Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42615 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeKTHxk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Nov 2018 02:53:40 -0500
Date: Mon, 19 Nov 2018 13:28:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (ntc_thermistor): add support for B57891S0103
 from Epcos
Message-ID: <20181119212806.GC5795@roeck-us.net>
References: <20181117121248.32143-1-peda@axentia.se>
 <20181117121248.32143-2-peda@axentia.se>
 <20181119170732.GA27435@roeck-us.net>
 <f1235661-f8f2-9885-1e7f-491f5c234078@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1235661-f8f2-9885-1e7f-491f5c234078@axentia.se>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 19, 2018 at 09:16:12PM +0000, Peter Rosin wrote:
> > 
> > Guess I deserve the non-alphabetic order as penalty for not enforcing it 
> > earlier. I'll accept the patch after DT approval and submit another one
> > myself afterwards to restore alphabetic order.
> 
> Right, I'm thinking another good change would be to introduce an enum
> into the ntc_thermistor_id array, because the hard-coded numbering in

Yes, sounds like a good idea.

> the ntc_match variable is a bit fragile in my taste, and that list would
> also benefit from being alphabetic. Currently there's simply no way to
> add things in the middle without causing mayhem. I thought about doing
> that, but didn't want to waste energy doing it up front without knowing
> if it would be well received (the driver might have been superseded or

It would.

Guenter

> something). I'm glad that you have volunteered to clean things up.
> Ha! :-)
> 
> Cheers,
> Peter
> 
> > Guenter
> > 
> >>  };
> >>  
> >>  struct ntc_thermistor_platform_data {
> >> -- 
> >> 2.11.0
> >>
> 
