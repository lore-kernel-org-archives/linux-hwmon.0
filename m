Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907281EE7A7;
	Thu, 19 Dec 2024 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649207; cv=none; b=n3pm9QnSQPMWY13cCac3UIbrtbhCgmCI48Y9AJ+I8qtCqgJs0OA3jjfvrLZa4Tf38EN79eeeL+qNZlxMd6Y/6OA+oZ+Q0IW3POCLv4B50hzHZjcf2jAsVuZjR7f89xFxzEt6l1NcmZZ2OXcGERvOQ2IZnRDzDdpTtfpGgvyh3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649207; c=relaxed/simple;
	bh=DjlXfah4HS0kWWVaSjLbf/32vxkVDn/szp7UNg9Rrh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apt1UnPZgpt2YWIMd7U+dP8Q17Jf1SXZUheqTnpWVWBP6IaBXAxPaWoZXAYslHKqk1+x+Sdw9qWzBF/r0Q3jwVyUTnTrhLk8/TCKM1oJo8rGU00mmnCtkD11ZrCz9tlnaw6Hu8c7eEbV/+ics6nQw6zbfOC8l6dOEiay40sR/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4b0dy0u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4b0dy0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734649206; x=1766185206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjlXfah4HS0kWWVaSjLbf/32vxkVDn/szp7UNg9Rrh8=;
  b=R4b0dy0uSX1zmpOuztnXuaTtzWWdB6+XbLHnQBReSw40X+QhU024GqlA
   LU0GSev3/niDLrr8Znrnrp0lClQ0Vjy3CJ41CjTon7ZeikCsI3msmnpu1
   47XFR/08AaPEbE+zrK+6pMD6R84GWIM9lEo/ppvEas43TrfzgrIiU0Ytz
   KxrnwxkSbNEPNnnl7BdTffwuJezoCCzxeUT+gHLHhDai9u6oWkaBlD7ku
   i7dNLpNrOFRAdpJO4wBx1ZS/+wvkic3hnZUFsl7XZ2Rm+fRTB9oJRMVrs
   iEO8szwxcctpAwmhLuGI+NTOiWCBUXV9gDLMZmmn/ESxaxxGrdGzBGyzk
   Q==;
X-CSE-ConnectionGUID: s4b5p7I5Q/+zJ4Pr5d/f1Q==
X-CSE-MsgGUID: rw64eFPaQL2yFNx2Px4nTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60572202"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="60572202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:00:05 -0800
X-CSE-ConnectionGUID: vXHSdRxTSPigBGyBwHMj/A==
X-CSE-MsgGUID: 5rQNjeneQqeYHef0oBbQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98166882"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2) ([10.125.108.87])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:00:04 -0800
Date: Thu, 19 Dec 2024 16:59:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Jean Delvare <jdelvare@suse.com>
Subject: Suspend/resume failing due to SPD5118
Message-ID: <dmx2x5sziux7ubk5fcas2nmj4lt3vpalr5gc7qmmwq2megmp24@24vmehdkle3x>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi,

In our CI for xe and i915 drivers we are noticing some issues
with suspend/resume with these error messages from spd5118:

<3> [120.648546] spd5118 3-0051: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -110
<3> [120.648598] spd5118 3-0051: PM: failed to resume async: error -110
<3> [122.825989] spd5118 3-0053: PM: failed to resume async: error -110

Example:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3885

(there are a few other issues in which this error shows up, but this is
the the cleanest one that doesn't mix with other bugs)

thanks
Lucas De Marchi
