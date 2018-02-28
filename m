Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:35485 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933061AbeB1VQE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Feb 2018 16:16:04 -0500
Received: by mail-wr0-f172.google.com with SMTP id l43so3935951wrc.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Feb 2018 13:16:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180228185302.GD1203@lunn.ch>
References: <1519780874-8558-1-git-send-email-tharvey@gateworks.com>
 <1519780874-8558-3-git-send-email-tharvey@gateworks.com> <20180228185302.GD1203@lunn.ch>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 28 Feb 2018 13:16:02 -0800
Message-ID: <CAJ+vNU2aeFAKf6e7RashG50Gu5qb3mqGvJUEPprh4AjFGs+MLg@mail.gmail.com>
Subject: Re: [RFC 2/4] mfd: add Gateworks System Controller core driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Feb 28, 2018 at 10:53 AM, Andrew Lunn <andrew@lunn.ch> wrote:
>> +             dev_err(&client->dev, ">> 0x%02x %d\n", reg, ret);
>> +             return ret;
>> +     }
>> +     dev_dbg(&client->dev, ">> 0x%02x=0x%02x (%d)\n", reg, val, retry);
>> +
>> +        return 0;
>
> Hi Tim
>
> There appears to be a few spaces vs tabs issues in this file.
>
>       Andrew
>

Thanks. I'll run through checkpatch prior to v2.

Tim
