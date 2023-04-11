Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4093C76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Apr 2023 06:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjDKGKR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjDKGKQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Apr 2023 02:10:16 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866D110DE;
        Mon, 10 Apr 2023 23:10:15 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id E8A4968BFE; Tue, 11 Apr 2023 08:10:12 +0200 (CEST)
Date:   Tue, 11 Apr 2023 08:10:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] nvme: host: hwmon: constify pointers to
 hwmon_channel_info
Message-ID: <20230411061012.GA18624@lst.de>
References: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org> <20230411060900.GD18527@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411060900.GD18527@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 11, 2023 at 08:09:00AM +0200, Christoph Hellwig wrote:
> Thanks,
> 
> applied to nvme-6.4 with a trivial whitespace fix.

Actually, I've dropped this again as it causes this warning:

drivers/nvme/host/hwmon.c:221:19: warning: initialization discards ‘const’
qualifier from pointer target type [-Wdiscarded-qualifiers]

This looks like we might need a core hwmon change first.
