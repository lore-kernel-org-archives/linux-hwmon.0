Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59433 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753751AbcLISLo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Dec 2016 13:11:44 -0500
Date: Fri, 9 Dec 2016 10:11:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 09/17] hwmon: (nct7802) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209181141.GA24142@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-9-git-send-email-linux@roeck-us.net>
 <20161209104931.0f8ad01f@endymion>
 <d7e6a458-3194-4230-7862-c15a1e6790d0@roeck-us.net>
 <20161209162548.7841e144@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161209162548.7841e144@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 09, 2016 at 04:25:48PM +0100, Jean Delvare wrote:
> On Fri, 9 Dec 2016 06:22:43 -0800, Guenter Roeck wrote:
> > On 12/09/2016 01:49 AM, Jean Delvare wrote:
> > > Looking at function nct7802_write_fan_min() I think an overflow can
> > > happen here too, as DIV_ROUND_CLOSEST() is called before clamp_val().
> > > Any reason why you did not fix that one?
> > >
> > Not really. The call is
> > 	DIV_ROUND_CLOSEST(1350000U, limit);
> > and thus won't overflow.
> 
> Limit is originally parsed by kstrtoul into an unsigned long, however
> the nct7802_write_fan_min function parameter is an unsigned int, so it
> is implicitly cast to an unsigned int. On a 32-bit system, that may not
> fit?
> 
Good point. My module test doesn't catch that. Let me have a look
if I can somehow trigger that failure.

Thanks,
Guenter
