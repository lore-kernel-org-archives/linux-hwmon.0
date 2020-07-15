Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72BFC433ED
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 08:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FFE520672
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 08:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="sKka4REm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="szvXy0KY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgGOIe7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jul 2020 04:34:59 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58477 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730120AbgGOIe6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jul 2020 04:34:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 8DF555C0138;
        Wed, 15 Jul 2020 04:34:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 15 Jul 2020 04:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=WEafkFKlZif10zVrKpRgSxKOWc7
        Ljh7MyeD0Tj3dL2Q=; b=sKka4REmgrKh4GchAIbzt3cK6A0BD/I6u0rm9IoQYDc
        K6KiYEpMn/qBM8XIoNyn64QYUomODQw2zA0J5baBGL8pg4uo/ka8Dqwwzy/TQ4xf
        aqprn7jkC7/AHAc7mlnpgRWd7yJcONmGKkREtgxS/Ko4ERIYiPhjM0zH3qW6u2ih
        PdGXTARLG98Ei+/1fDbPKXzZbIPmz2C9levCSMggVceiihOEFDGgXXGJU0hTVPxx
        B0bWXR1fZ9siYAAfJ1ijtie/R/PEaZupNFfL2qvu61EtOCXD6o44l/0cnGv9C+Xg
        Ka+6YvC4YGbdVcRuABin416XSOWcfYr1sE1QGpgcFFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WEafkF
        KlZif10zVrKpRgSxKOWc7Ljh7MyeD0Tj3dL2Q=; b=szvXy0KYTYwisUfZJjnvD5
        /W1NxfoledISdSUK2MQg2f6VI/KaVC9P21ToeZ/Mw7MPX63LlG4jsPpmQKz0ZDKJ
        eEqFVvvRH+zgNmZmVpThyt81nNJztPQ6f0MlAeWrJi5cJbU5f3trLTogq8gJGDfT
        DbZpLoMg/3gRiH8yAs95Pa1QraML+UneY0oGziOHpRn+MOwUnUql2vmwc0o4kooG
        1oxGIskcoJ73t8yERPWmGb7WeQQil5Qsp4uo386e39qWpmw6Uvv/HnjNknrq2yEh
        HK5DbYivRPsiQICf1YVABN3e4OvsAl3pd8B3bw9Tk0VNIutR6oLeHawTpx20v1lw
        ==
X-ME-Sender: <xms:sb8OXySvdjKttMWgY8J9SX2qnYlq-WckJAfEYOt4akaAIjVaIl8j6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfedvgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:sb8OX3wGCRN_PYeZfAsJm1PPPsPc2axM7_DwA506OIn6AmZb3e8xHw>
    <xmx:sb8OX_2CW7AHUQabGkpEdsCGK1rpKXRu5i1-S_R-eq7fJKWzrm7sEA>
    <xmx:sb8OX-B_xbr725mt2d1XCAutiffpvr6tGa2UR5gOIa32aFrGK9ONeg>
    <xmx:sb8OX-uirIbhBWF6j5hrT68819H35tuWLQ_6QbPFOZM3MiRVwT4HPw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id A45EF3280060;
        Wed, 15 Jul 2020 04:34:56 -0400 (EDT)
Date:   Wed, 15 Jul 2020 10:34:52 +0200
From:   Greg KH <greg@kroah.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Marius Zachmann <mail@mariuszachmann.de>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200715083452.GC2716443@kroah.com>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
 <20200715030740.GB164279@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715030740.GB164279@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 14, 2020 at 08:07:40PM -0700, Guenter Roeck wrote:
> On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> > Adds fan/pwm support for H1000i platinum.
> > Custom temp/fan curves are not supported, however
> > the presets found in the proprietary drivers are avaiable.
> > 
> > Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> 
> +Marius Zachmann for input.
> 
> Questions:
> - Does this really have to be a different driver or can it be merged into
>   the corsair-cpro driver ?
> - What about HID vs. USB driver ?
> - is the kref complexity really needed ?

At first glance, I can't tell what the kref is trying to keep track of.

So I would say no, it's not. :)

thanks,

greg k-h
