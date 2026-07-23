Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8062470459;
	Thu, 23 Jul 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817023; cv=none; b=Jo8SfjRY/QuNxTR+2cPClrtZa4pC0T//Xac3+fRbpz1cmY+Q9NGZ1elSxb+AzXgrymBmmdXfYBnJ8lzcq/R706MmTQfiOoVP1Y5H1TCJPA3WyuAHDffg5m2J24k3sGVDJdGiGiM5nKvfTXaIsTGzz5iDTxBNeBp8dy3y+NlLyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817023; c=relaxed/simple;
	bh=cJGkq4kOVfuHyHHabnkzzMNCaaefGwpEm2wPZjizGWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1Wuzjgtn+Z4Jx+I4exy5BtrkBUbtxXj58x0pJAc0p3pUoA1sNcmE39XUf7Z6h3UddcY1nXz8yqapjml/nJF285oCasck9zSQkEahrD9pPr2GN8bQpDevww6ZzQBa7rw3KmXiE/ZAfeINnB6y7xWdFzXlt5jR+VqDx89IMPjcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=EGbf46mY; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="EGbf46mY"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id DF36A780368;
	Thu, 23 Jul 2026 16:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784817019;
	bh=cJGkq4kOVfuHyHHabnkzzMNCaaefGwpEm2wPZjizGWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGbf46mYSRfX1b+fEdntZO/HmNEarV2jlIcpF875q2CBwrPuu9FtqoYNHjTweShnO
	 3iDBQ0NT+pknQ6e6Ze63KyPK84c5ufeYx5pBKH+lCeisY4SramNqv+rgozA98aFfFB
	 DYzgS7byiWW+7qV4lztgXL3LirUOO0ji6g2g/DPHB0dfAOkrwn3sG8VNGu8Bf6C8ge
	 DRs9bC3caicbayV/FP+7KeJGHBg4bHu0UV9Ze3JeL9JAxqk5ke5u4NpQn9VYRsBI3T
	 BtDnVvpfhDoJv56FiH0/tWUrqcvNFj5oESZYWXNl28nRkZvMu+iTouDLcg6Xi5qU0k
	 gVGV2qwqBbx4g==
Date: Thu, 23 Jul 2026 16:30:13 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Message-ID: <amIldYfzIH_e2_8p@L30177.local>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-2-14363c75916f@free.fr>
 <20260723131028.12D601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723131028.12D601F000E9@smtp.kernel.org>

Hi Mr. Bot,

> This isn't a bug, but there is a typo (devince instead of device) in the
> commit message.

typo will be fixed, I did miss it!

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-mpq8646_v0-v1-0-14363c75916f@free.fr?part=2
