Return-Path: <SRS0=tV7w=T2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABFC282E3
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 May 2019 20:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2062A2075E
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 May 2019 20:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfEZUjc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 May 2019 16:39:32 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46106 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfEZUjc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 May 2019 16:39:32 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 9E3021424962E;
        Sun, 26 May 2019 13:39:31 -0700 (PDT)
Date:   Sun, 26 May 2019 13:39:31 -0700 (PDT)
Message-Id: <20190526.133931.595609145149817265.davem@davemloft.net>
To:     marex@denx.de
Cc:     netdev@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
        linux@roeck-us.net, hkallweit1@gmail.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH V6] net: phy: tja11xx: Add TJA11xx PHY driver
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190524142228.4003-1-marex@denx.de>
References: <20190524142228.4003-1-marex@denx.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 26 May 2019 13:39:31 -0700 (PDT)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marek Vasut <marex@denx.de>
Date: Fri, 24 May 2019 16:22:28 +0200

> Add driver for the NXP TJA1100 and TJA1101 PHYs. These PHYs are special
> BroadRReach 100BaseT1 PHYs used in automotive.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: linux-hwmon@vger.kernel.org
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Applied, thank you.
