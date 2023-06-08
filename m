Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A8FC7EE25
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 13:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjFHNof (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236288AbjFHNoe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 09:44:34 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5831FD6
        for <linux-hwmon@vger.kernel.org>; Thu,  8 Jun 2023 06:44:32 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-653436fcc1bso376982b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Jun 2023 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686231872; x=1688823872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6Gwh0FKywTi4x3LopXoPp8aAEkhBLZJc416GFZDHiE=;
        b=i/vlJ6j/KUvHzzGFQRfet1MhTHczV2B3eM/ZuOPxGh0wMpytz84ZuSuXud1tvoXAUx
         I4liRu0mAvQe5l5/p1wo6YVpawT8sNTszdenUqj+f7Yf4LSOviwBIBSdeUY8hM1qqdKR
         8chS1PiqOMmXbMj6KFu9FzR9YWaD3OffzGogUy2dC2vREeZdNutetzvxFWiS1xOtXTRx
         5HiGeEYV4lGmhpxI9rU07BAb72s7dqjL3164JKckOK4ExZg+A2NF2aFMSc+TUIDltMex
         0ZtsXDKlaeLjWY4OVmU04tgeV6yMRAWsh4RKdpweZXABrb1EJOnIkVy5U2yyU4Nu6Nhh
         iSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231872; x=1688823872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6Gwh0FKywTi4x3LopXoPp8aAEkhBLZJc416GFZDHiE=;
        b=WtH2YyboDW24bJ7VubStj1JslXmHRjRPN1p36+VoJ/Z2MWlNPTj4fZuaPayYbYx9sI
         tDrELHcWE0TamA5t8O2/E2BmugzjiJYzwHAlEc85Cp8Pn/4gCvnwwRoBmD7UUz5K4wQG
         QjgDCRxLcJJg2JngLE9pWfyic0IqYHsqVkiuNdAdpGTHC3q1R0hniYdKma1lPa4LzXLT
         Otnsi/uD+FCpTcRg0EqMhQ5KPtg9i08MYRxDeOpR6E0ZNxaAePjdWmAD3iHPUPSVlVkp
         0gWRCy+eqzk0SOSJDMMr/in7Zm/s9c6qDRgj9KWh2f2cbbYVT43WyNQJBQ7MO+mXm9Ko
         n3jA==
X-Gm-Message-State: AC+VfDyTtAha+ytodW8Hk026fsI1r8i6URMgvxZgYQCy1jR6l6XX9tDU
        3pJ3CpMBbv7Tpt0mJ6CuaVMzQBSzmN4=
X-Google-Smtp-Source: ACHHUZ6fEV6aLF2+kOCWsMHZcaoB5qkdL3gLHsUxB9NsY2dEvfwKPwIm9pxlwHRgOGPRng6u23Xg+Q==
X-Received: by 2002:a17:902:ce89:b0:1ae:4c3b:bb0b with SMTP id f9-20020a170902ce8900b001ae4c3bbb0bmr5260428plg.5.1686231872265;
        Thu, 08 Jun 2023 06:44:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902dacd00b001b2404c7d53sm1447158plx.175.2023.06.08.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:44:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 8 Jun 2023 06:44:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Generalise support for FAN_CTL
 ON/OFF
Message-ID: <2afb6d4a-0750-4eb0-b518-d89353ff06dd@roeck-us.net>
References: <20230527094756.3464256-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527094756.3464256-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 27, 2023 at 07:47:56PM +1000, Frank Crawford wrote:
> Support for FAN_CTL ON/OFF is currently disabled only for IT8603E but
> there are severl chips that don't support the configuration bits to turn
> off fan control entirely.  Generalise this support for any chip.
> 
> Add feature flag FEAT_FANCTL_ONOFF for chips that support configuration
> bits for management of fan control off and assign all chips that support
> the configuration.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Thanks,
Guenter
