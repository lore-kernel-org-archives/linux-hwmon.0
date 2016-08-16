Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58203 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021AbcHPCzJ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 15 Aug 2016 22:55:09 -0400
Subject: Re: A question about masks in sysfs
To: Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <57B10525.6030200@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7d2af67a-f220-7ab2-e007-16b258fb2ed4@roeck-us.net>
Date: Mon, 15 Aug 2016 19:55:07 -0700
MIME-Version: 1.0
In-Reply-To: <57B10525.6030200@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/14/2016 04:56 PM, Joshua Scott wrote:
> Hi,
>
> I am wanting to add write support to the alarms mask sysfs entry for the
> adt7470 driver.
>
> Before going forward with this, I had a question about consistency in
> this area.
>
> In the other drivers I see that expose masks, it looks like they do this
> as decimal numbers (adm1026.c, w83627hf.c, w83781d.c).
>
> The adt7470 driver already exposes the alarm mask, but instead of
> decimal it uses hex.
>
> What would be the correct way of adding write support to this? Should it
> be converted to decimal to be consistent with other drivers, or should
> it remain in hex to prevent breaking any userspace code that may be
> relying on the current behaviour?
>

For all of those, the attribute is non-standard (not part of the ABI), which
is bad to start with. But either case, using hex without 0x annotation
is _really_ bad, so you really picked the worst of the drivers to change.
I'd suggest to leave the show part alone for backward compliance (shudder),
and to use kstrtoul() with a base of 0 for write. This will accept an integer
unless 0x is provided, which is what it should be.

Guenter

