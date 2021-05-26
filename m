Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8024EC47082
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 574EA613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhEZPmA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhEZPmA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:00 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7CFC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:27 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id d21so1883754oic.11
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p6EUzksabHseu/oiWGG3GNVNZH2CwUF+8oFGGdwslUY=;
        b=ZmOlJWjy7ujkUTqJ2qwm3uXDIPuqI2+XPTwp91wLtfnO6G8eEDwsJacxEB0Aiw8ZV3
         nREpGEN43k2aReYp6EPMWEmk5OhelIeR555tCzuggpYFjSvaq3ABD/IUPgO7448gdRsw
         0shefqEiNtipvELwfzE8fYI+/L7vQ1Z9Uk9VTXA/stJdhV+kpyFtDHELHN+DZtTvErSH
         ZNnjTYq2oS8Xea3M14eaKDNv/hqWkr9mS/cxJq5XM/xm4B43/tHy8GOuzcdozj9M5OyG
         byU06MZZFJR1WSIhdz5Gh9W1ty/ob6L9kRaRX2cs3kJ7WDtK6Gmn6cyPJGMJkjPiMu3e
         QxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=p6EUzksabHseu/oiWGG3GNVNZH2CwUF+8oFGGdwslUY=;
        b=dq0l6xcfAqx2eJoB7prIGfK6bpWw+pD9UQUcAjBOtgsvVYNqJVUXTxcXS/Kqq5wnrO
         9mvWvpQgvnP2MeB0ZGp43i1l56IxeRvmWwKYy+Ldu2eZ48sdrUFmCGzB5inIySTMRjMU
         4EBv2PpOPGExI/NjgRolVXbqSFRt4tsI28prw37tlxd14nnsBuEDnZLucWq0cPJVDrVr
         gzjxJ6VlIFTordbfJm6+tmBe7Q09+ec+xfN4C0F9PNedcqydBAheDa4S8XQZU86FGAmH
         gt2sMTxf1D39Bib3SsFN/0ZVVvTqHaQBx0BBJl1Fc9Rp94O7hHV+JMPvIGnMPrZZZlLp
         5EhA==
X-Gm-Message-State: AOAM533jFe95ktKP+wuvQ2BLceHzfD0Y6LiaUE1ypsYOV6oFldTyNvbO
        mOcG4VegF36WrZi77675UDQ3eQkteaY=
X-Google-Smtp-Source: ABdhPJxPfAkHe3UReX5udfFpALZG2UbdYM04zkx7C4nlU/qYbMrnnqVzWr9jxYtBLwURxHZDDJs4mQ==
X-Received: by 2002:a05:6808:1281:: with SMTP id a1mr2307890oiw.143.1622043626265;
        Wed, 26 May 2021 08:40:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d19sm4141826oop.26.2021.05.26.08.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/7] hwmon: (max31790) Fixes and improvements
Date:   Wed, 26 May 2021 08:40:15 -0700
Message-Id: <20210526154022.3223012-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The following series provides various fixes and improvements for the
max31790 driver.

----------------------------------------------------------------
Guenter Roeck (7):
      hwmon: (max31790) Fix fan speed reporting for fan7..12
      hwmon: (max31790) Report correct current pwm duty cycles
      hwmon: (max31790) Fix pwmX_enable attributes
      hwmon: (max31790) Add support for fanX_enable attributes
      hwmon: (max31790) Clear fan fault after reporting it
      hwmon: (max31790) Detect and report zero fan speed
      hwmon: (max31790) Add support for fanX_min attributes

 Documentation/hwmon/max31790.rst |  17 +++-
 drivers/hwmon/max31790.c         | 171 ++++++++++++++++++++++++++++++---------
 2 files changed, 147 insertions(+), 41 deletions(-)
