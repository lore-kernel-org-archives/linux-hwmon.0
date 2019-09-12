Return-Path: <SRS0=SwvS=XH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D5C49ED6
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 00:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 576452089F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 00:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HESC4gcs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfILA2j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Sep 2019 20:28:39 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:38006 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfILA2j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Sep 2019 20:28:39 -0400
Received: by mail-pl1-f179.google.com with SMTP id p9so6205200plk.5
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Sep 2019 17:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/6Y+U3fxXd4apgshZtNQSnUgorxas4MClHVEvLgzTs0=;
        b=HESC4gcs/4JEo5i8oUUZrzYQGzy56TbaraiQQ/Vj348YMCkKMQni4+ZpWIwuVo1ZW5
         WTtC16r7pmQlnPvb0FdosfAbpporK8kKmvQpXRo4vyphP7+RTkdxJLd9Tm5JZpsqoO2B
         q4xLl9DGq90Prp2aH2480LOeTfMKENYvwLFehpaoJ5na3yNL0RMn2F7Xbtf89g6ggE91
         sJKu+jfeyg9+ec5h2ygjMevEp1rct69ncq5ADe+p5ORmV0zTQG90+uL6S3CLJpRD4wi5
         X0JDSGVMGHREcFa3I5UhdsHYP9tivvotifTKv3a3NnGyEkbQndlOB1u6VRX6qtpl8WNv
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/6Y+U3fxXd4apgshZtNQSnUgorxas4MClHVEvLgzTs0=;
        b=uD0i4Du/qQSbrL38hdDhV//mcTRxsfq9sDA0MdIYZd0O0/fSbe5D9sr5K/zJgNqSKt
         UaT5rWGRdROAd0sDWqvmQPeHoekxpKmJXZwZYsnQPaI2fqTAuSDvyAWjSmCumd1F5GWn
         cIHwAQ4muEc4K1jHML9o/ceeYXAAQWcOBcZBiSSPRI9FB94LSCfGnIa6j7RDX3UHGT8b
         hYzqEVj8TGdYe3jawWRTe/MV8Qt/I6ysBYYL/DsD5j3dcWeJyMJcdyMDBV1bm6k8RYUi
         l5SBXd70AZpKp3YYMmBZndgeHtZ/cO82B93pIvSz3oOZ2VgQQy2pwvTyqCXTgayT02NM
         6AZQ==
X-Gm-Message-State: APjAAAXrBfaUDeTqteBiqw4YhIErFq9S7vk3NHzYMPZ8CWf6A7cvzjLD
        IlTJJ2ingNBo8L+hzX4htv01vy+Q
X-Google-Smtp-Source: APXvYqyyCC4eEZM5GAu1XP0SzKjqMeOo75lhuMDBKvlb1TyWd8Ms+B+aF562hkOkQOjXj9uJqgOc5A==
X-Received: by 2002:a17:902:9d90:: with SMTP id c16mr28720250plq.12.1568248118511;
        Wed, 11 Sep 2019 17:28:38 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id c35sm20457533pgl.72.2019.09.11.17.28.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 17:28:38 -0700 (PDT)
Date:   Wed, 11 Sep 2019 17:28:14 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Subject: ABI for these two registers?
Message-ID: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter,

Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
(At page 32, chapter 8.6.2.14 and 8.6.2.15)

I have two registers that I need to expose to user space:
	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers

Right now in[123]_input of INA3221 are for voltage channels
while in[456]_input are for Shunt voltage channels.

So can I just use in7_input and in7_crit for them?

Thanks
Nicolin
