Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD9DC71156
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 13:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377483AbjHRN4G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 09:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377537AbjHRNzx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 09:55:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D6E10D9
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692366933; x=1723902933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5l+TLt5jJBfvVH9wRW+tq76gc6Dv0LogxMlFhQsQZiE=;
  b=lNJdSDZHyzXjeLs13sI0v5NVLvdWepQ+G+qjW78RXId+idnelUZ7CIFg
   zPO6ac5XBWmYhn2rF3l8BEYUECL0QVcWqaNEOnOk4RIhJh/PAJGYJtdNz
   nHP/qi/+m66IzRfQ16qHdb9JelOwJumw7+HGBAMo1ATbwkXfp+/iLXdPl
   b+7vyc9RLHPFKT0yBZVKaAwaaYn24GkzrxCgYtAZV/DiuVvmceYdLA2sE
   O0uGFtN5wC+bArxeJTROXVKPr6AAsseaLIUMwaSkp4u+edZ+Ho9eE1oxd
   Io5XZRqw1zWL4q3/8UEkGWhcQK1E1nKdVd77xhSI+50NP2mU8wfIWP/is
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="372006118"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="372006118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 06:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="858706980"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="858706980"
Received: from esavax-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 06:55:29 -0700
Date:   Fri, 18 Aug 2023 15:55:27 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, linux@roeck-us.net, riana.tauro@intel.com
Subject: Re: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZN94TxNikUSKS6GN@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
 <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
 <ZJ2Qm0UcAidCEArX@ashyti-mobl2.lan>
 <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ashutosh,

> > >
> > > Also the the loop which acquires hwmon->hwmon_lock is confusing too.
> 
> Confusing but correct.

Confusing is implicitely not correct.

Might be correct now, but in some moenths someone else might miss
the point because it's confusing, mis-interpret and send the
wrong code.

Reviewers, going through the +/- commit will have a tough time
figuring out.

Let's keep things easy and simple... there are easier paths for
locking here and we've been discussing them with Badal.

Andi
