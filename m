Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B042C0F6D
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778903836; cv=none; b=TCvsWMp8dY71Qg2Ih5414cmok8OS1yB1CpdmAGf/NV5fPOhSh/YqUZfYT7yJEjH+I7GkCmjp3hFeD8lQQzPz7uwEPaACKYxMIpJzgozzJJCaMwt8WBjJ4vf+OhRM62bXz/iBXMF048GfB8ZteY3jANRwhiIwDvHRBq77WqnhYao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778903836; c=relaxed/simple;
	bh=VY0Nwk3KRsyeOnR7zsqXT7sX3nMPs5vyBAVJxv0j6ao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+cR6q4v5RGa+8TrSqatT9GooCs+nPIzk61Krxcv8GOqYEFWBmP8iZ1J/zREwZtbpXgOZnwbyDAQRTNw3PCdp99l6APbjpEooxyhdLVFUceSk/0aXtcz27MnjG0NX+mEpTZxxpdfIrjpKo3vIq1MyjkluyvkZNcyEQ7ws5XGYA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg7NECeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg7NECeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFE0C19425;
	Sat, 16 May 2026 03:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778903835;
	bh=VY0Nwk3KRsyeOnR7zsqXT7sX3nMPs5vyBAVJxv0j6ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kg7NECeE0S5te4rb0wVpOEbq6zR+0C7JfssbTbMEO1tOcG8mVCRTujvnJtF7+aMko
	 Vl8lRi07Uzx8XWQiD4ZPBdHfybW74iTgruZCtLdDBrD2quHDcq6Y6YXjJ/Xz3dL6/X
	 ZuwJiCwoVJBMwKbV880cMi3Y1oPy892YVxPg2mVLREUUl0ebJUdnjLg6GSH2Rj4LHr
	 px6qHSqW7K26CCU3YqeJBbLA0UMAMwpeY1xAobhSycMv4tKfIN2ufltzD70TPk+LS5
	 RLt3+xFs+IH5Rux9p+gqqgoCQv5SuJMgQzyfxv29WRrIr/hPu1dm1XObVQ712qBaKc
	 7IpaUaOVg/Mzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation: hwmon: adt7411: document supported sysfs
 attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516035245.1604-1-eric039eric@gmail.com>
References: <20260516035245.1604-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Sat, 16 May 2026 03:57:15 +0000
Message-Id: <20260516035715.BEFE0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The adt7411 driver exposes additional standard hwmon attributes beyond
> the ones currently listed in Documentation/hwmon/adt7411.rst.
> 
> Document voltage min/max/alarm attributes, temperature min/max and
> min_alarm/max_alarm attributes, and the temp2_fault attribute for the
> external temperature channel.
> 
> Also update the documentation to clarify that analog inputs in1 and in2
> are not available when the external temperature sensor is enabled, and
> remove the outdated statement claiming that external temperature support
> and limit registers are unsupported.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

