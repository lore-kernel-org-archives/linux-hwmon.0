Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48049 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753750AbdCGCFF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2017 21:05:05 -0500
Date: Mon, 6 Mar 2017 15:47:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: Question about hwmon_attr_show_string
Message-ID: <20170306234755.GA16512@roeck-us.net>
References: <201703030133.01363.PeterHuewe@gmx.de>
 <201703062148.36101.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201703062148.36101.PeterHuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Mar 06, 2017 at 09:48:35PM +0100, Peter Hüwe wrote:
> Hi Guenter,
> 
> I was wondering whether there was a particular reason why 
> hwmon_attr_show_string passes only an "empty" pointer(pointer) to the ops-
> >read_string function rather than the buffer itself?
> 
> Wouldn't this mean that in ops->read_string I'd have to reserve some space for 
> the value on the heap (and taking care to free it somewhere, since returning 
> an address on the stack is bad idea), instead of calling sprintf(buf, "%s\n", 
> s) directly?
> 
> With the current implementation I have to sprintf it into my local buffer and 
> you sprintf it again into the final buffer.
> 
The idea was that the called code would return a pointer to a constant string,
ie one that isn't changing from call to call.

What attribute do you see that would require a dynamic (changing) string ?

Thanks,
Guenter
