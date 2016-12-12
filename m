Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42835 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752280AbcLLPn1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Dec 2016 10:43:27 -0500
Date: Mon, 12 Dec 2016 16:43:22 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (nct7802) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161212164322.0449bec2@endymion>
In-Reply-To: <73ac82c8-8fc3-0def-aa5d-0bcab714cc4b@roeck-us.net>
References: <1481316062-4999-1-git-send-email-linux@roeck-us.net>
        <20161212110355.7907737e@endymion>
        <73ac82c8-8fc3-0def-aa5d-0bcab714cc4b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 12 Dec 2016 06:14:14 -0800, Guenter Roeck wrote:
> Hi Jean,
> 
> On 12/12/2016 02:03 AM, Jean Delvare wrote:
> > On Fri,  9 Dec 2016 12:41:02 -0800, Guenter Roeck wrote:
> >> Fix overflows seen when writing voltage and temperature limit attributes.
> >>
> >> The value passed to DIV_ROUND_CLOSEST() needs to be clamped, and the
> >> value parameter passed to nct7802_write_fan_min() is an unsigned long.
> >>
> >> Also, writing values larger than 2700000 into a limit attribute results
> >> in writing 0 into the chip's limit registers.
> >
> > You are only talking about _fan_ limits, right?
> >
> Yes. I'll clarify.
> 
> >> The exact behavior when
> >> writing this value is unspecified. For consistency, report a limit of
> >> 1350000 if the chip register reads 0.  This may be wrong, and the chip
> >> behavior should be verified with the actual chip, but it is better than
> >> reporting a value of 0 (which, if written, results in writing a value
> >> of 0x1fff into the chip register).
> >
> > This fix is good by doesn't seem to be related with the overflows?
> >
> Writing a limit larger than 2700000 results in writing 0 into the register,
> which is reported back as 0. 2699999 -> 1 -> 1350000, 2700000 -> 0 -> 0.
> I consider that an overflow situation.

OK, I understand, you are right.

-- 
Jean Delvare
SUSE L3 Support
