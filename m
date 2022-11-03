Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9D0C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Nov 2022 15:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbiKCPGk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Nov 2022 11:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbiKCPGR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Nov 2022 11:06:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97841A388;
        Thu,  3 Nov 2022 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=YyjBIES0PKA+FOsN7Ehy4kaFC+XY3NWciTCzuFNq5Gc=; b=h714WbeoW1gQqY1g8ji+TnoLFr
        WzxbCJANqCjgNa2UGaKfZFYUX6+T8RfZd5pMr4DnZf0/YKgfbC2zdbUFhycN0PicY8XpDABe8DgMs
        CuJ3mZ0B2x+C2EYROlxJW+guv42fMG0m7ckneMRdSg+d7GHyBbM+FNR1E7gk7VMw/4PIsoOqfvQ1Y
        UnMA6UtDkqFjr9GeSZVF5cf1FoXEMxuqb9uaOBJpU4IwX3R01gbi/j8lm2a1zzHg2ovdQ0w/PYlOM
        6KLsc6Re7ZpgUvyk0Hupx1Il7W/dqy8EIYTk8H3A7Or6AHKfCsgTrkfsYDHJgCQMzqkFN8Y4GseKa
        EJn8hR4Q==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oqbkn-000CaE-UW; Thu, 03 Nov 2022 15:03:38 +0000
Message-ID: <a530b209-36bd-c2c3-8196-a9c5001f6333@infradead.org>
Date:   Thu, 3 Nov 2022 08:03:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] hwmon: (amc6821) Fix unsigned expression compared with
 zero
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     wangkailong@jari.cn, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1872639a.89.1843b5106aa.Coremail.wangkailong@jari.cn>
 <f699bbba-69e6-2e62-98ed-0482f4c9a900@infradead.org>
 <20221103141727.GA145042@roeck-us.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221103141727.GA145042@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 11/3/22 07:17, Guenter Roeck wrote:
> On Wed, Nov 02, 2022 at 07:59:06PM -0700, Randy Dunlap wrote:
>>
>>
>> On 11/2/22 19:27, wangkailong@jari.cn wrote:
>>> Fix the following coccicheck warning:
>>>
>>> drivers/hwmon/amc6821.c:215: WARNING: Unsigned expression compared
>>> with zero: reg > 0
>>> drivers/hwmon/amc6821.c:228: WARNING: Unsigned expression compared
>>> with zero: reg > 0
>>>
>>> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
>>
>> Hm. IDGI. What's wrong with comparing an unsigned value to > 0?
>> I mean, it could be == 0 or > 0.
>> Please explain.
> 
> I don't get it either. The real problem with this driver is that error
> returns from i2c functions are not checked. However, that problem is not
> fixed by this patch. That means the patch would change behavior without
> fixing the actual problem.
> 
> I wonder what kind of (broken) compiler or analyzer produces above errors.
> We'll have to watch out for similar broken "fixes".

It says above that it's a coccicheck warning.

-- 
~Randy
