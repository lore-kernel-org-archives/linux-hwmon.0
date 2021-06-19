Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9227C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Jun 2021 10:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD3986120D
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Jun 2021 10:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhFSKwi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Jun 2021 06:52:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:53273 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231403AbhFSKwi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Jun 2021 06:52:38 -0400
IronPort-SDR: kqidM1A3iwTxKt7XxDBHaaEbLE+jRGfY2x/68tE8ihiM62+yCP0A2T7Gg7oIPN7ePII1zTq7eK
 BTK0IQGXjkfQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="206612094"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="206612094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2021 03:50:27 -0700
IronPort-SDR: fnU5lVuLvE2SosjadnbVc8+U+7EHHkhelglov8CVVi9knSHUKJ7SSBwFCv1q78S+K+GHwRHqgz
 fDHRW+TfgD+w==
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="485964066"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2021 03:50:22 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1luYYL-003nwP-Hg; Sat, 19 Jun 2021 13:50:17 +0300
Date:   Sat, 19 Jun 2021 13:50:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yury Norov <yury.norov@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Marc Zyngier <maz@kernel.org>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexey Klimov <aklimov@redhat.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/3] find: micro-optimize for_each_{set,clear}_bit()
Message-ID: <YM3L6fAhEmgYgle7@smile.fi.intel.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-3-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195735.55933-3-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 12:57:34PM -0700, Yury Norov wrote:
> The macros iterate thru all set/clear bits in a bitmap. They search a
> first bit using find_first_bit(), and the rest bits using find_next_bit().
> 
> Since find_next_bit() is called shortly after find_first_bit(), we can
> save few lines of I-cache by not using find_first_bit().

Any number available?

-- 
With Best Regards,
Andy Shevchenko


