Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77EAC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 08:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiECIy0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 04:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiECIyX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 04:54:23 -0400
Received: from skyrocket.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE18820BFD
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 01:50:49 -0700 (PDT)
Received: from mail.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by skyrocket.fabmicro.ru (8.14.9/8.14.9) with ESMTP id 2438od2O057796;
        Tue, 3 May 2022 08:50:39 GMT
        (envelope-from rz@fabmicro.ru)
MIME-Version: 1.0
Date:   Tue, 03 May 2022 13:50:39 +0500
From:   Ruslan Zalata <rz@fabmicro.ru>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <20220502110010.q7vvdkdpaiz5acjl@houat>
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <20220502110010.q7vvdkdpaiz5acjl@houat>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6009fbef45a8b77caa4fc137093a1e23@fabmicro.ru>
X-Sender: rz@fabmicro.ru
Organization: Fabmicro, LLC.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Maxime,

> I guess a better path forward would be to either register an hwmon
> device in the original driver, or convert that driver to iio and use
> iio-hwmon.

My first idea was to add hwmon to sun4i-lradc-keys.c driver. But soon as 
I began hacking the driver I quickly realized that it would be a mess 
since keyboard and hwmon belong to two different subsystems. Besides we 
would need to invent a way to control which way the driver works (new 
bindings?). So I decided that a new independent small driver would be a 
better solution.

---
Regards,
Ruslan.

Fabmicro, LLC.
