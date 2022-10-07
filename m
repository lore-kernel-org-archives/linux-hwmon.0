Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AE7C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Oct 2022 06:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJGGsC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Oct 2022 02:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiJGGsB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Oct 2022 02:48:01 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC45C458D
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Oct 2022 23:48:00 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id A3F7C240026
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Oct 2022 08:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1665125278; bh=0UWS+iyjBP6iUUcWb5qqEtxi5shbZVmZZKIvv3o2RwY=;
        h=Date:From:To:Cc:Subject:From;
        b=kWXsIkCXQzqkU1wY5Iz2vbLfIxBcEwHyxKJR4vzK+pbFBQddApoQRqJm/dNbE32Vg
         A2vhoAOFA0yuFaqnBIS6dSTazEFKRDXwsniKF1idzG5Y6AbHO8zh1heU7suzZjiM4m
         bzzhGv/fCpcbqsMri+tSjgddLXykzWb5g3hVZhtzmdbpMN//MJaKPvrTC0AoTQwn6/
         o7UppGLS89dmdQSy9vBX111ahBhkZD39emxPcR22yTw3gd04Egeye9VFLZsP4KbLOy
         VGLLZLO9F5awdP4a3XpvwHfm4Bv2A0ebd7BZB4h3ZVnoLxvxZuCX0MoGfBT6OvEgxI
         j51D8Me7YZzSg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4MkJlx3ydQz6tpg;
        Fri,  7 Oct 2022 08:47:57 +0200 (CEST)
Date:   Fri,  7 Oct 2022 06:47:56 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix typo in USB id description
Message-ID: <20221007084756.6f4053c5@posteo.net>
In-Reply-To: <20221005182215.GA2626047@roeck-us.net>
References: <Yzql13NOvQLlrye1@monster.localdomain>
        <20221005182215.GA2626047@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 5 Oct 2022 11:22:15 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Oct 03, 2022 at 09:05:27AM +0000, Wilken Gottwalt wrote:
> > Fixes: 0cf46a653bda ("hwmon: (corsair-psu) add USB id of new revision of the HX1000i psu")
> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> 
> Applied. In the future, please add some description (subject is
> insufficient).

Oh sorry. I wasn't sure how to handle this, I mean the title already says all,
nothing more to add.

greetings,
Will
