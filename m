Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A7FC43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 18:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58A3222B48
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576089223;
	bh=geCPNnHlvTAPkg1jPd3NplLkeVVLFJc4GxXn2pD4Nuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IzG3lHcdqi9RDr4JSDY6oAbOUjJQoGuYhZAdZae7LKfBTbYcRsaxSCNMrcXvjxRO2
	 aVm8TP5252wq1ZLs9MqzTLM0MhtuUOYXx1IYTq+nOkkjSRpcKLBIVBqvOAFJSUgUvN
	 BenB7hk6bD5WIdj+RNvcWSebPPsyc8eubAvKyxOk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbfLKSdm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 13:33:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:59790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729877AbfLKSdm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 13:33:42 -0500
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AA6020836;
        Wed, 11 Dec 2019 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576089222;
        bh=geCPNnHlvTAPkg1jPd3NplLkeVVLFJc4GxXn2pD4Nuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6GkFEpYTujJd+HLMhZoFmMEYFFXR+BSsi7MnEQwTY/13Gaaak3YGAjFzi1WN2U2g
         OE2puDDuCk6aaCrsaK7AwVtqXzNgdaZcCqmfXLyIpevzR52ISF9qmiJ1zxmWNMQ2tJ
         pAwcUzIHEmtUJhRMzHdEzTcaREb7tlil+rIvYmaw=
Date:   Thu, 12 Dec 2019 03:33:35 +0900
From:   Keith Busch <kbusch@kernel.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sujith Thomas <sujith.thomas@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH v2 7/8] nvme: hwmon: switch to use <linux/temperature.h>
 helpers
Message-ID: <20191211183335.GA26280@redsun51.ssa.fujisawa.hgst.com>
References: <1574952879-7200-1-git-send-email-akinobu.mita@gmail.com>
 <1574952879-7200-8-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574952879-7200-8-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 28, 2019 at 11:54:38PM +0900, Akinobu Mita wrote:
> This switches the nvme driver to use kelvin_to_millicelsius() and
> millicelsius_to_kelvin() in <linux/temperature.h>.

nvme change looks fine to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>
