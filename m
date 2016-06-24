Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53158 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbcFXObA (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 10:31:00 -0400
Subject: Re: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
To: Nishanth Menon <nm@ti.com>, Jean Delvare <jdelvare@suse.com>
References: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
 <576D401D.80700@ti.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <576D4421.8080704@roeck-us.net>
Date: Fri, 24 Jun 2016 07:30:57 -0700
MIME-Version: 1.0
In-Reply-To: <576D401D.80700@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nishanth,

On 06/24/2016 07:13 AM, Nishanth Menon wrote:
> On 06/23/2016 07:28 PM, Guenter Roeck wrote:
>> By registering a cleanup function with devm_add_action(), we can
>> simplify the error path in the probe function and drop the remove
>> function entirely.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> I dont seem to have a cover letter to reply to... but anyways..
>
> Before: http://pastebin.ubuntu.com/17801376/
> After all 5 patches: http://pastebin.ubuntu.com/17801824/
>
> Fails on beagleboard-X15 with:
> [   36.781509] tmp102 0-0048: No cache defaults, reading back from HW
> [   36.795940] tmp102 0-0048: unexpected config register value
>
> I have'nt bisected down on the specific patch in the series. Have you had a chance to test the series?
>
>

Thanks for testing. Yes, I did test it. Maybe different chip revisions, or different
initial config register values and I messed up there. Can you send me the output
of i2cdump (word wide) ?

Thanks,
Guenter

