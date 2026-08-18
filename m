Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E5479870;
	Tue, 18 Aug 2026 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062352; cv=none; b=f1nxeObiXPD0rsk1kj2mS60rwBkoe1RI3kOuU4kLsqWYv0EwTGUjxdGuGab1kA728tmWhqURCc4VOhYI4gTHa6cmDK0oWCLqa08+YQfyIvoIIK8/08ROifbNy7ySPOgoPHHK8zBROmAwQA7eLuKN1rEzJ9bx/m7XOjy3Czt5JWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062352; c=relaxed/simple;
	bh=8MQLiu6xi4PMKkmodbNWmp6Qv1d9OCwk0XRCFGF6pHQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OUlLvxhoalhgsOzj7m1iTCPhV6ZDhyw5q2CvgVFvhC6q9hdfiadOG7ffMLSSYo9XvvKEUDkDh0pzWhpAJILvKqpf7KIDk28Z09EnINR1lGJH0eM7AGOA1fhApA0gqt+j4wlFYCqqE6n38S4t6/2ryc9Dw7HJfQR/CL2/5bslFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ao2nU6YN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ao2nU6YN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062351; x=1818598351;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8MQLiu6xi4PMKkmodbNWmp6Qv1d9OCwk0XRCFGF6pHQ=;
  b=Ao2nU6YNMcuQ9me/3EporkD8Jj0tpAjDIZ5ylhdOT0V2qn86i/QAOMXe
   vGepHraC//VrF4xKSOlzVIsd3uZL6BHqOERxiird9x4RM0DpwRbf4hQf2
   +YvRtzgdT4+Rh0XH3nEaDGcDLMSwvre01fF0T3PDiV4BoAjAMDzqpcqBX
   KpVHDFz0cbNNZTjhtc9TPf59jrnbJ/qLT/kuoKiiuDt6F/RROX17KNqfC
   sSZW0Bn0EkhcDM1S1V69QYT9cNZIfhr8QfWE/4M70wDvsjK5vZoF5mx/J
   pFzFxcV7DkESi9rl/9n7yXaAfjz0FZxruEbICFOjmmvJYwXSxm3Wrqa0R
   A==;
X-CSE-ConnectionGUID: FexdW5XGSx2xkjr9PcA1hQ==
X-CSE-MsgGUID: 6AnFwmGJQkCRsUkE4AmN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87677516"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87677516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:12:29 -0700
X-CSE-ConnectionGUID: 0D+ypL5GTm+g2wkpopxPzA==
X-CSE-MsgGUID: QpDwzslhTZmXQQ3reng90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261955834"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:12:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 17:12:22 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: lkml@antheas.dev, W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com, 
    jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
In-Reply-To: <20260803221614.59324-2-derekjohn.clark@gmail.com>
Message-ID: <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com> <20260803221614.59324-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Aug 2026, Derek J. Clark wrote:

> The ML patch set uses a guard within a switch case that violates cleanup
> rules. Move the guard outside the switch so all return paths are covered.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/msi-wmi-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
> index dfb65ac8fbf6..33acd448f674 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
>  	u8 buffer[32] = { };
>  	int ret;
>  
> +	guard(mutex)(&data->wmi_lock);
>  	switch (type) {
>  	case hwmon_pwm:
>  		switch (attr) {
>  		case hwmon_pwm_enable:
> -			guard(mutex)(&data->wmi_lock);

While I cannot see the code easily, one could also add braces to inside 
the case to avoid this problem.

>  
>  			buffer[0] = MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
>  			ret = msi_wmi_platform_query_unlocked(
> 

-- 
 i.

