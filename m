Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57460 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbdAaLsx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2017 06:48:53 -0500
Subject: Re: [PATCH v5 1/2] hwmon: new driver for ST stts751 thermal sensor
To: andrea.merello@gmail.com
References: <1485769255-27118-1-git-send-email-andrea.merello@gmail.com>
 <1bb3b18c-d765-2180-7759-76d7dc76e6d6@roeck-us.net>
 <CAN8YU5O_xhD2Dbti-d9eBHMYyOHZG128G44QXpVt65WfBiXtEw@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <625efd69-2cce-7029-0163-4353703e5a5e@roeck-us.net>
Date: Tue, 31 Jan 2017 03:47:30 -0800
MIME-Version: 1.0
In-Reply-To: <CAN8YU5O_xhD2Dbti-d9eBHMYyOHZG128G44QXpVt65WfBiXtEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/30/2017 11:11 PM, Andrea Merello wrote:
> On Mon, Jan 30, 2017 at 3:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 01/30/2017 01:40 AM, Andrea Merello wrote:
>>>
>>> This patch adds a HWMON driver for ST Microelectronics STTS751
>>> temperature sensors.
>>>
>>
>> Overall looks good. One thing I noticed, though: In the log function calls,
>> you use a mix of priv->dev and &client->dev as log device. Also, you
>> sometimes
>> use &priv->client->dev even when a local client variable is available.
>> I can fix up the latter (no need to resend for that), but please have a
>> look at the overall use and either send a fixed up version or let me know
>> if the log devices are all intentional as-is.
>
> Hmm, you are right: there is a bit of mess here. It's not intentional indeed..
>
> I gave a look to lm90.c and lm63.c; it seems no one uses the hwmon
> device for this purpose. We can probably stick to &client->dev or
> &priv->client->dev when a local client variable is not already
> available.

It is really your call as the driver's author to make if you want to use
the hwmon device or &client->dev.
>
> Also, it looks like we can change some &priv->client->dev in
> &client->dev in probe function when calling i2c read/write functions.
>
> If you ACK, I'll fix and resend.
>
SGTM.

Thanks,
Guenter

