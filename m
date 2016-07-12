Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38696 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084AbcGLVYv (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 12 Jul 2016 17:24:51 -0400
Date: Tue, 12 Jul 2016 14:24:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nishanth Menon <nm@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (tmp102) Improve handling of initial read
 delay
Message-ID: <20160712212439.GB21286@roeck-us.net>
References: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
 <578558BD.1000608@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578558BD.1000608@ti.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 12, 2016 at 03:53:17PM -0500, Nishanth Menon wrote:
> On 06/29/2016 10:41 PM, Guenter Roeck wrote:
> >If the chip was in shutdown mode when the driver was loaded, the first
> >conversion is ready no more than 35 milli-seconds after the chip was
> >taken out of shutdown. The driver delay was so far set to 333 ms (HZ / 3),
> >which is much higher than the maximum time needed by the chip.
> >Reduce the time to 35 milli-seconds.
> >
> >Introduce a 'valid' flag to ensure that sensor data is actually read
> >even if requested less than 333 ms after the driver was loaded.
> >
> >Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >---
> >v3: Don't go to sleep if sensor readings are not available;
> >     instead, return -EAGAIN (matching previous behavior)
> >     tmp102_update_device() is now a void function.
> >v2: No change
> >
> >Note: This series depends on the following two patches in -next.
> 
> 
> a little too late perhaps.. Apologies, was on vacation.. tested and for the
> series:
> 
> Acked-by: Nishanth Menon <nm@ti.com>
> 
Thanks!

Guenter
