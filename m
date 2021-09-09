Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80513C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 16:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6633661100
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 16:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239808AbhIIQvQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Sep 2021 12:51:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:7570 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234524AbhIIQvQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Sep 2021 12:51:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="220521114"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="220521114"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 09:50:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="513854888"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 09:50:04 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mONFS-001i4W-An;
        Thu, 09 Sep 2021 19:50:02 +0300
Date:   Thu, 9 Sep 2021 19:50:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Denis Pauk <pauk.denis@gmail.com>
Cc:     Bernhard Seibold <mail@bernhard-seibold.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (nct6775) Use sio_data in superio_* (v2)
Message-ID: <YTo7OnzCRDZuveHN@smile.fi.intel.com>
References: <08262b12-4345-76a9-87be-66d630af3a59@roeck-us.net>
 <20210908213605.9929-1-pauk.denis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908213605.9929-1-pauk.denis@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 09, 2021 at 12:36:02AM +0300, Denis Pauk wrote:

Thanks for your contribution!
My comments below.

> Rearrange code for directly use struct nct6775_sio_data in superio_*
> functions

Missed period.

We refer to the functions as superio_*().

The commit message may need more elaboration (why you are doing this).

> v2: split changes to separate patches

This should go after '---' (cutter) line below. But entire series needs:
1) a proper versioning (use `git format-patch -v<n> ...`)
2) to NOT be a continuation of the previous one (start a new thread!)
3) to have a cover letter (use `git format-patch --cover-letter`)

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204807

BugLink

> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
> Signed-off-by: Denis Pauk <pauk.denis@gmail.com>

This is wrong. My understanding that you have to preserve Bernhard's
authorship and add yourself as Co-developer (see Submitting Patches on
how to properly use tags).

...

> +struct nct6775_sio_data {

> +	int sioreg;

It should be unsigned short.

> +	enum kinds kind;
> +};

-- 
With Best Regards,
Andy Shevchenko


