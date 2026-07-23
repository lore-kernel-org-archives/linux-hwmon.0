Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBC456E19
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823528; cv=none; b=VR+sGX0GyPfdswDE8DKDlheIGakCa7oHX1xiAvX5GdSyiy8UMFOsoJvAlEUGxXa6IifvcX+tuUCbjer8ImeZVIfq1cVZHeA/PwR7hxIQ3ps8OKPdZKKh/n8xQyNQouBA5z3g6fTcmBFBnX8xT/nyzGN3NBISAG8aCPHaWjYKbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823528; c=relaxed/simple;
	bh=YSTTdnjMlDwYvQ8fDFXg/5MRSXgy1V6Vp1BdwLqpT6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G34L7UB9SvFfpn9CVvOWNpyQa8dQpJt1bP834Yuv8L45amxZCuTLQmzeiE5jEOk50dVFpNu/PYEOMtAe6Ruebu2EArqLprdOJBUiWt1HxPsQUpYc/JSAnt8i4k8b8TWkz20Dd4LywDcXfX/SI6m+EijDHpsV6L8ebfibz1B2K7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=ujfvff3q; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="ujfvff3q"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2989878034D;
	Thu, 23 Jul 2026 18:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784823507;
	bh=YSTTdnjMlDwYvQ8fDFXg/5MRSXgy1V6Vp1BdwLqpT6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujfvff3qzgl/If0xmzs1gb1OHsaxrPz1fEnSmKuKAE1RgZPuANgFOWBS/DA69rxi8
	 oeIhL/JP+USeoIIP7ZZvhcUUqu03YgiQ8HwLbToCRwpOMP1Lp5Jzp90EykvfEZY1jJ
	 bTp0ZbTvAIbUACRGCtSp4PNxlz4iTpZ5A0vlBCYFu8LaK7Q2PjEBkSQ4CqmJjKhfNS
	 8YBoNUQNXhzwRqxT4iKiQnsP3EkBE/UmloFIL+2y6MX69yhOjsPhkdmXGPatenbX6S
	 9LGrPIMEB1Ydhx3bQjv/OD1RBvaMABxUyFYyXdup5IHeLGk+Bpk7+zWRVde8dg1PK5
	 jMS6PjKeIkmww==
Date: Thu, 23 Jul 2026 18:18:24 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) notify on the hwmon device, not the
 i2c client
Message-ID: <amI-0KTPoQnjxCYh@L30177.local>
References: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>
 <20260723155926.13B771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723155926.13B771F000E9@smtp.kernel.org>

Hi Bot,

> Pre-existing issues:
> - [High] Type confusion in pmbus_notify() causes out-of-bounds read and dropped hardware alarms.
  ...
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed a potential type
> confusion issue here while reviewing the notification logic.
> 
> Does the loop in pmbus_notify() safely handle heterogeneous attribute types?
  ...
> If so, it seems this could prematurely clear bits from flags via
> flags &= ~smask and silently drop legitimate hardware alarms before
> reaching the actual boolean alarm attribute.

It seems you are right and they are pre-existing behaviours.

However, this fix is independent of this behaviour. It moves
the notification target from i2c client kobject to the hwmon 
kobject device.

regards,
  Vincent

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr?part=1
