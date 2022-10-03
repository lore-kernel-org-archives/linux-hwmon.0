Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560E9C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 20:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJCU4O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 16:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiJCU4N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 16:56:13 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A0F3CBD5
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664830572; x=1696366572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JFuCp+8Wk4ieboVdzv748y1JMMemmYHxHZf1BsNXxU=;
  b=DP+77JJ27hjXdDeAsiY0BFxJ/VN8jpb/ZLWxXaYOAH+79foP54+3BSX1
   F5BOZ3l7tXm1jji37UfKfHtAIZjbOM7gTc16tPDjbvm318zZRK9Ae0rN2
   XmOiNdHMUC5Vbo7aQFFbSLonOiVtsQ2m9BIdZ2FNTUJQZ8WeqcABAaCmk
   UjqINw2waexc14nd7d2wtyWQbDFUZYOBzfkVUVB/K0KGJF21YWQhjHnsr
   ie/DWl3y6ZJfMc/oE1QDY/DZfVULNGBM9lJ1qr9ROU3mUDXlS8KfHjV7Q
   jPA/XC8IXsw+0p0ntOou+r1PqcDEqALVNX5AC/rqjJEWJS92otpLUX1cN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="289976523"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="289976523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:56:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="654520246"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="654520246"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com) ([10.213.7.91])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:56:08 -0700
Date:   Mon, 3 Oct 2022 22:56:05 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/hwmon: Add HWMON current
 voltage support
Message-ID: <YztMZc7wWCDuRhUi@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-3-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

>  static void
>  hwm_get_preregistration_info(struct drm_i915_private *i915)
>  {
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +
> +	if (IS_DG1(i915) || IS_DG2(i915))

why not GRAPHICS_VER(i915) >= 12 here?

Andi

> +		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> +	else
> +		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>  }
>  
>  void i915_hwmon_register(struct drm_i915_private *i915)
> -- 
> 2.25.1
