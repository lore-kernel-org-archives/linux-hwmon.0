Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1E55C04;
	Tue, 27 Feb 2024 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709074503; cv=none; b=rU01x0v2AmYandSCtxJVGgyoIaGOZJO1QHfiYQEwaYZ2zFnx68TjRg3b2dMJO25IC6iEq+6EUpon5nYRdDWy4xL+MIWHR1ivSQZoYl67BSEzOsK+xjokWh6Jj3CbI9LBJ0KypN6m77Qp7E16N9E276CePSSp4M4c2Rrz0ZSxAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709074503; c=relaxed/simple;
	bh=btTrB3fzkyTme293c3G3VKfFDQzh3DmsLeMJd4y07IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeGeDt1RJv4iEpjKxMiS/875NO90qsyZbGdetfKFrqQuYq9JgylqKYB/HXmWDWilp+0LtXqM4v8HVkNhKVMksxD96mjqVIk6Hv4Fd8ZOGh67m6QX0gmaT7pI/1kopWvbWdM7ngCpyeeqPxxS7PV3W5LKlPDmK1OoPhjD+7QmpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAB8URMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAB8URMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E80C433C7;
	Tue, 27 Feb 2024 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709074503;
	bh=btTrB3fzkyTme293c3G3VKfFDQzh3DmsLeMJd4y07IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAB8URMcytIbMUACjzxEUYS9p/vZCPcg/2bJREpJx0tR+GCDuP7hLxgg8dBj+3NPM
	 XIfSiQrWZE71npl7WS8NqRv5CuqkywDL3Fz+joxiwSDBaSCn8U2zr8A/tPuKPqZX8E
	 bjhI5iIqySmSA/sTHcffeDFKQJjeEuLtVYeL4pSLESnRrfsgEuPYFFC28z1a4fY8Ch
	 2jAtuXpmRKzEbnjgrEVr20YLgeHjMyIE5FIo3dX/rrUmfTXArR6Sx+HM34LhlT1gYD
	 YXSaDUMF352W0F2w6aTxRuYy2w5IS2TZ4XpvxepMkuUmkup1cuZltFdEl8wzVuku2f
	 rEyXnVkYoyBVA==
Received: by pali.im (Postfix)
	id 79894828; Tue, 27 Feb 2024 23:55:00 +0100 (CET)
Date: Tue, 27 Feb 2024 23:55:00 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jithu.joseph@intel.com, linux@weissschuh.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
	jdelvare@suse.com, linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: wmi: Ignore duplicated GUIDs in legacy
 matches
Message-ID: <20240227225500.mkqyzkptdvlydkx4@pali>
References: <20240226193557.2888-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226193557.2888-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

I think that changes in this patch series looks good. You can add my:

Acked-by: Pali Rohár <pali@kernel.org>
