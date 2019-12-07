Return-Path: <SRS0=6LgM=Z5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512B0C43603
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 13:51:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FA2E21835
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 13:51:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOgqgwFo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfLGNv3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Dec 2019 08:51:29 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46524 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfLGNv3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Dec 2019 08:51:29 -0500
Received: by mail-pf1-f193.google.com with SMTP id y14so4833815pfm.13
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Dec 2019 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zOv5lY4PAjbfbG8GUApEIuCCDMNZPJWHLfEV2FDaSd4=;
        b=WOgqgwFo5+JwJtoa7+5idHf1Jd8y9R6++ncupV3i6sH9GLpn+HsSxcKDpUhXvoJMCs
         usIAmkVKMDzy6rGRjE//MMBFre4QdeKGButDCoq4FT/bg+T6UgPUOkWFHzrd1XLzJlBQ
         fe1g7FAMe50Drh9wzmyVvfaQHSsQwsH593m69lNcPG6A458ZwW6OLwi2WgimQK9Dltf1
         4AKw+D+vScjKJ0IjKhhyAux+V++7UQBHOPoXOVqD5kTP+WZ6ZtftzCoRe7CmVNvREzZl
         p17WkO/P8U5t5ZvlTnuzXAj/Kf9fXw3mKX8TAc16pNYTlylVOiMrA+MFolyncAaPrJpt
         X2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zOv5lY4PAjbfbG8GUApEIuCCDMNZPJWHLfEV2FDaSd4=;
        b=UZSg1Kh5iQhY1pJMP2muo8cLgr/5CMf9dmduNE45bQ35hlpVqrowmKwZApgYyq4mb2
         gBiYxljrcveV1n41UBBAODNnZY9kyBoGljUCp0eNY1nVMD4gi18F8jlMYwpr5tnma8B9
         1kBcEHpjfMFJIR6OB3kVg5m8TmBRMrjCbwa+7mwkdeiohpc+nRXLPmEfpkRKNuc24DO8
         CGbNgoFrlmnWtmjj+kk3GMuHaYU4Z+OH7gXwWviBd22gxGAXQAWebkNmboEKr8zCwMsM
         aVLMltDhlESAaRwmzX0z2Z/TGbmbVHcJgTv5qYiWNmxN4VGccfM+VOXf73FtCiAeD+GX
         s1Fg==
X-Gm-Message-State: APjAAAWXCNndXiz5AyJImmja5/pF7y2UPoIgbWhwdN6/X8+9kuB6NW5h
        1m9b5bheYNKT4ivD1AB1AtU=
X-Google-Smtp-Source: APXvYqzCbV80YLU1tTRx2+qsPAM5azKwC9b1Z5PKJLuyd2hApRrRgRCrcKgvQlxcz3MTJuznsuuu2w==
X-Received: by 2002:aa7:9afb:: with SMTP id y27mr19818929pfp.91.1575726688840;
        Sat, 07 Dec 2019 05:51:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm5434225pfh.182.2019.12.07.05.51.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2019 05:51:27 -0800 (PST)
Date:   Sat, 7 Dec 2019 05:51:27 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191207135127.GA24852@roeck-us.net>
References: <20191124202030.45360-1-linux@treblig.org>
 <20191124202030.45360-3-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191124202030.45360-3-linux@treblig.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 24, 2019 at 08:20:30PM +0000, Dr. David Alan Gilbert wrote:
> Convert the old hwmon_device_register code to
> devm_hwmon_device_register_with_info.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Looks good. I am sure I am missing something, given the size of the patch,
but I am going to apply this to hwmon-next.

Side note: At some point we should drop support for nct6775 and nct6776
from this driver.

Thanks,
Guenter
