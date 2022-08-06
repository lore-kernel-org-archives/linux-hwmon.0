Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01094C25B06
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Aug 2022 08:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiHFIbT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Aug 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiHFIbS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Aug 2022 04:31:18 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24F915A1D
        for <linux-hwmon@vger.kernel.org>; Sat,  6 Aug 2022 01:31:17 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso10180359pjq.4
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Aug 2022 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=U7CDG06zN618piD7I8XW6HV54roMQW74LZKrYlU2KVo=;
        b=UUDrbZWgRpqXR+CLnt9LoEmxXY/Pc1aJUccgrdGqu0YsA14a5lPzygPODth/CocKki
         mBnHNTPQNp13GdwKQyJ+gfic8P+lOyk9RUas3tGEfeDCoSD2IHgTaQtrCMDx65ReUT1A
         aj+r6GIACNOhLprALVV8/NmcGux+c+4X2P7+EdC+lB5gMDteQsV/hkbaIm+KYxqeFhHb
         ybZHq78rtQU3Hc7PzbwhkeUmXXegrlIaztG/ANsRILPjoavi8nJaZjNGZDoM3zRyPdXV
         qgnEIBZKSyPCeEK93nNornMF5nyvNWytnRcBDPh74Z58OhJ9qTkIYXJuuRzgBfMprKrS
         TONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=U7CDG06zN618piD7I8XW6HV54roMQW74LZKrYlU2KVo=;
        b=oovU/BNO0rgFJ+nVvrnPaL2qQczTG52PuBWJ9htrHyOck7shwnVovHZbD/75x3ZlMQ
         8hgUFvIjrXZuV27z3rUiAzlZTDnktonDH+/0wwvazr44I+CCTZ683AEEgwwvwE3JU+9V
         YcAdxxa81b2Oqrlvm7ebJ9TYO2z/RegnXdCyLtxMWskgiYsbuX7mm40bHu5umTn7oeG+
         nSoZt+QvKAP78B9/u8crIEZnplW0RFVLZKK8YkXyfciYgtkDRgnMXkg8zkSGaCFc4Fn2
         FoKSfkgHlJLS0BHVvkQ+uzEaii3K3PvO0KaYoDz0OFhvbXUSOxBLx6df8cGg7E306EXT
         Ksow==
X-Gm-Message-State: ACgBeo2owhKLEIVzaCRL9vr3s515MVl3u99uhYZrprHbyBRV39kLUCM2
        9BmepP0gEZc5RPkGOTGplzU=
X-Google-Smtp-Source: AA6agR7AaJLrj3eI6R/M9IZho/wQiYkk1PJuKqZdIh+hiPUD1ZIXBfdEjxqrsFzHzO/bUHfxaLnwcQ==
X-Received: by 2002:a17:90a:bb18:b0:1f2:f715:60bc with SMTP id u24-20020a17090abb1800b001f2f71560bcmr20084236pjr.215.1659774677166;
        Sat, 06 Aug 2022 01:31:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902f64b00b0016c0c82e85csm4382429plg.75.2022.08.06.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 01:31:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 6 Aug 2022 01:31:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tokunori Ikegami <ikegami.t@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
Message-ID: <20220806083113.GA3986075@roeck-us.net>
References: <20220806054606.7280-1-ikegami.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220806054606.7280-1-ikegami.t@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
> NVMe drives support host controlled thermal management feature as optional.
> The thermal management temperature are different from the temperature threshold.
> So add functionality to set the throttling temperature values.
> 
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>

NACK. There are several existing limit attributes which can be used
for this purpose. I would suggest to use EMERGENCY and LCRIT attributes.

Furthermore, one can not just extend the hwmon ABI without discussion,
much less as part of a patch introducing its use. Any attribute introduced
into the ABI must benefit more than one device, and a matching
implementation in the sensors command and the lm-sensors library is
expected.

Guenter
