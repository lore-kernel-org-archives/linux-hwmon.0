Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4389C61DA4
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjCOOGk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Mar 2023 10:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbjCOOGj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2023 10:06:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A88C2FCF5;
        Wed, 15 Mar 2023 07:06:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9EDE61D5C;
        Wed, 15 Mar 2023 14:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A04C433EF;
        Wed, 15 Mar 2023 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678889197;
        bh=GVcHCdfi7S6027GGkrt7Alrat2aoIieLivpIm53EJ1k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LUqvytekoPk5vKtU6zxdiJb/qc9JAmJb5nAe29512TXXvp8kZ5v9EXTNHphH0s901
         tFs5wGXeZqawIdHjizPy2yDCpMIt5K87HA/2ynIvcLuHgRLs6WdDFzkv26QGVrCsQM
         4T4Ju2ARJz7d/lM4lAfa3zWkuQnc7hHNj7lMBCSfF+pOnMl2tx50eitiXGD48/PjDu
         KYAQVFszJtK0hVRuDi9f7M76ktnJjujclghL0Oyv81uPF/Ihay970SWsxbQCNDhRpB
         O923odroMz7FC37L+t2jD2cIVF41MVh2b9PXwJJ/xks++oVLwfa/kU15bRb0vymnW4
         6X3jV+d4sSfkQ==
Message-ID: <f6efbd9f-27ef-7367-5b8c-9844c21a476b@kernel.org>
Date:   Wed, 15 Mar 2023 15:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] hwmon: drivetemp: support to be a platform driver for
 thermal_of
To:     Phinex Hung <phinex@realtek.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230315121606.GA71707@threadripper>
 <30d2ab9a-c3d1-c9d9-3cc6-02ef7af8981a@kernel.org>
 <9DA1C2E5-C9EB-48AD-846D-92CC0C434BFE@realtek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <9DA1C2E5-C9EB-48AD-846D-92CC0C434BFE@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 15/03/2023 15:02, Phinex Hung wrote:
> 
> 
> On 15/03/2023 21:11, "Krzysztof Kozlowski" <krzk@kernel.org <mailto:krzk@kernel.org>> wrote:
> 
> Hi Krzysztof,
> 
> Thanks for your comment.
> 
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC. It might happen, that command when run on an older
>> kernel, gives you outdated entries. Therefore please be sure you base
>> your patches on recent Linux kernel.
> 
> I am working on git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> 
> For master branch.
> 
> Is there any updated git repo that I should rebase my patch?

The mainline master. But even on that kernel you would get different
people to CC, so you did not run the command to get proper addresses.

> 
>> No such vendor prefix. Are you sure you are describing real hardware?
>> Also device specific part looks too generic. What device is it exactly?
> 
> It's a generic patch, just want to support thermal zone using a simple device tree.
> Any SoC with SCSI interface and attached hard drives can benefit this change.

Devicetree describes hardware, not generic patches. Please be more specific.

> 
> Normally a THERMAL_OF require a platform device to add a thermal zone.

Whatever problem is (or is not) with THERMAL_OF does not really matter
to bindings.

> 
> Original drivetemp.c works quite well as a hwmon device, but no thermal zone support.
> 
> My patch just extend its capability to support a simple thermal zone created with this hwmon.

I understand. Still it is not describing any hardware. In all your
statements above you did not reference any specific devices or hardware
at all.

> This is bind to any specific vendor, just to provide an easy way to handle cooling when hard drives' temperature gets high.

Then either you need something more specific to hardware or Devicetree
is not the place to put it.


Best regards,
Krzysztof

