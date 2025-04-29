Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B221C19D;
	Tue, 29 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938920; cv=none; b=Se0QKlu7D4rI2H/Qsk/ekaseSL6EtJsOsBc01/IAiQtUbo3Ao+LkgElOLMJKR1wGkZI86JxBik7PwuArPwehaHFU0QkesiUuQcY4aUHUPibXeeTC6A3iq50We1NYdVLewfLDP8vXPZ2WB8xyRo7ovF0UD3jOOfcSpd5RwaWbOZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938920; c=relaxed/simple;
	bh=QFQFyq311N2wlvsxda46p2j/TaWrlH6O3EDvJxMOMGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=adST7NmpsSVQT0TzVTMz8r8nYYNWPF8e2ixIgEMeNOavUCD9cKWPH00yqlgjMknJtPlF522Zq0+v9M6WKhXOWG+ii0fwcKIFcdHZiz3ltAiylHAQ3cb2FLER2hczAWZZl3PeGptncvYv573Ftv6986lXSJdaozEy+ssg2jc1hrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXzYhvun; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXzYhvun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745938919; x=1777474919;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=QFQFyq311N2wlvsxda46p2j/TaWrlH6O3EDvJxMOMGI=;
  b=GXzYhvungJCtRV5VDUQteBYqKS3Bc8anXfQ0gzQ5bAb9/ZEIlotDm91B
   OtVDJcZGwzhUK/PTC26n+lRuTow2bwE0q4STzaRPA7552swam0IbQzRTQ
   m8fhwrEEZEEC+H/QljL2rHM2UoO80zw9MXy1WxX3v1C7yAh/uL+fEfj4X
   nCYYqOskyXovhNNifg7nAaN2findNaGuL+C7T0uvyou9roNpme8pUQD8/
   NlBfqTJmUvNYB3xOywj32nD2+b8Zk00Lv83Il3r8Zf/ev0Hxt3NvcZ/A0
   RyMco1wM73EyWT0zM2SMDycTT8+g+EzI01IqGOXy89+YTA3zdB0IRnXZL
   g==;
X-CSE-ConnectionGUID: E5WTvvkpQxqWS3NcvQ7FVg==
X-CSE-MsgGUID: Xm4H/yEAQ5O3kTtOiZo6zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="35179110"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="35179110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:01:58 -0700
X-CSE-ConnectionGUID: AqYG3e6sTsejC9NKXF2obg==
X-CSE-MsgGUID: bwG0HarmSSCm2mszUETx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138833143"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:01:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, tomasz.pakula.oficjalny@gmail.com, 
 jdelvare@suse.com, linux@roeck-us.net, 
 =?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal.kopec@3mdeb.com>
Cc: platform-driver-x86@vger.kernel.org, piotr.krol@3mdeb.com, 
 maciej.pijanowski@3mdeb.com, linux-hwmon@vger.kernel.org
In-Reply-To: <20250425112147.69308-1-michal.kopec@3mdeb.com>
References: <20250425112147.69308-1-michal.kopec@3mdeb.com>
Subject: Re: [PATCH v8 0/1] platform/x86: Introduce dasharo-acpi platform
 driver
Message-Id: <174593891016.4147.10484642457203999002.b4-ty@linux.intel.com>
Date: Tue, 29 Apr 2025 18:01:50 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 25 Apr 2025 13:21:46 +0200, Michał Kopeć wrote:

> Introduce a driver for devices running Dasharo firmware. The driver
> supports thermal monitoring using a new ACPI interface in Dasharo. The
> initial version supports monitoring fan speeds, fan PWM duty cycles and
> system temperatures as well as determining which specific interfaces are
> implemented by firmware.
> 
> It has been tested on a NovaCustom laptop running pre-release Dasharo
> firmware, which implements fan and thermal monitoring for the CPU and
> the discrete GPU, if present.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Introduce dasharo-acpi platform driver
      commit: e04e0911c4e057c4699a05962d70ce1b9e332ac7

--
 i.

