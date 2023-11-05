Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACE7C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Nov 2023 18:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjKESvL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Nov 2023 13:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjKESvI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Nov 2023 13:51:08 -0500
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415B5BD
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Nov 2023 10:51:02 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1699210261; x=1699217461; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=Yi3ZhkzUKG+q8LbzxYY/3xmuWMmLwTf4+vaaMTe7hsE=;
 b=R481NeQyYazcbBJLEL14RUW1NZTqV9Ww5JXU4mIc2SAtM6zuNtJKyBHL6K0pjV99joCZOXstcsIVOjMIIaRJ/wRRYTNxyTuIHT8EUr2D7ByD1yIhnirLTTANE14qgQIOJmc4tmet6jOofo180vFICH0UbxeYrRGIcVkQBy9vUIWYOLGDiah1zVpAm501at4u7rhAzsEl8ruz5HuwwF1rXP84lXFe/sIPmtoGdOOyJSfT51O0bLLyhZVf47gsO7bnqQ5giVfoJp4GOEjtZ14GMNJh7y18O/niXqSoq3w4hKS4bRj+dXI+onNvcezMgkXMAUpv8xwptErRhwDggSFRNg==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by b5fcd0d995c4 with SMTP id
 6547e415cf03ca46bac0c8d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 05 Nov 2023 18:51:01 GMT
Sender: james@equiv.tech
Date:   Sun, 5 Nov 2023 10:51:00 -0800
From:   James Seo <james@equiv.tech>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk
 800 G6
Message-ID: <ZUfkFHmrlnL7gbfG@equiv.tech>
References: <20231103181931.677796-1-james@equiv.tech>
 <dec086cc-7403-4a06-b860-aae6daf8f0e7@roeck-us.net>
 <ZUZsPO9aN+E3qAng@equiv.tech>
 <2b48b41d-7d82-470a-a40e-c8f3c9de94dd@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b48b41d-7d82-470a-a40e-c8f3c9de94dd@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 04, 2023 at 09:29:43AM -0700, Guenter Roeck wrote:
> On 11/4/23 09:07, James Seo wrote:
>> 
>> #define HP_WMI_WSTR_INFO(name, wids) {					\
>> 	.matches = {							\
>> 		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Hewlett-Packard"),	\
>> 		DMI_EXACT_MATCH(DMI_BOARD_NAME, (name)),		\
>> 	},								\
>> 	.driver_data = (void *)(wids),					\
>> }
>> 
> 
> Quite frankly, I dislike multi-line macros because they make it (more)
> difficult to understand the code. If that is where you want to go,
> I'd rather keep the current code (or wait until someone else maintains
> the hwmon subsystem).

OK, I'll remove that macro if I end up using a DMI table for this. 

>> Out of curiosity, how would you feel about just adding full raw WMI string
>> support now? It wouldn't take much more work and for various small reasons
>> it's starting to look like a better idea to me.
>> 
> 
> I don't know; I would have to see the code.

I'll submit something in a bit.
