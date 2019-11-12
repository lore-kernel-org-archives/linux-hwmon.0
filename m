Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D782AC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B234C21A49
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfKLPHD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 10:07:03 -0500
Received: from verein.lst.de ([213.95.11.211]:56274 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfKLPHD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 10:07:03 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B3EFF68BE1; Tue, 12 Nov 2019 16:06:59 +0100 (CET)
Date:   Tue, 12 Nov 2019 16:06:59 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values
 for each sensor
Message-ID: <20191112150659.GA12493@lst.de>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com> <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net> <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com> <20191111173505.GB5826@roeck-us.net> <CAC5umyjviR1J5HojE6WBhYQCzu=CFPPoNxXY=T9KRw2yTpO=VQ@mail.gmail.com> <e2699eee-8ca2-fcf4-d6b2-624cbddd4c6d@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2699eee-8ca2-fcf4-d6b2-624cbddd4c6d@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 12, 2019 at 07:04:38AM -0800, Guenter Roeck wrote:
> The Intel NVMe has the latest firmware version installed, so this isn't
> a problem that was ever fixed.

What Intel device is that?  If it is one of the XXXp models, those just
seem some of the most buggy NVMe SSDs around unfortuntely (excluding
the Apple ones that don't actually claim to be NVMe at least).
