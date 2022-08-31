Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9499ECAAD1
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 08:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiHaIYQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 04:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiHaIYI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 04:24:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C47ACE01
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 01:24:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTJ0w-0006GE-E4; Wed, 31 Aug 2022 10:23:58 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTJ0v-00320m-Fz; Wed, 31 Aug 2022 10:23:57 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oTJ0u-0002UM-JL; Wed, 31 Aug 2022 10:23:56 +0200
Message-ID: <89806ee9a80652d5877ef5c4a86574e82af48da4.camel@pengutronix.de>
Subject: Re: [PATCH v3 14/19] dt-bindings: hwmon: (mr75203) add
 "moortec,ts-series" property
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
Date:   Wed, 31 Aug 2022 10:23:56 +0200
In-Reply-To: <20220830192212.28570-15-farbere@amazon.com>
References: <20220830192212.28570-1-farbere@amazon.com>
         <20220830192212.28570-15-farbere@amazon.com>
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

On Di, 2022-08-30 at 19:22 +0000, Eliav Farber wrote:
> Add optional "moortec,ts-series" property to define the temperature
> equation and coefficients that shall be used to convert the digital
> output to value in milli-Celsius.
> Supported series: 5 (default) and 6.

Is this the difference between mr75xxx and mr76xxx series?
If so, should be a compatible "moortec,mr76006" instead?
If the temperature equation could be derived from the compatible, this
property would not be necessary.

regards
Philipp
