Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FD1C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 16:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbiKKQY6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbiKKQY6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 11:24:58 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536406324;
        Fri, 11 Nov 2022 08:24:57 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id w10so3656685qvr.3;
        Fri, 11 Nov 2022 08:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v+NvVXltj/TbfxfwHAtJKzBZ9fC8sX5VYO8yKY7+0w=;
        b=lxCbdgG043WJk6nAw7tqpCP+OBhHWCUc59lIbHbniruluegDX9JB4OHUg+5ZgWPiIl
         r9eCHvO0OAjnQ5nTf0Yr4yycBYWIv99tMdQlW7pBfcj4TOEHSRTjevcE32jnja5XhGkH
         Xe4hXUpd+mma9HWahnmmoRwGmPC5RlE3weGc3tTDIH4xDsYMockR4PdH91YE6c6Uvhq9
         XB1r+QMcDL9MgYPDkohHEdI3FSFFVUxW9ixYauViPCnPaqwvZ11BBMX63hJS7543CtQ0
         IWY7tMjV5qmYeo4I3Ki3obXMn2daW5ZUBX/9ssKt9vaRV6n96zEpb82mMSH21Jq8v5T1
         zvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9v+NvVXltj/TbfxfwHAtJKzBZ9fC8sX5VYO8yKY7+0w=;
        b=V8lpsrwELTmyelVAdVPs2OrVq07LERASm22xulXVEtwV60iDwByeNpUMCnk1H88icE
         gEf56dzYsihuIccno65iipubeKSPwKO5JD2Xo93BS+fM37W8A4FF4g8oE2thcLCyGr9r
         8UG8EbhSqilwSSiLKUMA/mjAS2+HGtB65FH0smbCP990dcgjq1grncs65izsFQB95ZD2
         j7OH6EC0HVEhgrVKjYb4B8Sfv9JuQdRp8YsQj3rOwHCeZRfrDAAqX+Hg40zqQ+caFeiu
         j2lKW7bNjjCu7OUFjU7kIn1c+6PuhpdgcxfFuCSnYc9wkjqVeT2/Uq47IosZE0C3z+pL
         hgSw==
X-Gm-Message-State: ANoB5pkawau7WWNfXyUomUJZIqW9e6CeXmn45zVndvE0adYpt2cGkaN4
        wGdPvnBZV+/Mju7O2Mvvks4=
X-Google-Smtp-Source: AA0mqf5A1gZMCrNfUymfiQwVYfuFmR6TguGBFU1t3sOo4GarTkz/Mhy0NA3hat6o4zYx8ykthtfj8g==
X-Received: by 2002:ad4:420d:0:b0:4bb:5d3a:1720 with SMTP id k13-20020ad4420d000000b004bb5d3a1720mr2568337qvp.85.1668183896512;
        Fri, 11 Nov 2022 08:24:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a280900b006eeb3165554sm1643831qkp.19.2022.11.11.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:24:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 08:24:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6] hwmon: add OneXPlayer mini AMD sensors driver
Message-ID: <20221111162454.GA232204@roeck-us.net>
References: <20221104140659.593608-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221104140659.593608-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 04, 2022 at 11:07:00AM -0300, Joaquín Ignacio Aramendía wrote:
> Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
> and control via hwmon sysfs.
> 
> As far as I could gather all OXP boards have the same DMI strings and
> they can be told appart only by the boot cpu vendor (Intel/AMD).
> Currently only AMD boards are supported since Intel have different EC
> registers and values to read/write.
> 
> Fan control is provided via pwm interface in the range [0-255]. AMD
> boards have [0-100] as range in the EC, the written value is scaled to
> accommodate for that.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
