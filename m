Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786C18E1F;
	Sat, 29 Nov 2025 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427384; cv=none; b=XVWgzVfiV81KQ58ehakI8Z54Fkudrz9j+4wgfRttOWkfzllJOX4cD/eEA6/nMO59q46uMifU7csa7hWIA0H0umPAiHI/OPbvXTYnJzdFcNn32LTDPMNM9SWdHz6m4niZEB4zExwCleRgPgEc8wUaMZeIthz8UZPzq3Ze+gfjGFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427384; c=relaxed/simple;
	bh=cBwO9lIhCMUhLHToTYWKkTzSzVLCZx04TKS3HmtWfv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf+2jP4O/e1yQ6N70Fh8FBd779pVyIZ4HeCgGskLfOUKT6XiPFo2iDF2MiK6KdhF1iYPXiXzvPMwCnLERhJSD/nL4GJb64b2Ebsr48A9rO6FWamH5CfCO2Y+1SLz6raKu4JFjI9EdS/jHXOlh7c8HFfrCmLj3Xq0sgqQQV87TdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj+z7v7V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj+z7v7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764427382; x=1795963382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBwO9lIhCMUhLHToTYWKkTzSzVLCZx04TKS3HmtWfv8=;
  b=bj+z7v7VhgaJxDTGBWPHz19XtEBT31D899TtHx0DPVFfwijiYUodMT9i
   UAykbUZE15W4wLy+gg8CUcsGcifej1NFkhe6w3zqqBOKHEXCZFySeZ3e4
   l9Lyn9MGhC0bBk8pTUqjAEgF8ayHXAOFNOqNNNOz0gftl+A5zO0yHu1bs
   WcseppFLIH3MbdGx+nOnBbkAkDuUUuOLv/OqSW0YXCe9nCw0E9HUn4m5v
   TQoTxRDhAlyXazyucuFxbGjYQkrI9Jv0kIdpz9fUsSKxPFG2oQH281dQ8
   0KAm422dKt05ln3VxLG8knmKaLhVZ9LSgqYTZtZ+Vu8x+PXSC08SCQiET
   g==;
X-CSE-ConnectionGUID: lvwNDz2yS2GJZ55zQjWysw==
X-CSE-MsgGUID: WoMRc7OUSeeoLR7C0+rbwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="89071233"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="89071233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 06:43:00 -0800
X-CSE-ConnectionGUID: 3EDZXGf+RyqasVyPhWarZQ==
X-CSE-MsgGUID: JBS7kOghSfaLJ0Pg6YV8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="193456117"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2025 06:42:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DBBD693; Sat, 29 Nov 2025 15:42:56 +0100 (CET)
Date: Sat, 29 Nov 2025 15:42:56 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gui-Dong Han <hanguidong02@gmail.com>, vt8231@hiddenengine.co.uk,
	steve.glendinning@shawell.net, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
Message-ID: <aSsGcLCaXxQChDA8@black.igk.intel.com>
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 05, 2025 at 07:33:22AM -0700, Guenter Roeck wrote:
> On Thu, Jun 05, 2025 at 07:49:37PM +0800, Gui-Dong Han wrote:

...

> Also, it might make sense to add a note to
> Documentation/hwmon/submitting-patches.rst, to "avoid calculations in
> macros", explaining that this may result in the kind of problem explained
> here.

No, it might not. Do not blame a messenger (calculations), the problem is
accessing data several times. That one makes sense to add.

-- 
With Best Regards,
Andy Shevchenko


