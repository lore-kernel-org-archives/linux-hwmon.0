Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EA0E6FE4E
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 15:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjIVPQo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 11:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjIVPQn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 11:16:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC915A3
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695395796; x=1726931796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=plevMaCrcoSQiunOePJWM19KJ9OivzRDaLpXHbn/S1E=;
  b=aoqASf6WqW5X7f5hTU7bzGFr6nSg4wwry6msouQ8WN7To5G9AxiG6SxL
   oM3Zvi+VXrOcRpOe7Uq08yQK1ArQKTTm43NeIK4OoW+KqSS7whwAoVqFp
   +B3+CPY+/xHWUyuEhHy5iaQhbidPVm0sakFPImn0DaxJMu+Qx0erOZxj0
   S0lEUmisihOCI7zLwCx8H6runpx0niBiSP1zBkdoV8EZSFsM+nJyaKyeY
   bxJVEAqAYKzg79BLjv2BYj9uRN/1+w3DXgAXZhDScFOP51A5Tp29IDyRK
   BRXAB+5NhyYNYnBjy3TNTlw7eeoV+8/e1bYmHPAMIkbhn89cDCDXU6ley
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379729614"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="379729614"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 08:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697217719"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="697217719"
Received: from velangov-mobl.gar.corp.intel.com (HELO intel.com) ([10.214.174.70])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 08:16:29 -0700
Date:   Fri, 22 Sep 2023 17:16:23 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Message-ID: <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQxpTss3+OYdbJks@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rodrigo,

On Thu, Sep 21, 2023 at 12:03:26PM -0400, Rodrigo Vivi wrote:
> On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
> > Add XE_MISSING_CASE macro to handle missing switch case
> > 
> > v2: Add comment about macro usage (Himal)
> > 
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_macros.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > index daf56c846d03..6c74c69920ed 100644
> > --- a/drivers/gpu/drm/xe/xe_macros.h
> > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > @@ -15,4 +15,8 @@
> >  			    "Ioctl argument check failed at %s:%d: %s", \
> >  			    __FILE__, __LINE__, #cond), 1))
> >  
> > +/* Parameter to macro should be a variable name */
> > +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> > +				__stringify(x), (long)(x))
> > +
> 
> No, please! Let's not add unnecessary macros.

it's not a bad idea, actually... in i915 we have the MISSING_CASE
for switch cases with a defined number of cases and print
warnings in case none if them is the one inside the switch.

It's so widely used and actually nice to have that I thought many
times to move it to some core kernel libraries.

Andi
