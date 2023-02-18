Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15DFC05027
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Feb 2023 01:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjBRBpr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Feb 2023 20:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBRBpq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Feb 2023 20:45:46 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1EA6A06C
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 17:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=DNdZfVzDLy7FYC3sRTUaWjYU7yCKcPQpB0TOPD34FJc=; b=bbwKcqPfuKwKbdnFDxYRG3ZveB
        GIrBrumpUcnsWWfuXuReoDwwXKhEmff0wSLAF5pIhr1yU3Di0aDlrJeGGxy1P3pfcagjHGQc1q0ML
        mjDBDkTB2iVBsWxXKOcYrxPhmXPh/h1ldZvkMsQog4VctqckAN1x3tPf7Ij65GkvfZTE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pTCIJ-005MCP-J1; Sat, 18 Feb 2023 02:45:43 +0100
Date:   Sat, 18 Feb 2023 02:45:43 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Enrico Mioso <mrkiko.rs@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
 aqr_hwmon_set
Message-ID: <Y/AtxyXsMVHf0ygt@lunn.ch>
References: <20230217231647.968107-1-mrkiko.rs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217231647.968107-1-mrkiko.rs@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> diff --git a/drivers/net/phy/aquantia_hwmon.c b/drivers/net/phy/aquantia_hwmon.c
> index 19c4c280a6cd..6444055e720c 100644
> --- a/drivers/net/phy/aquantia_hwmon.c
> +++ b/drivers/net/phy/aquantia_hwmon.c
> @@ -70,8 +70,7 @@ static int aqr_hwmon_set(struct phy_device *phydev, int reg, long value)
>  {
>  	int temp;
>  
> -	if (value >= 128000 || value < -128000)
> -		return -ERANGE;
> +	clamp_val(value, -128000, 128000);

It could be argued that value < -128000 should return
-EUNOBTAINABLE. I've had trouble getting DRAMS to work at -40C, even
those listed as industrial. Setting an alarm for -128C is pointless.

+128C is also a bit questionable. The aQuantia PHYs do run hot, you
often see a heat sink, and they are supposed to support up to 108C. So
an alarm for 128C probably also does not work.

Anyway, as Guenter suggested, please change -ERANGE to -EINVAL.

     Andrew
