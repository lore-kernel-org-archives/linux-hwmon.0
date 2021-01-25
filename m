Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C835C4332D
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 05:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EED4F2223D
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 05:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbhAZF6M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:58:12 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:33879 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbhAYKTy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 05:19:54 -0500
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 10PA2ADg098993;
        Mon, 25 Jan 2021 18:02:10 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 10P9tsXQ098016;
        Mon, 25 Jan 2021 17:55:54 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 25 Jan
 2021 18:01:37 +0800
Date:   Mon, 25 Jan 2021 10:01:19 +0000
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        ChiaWei Wang <chiawei_wang@aspeedtech.com>,
        "leetroy@gmail.com" <leetroy@gmail.com>
Subject: Re: [PATCH v2 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210125100119.GA2349720@aspeedtech.com>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
 <20210113070850.1184506-5-troy_lee@aspeedtech.com>
 <20210123161405.GA50622@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210123161405.GA50622@roeck-us.net>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10P9tsXQ098016
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

The 01/24/2021 00:14, Guenter Roeck wrote:
> On Wed, Jan 13, 2021 at 07:08:48AM +0000, Troy Lee wrote:
> > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> > 16 FAN tacho channel.
> > 
> > Changes since v1:
> > - fixed review comments
> > - fixed double-looped calculation of div_h and div_l
> > - moving configuration to device tree
> > - register hwmon driver with devm_hwmon_device_register_with_info()
> > 
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> 
> checkpatch says:
> 
> total: 0 errors, 9 warnings, 26 checks, 779 lines checked
> 
> This is a bit much. Please run checkpatch --strict and fix the issues
> it reports. Please also fix the issues reported by 0-day as well as
> the issues reported by the bindings robot, and resubmit.
> 
> Thanks,
> Guenter

I'll fix the WARNINGs and CHECKs.

Thanks,
Troy Lee
