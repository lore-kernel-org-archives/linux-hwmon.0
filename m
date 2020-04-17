Return-Path: <SRS0=fRLa=6B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A612C352BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 13:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F74220780
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 13:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbgDQNr0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Apr 2020 09:47:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:44158 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730597AbgDQNr0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 09:47:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 72AD3ACC4;
        Fri, 17 Apr 2020 13:47:24 +0000 (UTC)
Date:   Fri, 17 Apr 2020 15:47:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
Message-ID: <20200417154723.09bad8d9@endymion>
In-Reply-To: <20200417103255.GZ1694@pengutronix.de>
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
        <20200417115503.249d4d48@endymion>
        <20200417103255.GZ1694@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 17 Apr 2020 12:32:55 +0200, Sascha Hauer wrote:
> On Fri, Apr 17, 2020 at 11:55:03AM +0200, Jean Delvare wrote:
> > On Fri, 17 Apr 2020 11:28:53 +0200, Sascha Hauer wrote:  
> > > The jc42 driver passes I2C client's name as hwmon device name. In case
> > > of device tree probed devices this ends up being part of the compatible
> > > string, "jc-42.4-temp". This name contains hyphens and the hwmon core
> > > doesn't like this:
> > > 
> > > jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
> > > 
> > > This changes the name to "jc42" which doesn't have any illegal
> > > characters.  
> > 
> > I don't think "jc-42.4-temp" is a valid i2c client name either.  
> 
> What makes the name invalid then? I am not aware of any constraints of
> i2c client names.

Historically hwmon devices were i2c devices so libsensors would use
the i2c client name as the device name, and still does as a fallback if
memory serves. Therefore whatever rule applies to hwmon names would
also apply to i2c names (in the context of hwmon devices) even though
this is not enforced.

> > I believe this should be fixed at the of->i2c level, rather than the
> > i2c->hwmon level.  
> 
> Are you suggesting a character conversion from hyphens to underscores or
> similar in the i2c core?

No, my point is that from a userspace perspective it shouldn't matter
if the device comes from the OF tree or not. So the device name should
be the same, i.e. the i2c client should be named "jc42" always. That's
what happens for all other devices I checked, simply because it turns
out that their OF compatible string is in the form
<vendor_name>,<linux_i2c_client_name>, so when you strip the vendor
name you get the right name directly.

My knowledge of the OF subsystem is fairly limited though, so I have no
idea if it is possible to enforce a specific name like that at an early
stage. The proper name can't be guessed by i2c-core, so ideally the
conversion should be provided by the driver itself. I see that struct
of_device_id has a "name" field, can it be used for that purpose? If
not, I suppose the "data" field could be used for that.

> > Not sure how other drivers are dealing with that, it
> > seems that in most cases the name part of the compatible string matches
> > exactly the expected client name so no conversion is needed.  
> 
> Other i2c hwmon drivers I found do not have any hyphens in their
> compatible string, so they are at least not hit by this message.

I drew the same conclusion here, and your patch is definitely better
than nothing as it fixes a real problem, however it is not prefect due
to the reason explained above, plus the fact that it would break if the
driver ever supports more than one device type (say JEDEC releases JC43
tomorrow and we add support... you code forces the name to "jc42" even
if the OF name was something other than "jc-42.4-temp").

-- 
Jean Delvare
SUSE L3 Support
