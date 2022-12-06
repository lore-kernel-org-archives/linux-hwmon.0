Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C633CC3A5A7
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 05:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiLFFbu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 00:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbiLFFbt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 00:31:49 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E217F220DB
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 21:31:48 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 82so12482531pgc.0
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 21:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnYRT7dGiX4P5zp8J1t4fojUZ7kYrWQBtCw18C6ZxoM=;
        b=D/Bpc2X7461Fr8AfKKI88T9xQYPmmgR6tbwZygfNg+b9t1Hfw3yS774bDA0OXp9Zum
         u/XRaSBOP24sU6ZoUE5sM7NTV3XvZsGdxF3gmrF2OOtR56nbJHNwShWIgMOB7KxsXUeX
         YbI5K86Ee2lySY5NBNLJTZYYvof9fVEoECP9tblb+CwojbGPX4rveZSJ+LWcp1gRgJYX
         xDpPACA/H5MHWTw+75966EkYHw2AWAOlY4x7gj4L0SSsqrBoocHshmbe5udNusi0HBoG
         Se4Njyw49YtGX0RmhTlx6vj8gFF9vrqdOWgM4wYdPkvdde7+faVYKIS26KHGTb8BqLhK
         mk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnYRT7dGiX4P5zp8J1t4fojUZ7kYrWQBtCw18C6ZxoM=;
        b=AEfoFwGNRSE0UqRBLAjV08YI62uGc7HXTenMC6X89LtQxWGcWMVTfuZrJ/in2nHUyr
         jOUsGyerIPEufpxojTYlltAjD3EIP+hUsP9Gc2YbPXihXZi3S822Z5gfKacepZigBJAK
         P/KG2Me3SBCDy+CsEc4nqukkMuWrC+mZGvXE9PdjwaaF2LLVU040s/6QjqznnhgPSyZU
         PBO78wQldvRKVJ831EVxeSBMyq9qU49jYjLYYxc0uKaYVhBaEoaC0pnbA1tilUY9k5fB
         8J31Nikiz41tmgHjVjznpbPKQWh7ZLQIQXobhIlNA36wHVS22j5+u2QkMgW9NQUM0hBU
         baqA==
X-Gm-Message-State: ANoB5pmC36Ix+TAABPpLhcD/mWpvOxwajXc3BGforPG/HxJBpquYk8WP
        YCoyQWyfpRJYFy+WyaRJo/jXsnJOo/Z27sRF1r8=
X-Google-Smtp-Source: AA0mqf4YVXlTKHj7IfpYO7LeXaPnvnmURo0sItrTl0urNU2q4rphseY/OkkVR3ZdzaNo/ciuviN8dw==
X-Received: by 2002:a63:de01:0:b0:476:32a2:253 with SMTP id f1-20020a63de01000000b0047632a20253mr62938775pgg.133.1670304708215;
        Mon, 05 Dec 2022 21:31:48 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b00186b69157ecsm11574039plg.202.2022.12.05.21.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 21:31:47 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Michael Shych <michaelsh@nvidia.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: RE: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set lower
Date:   Tue,  6 Dec 2022 13:30:29 +0800
Message-Id: <20221206053029.169506-1-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205173611.145571-2-nanpuyue@gmail.com>
References: <20221205173611.145571-2-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


The value range of the chip's 'FAN DRIVE SETTING' register is 0-255.
But currently, the driver can only set up to 10 values at most (even via
the 'hwmon' subsystem) when the 'thermal' subsystem is reachable, and
there is no way to increase this limit via "emc2305_platform_data".

Should the "pdata->max_state > EMC2305_FAN_MAX_STATE" check be removed?
Or 'EMC2305_FAN_MAX_STATE' should be defined as '0xff'?

This should be the third patch?


> 	pdata = dev_get_platdata(&client->dev);
> 	if (pdata) {
> 		if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
> 			return -EINVAL;
> 		data->max_state = pdata->max_state;
