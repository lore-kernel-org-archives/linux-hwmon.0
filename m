Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41658C77B7C
	for <linux-hwmon@archiver.kernel.org>; Sat, 27 May 2023 08:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjE0I2l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 27 May 2023 04:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjE0I2l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 May 2023 04:28:41 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9311DDF;
        Sat, 27 May 2023 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685176119; x=1716712119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5Dgm34GX4qBJ01nGG2Ddz46agLUsvcgLlnRbhbhx0g=;
  b=fEpdKUPClII1LWfYhUIrl0gCDzHnwGFMf9rIXp6K3m1c1UQiMS3v06qC
   7zV9/usL2RuPGk0t2GHwf39qy+AyqVu53f7icx+8vuD0O4jCsDDZAN+nv
   fETc3Ufu18gfrYopecnAmhrUjpBVxNuy2Rr2y7Qk9tbe32Ct1BXJ97LCn
   K9Rh3uR7oS9ClbLgGGKeHwz02kFpTOiIaxdyYt6XYIiLipaRrJ0v90Sgn
   zpHTk0WZNCpoW3BoIPJesba2VSBuDXUysk+QhIMpj0weH+CI5g2YJditc
   DfezNi2iv1oevmbdtzuEsZ3FfUFR1NhLPnAaiLnYaQLYE0lLT07PRdrjE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343876274"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="343876274"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879781595"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="879781595"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 01:28:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q2pHv-000Ipz-0C;
        Sat, 27 May 2023 11:28:35 +0300
Date:   Sat, 27 May 2023 11:28:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinh.nguyen@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hwmon@vger.kernel.org, dinguyen@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCHv2 3/6] hwmon: (socfpga) Add hardware monitoring support
 on SoCFPGA platforms
Message-ID: <ZHG/Mvb+Ivf87u/8@smile.fi.intel.com>
References: <20230508212852.8413-1-dinh.nguyen@linux.intel.com>
 <20230508212852.8413-3-dinh.nguyen@linux.intel.com>
 <9459547a-0ff9-9972-602d-3098b616602b@linaro.org>
 <b36bd5d9-a7dc-b478-9b89-ed3b10bd6725@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36bd5d9-a7dc-b478-9b89-ed3b10bd6725@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 25, 2023 at 04:20:12PM -0500, Dinh Nguyen wrote:
> On 5/9/2023 1:57 AM, Krzysztof Kozlowski wrote:
> > On 08/05/2023 23:28, dinh.nguyen@linux.intel.com wrote:

> > > +	for_each_child_of_node(child, grandchild) {
> > > +		ret = of_property_read_u32(grandchild, "reg", &val);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret, "missing reg property of %pOF\n",
> > > +					     grandchild);
> > Where do you drop child reference?
> 
> Not sure what you mean here? Can you clarify?

for_each_child_of_node() bumps a reference of the current (iterator) node, when
the loop is interrupted it's a user (of for_each macro) responsibility to drop
it.

-- 
With Best Regards,
Andy Shevchenko


