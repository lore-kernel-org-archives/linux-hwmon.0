Return-Path: <SRS0=fRLa=6B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3C7C352BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 10:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 503FD221EB
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 10:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgDQKc6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Apr 2020 06:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727828AbgDQKc5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 06:32:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E41C061A0C
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2020 03:32:57 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jPOIq-0006Dq-4X; Fri, 17 Apr 2020 12:32:56 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jPOIp-0008EY-Od; Fri, 17 Apr 2020 12:32:55 +0200
Date:   Fri, 17 Apr 2020 12:32:55 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
Message-ID: <20200417103255.GZ1694@pengutronix.de>
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
 <20200417115503.249d4d48@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417115503.249d4d48@endymion>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:25:55 up 57 days, 17:56, 99 users,  load average: 0.20, 0.14,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Jean,

On Fri, Apr 17, 2020 at 11:55:03AM +0200, Jean Delvare wrote:
> Hi Sascha,
> 
> On Fri, 17 Apr 2020 11:28:53 +0200, Sascha Hauer wrote:
> > The jc42 driver passes I2C client's name as hwmon device name. In case
> > of device tree probed devices this ends up being part of the compatible
> > string, "jc-42.4-temp". This name contains hyphens and the hwmon core
> > doesn't like this:
> > 
> > jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
> > 
> > This changes the name to "jc42" which doesn't have any illegal
> > characters.
> 
> I don't think "jc-42.4-temp" is a valid i2c client name either.

What makes the name invalid then? I am not aware of any constraints of
i2c client names.

> I believe this should be fixed at the of->i2c level, rather than the
> i2c->hwmon level.

Are you suggesting a character conversion from hyphens to underscores or
similar in the i2c core?

> Not sure how other drivers are dealing with that, it
> seems that in most cases the name part of the compatible string matches
> exactly the expected client name so no conversion is needed.

Other i2c hwmon drivers I found do not have any hyphens in their
compatible string, so they are at least not hit by this message.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
