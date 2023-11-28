Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0yuf6yg"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0642A10D8;
	Tue, 28 Nov 2023 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701176096; x=1732712096;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=dVu4q/x1civBTJPwWNdWPRxz+AZouCiyXKEZvCfSL7A=;
  b=b0yuf6ygaLe+2qq4qfP2Yw6KCWtZ9pZyHu5EvPYJTt4wJiV8fljZgzoU
   lt0oi1nTpPtkIxQO3GNDicmfL57hwVTErGlFPhniErPzInWDQwWokeXFd
   7rf9UW+AhDg0VoU0BeC6d7oJwQzVXPmJ4MrDjAHWR+7GE0ag8JiyFwIKB
   M5qv4NYE/x7GrgxTzt0Q+fSYIbaDjtCkYzC6gnGcCBqJxd8xIvobSTcVZ
   /dePggJQQnSVna6R37JCYzP3QaFBiLCDwf3XsI5BGeiZl5FXZedIS0gNL
   N5OL9sW0qeURP1lTata7rnqeA45u0OVzUHM80Qqm+9Gi0LN3NpYqD9QfI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="6116070"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="6116070"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="892073899"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="892073899"
Received: from haslam-mobl1.ger.corp.intel.com ([10.252.43.79])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:54:50 -0800
Date: Tue, 28 Nov 2023 14:54:48 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Henry Shi <henryshi2018@gmail.com>
cc: hbshi69@hotmail.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    jdelvare@suse.com, linux@roeck-us.net, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    hb_shi2003@yahoo.com, henrys@silicom-usa.com, wenw@silicom-usa.com, 
    =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v15] platform/x86: Add Silicom Platform Driver
In-Reply-To: <20231124200334.5318-1-henryshi2018@gmail.com>
Message-ID: <b9e2321c-7dfb-d2d5-6cb-e3fa1ded1422@linux.intel.com>
References: <20231124200334.5318-1-henryshi2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1963003203-1701175569=:1797"
Content-ID: <e8e7589-3b28-421d-5a5e-9b5531705bfc@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1963003203-1701175569=:1797
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <53551940-6a3b-3470-c377-42fbfd0fa7@linux.intel.com>

On Fri, 24 Nov 2023, Henry Shi wrote:

> platform/x86: Add Silicom Platform Driver
> 
> Add Silicom platform (silicom-platform) Linux driver for Swisscom
> Business Box (Swisscom BB) as well as Cordoba family products.
> 
> This platform driver provides support for various functions via
> the Linux LED framework, GPIO framework, Hardware Monitoring (HWMON)
> and device attributes.
> 
> Signed-off-by: Henry Shi <henryshi2018@gmail.com>

As far as I'm concerned, this seems to be okay shape now:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

It would be good for somebody to check if the devicename part of the led 
.name is correct (as I cannot even myself figure out what exactly is 
expected there).


-- 
 i.
--8323329-1963003203-1701175569=:1797--
