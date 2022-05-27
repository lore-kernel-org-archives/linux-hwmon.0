Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC993C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 May 2022 05:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238956AbiE0FIz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 May 2022 01:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbiE0FIw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 May 2022 01:08:52 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED8069CD1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 22:08:49 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Fri, 27 May 2022 07:08:45 +0200 (CEST)
Date:   Fri, 27 May 2022 07:08:42 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 20/40] hwmon: (lm90) Add support for ADT7481, ADT7482,
 and ADT7483
Message-ID: <YpBc2uOTL6G6nREp@t480s.localdomain>
References: <20220525135758.2944744-1-linux@roeck-us.net>
 <20220525135758.2944744-21-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525135758.2944744-21-linux@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653628126;
        bh=qjXWF2SxjaLYFYf4Ou0CUK1Dlc+PO7EjfyrTq7tBWOo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=UKroSo0dRAWXUUhdlNS0A2Fu7h4Mq1waoWVlDr2/VA/P8V+gOtcL9MnfI+8b/m7MH
         NRs/ciX2253v8M5W4xRwf0t4D0aEw2yCWxGGxtr9Umyqu7WfLd7F0218DuuMivuX0m
         Yx4TT1p/CN4u/OWh1WRRVqRUkCZpnkkJJCLfexBw=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 25, 2022 06:57, Guenter Roeck wrote:
> ADT7481, ADT7482, and ADT7483 are similar to ADT7461, but support two
> external temperature sensors, similar to MAX6695/6696. They support an
> extended temperature range similar to ADT7461. Registers for the second
> external channel can be accessed directly or by using the same method as
> used by MAX6695/6696. For simplicity, the access method implemented for
> MAX6695/6696 is used.
> 
> The chips support PEC (packet error checking). Set the PEC feature flag
> and let the user decide if it should be enabled or not (it is by default
> disabled).
> 
> Even though it is only documented for ADT7483, all three chips support a
> secondary manufacturer ID register at 0x3e and a chip ID register at 0x3f.
> Use the contents of those registers register for improved chip detection
> accuracy. Add the same check to the ADT7461A detection code since this chip
> also supports the same (undocumented) registers.
> 
> Devicetree nodes are not added for the added chips since it is quite
> unlikely that such old chips will ever be used in a devicetree based
> system. They can be added later if needed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/lm90.rst |  38 +++++++++++
>  drivers/hwmon/Kconfig        |   3 +-
>  drivers/hwmon/lm90.c         | 119 ++++++++++++++++++++++++++---------
>  3 files changed, 129 insertions(+), 31 deletions(-)

Reviewed-by: Slawomir Stepien <sst@poczta.fm>

-- 
Slawomir Stepien
