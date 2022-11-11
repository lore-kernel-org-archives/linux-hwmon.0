Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FD9C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 16:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbiKKQV1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiKKQV1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 11:21:27 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7DE60E88
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 08:21:26 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id x21so3273832qkj.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJLaPkBrLP7IHz8aOxV3pYnlAnsvFqe5xPDqmP2mgNQ=;
        b=HR8G4imFHXU7qCEJCkdJL1QyGKSzNGXuyHd5HD0HR13I990Wg7uCLIFbyuq+cHExjf
         aopQESwUPDcNNEs6a5Fq85nXBL6ZUTsQv22RFXvfxMtd7dMTrv6nc3HNHk5uHb/za8Hs
         u9g51GXp7YnILJiHdJ+Xj+MPfRH/NkmlSRMgHjfxUXvsJ31fo9tkxyVJWSR7sqQVkGwO
         1CXeYIJ+0gxvDZANU4Bhqu5CketscNdefgrp2vEBX7ldCQTNVXWiKboaGacrfLwKYhgH
         JAzZPrdbzk+yg+2N/3hrB8PYCjgyUH44wOxHnV9bNpcpOOK5hlpLTqqrGJD5l9XgqIwf
         FskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJLaPkBrLP7IHz8aOxV3pYnlAnsvFqe5xPDqmP2mgNQ=;
        b=A63KXQ6q+oZ8MAeJOtZh/pMMyRPTztl3dglBMrkKOZNVB8y8FEoIrRrZOrn+7fFyrp
         1s0PjjI6Lie2RXzbQXcpHhTZQkG+wiEfA/hTXzrOjLrqisqTc700YWu1lGB8+qAw9obi
         MNvRMheGuO0F17NMCax2Pnvtj5wWIyRgETacsrWiMMWrYeGHsLZUHfy8bK2ocIVlg2oh
         fI920WquK/yOTglxPQ7MGeskv3YYxX6Mnohb16QfTdUVixF+c+dsMyFjdozsXukHryKJ
         rtSCk03CG/Wvxyijowtp1VKocEokTuodZZFioxYHSbBr/+wiEMGLIx2ZmTLssesJ+OHt
         PUNA==
X-Gm-Message-State: ANoB5plY0UAsy1Auzts86wMAT3lJOefhv46KVy4CdWzeaQ+b73bDsx9U
        LG0BYP0J6UizMUuSiPxFhV+1UP35Qw0=
X-Google-Smtp-Source: AA0mqf6wCM5fghN31nUu1VeQOpxZ6SqlFeUEXL1IwAFkEslxz2scEz4YA9Q5pp84MCJCoDuDN3y3KQ==
X-Received: by 2002:ae9:e64b:0:b0:6ec:5459:9cfc with SMTP id x11-20020ae9e64b000000b006ec54599cfcmr1683887qkl.295.1668183685703;
        Fri, 11 Nov 2022 08:21:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bs13-20020a05620a470d00b006b61b2cb1d2sm1697920qkb.46.2022.11.11.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:21:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 08:21:23 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 1/1] hwmon: (it87) Add DMI table for future extensions
Message-ID: <20221111162123.GA230547@roeck-us.net>
References: <20221105232531.1619387-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105232531.1619387-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 06, 2022 at 10:25:32AM +1100, Frank Crawford wrote:
> Add in DMI matching table to match various board quirks and settings.
> This will be useful for future extentions, but will start with the
> existing definition of the Shuttle SN68PT.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter
