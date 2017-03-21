Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59943 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751477AbdCUNfo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Mar 2017 09:35:44 -0400
Subject: Re: Conversion of w83627ehf to hwmon_device_register_with_info ?
To: =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>
References: <201703030133.01363.PeterHuewe@gmx.de>
 <bb297d0e-e87a-83a9-7a2a-9cc0e6f51164@roeck-us.net>
 <201703211146.24674.PeterHuewe@gmx.de>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0163376b-88af-d937-f29b-1d92ac1f87ef@roeck-us.net>
Date: Tue, 21 Mar 2017 06:35:41 -0700
MIME-Version: 1.0
In-Reply-To: <201703211146.24674.PeterHuewe@gmx.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/21/2017 03:46 AM, Peter Hüwe wrote:
> Hi
>
> On Friday 03 March 2017 03:56:01 Guenter Roeck wrote:
>> Hi Peter,
>>
>> On 03/02/2017 04:33 PM, Peter Hüwe wrote:
>>> Hi,
>>>
>>> is anybody else working on the conversion of the w83627ehf to the new
>>> hwmon_device_register_with_info interface?
>>
>> I don't think so.
>>
>>> Otherwise I will probably update the driver to this interface within the
>>> next days - but since it's a lot of work I wanted to check for
>>> duplication first.
>>
>> Go ahead.
>
> So I'm close to have to conversion done,
> the current diff stat is about
> 647 insertions(+), 787 deletions(-)
> for the whole conversion.
>
> Should I try to break it down into smaller chunks for easier review?
>
> Although this would mean to convert stuff from A to B and then from B to C -
> otherwise the intermediate steps would be not fully functional.
> (since the sysfs nodes partially would exist under hwmon1/ and partially under
> hwmon1/device/ (as they currently are)).
>
> or just submit it?
>

Just submit it. I don't really think a conversion like this can be split up
cleanly.

> It saves about 20k in compiled size, so the savings from reduced boilerplate
> are huge. (and I think it's more readable)
>
>> I would suggest to drop nct6775/nct6776 support to simplify the
>> code when you do that. Maybe as separate commit, though.
> Hehe - I'm testing on a nct6776 :)
> I'll look into it once the first conversion has been accepted.
>

Wondering - why don't you use the nct6775 driver ?

Thanks,
Guenter

