Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098882;
	b=QLwCWvmdasmoWHpkhXXojqtMlBlneMs+3QNMmK32fJYGf4PbYmHqvZ50T6xhP/+YLMt8
	 I3W4QV7k7j/A+MOU7cdZw79gmVGRwSgTPW6MnxlWglkJhSpORb9kqgOkkxgxTYn2J7brP
	 nXb6ridjBfuI3IUOnUgpJjsmrcp5ZJG6FGLdP064wCUiqFglF1iO91v5UgzFpZ/WdirT2
	 bp9b/tus/5tc8HyquQopRCJx7T26Ge7uXHhrUZQ37cfAYliZ5UUItHEihPGgTsZKqZYCN
	 5LHZ3gRa+PEHiimrbF3DBgGZijk2eeVX+1BLn5kSB+valiY75aDj1TnycT5BgadufHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=54xr3+4KV4okVrxl0DqqbNmnBRKO2e1Wm+dMoQ9wAIM=;
	b=Nc2vriIiGhTMXSKLnD9fYMF9c/ztd9WV2KFUVkCmkYxNGUblilHh2f97IysQqXpzUayk
	 XKAy0oq/mz8vxTDcCZCxlX5/K3WRF5B8XnRymYw/ysXWL0pP3/d+DOGENOw2v4IrWjAfR
	 flP3lbZ/NVW7j9upMQLvTRVDnCUBXNoaZ7OYPfKfW3imkOHUxY/jZPUtO25+Hkf+tIl72
	 SJuYcZ1J58M6ci8Dmf6wxaXnILOaEEtiK73FjTdfXV30IglmZlQDQIRXygA5xMp3m1lrB
	 v3FrbE/yDrduLEsm5fO+Oc4vdjEukqbs7DCLCChm6a3ZrElnNf63AzQTjex7/DS3T2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYelWIfR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B3606A31B;
	Tue, 27 Oct 2026 11:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYelWIfR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098883; x=1824634883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i5DzzxlouoH9Sr8L5QKk2m0+K6t0SjdBY5att4ix7IM=;
  b=ZYelWIfRZWr0MwJAqtWmP4G5KywZGqB+fOthXlheiPoPgZIXa/7R7Vka
   /NaTvmNgE0/kxET1AH6RBuenp8HsBaxPdYtBubXp5VGTe/+gyuXQqtmDd
   +FfvQ6/L1DIWDFXNiz6nW7OemVz+o/E5zDb1UnZSBQ8mhDU0/FPGVr8HF
   JsYW2M7k/+pQ144DrSmrPD55QuY8k+hVCuyN8fwO4TW8cYqqVTkPqINy8
   KdExoAZBmY5QJwSsbeVlxnLNVrXQoDJyDscM7iRSsN5pEJ7AxQ3UYmdMS
   W60vjL6JL1hCFl8IUE0x/QkJcuAmU5ruJqhQBGQJ34yZO0fekMeB5/CTC
   A==;
X-CSE-ConnectionGUID: jAf/gOpbRtO5smctMWi8KA==
X-CSE-MsgGUID: wyMrlxLAS5CQhSqSyQVpSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1825804"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1825804"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:01:22 -0700
X-CSE-ConnectionGUID: RsXthhwqStGOpC7Ydn1rug==
X-CSE-MsgGUID: tIz5YvfnR5+c67EV0Lyj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4598550"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.2])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:01:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B32F6121CEC;
	Tue, 27 Oct 2026 13:01:22 +0200 (EET)
Date: Tue, 27 Oct 2026 13:01:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 13/23] gpio: Use named initializers for
 auxiliary_device_id arrays
Message-ID: <auCEgktEEKpnKWUx@kekkonen.localdomain>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>

Hi Uwe,

On Tue, Oct 27, 2026 at 11:48:50AM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> auxiliary_device_id that replaces .driver_data by an anonymous union
> (though none of these drivers uses .driver_data, so this patch isn't
> strictly necessary for the plan, but still ok for consistency).
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # gpio-usbio, gpio-ljca

-- 
Regards,

Sakari Ailus
