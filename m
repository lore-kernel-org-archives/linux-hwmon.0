Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFCC26ED48;
	Tue, 10 Feb 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737031; cv=none; b=IfXMkAwwd7iXSUuJcFIvmlq9iBBfzcWgml2fAbLBj1ujaFTrVFGgYWK+GVn9nbwQWr6JjH8uRsZcGuUwGThMfU8OkMqHHiGo8GqcGFrA3gukJqkzw54NBSAWcpofOMK42DVN1Xdbeq3scd4b0SrQq4d9auF4MGAJL27yBDbC7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737031; c=relaxed/simple;
	bh=YNGJ8MR3eEHf9snY+3nSK24o/UGGU1OpVLEAncpm5Ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XMSqqxJnGH01d2CT0nAGdQc3+TFadeQY6JcF2nknrXDmk9tLEW2FFNtZkPLaq0/8wOO3zk5Peivi28xeWyoFD1D7u71ZGcWiUq/qA6OovMLw6crrfLgGksYnAY97EBDG1r9mBtyQTQm6qEmQw0Agk3QoIHnryZ0a26CiHGJJoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDnckZWp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDnckZWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770737031; x=1802273031;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YNGJ8MR3eEHf9snY+3nSK24o/UGGU1OpVLEAncpm5Ps=;
  b=JDnckZWp2PEF4QDwmyPpNnLaMmU9vlwyYMAFgKZHS298oiMNYnNDDSOG
   V+WIomkTsC0dEkdLZRyIcbSzR2FDI8MSKxaE5yBfv72tkk9HnnnwbACO8
   /TpTVixZx+DFBkDllCirYyWGB3a4lCiu3jVzcjo4xTuO6cOnSihHK0+bI
   LuTc5CIKW2IlUN0+liDSEr9+lkHBQ6WB/Z2X0NKWShY7HeiSf2UqHuH0x
   4ZyC6938npVoSYnDqTJDdi5bqgAclOf/t3zJqRlsnDr4Ch9ahZPP6Cdor
   eGoHr2d1LTzKWscRC18z/ddfFtYFwoi23Obp7pqHJK6iPrQaBCHr1Pfi7
   g==;
X-CSE-ConnectionGUID: q9Xdd0tOTN2Ca3ndQznegQ==
X-CSE-MsgGUID: adp/sj7xQbyI+t8lkeoPLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854528"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71854528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:23:50 -0800
X-CSE-ConnectionGUID: 72MbbWFEQJOoHopteGgRmQ==
X-CSE-MsgGUID: mUPGSxL5SFeTlwWXPy0BkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216478631"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.63])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:23:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, Rong Zhang <i@rong.moe>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260207172327.80111-1-i@rong.moe>
References: <20260207172327.80111-1-i@rong.moe>
Subject: Re: [PATCH] platform/x86: lenovo-wmi-{capdata,other}: Fix HWMON
 channel visibility
Message-Id: <177073701772.1935.17832144626573387865.b4-ty@linux.intel.com>
Date: Tue, 10 Feb 2026 17:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 08 Feb 2026 01:23:27 +0800, Rong Zhang wrote:

> The LWMI_SUPP_MAY_{GET,SET} macros are fundamentally broken. When I
> introduced them, I meant to check LWMI_SUPP_VALID *and* the
> corresponding bits for get/set capabilities. However, `supported &
> LWMI_SUPP_MAY_{GET,SET}' means *or*, so it accidentally passes the check
> when LWMI_SUPP_VALID is set.
> 
> Fix them by only including the corresponding get/set bit without
> LWMI_SUPP_VALID. Meanwhile, rename them to LWMI_SUPP_{GET,SET} to make
> them less confusing.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lenovo-wmi-{capdata,other}: Fix HWMON channel visibility
      commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c

--
 i.

