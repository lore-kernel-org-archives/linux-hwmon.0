Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A84028E2;
	Mon,  7 Sep 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766267; cv=none; b=XXZVa322W16BpH2XmRlth9+h0sBVj2Gh5spIYDCJFoxUiZQlXvfuRU8Wx5+VFFDYZAdAxxvkGrG46vVcanXrFY/OaUOGG3+Hyv2S7xrTbZ2biNnqgmOdQGe0+ccchlniyWp3/4PM8nTgEDb06FhzR/dqg+4DtcX7n+Fu5MwdmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766267; c=relaxed/simple;
	bh=75gJo4soMDWgvVFd907DxIUGAHUUJsAttBWjfH8/iug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/KUus6z+H8WyO4pqQ8Ikx1YAlvY5xPwd23UG/m8rDVr3KkoMeefV1W56tl0O1Xp3NlpwA/yfHStNraQndTRc+aZbW5dfnMetLKuUrFOIQTHF+KJKWHrJbn3EtQgnSjW2ulQGTmUQzg3mnR0iDgnBaP3HC95RycKwnvhPCmBrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0z2f1hG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0z2f1hG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7411F00A3A;
	Mon,  7 Sep 2026 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766265;
	bh=tMdyHZ9kayoSShJk3iyTTO+vjov94Kd7L0/5q/U75GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0z2f1hGIErfStKXpyMG9QhyCc1VB4LVG100lVEc1k+pXRiJufmNFUcDv6EsMO3mR
	 hCKGVPgjjc0gBThKZZA0RYGTgYdnNQxfmLCAJSdFNv16rV8YgwflBo8B91HxRPu6/f
	 EpSZ7MCZfMwUrBXKWi24RVU9l0Xwpsv1DCBz3H6EGKyfHAqSq/vn8yd0bhgXZepfPl
	 1ugZ4emWXDrXaoYDRgeExTHVJ4xsk6mID1PYTNBSswYq6ZlD16mdbMVHysQ1gFzHW7
	 FiUCaYwNpSdVSHFNGqJhjQOS2JPI2wzivCZ2RabQByFwZQrSt5R/YDd1hb0br5n/yN
	 PhEpC94rSM9Qw==
Date: Mon, 7 Sep 2026 09:31:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 to enum
 from items
Message-ID: <20260907-relaxed-giga-pegasus-5c6a00@quoll>
References: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>

On Tue, Sep 01, 2026 at 06:22:48PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Fix patch merge error. ti,tmp103 should be after ti,tmp102 in enum, instead
> of in items.

Fixes?

Commit 94056769c49 is also looking differently than link below:

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> original patch is correct
> https://lore.kernel.org/imx/20260826211422.3299728-1-Frank.Li@oss.nxp.com/

but not in the way of where the compatible is added. What's more, I
cannot find such context in linux-next, so maybe that's some recent
commit in hwmon tree.

Best regards,
Krzysztof

