Return-Path: <SRS0=7wWQ=ZM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BB0C432C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 878EE2071C
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfKTStB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Nov 2019 13:49:01 -0500
Received: from verein.lst.de ([213.95.11.211]:41761 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfKTStB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Nov 2019 13:49:01 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9D4C768B05; Wed, 20 Nov 2019 19:48:59 +0100 (CET)
Date:   Wed, 20 Nov 2019 19:48:59 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] nvme: hwmon: add quirk to avoid changing
 temperature threshold
Message-ID: <20191120184859.GB12322@lst.de>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com> <1573746001-20979-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573746001-20979-3-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
