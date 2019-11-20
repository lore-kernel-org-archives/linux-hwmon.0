Return-Path: <SRS0=7wWQ=ZM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277AFC432C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05F4620878
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfKTSse (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Nov 2019 13:48:34 -0500
Received: from verein.lst.de ([213.95.11.211]:41752 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfKTSse (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Nov 2019 13:48:34 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9E6B268C7B; Wed, 20 Nov 2019 19:48:28 +0100 (CET)
Date:   Wed, 20 Nov 2019 19:48:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
Message-ID: <20191120184827.GA12322@lst.de>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com> <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> +/* These macros should be moved to linux/temperature.h */
> +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)

Didn't we want to move this to a generic header?

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
