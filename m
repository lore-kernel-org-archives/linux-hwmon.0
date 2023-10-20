Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464F8CDB47E
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 Oct 2023 11:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377258AbjJTLkL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 Oct 2023 07:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377271AbjJTLjR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Oct 2023 07:39:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A41213E;
        Fri, 20 Oct 2023 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697801897; x=1729337897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JePTitzuY0GQtcJN+j6l1yJWlx9JL0zZgTWlbLVx8N8=;
  b=Ksik9nfIDemqOWvDHAgyjBxp1T2qeJmtINxn/8gEWfZfd7LrdZ5WQqFB
   g0dN9j/J8IPgoGqzwiQYN7yk/Lr9rDnCHwtfixSU4toI5ZDEfFg3TrE9P
   lbhTWMZ7V8B2xrU7eGqkNsf1WxREJdeorInhHrgGveMDQftUF4eosUDgL
   To/mjGOr5S/3koG/YpYXG7FbM14yOimSrMVOOrT/6UOu605+XSru7p76+
   tKPgvJaWppYxDuPqzBTVfJmcRdO2L+xqjFXypeONYjjWjcNlztYQmRlYf
   lMHCkYMaA1Y83xuNyFDPOE9GyUp1BC4vKYrwD3kd/BO2dBi8Y75os2N5J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450707539"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="450707539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 04:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901121259"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="901121259"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 04:35:59 -0700
Date:   Fri, 20 Oct 2023 14:38:06 +0300
From:   Raag Jadav <raag.jadav@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     rafael@kernel.org, len.brown@intel.com, robert.moore@intel.com,
        mika.westerberg@linux.intel.com, mark.rutland@arm.com,
        will@kernel.org, linux@roeck-us.net, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v1 4/8] ACPI: utils: use acpi_dev_uid_match() for
 matching _UID
Message-ID: <ZTJmnv6CsZUt0pIS@black.fi.intel.com>
References: <20231020084732.17130-1-raag.jadav@intel.com>
 <20231020084732.17130-5-raag.jadav@intel.com>
 <ZTJYK02w8HZg26eI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTJYK02w8HZg26eI@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 20, 2023 at 01:36:27PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 20, 2023 at 02:17:28PM +0530, Raag Jadav wrote:
> > Convert manual _UID references to use standard ACPI helpers.
> 
> Yes, while not so obvious this is the correct replacement.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I think this is the only case which would suffer from the more obvious
behaviour, i.e.

bool acpi_dev_uid_match(struct acpi_device *adev, const char *uid2)
{
        const char *uid1 = acpi_device_uid(adev);

        return uid1 && uid2 && !strcmp(uid1, uid2);
}

That said, we can't be particularly sure about it's potential future users,
especially when the usage will not be limited to just ACPI core since we're
exporting it.

Raag
