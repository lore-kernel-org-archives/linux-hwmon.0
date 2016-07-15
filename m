Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58716 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcGONuN (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 15 Jul 2016 09:50:13 -0400
Subject: Re: [PATCH] hwmon: adt7411: add rev5 workaround
To: Michael Walle <michael@walle.cc>
References: <1468497127-6325-1-git-send-email-michael@walle.cc>
 <20160714205611.GB13933@roeck-us.net>
 <136b2f5f223ea8460edf3c2024f710d3@walle.cc>
 <20160714223755.GA18295@roeck-us.net>
 <ac55e7337e3a039e8cd72613c7ed1ebb@walle.cc>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Rini <rini@arvoo.nl>, stable@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5788EA0E.8030700@roeck-us.net>
Date: Fri, 15 Jul 2016 06:50:06 -0700
MIME-Version: 1.0
In-Reply-To: <ac55e7337e3a039e8cd72613c7ed1ebb@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/15/2016 02:16 AM, Michael Walle wrote:
> Am 2016-07-15 00:37, schrieb Guenter Roeck:
>> The latter. Strictly speaking, each write to CR1 should explicitly set bit 3
>> and clear bit 4, but that would be a bit too invasive. And the same really
>> applies to the reserved bits in CR3.
>
> Should I address this issue, too? If so, I would like to provide a second patch, which isn't flagged for stable.
>

If you like. On a side note, you should not tag patches for -stable yourself.
Better would be to add a Fixes: tag and reference the patch introducing the problem.
This reduces the noise on the stable mailing list, and gets it applied automatically
to all affected stable releases.

Thanks,
Guenter


