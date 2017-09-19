Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750884AbdISSME (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Sep 2017 14:12:04 -0400
MIME-Version: 1.0
In-Reply-To: <20170918211124.jvvl75mznwf3n6sk@rob-hp-laptop>
References: <20170911191649.3344-1-atull@kernel.org> <20170911191649.3344-2-atull@kernel.org>
 <20170911195857.GB2580@roeck-us.net> <20170918211124.jvvl75mznwf3n6sk@rob-hp-laptop>
From: Alan Tull <atull@kernel.org>
Date: Tue, 19 Sep 2017 13:11:22 -0500
Message-ID: <CANk1AXQr1RzB9THosy+_8VPz4-GLzHSZYtGqf59S97aBThhaZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: add dt binding for max1619
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 18, 2017 at 4:11 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 11, 2017 at 12:58:57PM -0700, Guenter Roeck wrote:
>> On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
>> > Add new device tree binding for max1619.
>> >
>> > Signed-off-by: Alan Tull <atull@kernel.org>
>>
>> Technically that should already work, without explicit binding,
>> or did the i2c core change lately ?
>
> There was some work in that direction IIRC.

Yes, after Guenter replied I tried it without this patch and it
worked.  i2c drivers can have a 'detect' function that can check part
id, etc.  If detection succeeds, it will fill in the device name in
i2c_board_info->type and the i2c-core will enumerate using that.

Alan

>
> We don't really want to rely on that behavior and should have DT match
> strings.
>
> Rob
