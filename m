Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0B34B1A7
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243914; cv=none; b=cdW4B28wuQt9FyjUGPg2MeUEfRbRUop9k/I/PF7u2sEdM2ACZyIWc/EXFBldvht1oOaOvOWoeSSzoUK817RKY5okZQ3ILMnVHwggsNzpNB0fR7AVFLob6K3UW7NX0JRvGHLYIPkO5iFMFX21tbKGm7ApGOdHT97ZI46gjA8ZSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243914; c=relaxed/simple;
	bh=OW9xtBE7QkQIpQ9a1bsU/na/56nDrQ0HQq9DCYmZMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFukacwEXbEnXVxUUo4e7gv7Cg6DyOb0MkwvMhhwPpzMHmLr/jpUIj+9LwsZdA/Or54pPZndXOu9G+fb7E9eQa6vpk1daZhivWeMs00l2Hhc2gevRrTkMjWLGDtoBAF/cd4fX6IPwBcK35x2wYhCeJyqtBeemWaUYpAD3xBG14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSgrjqr/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSgrjqr/"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so1369933e87.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761243910; x=1761848710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdZsaxvrfD9mBzacOGMyfPJ9ejMpsnX7T8c3nx39O8=;
        b=lSgrjqr/FauM9qp6rax+CaoXdIQYFbK/KmpV+K3q96R8w5qbCVI/ExNalL2eeGgVGH
         jXVyoC0lh4YLPJ9MztM9J+kcmNmO1eVmiSC1fxH5KnipsyF8gqT0OkyXwVrCD9iynsOy
         zgx1R/i3Us6OJFBHHgtrmi0H7mEb7wDC/ctr1UwW4grYhbRLV05E9cC4gMsbgkNBbByz
         J0wJhnA/B/Xg4ho7qj/9px8lf+2LznYGTWXtwDrClkvGut1s8gUeqbcL4lcxNAYb7Fxj
         d9fL8KGDUKfh/bFfNF61pmgIO4i8/gz4IBgF+dHz+n2oWcK78oXE43VubQgo6HH0+Gvf
         f5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761243910; x=1761848710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJdZsaxvrfD9mBzacOGMyfPJ9ejMpsnX7T8c3nx39O8=;
        b=OM/PVGJe8ZdEEMhOeyaKx9U/3Pisk0y00X+Tb5NSffIQa4jZwf0SCfRvDHqx53ZvOi
         r3KsjHh+wwGgy+al16IyeEIBZsZnVgcONpu3MLAy0YhOMuxHM1uDFTUXzGd7VElzUUtZ
         tUHcKM+CGnC7jokYjuBGDhY2Y3mCFRmLuBYCdl2EMj2q0H0uae1EkNegytkmCJae72OV
         pKgfm+3DdiRRrYenA7Yv0Wo6vQyfAysFSSravx+wSLDH/+um+jv7/koMPdQCl9Mxykhp
         dgn0mwcYYxgQB3shvNkbENFL59bvP3zJzc6PdyUXhRQxtuSvc7T614oBna9k+vPIoIE/
         zhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBuJzr8xc8PEGySc3BJOMaxiskMGIYwShw31ifahKHdzBrl76OkuXx/91sI+kHtRknrHtHBfRh1Gn6Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wYWAj0j4ZQZmIpd14lrHjyHANVjQe1bfqHyddj+XRLcICgIA
	xZXKl9n11Vco3XB8bQuGqg/fqae0y+SxdwQPx3hsXd1gRzKPZwbmf0zB
X-Gm-Gg: ASbGncvy07zBr2CPDjDWv7HYADrcbSbJhmEkc3mC8Hkm9RIxVqFN4O4RBBIzEb2T/B2
	WDL9s2tlbTnMLJVCj1XRbVavsPpLTJY/UVj2jSroVd5QrmgvhrCWa51Rt0hg8LQu1on8UNtWvJH
	OjuQrr8xwjFdsjGjReq9EDx8lqodpTu0joGtkVqEgw2OXCKsvymS0rfMWzpoDoqU1Ms79D6Z7W/
	23ybAd0eDz5QxUOdpp4G321wFy6gAxSmhP6o4Y1ozCFZEOaiGN9mhRUnIRPGEYhMkCRskaLyJ2Q
	7U3kK6NE06vEjztm/7YHrsLKNBdr3JgbLXgj1i0Puu8H6/ecHkAuzb4pVHotJd0JRbYCM9Aeqp4
	OMaizU2IKBTKp7WZjQr0pz06AV1VtEbbRAdmN2U2u9csLVuTVSM9RpKGEvwRxS25Y0Q02nzjOPn
	H+I5M7GWG/ibc734IPArJiC604OrmeYSFdCCyhIw==
X-Google-Smtp-Source: AGHT+IE0DFfcemUtSg6UDp4QQqO5coJH36uQh9JRQkz1hQEF8PQOPqrf1u6yvwyTkEAqPB81Cen56A==
X-Received: by 2002:a05:6512:6d1:b0:592:f573:65d3 with SMTP id 2adb3069b0e04-592f5736dfamr993145e87.1.1761243909793;
        Thu, 23 Oct 2025 11:25:09 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4cd12e9sm919045e87.32.2025.10.23.11.25.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Oct 2025 11:25:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:25:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Shyam-sundar.S-k@amd.com, bhelgaas@google.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux@roeck-us.net, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org,
 suma.hegde@amd.com, tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v3 06/12] x86/amd_nb: Use topology info to get AMD node
 count
Message-ID: <20251023202503.72987338.michal.pecio@gmail.com>
In-Reply-To: <20251023160906.GA730672@yaz-khff2.amd.com>
References: <20250107222847.3300430-7-yazen.ghannam@amd.com>
	<20251022011610.60d0ba6e.michal.pecio@gmail.com>
	<20251022133901.GB7243@yaz-khff2.amd.com>
	<20251022173831.671843f4.michal.pecio@gmail.com>
	<20251022160904.GA174761@yaz-khff2.amd.com>
	<20251022181856.0e3cfc92.michal.pecio@gmail.com>
	<20251023135935.GA619807@yaz-khff2.amd.com>
	<20251023170107.0cc70bad.michal.pecio@gmail.com>
	<20251023160906.GA730672@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Oct 2025 12:09:06 -0400, Yazen Ghannam wrote:
> The kernel seems to think there are 6 CPUs on your system:
> 
> [    0.072059] CPU topo: Allowing 4 present CPUs plus 2 hotplug CPUs

I wonder if this code doesn't break systems which actually support
hotplug, when some sockets aren't populated at boot?


	amd_northbridges.num = amd_num_nodes();

This count apparently includes potential hotplug nodes.

	for (i = 0; i < amd_northbridges.num; i++) {
		node_to_amd_nb(i)->misc = amd_node_get_func(i, 3);

This is a wrapper around pci_get_domain_bus_and_slot(). Isn't this PCI
device part of CPU "uncore" and absent until a CPU is hotplugged?

		/*
		 * Each Northbridge must have a 'misc' device.
		 * If not, then uninitialize everything.
		 */
		if (!node_to_amd_nb(i)->misc) {

And if it's absent, all previously found northbridges are ignored.
BTW, kerneldoc seems to suggest pci_dev_put() should be here?

			amd_northbridges.num = 0;
			kfree(nb);
			return -ENODEV;
		}

		node_to_amd_nb(i)->link = amd_node_get_func(i, 4);
	}

Regards,
Michal
