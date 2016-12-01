Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36219 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752576AbcLABlt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2016 20:41:49 -0500
Received: by mail-pf0-f195.google.com with SMTP id c4so10931815pfb.3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2016 17:41:48 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 2/2] devicetree: hwmon: Add documentation for TMP108
 driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <20161201004251.GA18513@roeck-us.net>
Date: Wed, 30 Nov 2016 17:41:46 -0800
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <98EEEFAF-0F57-44F0-947F-94C7FB1690A3@jmuir.com>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480538179-75901-3-git-send-email-john@jmuir.com>
 <20161201004251.GA18513@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Nov 30, 2016, at 4:42 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
>> +Optional node properties:
>> +- ti,thermostat-mode-comparator : (boolean) select the comparator =
mode for the
>> +      thermostat rather than the default interrupt-mode.
>> +
> I keep arguing with myself over this. Ultimately, I think it is not =
needed,
> for a simple reason: As currently written, using the driver in =
anything but
> comparator mode does not really make sense (because the alert status =
bits
> will be reset after reading them in interrupt mode). Second, interrupt =
mode
> can be determined automatically, based on the presence of SMBus alert =
support.
> Given that, I wonder if it would make more sense to drop this property =
and
> always put the chip into comparator mode for the time being. At a =
later time,
> if and when alert support is added, we can discuss the best approach =
to
> determine how it should be enabled (ie how do we know that the SMBus =
adapter
> supports handling alerts, or would we assume that it always does ?).
>=20
> What do you think ?

I did find myself putting the device into comparator mode in order to =
test the FL and FH bits, so I agree that it can be the default for now. =
When I can test the Alert pin, we can discuss adding interrupt and SMBus =
alert support.

Once you have finished reviewing the other patch, I will make that =
change and re-send.

Thanks,

John.

