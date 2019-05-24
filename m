Return-Path: <SRS0=k8b7=TY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC271C282E3
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 May 2019 14:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94E1A20863
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 May 2019 14:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5Vuw6f+/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391470AbfEXO3H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 May 2019 10:29:07 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:56122 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391271AbfEXO3G (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 May 2019 10:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=U3lhL7C21RlQ3Y8fqHe72if9AlIjCzKH0geVW9Mq48M=; b=5Vuw6f+/InbNYvGHy/t4l1ctwv
        NICaMYKZFU7S3zNcru+lf4o+rFfBiaawTIDAW60nnNGx+OTkL8xLvxqbURqVu/zZxQ0LB4ywk8uY0
        HIN8kW+qAVIiByvvyxy8qaFmxjNPdpPdh5fTXKJ4HkHINSHjJT08jptEhEJu4NqWNs/c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hUBBq-0001dE-VD; Fri, 24 May 2019 16:28:58 +0200
Date:   Fri, 24 May 2019 16:28:58 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Marek Vasut <marex@denx.de>
Cc:     Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH V5] net: phy: tja11xx: Add TJA11xx PHY driver
Message-ID: <20190524142858.GM2979@lunn.ch>
References: <20190517235123.32261-1-marex@denx.de>
 <2c30c9c9-1223-ad91-2837-038e0ee5ae23@gmail.com>
 <CA+h21hq6OW2fX_m3rGvhuumhwCj7MM+VjVH_G4RO85hgGa4p7Q@mail.gmail.com>
 <e7539c77-72ea-5c7f-16e3-27840b040702@denx.de>
 <20190524135209.GG2979@lunn.ch>
 <837d8b8e-cb69-1d27-cc10-4a4f66a5c0c5@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837d8b8e-cb69-1d27-cc10-4a4f66a5c0c5@denx.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Are all these subtleties documented anywhere ?

The netdev FAQ.

    Andrew
