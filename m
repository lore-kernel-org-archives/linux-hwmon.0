Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD6FC10F12
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 16:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B097F2087C
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 16:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/wKmtOf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfDOQdN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 12:33:13 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45548 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfDOQdN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 12:33:13 -0400
Received: by mail-pg1-f196.google.com with SMTP id y3so8817316pgk.12
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gKJQMLcJvQEppNUSnWvfhsAZMWyA6mwc+IIzq2r/j+Y=;
        b=n/wKmtOfGYqgHidH4k2FZRZN5UhOwfT4IjL8yBzjjIJvtxpCrrC5kcWnYfqUYURWgQ
         hOMvWv6aZzEIIcVzYbDSSnZHp2lggDUKLkgC+2i5rLDE+W+jLq3/PGt0IDooAjuC/dBP
         Q04PY94mUHvWLHGDXV1s2bWhsxqkr67qGpptVR5UHgUAhQJsLTb3sdvY3B4GHCpmJ6mZ
         WCcb1f2lnspFCbijYlUHLv7k9qX+Nov/yx6+cLfiQPiVISP8Tx79Gmf1nIIAeyOqWO9R
         LB4sdrlrH4QnufxjS4EC0QhvQt9tSk04CZDPa+0OQt1z92eQNNHRyYPBT6+pRifHVyhr
         6ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gKJQMLcJvQEppNUSnWvfhsAZMWyA6mwc+IIzq2r/j+Y=;
        b=Obchry8J01yK58IksRpF0DHA/hf+QNePSRZATPehXqPiyh+lfUrLS99VgWPGARSkD5
         fOReGqSbiBnLPM1RWA+7sFsAVAQGCBe7p3QMbeJxLG1ovKF+iDP8UkLZw+zs1B7KGmnD
         uIJLkLYAh4Jw8zIVW17DlTXIvESMZM5z2DiPbQ4mRkPxUVvKTHQ7mWTLhIfMr1/9KKUC
         SlWAS94rXk0wPfB8Rc9iesjQA5I0xXx6l2ijaaPtN9yfP9qfF4TEifxWsqeg9wNJdhqd
         mF6Gm8Ktf5eSfwGF1sXu6zBkuJtmUqOABfkH8dXc5pdv1M6yX3QGyjsjng/8hTtV/AVB
         qZ3g==
X-Gm-Message-State: APjAAAVufzL2vFUmbVAGPeVeKE9hDdXk04Sv3qEh944iTpJj4eFHdCev
        Au7LvrgwZT7uf94bg7Z0LXU=
X-Google-Smtp-Source: APXvYqy5l2gZ6xVVYwYmoy9524PeU09ufjGVS3jsyh+yJbIMehUItEZ2G0GAcpq8ZzNMwUqX6Cf5nw==
X-Received: by 2002:a62:874d:: with SMTP id i74mr77497867pfe.211.1555345992511;
        Mon, 15 Apr 2019 09:33:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f7sm81321401pga.56.2019.04.15.09.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 09:33:11 -0700 (PDT)
Date:   Mon, 15 Apr 2019 09:33:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Message-ID: <20190415163310.GA7933@roeck-us.net>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
 <20190414223728.GB18461@localhost.localdomain>
 <8b641f3c-c9d6-f70c-0f1d-f4287773574a@roeck-us.net>
 <20190415080527.GA6320@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415080527.GA6320@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 15, 2019 at 08:34:48AM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Sun, Apr 14, 2019 at 07:38:33PM -0700, Guenter Roeck wrote:
> >On 4/14/19 3:37 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> >>On Sun, Apr 14, 2019 at 11:59:38PM +0200, Krzysztof Adamski wrote:
> >>>PMBUS devices report values in real-world units. Those using direct
> >>>format require conversion using standarised coefficients and formula.
> >>>This operation is already done by pmbus_core and the default values for
> >>>coefficients are configured by chip drivers.
> >>>
> >>>However those default values are not allways suitable as they depend on
> >>>the value of sense register and environment used. For that reason, in
> >>>order to get values that make sense or just to get best accuracy, in it
> >>>may be required to tweak coefficient values. The proper values may be
> >>>measured during device production (to get best accuracy, they might be
> >>>callibrated for each individual unit) and stored as calibration values
> >>>in some place (like EEPROM or even a file).
> >>>
> >>>To support wide range of possible use cases, lets export those to user
> >>>space via sysfs attributes so that it can implement its own policies
> >>>about them. All those attributes are put into separate attribute_group
> >>>struct so that we can set its name to group all of them in a
> >>>"coefficients" subdirectory in sysfs.
> >>>
> >>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> >>>---
> >>>drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++++++++-
> >>>1 file changed, 102 insertions(+), 2 deletions(-)
> >>>
> >>
> >>[...]
> >>
> >>>+	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),
> >>
> >>I screwed up and did not fix this also, sorry for that. I'm not sending
> >>an updated version (yet) as I didn't get your approval for the concept
> >>itself (though I still hope you will reconsider taking into account my
> >>latest arguments).
> >>
> >
> >I won't, sorry. As mentioned before, this is a generic problem that needs
> >to be solved for all hwmon drivers, not just for pmbus devices, and also
> >not just for pmbus devices using direct mode.
> >
> >Even worse, this doesn't even work for pmbus devices in general.
> >PMBus supports commands such as VOUT_SCALE_LOOP and various other
> >calibration commands such as VOUT_CAL_OFFSET, IOUT_CAL_GAIN and
> >IOUT_CAL_OFFSET. Your approach doesn't even try to support those
> >commands; you only look at r/m/b which may suit your needs but are
> >hardly generic
> 
> I agree I don't see this problem as general as you. The mentioned
> registers can easily be supported if needed by just attaching attributes
> to them. That would allow doing things that cannot be done currently
> (configuring precision of the regulation of the devices) while I see
> coefficients problems as something totally different - more like a fix
> to the already supported functionality (reporting current measurements).
> 

We are talking an ABI here. ABIs are supposed to be hardware independent.
Directly mapping registers to attributes is not exactly hardware independent.

> > and even misleading since chip programming isn't adjusted even when
> > that is possible.
> 
> I don't understand what you mean by that, could you explain?
> 
"when that is possible" -> on chips supporting calibration commands,
one should not manipulate b/m/R but write any adjustments into the chip
using those commands.

> >
> >Addressing this problem in a generic way will require substantially
> >more thought than just adding a couple of pmbus direct mode specific
> >attributes.
> 
> I'm willing to put more effort into that but I would need to better
> understand what is your view of the scope of problem here.
> 
There are a number of elements.

First, a case has to be made why the current mechanism of using
sensors3.conf for adjustments is insufficient. This may be well
understood by some, but the case needs to be made (ie some chips do
have HW registers to perform the adjustment, and in some cases there
is accuracy loss by performing adjustments in user space).

Second, we'll need to determine which standardized attributes are
needed. As far as I can see this would probably be 'scale' (or maybe
'gain') and 'offset'. The question is how to express especially 'scale'.
It would either require both a multiplier and a divider, or it would
have to be expressed in fixed point arithmetic. I would prefer the
latter, but I am open to suggestions.

Third, we will have to determine how to apply this all to pmbus
chips. It must not only apply to direct mode chips, but to all
PMBus chips. Even for direct mode chips the case needs to be made
if the attributes should apply per sensor class or per sensor (I
would think per sensor). Just looking at VOUT, chapter 9.2 of the
PMBus specification (Rev 1.1, part II) gives an example of what
to look out for: Just for VOUT, there are VOUT_TRIM, VOUT_CAL_OFFSET,
VOUT_DROOP (does this require yet another attribute ?), and
VOUT_SCALE_LOOP.

I should add that the above, for VOUT, are the primary means for
PMBus devices to adjust voltage readings. This also applies to IOUT,
which has similar standard PMBus registers available for calibration
(IOUT_CAL_GAIN and IOUT_CAL_OFFSET). On top of that, some chips support
vendor specific commands to calibrate other sensors. For example,
MAX15301 supports a EXT_TEMP_CAL command to calibrate temperature sensor
readings.

Also note that direct mode PMBUs chips _should_ support a COEFFICIENTS
command to retrieve actual coefficients from the chip (though I don't
recall ever encountering a chip that actually supports it).

Overall, adjusting readings through manipulation of b/m/R is at best
a workaround.

As such, the chip we are talking about here does pretty much
everything wrong. I do understand the need for a more dynamic
calibration support on the driver level, but the solution must
not focus on such a chip and needs to be more generic.

Thanks,
Guenter
