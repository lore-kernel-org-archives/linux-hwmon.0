Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8EBC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Mar 2022 08:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiCII4j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Mar 2022 03:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbiCII4i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Mar 2022 03:56:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D988B13D933;
        Wed,  9 Mar 2022 00:55:39 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m42-20020a05600c3b2a00b00382ab337e14so2890493wms.3;
        Wed, 09 Mar 2022 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VH9AbBrPXRG109H3QebLiQf4Jg9EHI5Sz6/Yo6+8NsA=;
        b=VPMBOQlnUt1n7P8I/nP8Gdn21loCOt0IttXY9rYtqPBUop6slFNYZFf1ftNacgwfkP
         DX1xPpygGOmn6kD0m6LG2ZIh1MnPrdhvFasl6D/EcZi4rO+XiH1Lsui+G9kDEKXe9/5d
         1hWUYPj8M/bZW6iNlAnBmwW03M6MVAgTLVcI9nEPreTXq5SeKJJmFToK3xaP92d+bACh
         jxMvjBTGptaQBHFPg7tKXxBhBlujBQYLFTHok5KZShnrh+LPsdHX+0giCfqdX4oDxkyf
         gEEBWM0LXbGDU2nsbRWJEvmwsDlZHM4O8TMRQ/13nQkscaqeLyJGjqM/B/n9+QbwXIfU
         1C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VH9AbBrPXRG109H3QebLiQf4Jg9EHI5Sz6/Yo6+8NsA=;
        b=mq/8cinWhGjH4zDPYr/lyg5GrqMl20m6KZVkFE/+Zo+0p9aSZHFIUhHInNpzCpx2cE
         PBbm16vGt2epfL0H850x77fZME+ahDoR2pceSmbhABcDUZcpTtC56tstMju79++QJoku
         mTpJvz5/usvoHsnn5+VGExB+rJGh6G6vzUsEYatdF772fdWsmRCyUKi+3gr09x4lGwB+
         c+mg6dLvhs34pXnCjIhrmJaEXWrQfLNCHJoMfoX24Shzm3y5wsnqc/jN9O7T7tq+SEm/
         IrAkzmg0Ob5uLOSb9K8b6A7RCO+urHOHIaqRAU8waQ0u2r8vzi2skR6xGLC2SnbIq6Tj
         dY3Q==
X-Gm-Message-State: AOAM53191aczBUy0kFmrFiGx6MG+hwWa62lypnuopQ+L97st5DXl9Ko4
        5XFu20U2iRNqnLVkNkgeJr4=
X-Google-Smtp-Source: ABdhPJxny+69U+uASjszCj8L/yA9TbdRFQxtV0w/a/mmkaS77KwOUP35uyP17mMJWChGufGKW2illA==
X-Received: by 2002:a05:600c:22c9:b0:381:3b27:89be with SMTP id 9-20020a05600c22c900b003813b2789bemr2510045wmg.83.1646816138352;
        Wed, 09 Mar 2022 00:55:38 -0800 (PST)
Received: from fedora ([95.180.24.23])
        by smtp.gmail.com with ESMTPSA id o11-20020adf9d4b000000b001f0077ea337sm1129989wre.22.2022.03.09.00.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 00:55:37 -0800 (PST)
Date:   Wed, 9 Mar 2022 09:55:35 +0100
From:   Aleksa Savic <savicaleksa83@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Add support for
 Aquacomputer Octo
Message-ID: <YihrhwBeS5i8ehGV@fedora>
References: <20220308105225.24178-1-savicaleksa83@gmail.com>
 <f13f68eb-d208-9df2-80ea-6aedd686cbc1@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f13f68eb-d208-9df2-80ea-6aedd686cbc1@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Thanks. I'll fix and resubmit.

Aleksa
