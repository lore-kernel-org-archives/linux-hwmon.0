Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F352CC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 20:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJCUuo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 16:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJCUum (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 16:50:42 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A56A2CC80
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664830240; x=1696366240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6VqIHYFgFIEoyzTdi1njUX9Hl4jD6f5/e4y6Z84H70E=;
  b=VbvNaiZS6Dfbrf347g/5v6YZhVFEGyGLWkMPxQzLRLrmFi1BNXcRUA1p
   q6Cqt+8NJze+1F65h5thY2FGBoaW9xfKdKTOU5MLRWlemGX5sxD0vzIT0
   9l7fv2WlRT33rZEU+ijZnSUiyneCzxqeuWUa5eF2eJzem955FJittwI6y
   TCqC79w572MuelWK8ZWfcL7zO5zxs+JADAGJn8O+uQ/wYB8I5jxr2a21+
   4ns6ndmCpbJqb+WmVvF1TkiZv5sRPZQlTOf4LPzD/tQmFckftXSc5JNRc
   nr5dDYaGeQDLV6V9PHgeujzo0B4Hvj+qPNiD+Nrfdz7KnH7kQOCfYryCN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="302735296"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="302735296"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:50:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="654518823"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="654518823"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com) ([10.213.7.91])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:50:38 -0700
Date:   Mon, 3 Oct 2022 22:50:34 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YztLGogsP+U+FIFT@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-2-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

On Tue, Sep 27, 2022 at 11:20:14AM +0530, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> The i915 HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up i915 hwmon infrastructure including i915
> hwmon registration, basic data structures and functions.
> 
> v2:
>   - Create HWMON infra patch (Ashutosh)
>   - Fixed review comments (Jani)
>   - Remove "select HWMON" from i915/Kconfig (Jani)
> v3: Use hwm_ prefix for static functions (Ashutosh)
> v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the former
>     doesn't work if hwmon is compiled as a module (Guenter)
> v5: Fixed review comments (Jani)
> v6: s/kzalloc/devm_kzalloc/ (Andi)
> v7: s/hwmon_device_register_with_info/
>       devm_hwmon_device_register_with_info/ (Ashutosh)
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
