Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2DFC64E7B
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Nov 2020 14:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B63082085B
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Nov 2020 14:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="rUVpJ1DT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgK3OvN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Nov 2020 09:51:13 -0500
Received: from gproxy8-pub.mail.unifiedlayer.com ([67.222.33.93]:59590 "EHLO
        gproxy8-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726220AbgK3OvN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Nov 2020 09:51:13 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id AAA141AB0B8
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Nov 2020 07:50:30 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jkVakfLPhdCH5jkVakjnmt; Mon, 30 Nov 2020 07:50:30 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=cYj8UELM c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=iVeWByoVIOZTqDy8_TYA:9
 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2Tt9i/op0/nQkzG0OKe6aUj7OlGKM9MANi9G+onZW2Y=; b=rUVpJ1DTlz8ASTXkftV7E9gMwD
        5pTDmFRg6IBMzpH2XL8vXPcxDY3FzRMtaHFcnzGD+Uy1DsfXRrLA7nN0aKmmWF3qOisBDFn+uTOy+
        /inH+fIV+XHBNbcfSrPyF2bOu8iFBdeFRoNdzmWi2gqRPN1DoeIrRxaWxjwKubIFJkj/xOS91tlbb
        2pUUGXWYfi8/mGM+IU3oCVkKyHpE03XrTew6TJHjN1hoa71S81v3kn5QtPVlRFMaix9J6yBMdS8Ob
        EFbx1Cog+j1Kgn2YIP6ae8ohwlAE0uTToZAb7PVRthk5CebCXZDvLoSFdy12x7SwbYx9c4pi9OVeE
        6TLG6lnw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55694 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjkVZ-0031g5-J9; Mon, 30 Nov 2020 14:50:29 +0000
Date:   Mon, 30 Nov 2020 06:50:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     Jonas Malaco <jonas@protocubo.io>, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: update supported devices
Message-ID: <20201130145028.GA16278@roeck-us.net>
References: <X7+T4aZSUuzfsf7H@monster.powergraphx.local>
 <CANS_-EN8rgFEyE5rDw3=JLUYNwLQexafn7efvMC_=+4s2h1R6Q@mail.gmail.com>
 <20201128113524.24f4f56f@monster.powergraphx.local>
 <CANS_-EPK75zrVRtBKxO-00RZD-XWrixJD8DH1_d=80rbazXQng@mail.gmail.com>
 <20201129073618.082c2291@monster.powergraphx.local>
 <20201129130049.GB120875@roeck-us.net>
 <20201129165443.51d22225@monster.powergraphx.local>
 <20201129215933.GA131003@roeck-us.net>
 <20201130062230.2141750a@monster.powergraphx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130062230.2141750a@monster.powergraphx.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjkVZ-0031g5-J9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:55694
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 30, 2020 at 06:22:30AM +0100, Wilken Gottwalt wrote:
[ ... ]
> > 
> > Can I just drop your previous patch and you send me another - more restrictive -
> > one ?
> 
> Yeah, dropping is fine. There is no need for another patch after that, this was
> a patch only dealing with the AXi series.
> 
Done.

Thanks,
Guenter
