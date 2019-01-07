Return-Path: <SRS0=ZG3s=PP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44318C43387
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 23:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A4402147C
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 23:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfAGXSt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jan 2019 18:18:49 -0500
Received: from ms.lwn.net ([45.79.88.28]:53798 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbfAGXSt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Jan 2019 18:18:49 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 031E32ED;
        Mon,  7 Jan 2019 23:18:48 +0000 (UTC)
Date:   Mon, 7 Jan 2019 16:18:47 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chengguang Xu <cgxu519@gmx.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Message-ID: <20190107161847.07b67a33@lwn.net>
In-Reply-To: <20190107231622.GA2126@roeck-us.net>
References: <20190104142722.24824-1-cgxu519@gmx.com>
        <20190107154049.4e10e0c5@lwn.net>
        <20190107231622.GA2126@roeck-us.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 7 Jan 2019 15:16:22 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> > Applied, thanks.  
> >   
> Ok, I'll drop the patch from hwmon.

Oops, sorry, I didn't realize you'd picked that up.  Would you prefer that
I stood back and let you handle Documentation/hwmon in the future?

Thanks,

jon
