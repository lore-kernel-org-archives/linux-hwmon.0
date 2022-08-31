Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E11ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 08:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiHaIVO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 04:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiHaIUu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 04:20:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A10C6FDD
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 01:19:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTIwF-0005Uf-C1; Wed, 31 Aug 2022 10:19:07 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTIwC-0031zi-Fj; Wed, 31 Aug 2022 10:19:04 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTIwB-0002P0-SQ; Wed, 31 Aug 2022 10:19:03 +0200
Message-ID: <89b82aeeb613543642274623cedd71b682974a2d.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/19] hwmon: (mr75203) skip reset-control deassert
 for SOCs that don't support it
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Eliav Farber <farbere@amazon.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org, rtanwar@maxlinear.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com, rahul.tanwar@linux.intel.com,
        andriy.shevchenko@intel.com
Date:   Wed, 31 Aug 2022 10:19:03 +0200
In-Reply-To: <20220830192212.28570-6-farbere@amazon.com>
References: <20220830192212.28570-1-farbere@amazon.com>
         <20220830192212.28570-6-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eliav,

On Di, 2022-08-30 at 19:21 +0000, Eliav Farber wrote:
> Don't fail the probe function and don't deassert the reset controller if
> a "reset" property doesn't exist in the device tree.
> 
> Change is done for SOCs that don't support a reset controller.

Not strictly related to this patch, but reading the context I wonder
whether it is required that clock/reset are running/deasserted all the
time. Would it make sense to implement some kind of runtime PM?

> Signed-off-by: Eliav Farber <farbere@amazon.com>

This change is

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
