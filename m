Return-Path: <SRS0=ZG3s=PP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D1AC43387
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 22:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 583B82147C
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 22:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfAGWkv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jan 2019 17:40:51 -0500
Received: from ms.lwn.net ([45.79.88.28]:53692 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbfAGWkv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Jan 2019 17:40:51 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 73FEE2B6;
        Mon,  7 Jan 2019 22:40:50 +0000 (UTC)
Date:   Mon, 7 Jan 2019 15:40:49 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Chengguang Xu <cgxu519@gmx.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Message-ID: <20190107154049.4e10e0c5@lwn.net>
In-Reply-To: <20190104142722.24824-1-cgxu519@gmx.com>
References: <20190104142722.24824-1-cgxu519@gmx.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri,  4 Jan 2019 22:27:22 +0800
Chengguang Xu <cgxu519@gmx.com> wrote:

> Just fix a typo in Documentation/hwmon/f71882fg.
> 
> Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
> ---

Applied, thanks.  

jon
