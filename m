Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208B1C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Apr 2022 16:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbiDXQrb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Apr 2022 12:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbiDXQrZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Apr 2022 12:47:25 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E152AA88AA;
        Sun, 24 Apr 2022 09:44:23 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 4798122205;
        Sun, 24 Apr 2022 18:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1650818661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jXfsHUGKTURUo7Q7QC4akzndTGBjfMtiuq9NMiwlIeg=;
        b=rLwy+jwYNz5i1xoSWFINcDYAntlYfK+ZChasNk+xMu1+3v1XbYAvnCGEQv8zq2aHYkjE/L
        ZRZraXFOq0HszlQl5CWBdvI4bIQ7kZ0NzBWipNecd/h6+/TuxuMsG0OFGRl7v/ex3PEEtS
        vnEltJM4KLeCv+0Fi3lXnTpeUbCGJU0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 24 Apr 2022 18:44:20 +0200
From:   Michael Walle <michael@walle.cc>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: add driver for the Microchip LAN966x SoC
In-Reply-To: <82834494-dec7-b827-2910-f7823cb48561@roeck-us.net>
References: <20220401214032.3738095-1-michael@walle.cc>
 <20220401214032.3738095-5-michael@walle.cc>
 <82834494-dec7-b827-2910-f7823cb48561@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <47f81dbfb160abba385b98069fe0d06a@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 2022-04-24 18:38, schrieb Guenter Roeck:
> On 4/1/22 14:40, Michael Walle wrote:
>> Add support for the temperatur sensor and the fan controller on the
>> Microchip LAN966x SoC. Apparently, an Analog Bits PVT sensor is used
>> which can measure temperature and process voltages. But only a 
>> forumlae
>> for the temperature sensor is known. Additionally, the SoC support a 
>> fan
>> tacho input as well as a PWM signal to control the fan.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> For my reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I'll apply as soon as the devicetree file has been approved.

Thanks! Could you please make a stable branch with this series the
hwmon_sanatize_names() series [1] so I can ask the netdev guys to
merge it?

-michael

[1] 
https://lore.kernel.org/linux-hwmon/20220405092452.4033674-1-michael@walle.cc/
