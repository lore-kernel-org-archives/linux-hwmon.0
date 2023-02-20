Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B5BC636CC
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Feb 2023 17:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbjBTRON (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Feb 2023 12:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbjBTRON (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Feb 2023 12:14:13 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7058A16321
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Feb 2023 09:14:12 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id e10so495075ilu.4
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Feb 2023 09:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClyVx85vpQ+A5Uj+QtVamMFVEk6ds6mSpjb67MxZ8fI=;
        b=JZhc0FwQ2ayLn+Uj99sUpsgVFaXl8CEaALHjT8kM49X2WoYMqkp5vWdFhLNFyuxRCG
         5U/h9MgKbladoqECzaWcWbpjUX4BKOOMZ8a8ENgMll7rsYYednF2Av72U+Udk2QNO41M
         zQ5HAj+WO8FKQiDVVVqCXa+9s3IwYM95ZOXpdhQdBGoc0UY0iyZi/Zp//nsPnoLSsLY8
         Xto1gHlKiYhkDdGQLeEuHJrfAwxkBJ/2aESQk82Mg30EV0sNrEm48esDaESYVsbplOiX
         CfLjC5M/2mg4LSitfLx/6SriyqdYnegwVp7C37u2vkblZ/1/Z2zBLqYtVXrZpFZFxev3
         c7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClyVx85vpQ+A5Uj+QtVamMFVEk6ds6mSpjb67MxZ8fI=;
        b=6l6vzBqtjyGuRyWVSx2p4WHnDs0TH8zaf4XUbW3NZ1OmfRtY5zOpy4YKtpNqdEVT6m
         ZfQJPOm32qsfydhiMFhBSJ+/TFFH0Oqi/VvwPOFai4UOW6FoT1dLzDj3hgVend93Qlmo
         NLlAthSjgRGeB2E2/K9OmLj85VJPvbrncZzygb9jjRAb5mRuP+C9Sb5+SJWTZlrL3Vjo
         MSCmWv6O9g18KF+6UF3C+xLneV08nJht7EKKqo+ImGk2QwF88oB6VvyKq3sJWs07Kbxh
         YQOjyeKzo3oHnqIgLwrAxBzEKjQeof1Wj6EM37zpLf7OrI0uGLjHgY+eC7ZKi3IkQ+el
         q4TA==
X-Gm-Message-State: AO0yUKW4RwSrHSCadcL/v7PbqumAgYvyhh1JjY+6sLKNXJ20U5zVFJmf
        nBOe2YPzmaMOFbFpWLP5WiWXXI24NWI=
X-Google-Smtp-Source: AK7set+bZZx5P6ZHxyMyp+sdixQI6IKt6pfsdPTZxaNQHUCLoBQyAhNBZr9ZsCYKGkKkA/krr5HiKw==
X-Received: by 2002:a05:6e02:1a04:b0:315:3fe4:1d0a with SMTP id s4-20020a056e021a0400b003153fe41d0amr706755ild.0.1676913251853;
        Mon, 20 Feb 2023 09:14:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4-20020a92cd04000000b003154a4a039esm872359iln.5.2023.02.20.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:14:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 20 Feb 2023 09:14:10 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Enrico Mioso <mrkiko.rs@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, linux-hwmon@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
 aqr_hwmon_set
Message-ID: <20230220171410.GA3076234@roeck-us.net>
References: <20230217231647.968107-1-mrkiko.rs@gmail.com>
 <Y/AtxyXsMVHf0ygt@lunn.ch>
 <20230218144234.GA2652402@roeck-us.net>
 <d49c3219-f67d-76c9-acba-f518ebbdb73f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d49c3219-f67d-76c9-acba-f518ebbdb73f@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 18, 2023 at 09:50:29PM +0100, Enrico Mioso wrote:
> 
> Onanother side - if I want to set those limits to -10 °C and +90 °C, may you suggest me a DTS snippet? Thanks,
> Enrico
> 
That would hae to be supported by the driver.

Guenter
