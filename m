Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF109C4167D
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 13:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344694AbjJaNyi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 09:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344691AbjJaNyh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 09:54:37 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4AFE6;
        Tue, 31 Oct 2023 06:54:34 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 924EBE0007;
        Tue, 31 Oct 2023 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1698760473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5rUHRQv73AIrtd35QNYvGvh4LBovqhhzdBrWZKCti2w=;
        b=iwqxiKdpn7JuId1ORGHScXnbczVUO2o7i2nH+wlQYZ5ECVmdGhJMvkx9PvZl66fr6cBFM2
        JLAM1dwn6CiUQq2sMi+/GMGQupOb2u/xld0QYEd14ieHFXhwbRbaFn7DL4DfffbQS7t47+
        pBDQTBQ3LDkApcVP3soGkniQ52E/lyFX8RmLXT3kL2Rmc2kvZCsMY/n/ttLQ+wx5NI81k2
        JM7UyqOX0wrMOwGZF5HpMxvpgGc97YdW+4go1TrghY7NvDSwQVZpM+vGI32m12uWVVCWTh
        NEhJV6+/M8rs/hq513YGbNjA8bH73ZWAKhKHzeoeT60t6gjroEdfpqW2dYkytg==
Date:   Tue, 31 Oct 2023 14:54:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/2] drivers: rtc: max31335: initial commit
Message-ID: <202310311354329a21a9d0@mail.local>
References: <20231030115016.97823-1-antoniu.miclaus@analog.com>
 <20231030115016.97823-3-antoniu.miclaus@analog.com>
 <ce07d951-f492-4137-9588-1d55001e0003@roeck-us.net>
 <CY4PR03MB339979DBB7ADBFC3872156019BA0A@CY4PR03MB3399.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR03MB339979DBB7ADBFC3872156019BA0A@CY4PR03MB3399.namprd03.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 31/10/2023 11:23:49+0000, Miclaus, Antoniu wrote:
> > > +	if (status != MAX31335_STATUS1_DEFAULT)
> > > +		dev_err_probe(&client->dev, -EINVAL,
> > > +			      "Unable to read from device.\n");
> > > +
> > 
> > That is misleading. The device returned an unexpected status.
> > I don't know if this really reflects a problem, but it is not
> > "Unable to read from device".
> > 
> 
> Since the device lacks an ID register, I found this as a suitable 
> replacement for checking that the communication with the
> device actually works before the probe function finishes
> successfully.
> 
> I will be more specific in the dev_err_probe message in the 
> upcoming patch version.
> 

What if this is a transient bus error and the device is actually present
and working?
 don't like this kind of check, they are not usually useful.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
