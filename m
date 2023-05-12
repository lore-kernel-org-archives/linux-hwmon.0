Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57282C77B7F
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 May 2023 11:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240605AbjELLL4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 May 2023 07:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240867AbjELLLw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 May 2023 07:11:52 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4464C1F;
        Fri, 12 May 2023 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683889910; x=1715425910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJIGwqmtTqGzB0hVJQVc6DByGb0fLVxLbAJzTYeq0qo=;
  b=nYx/D1y3l6jTMtDNrdj2R9CBemeC6Qqm2e5QDHCQWb3oIjZ9xr2i3Soa
   JaOxFm1bOdRLoFbud+MbcSkJU9p5HN15ch6D9JmHS9YWcoJ+zswirtbIs
   1MgRJWXeB9D2D4f9fFmSEaDguwcE4rH3Lx3VzSD0KDCy4kUTS5M+QHrxM
   hTwVS1NKdkEPvIqzZkDy8NH9tyNy4eLtYrL5lvTrZbRxzJe8P1jgcpV3Z
   4YWGgPkb2ygh4L47+QRnFCPvvRoNvbkHSyrKskl+mMkvv1aTM8aql/yj/
   u+hXh0iUSd5HZnco3FQgw6UUpJqfoEwPURGja6IfD2DeZJatZAD4Sn6E3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331130646"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331130646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 04:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677628493"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677628493"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2023 04:11:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pxQgc-0004ax-0Q;
        Fri, 12 May 2023 14:11:46 +0300
Date:   Fri, 12 May 2023 14:11:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     dinh.nguyen@linux.intel.com, linux-hwmon@vger.kernel.org,
        dinguyen@kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCHv2 3/6] hwmon: (socfpga) Add hardware monitoring support
 on SoCFPGA platforms
Message-ID: <ZF4e8YdAqHwmONzS@smile.fi.intel.com>
References: <20230508212852.8413-1-dinh.nguyen@linux.intel.com>
 <20230508212852.8413-3-dinh.nguyen@linux.intel.com>
 <9459547a-0ff9-9972-602d-3098b616602b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9459547a-0ff9-9972-602d-3098b616602b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 09, 2023 at 08:57:26AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2023 23:28, dinh.nguyen@linux.intel.com wrote:

...

> > +	struct device_node *child;
> > +	int ret = 0;
> > +
> > +	for_each_child_of_node(np, child) {
> > +		ret = socfpga_probe_child_from_dt(dev, child, priv);
> > +		if (ret)
> > +			break;
> > +	}
> > +	of_node_put(child);
> 
> Hm, and if the loop does not break, is this still correct?

Yes, since NULL is okay for of_node_put(). However the explicit call inside the
if (ret) can be more obvious on what's going on.

> > +	return ret;

-- 
With Best Regards,
Andy Shevchenko


