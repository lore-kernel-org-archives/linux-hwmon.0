Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40327 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbcFZORl (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 26 Jun 2016 10:17:41 -0400
Subject: Re: [PATCH v2 5/5] hwmon: (tmp102) Convert to use regmap, and drop
 local cache
To: Nishanth Menon <nm@ti.com>, Jean Delvare <jdelvare@suse.com>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
 <1466908825-14222-5-git-send-email-linux@roeck-us.net>
 <576FD84E.6020204@ti.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <576FE3FE.5070406@roeck-us.net>
Date: Sun, 26 Jun 2016 07:17:34 -0700
MIME-Version: 1.0
In-Reply-To: <576FD84E.6020204@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nishanth,

On 06/26/2016 06:27 AM, Nishanth Menon wrote:
>
> Note, at this point:
> We have set CR0=0, CR1=1 (4HZ conversion rate). we do indeed have a
> 26typical (worst case 35ms) conversion time, but if we read register
> before 250 ms, we are not getting a new data, instead, we are just
> reading the same old register data.
>
Yes, I know. As I said in the description of patch 5, there is a
trade-off between caching provided by regmap for non-volatile
registers and internally managed caching.

Question for me is the practical impact. It is quite uncommon for
applications to actually read the attribute that often.

> for lowering potential i2c ops, I suggest:
> if < conversion_rate + CONVERSION_TIME_MS, provide a cached data, if
> after that, do a read.
>
That would be a possibility (we could specifically cache only the
temperature register), but I am not sure if it is worth it.

Caching was more important when the driver kept reading all registers,
which was more time consuming and also happened if only a single attribute
was read. Since the non-volatile registers are now cached by regmap,
this won't happen anymore, and reading a single register is not as
expensive as reading four. In practice, that means the amount of i2c
reads is only larger than before if an application polls the temperature
more than 10 times per second.

Do you think there is an application which does poll the temperature
that often ?

> we could do a patch over this ofcourse -> best will  be to let us do a
> configurable conversion rate. We could get upto 8Hz conversion rate
> with this chip (CR0,1=1).
>
Adding such an attribute might be worthwhile, if for nothing else to
reduce power consumption if high speed conversions are not needed.
I actually thought about it, but my ultimate goal was elsewhere -
the series served as baseline to test the new registration API
(http://www.spinics.net/lists/kernel/msg2288309.html), and I didn't
want to get too distracted.

If we add that attribute, it might be easier to do it on top of the
driver converted to the new API, though.

Thanks,
Guenter

