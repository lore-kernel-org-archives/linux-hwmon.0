Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4E5C32771
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Aug 2022 10:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348218AbiHSKhX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Aug 2022 06:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348191AbiHSKhW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2022 06:37:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69352F2C8E
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Aug 2022 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660905442; x=1692441442;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=QSUVKe8KappvgvW3Mp0CaPIoqFCyynmjJ3U/na7Wph4=;
  b=WPWyfef2F2iHQ/E4rNXvnL1FOeAwJY3RU3UhO+3iIawC4HV2oP8Ju6oM
   vtQ5U/GKcf3p4s46Gyr5lLTfTe0WuqlkTeqaPl2RI5sCHhKYRyCcLFxR4
   Un7NkRS4gEtzmm2oidggpUQqwevoLN+/fw4hY2ZFLFtE7bhr6luUT2jMl
   9Gf7BNTW+EqwGX3xDRudM9ncY0IflC1tcSZi2nkFg6lPUK/J+8YdS+WEA
   7zVmqz4RQlUJluV+Oo4u0i3ph6jTkTAfAwS7C+8KuNaNn3AmZqZx/Qjdh
   9V2YdnETWIJI/qHhc3pnvK+cM4MPchiy2zSZpIByS/I573OCzXsBeicP1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="291743616"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="291743616"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 03:37:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="668533454"
Received: from jastrom-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.51.176])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 03:37:20 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
In-Reply-To: <20220818193901.2974625-2-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220818193901.2974625-1-badal.nilawar@intel.com>
 <20220818193901.2974625-2-badal.nilawar@intel.com>
Date:   Fri, 19 Aug 2022 13:37:18 +0300
Message-ID: <87edxco6xt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 19 Aug 2022, Badal Nilawar <badal.nilawar@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i91=
5_hwmon.h
> new file mode 100644
> index 000000000000..921ae76099d3
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_HWMON_H__
> +#define __I915_HWMON_H__
> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include "i915_reg.h"

All of the above #includes are unnecessary. Please remove.

BR,
Jani.

> +
> +struct drm_i915_private;
> +
> +void i915_hwmon_register(struct drm_i915_private *i915);
> +void i915_hwmon_unregister(struct drm_i915_private *i915);
> +
> +#endif /* __I915_HWMON_H__ */

--=20
Jani Nikula, Intel Open Source Graphics Center
