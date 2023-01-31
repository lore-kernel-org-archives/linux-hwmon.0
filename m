Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCF8C636D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Jan 2023 14:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjAaOvT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Jan 2023 09:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjAaOvR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2023 09:51:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21B9F8;
        Tue, 31 Jan 2023 06:51:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F93C61489;
        Tue, 31 Jan 2023 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBD6C433EF;
        Tue, 31 Jan 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675176675;
        bh=15Wd5z/jRz6pb0WwzR3mt++1qGm62uG95hzl9q3OQQU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ODIXiCluZuZlRcoUd4L8EKp+rl/sNBdzAWfcuyTZHqg066Nd2sK8gr40KV+OZVNJE
         8uP7h3qaHbets5ek09039BDswiEYgLRIl8OtgUAyTgJOZX3SJ5sywTUOGLWyQ4xtRN
         6QK3Ou5wyp3spv4GhxGxvX7hQtgDOxh0g6vHvofjIbFCvY+eqai83p0jOa+lyXo5BC
         H1gdiLuv0M0IdGMQtkb1hwrA03BqjiByJy9SZvfnOojdqCVT6z5Z/jW8xIYqsdlYJv
         ow993QS1xtES3kaSY5dJ7PkIFpXkk5ybfe3n0lNq7oLRxHFWW3FqmU4EYCFt4QYKH1
         HCImaLm/9Omgg==
Date:   Tue, 31 Jan 2023 15:51:10 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, SeongJae Park <sj@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] Docs/hwmon/index: Add missing SPDX License
 Identifier
Message-ID: <20230131155110.032ec4a6@coco.lan>
In-Reply-To: <87k0124vd9.fsf@meer.lwn.net>
References: <20230122213650.187710-1-sj@kernel.org>
        <20230122213650.187710-5-sj@kernel.org>
        <20230131034404.GA837158@roeck-us.net>
        <87k0124vd9.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Em Tue, 31 Jan 2023 07:44:02 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Guenter Roeck <linux@roeck-us.net> writes:
> 
> > On Sun, Jan 22, 2023 at 09:36:46PM +0000, SeongJae Park wrote:  
> >> Add missing SPDX License Identifier for hwmon documentation index file.
> >>   
> >
> > I do not feel comfortable accepting this change without confirmation
> > that changing the license from <none> to an explicit <GPL v2.0> is
> > legally acceptable.  
> 
> As with many of these, this file was initially added by Mauro (added to
> CC).  Mauro, can you confirm that GPLv2 was your intention for these
> index.rst files?  That would clear the path for a lot of these patches.

Yes, that's the intend. Feel free to add either:

	Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Or
	Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

to Documentation/*/index.rst files I wrote that might have missing:

	.. SPDX-License-Identifier: GPL-2.0

on the top of it.

Thanks,
Mauro
