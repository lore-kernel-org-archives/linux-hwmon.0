Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ob0-f194.google.com ([209.85.214.194]:34357 "EHLO
	mail-ob0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbcC2Jeg (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 05:34:36 -0400
MIME-Version: 1.0
In-Reply-To: <56FA477C.8030607@roeck-us.net>
References: <1459241443-28392-1-git-send-email-joel@jms.id.au> <56FA477C.8030607@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Mar 2016 20:04:15 +1030
Message-ID: <CACPK8XdyB2mwswJu8=EVjf9519fwBxhrrkkMSn3=JGSqiAY_Dw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (adm1031) Add device tree support
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello Guenter,

On Tue, Mar 29, 2016 at 7:44 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 03/29/2016 01:50 AM, Joel Stanley wrote:
>>
>> This adds a of_device_id table so we can probe the driver using the
>> device tree.
>>
> The subject line does not match the driver being modified; it suggests
> adm1031
> while in reality the adm1275 driver is being modified.

Apologies, that's what I get for writing a patch as I'm walking out the door.

> Besides, this should already work, through trivial bindings.
> Is there a reason to believe that it does not already work ?

I wasn't aware that we had such a mechanism, thank you. I assume you
referring to bindings/i2c/trival-devices.txt?

As background for why I added the bindings; originally this code was
patch one of two. The second added a device tree property to inform
the kernel of the external sense resistor so we could perform scaling
in the kernel.

I read the hwmon documentation on why this is not currently done.
However, as the device tree is specific to a board - things like i2c
addresses and which bus they are on - I was wondering if you would
take patches to add such a feature?

Cheers,

Joel
