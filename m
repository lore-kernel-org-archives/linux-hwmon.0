Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE2372B52
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 06:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911357; cv=none; b=rIKuibXdg34jjpKhkDhy1ebtrVzt8nRArgX3dIQf0ER3+PlhVWU00haToLhSASEnuzx3eU3XA5ZkuvhxBMvFhDmVOMKGLP+vIgIIA4mf0CVodOBtOfKOin0Kg4Fo4afCBUIwsK8+h6ruegyb2ktYTHVhKpfzSo/ju33HiDXvaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911357; c=relaxed/simple;
	bh=T4xOe7jXYEGnQyng83CZJpoLVGIVM/OoB2d/IqsgST4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fd9+HwIsNv/561mCF5BmzYf+E5Cnm3DFmeF1zQrR1yhbrJd33ithKRsvrxrgfFUlCJmSNKoDVbHg2I8emYx2qG55wtrNgMM89fusGqwDwxLZiu2yRco1xNTPtKcdmORVGvsEZPKEe/7AE9RUk9Y/b65jQgr9bFexMClkP4JxDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0GM1I28; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0GM1I28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92E2C19425;
	Sat, 16 May 2026 06:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778911356;
	bh=T4xOe7jXYEGnQyng83CZJpoLVGIVM/OoB2d/IqsgST4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A0GM1I28tk4aLw73GIiqpCZpIYjg0WXM/lTt2jJ1NncEU0Corj5u7j4JZ96yprhN7
	 oDp1yCpSd8ldtD4Q9El3pkn4YJjZcSOq1MdF23KtngFPbwJ6s9MysmTkQgE9fp7Ukq
	 RZgi070UqCQMJ4F2NRUkljRIKPzpp0/lDsR+ZhWB5P7NjOF3wOfLBGAAkhBuSaDz+g
	 VLIAkwvae/NNvH4ies4SDkoWI8o8MtO5vpLhemLxgO6LWjUYVfSyw+izVZRws1pU9E
	 CQh+5DEhkGmX/fuBWAVkBUObz2AaXA0xEApPLez0mkfLcb83/ei0/Ce4F2SJ98YkP7
	 3eLq9nK9W+3kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] Documentation: fix typo in heading for max31730
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hassan Maazu" <maazudev@proton.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Sat, 16 May 2026 06:02:36 +0000
Message-Id: <20260516060236.B92E2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Wrong device name used in heading.
> 
> Signed-off-by: Hassan Maazu <maazudev@proton.me>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

