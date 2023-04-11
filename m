Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BFFC7619A
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Apr 2023 06:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjDKGJS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjDKGJQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Apr 2023 02:09:16 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9E419A6;
        Mon, 10 Apr 2023 23:09:03 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5489268BFE; Tue, 11 Apr 2023 08:09:00 +0200 (CEST)
Date:   Tue, 11 Apr 2023 08:09:00 +0200
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
Message-ID: <20230411060900.GD18527@lst.de>
References: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks,

applied to nvme-6.4 with a trivial whitespace fix.
