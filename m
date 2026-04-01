Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137163806AB;
	Wed,  1 Apr 2026 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028643; cv=none; b=QgFFZR0O/tnAcguFs8mhFdy2D+s501vyTsjy1KpaIsjxJU02cC+K1EKFyG8JsMjBMh6BdWQoCeB46eO81yspnyrHp153R8T///oSbfXbwP3DFA0JQsG+dT+z4c0KNTfmbd9zg67M3HPJy0v8U97Rx4T8mzHIQ45A8EbQiznRKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028643; c=relaxed/simple;
	bh=L73nS6oMrPdKteMWnmYHL6RfHKPTssTEXNzH4IVY5gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Useu34/hFBsFT1+E3wuZHuDt2528+bLNBFpq6XBlwTgKYzy2vT7f0IulQZp7QdnDTMPvfszwaix303OHVllQfMz/AvtyxpeAm1++RkJKJBrpuNJZWB5kma1l846bZW44UnSmkZWuT7zLwrD89tyVG0UwAABy/FtdLGgQokTeQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBcP5VxT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBcP5VxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E5DC2BCB2;
	Wed,  1 Apr 2026 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775028642;
	bh=L73nS6oMrPdKteMWnmYHL6RfHKPTssTEXNzH4IVY5gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBcP5VxTs39Pr5v9YOhLUQtoGE4xjr/GYUhJYSA43bpLPVqlaz5riAtuaQcRcvPoR
	 7czvJi0cwngk+NR7ykfGQMJlpseppyY/KGqc+nGGPFnMj6aJk7UJpuxAiX53feX3zb
	 W2P9v5wyRTcmGthrCg9PCebnJkp2lHpWIQiHNsuUw3nhMEMUrpp3+ExFJVYBMhhV07
	 cdPlAsObV9U+vCtLYJMuk6j5vOt/MKNKl3ss1T+6tBq+JBWdMxKCYszxqvpVvsCM8L
	 gwlTQLKBL1owc/fz5Cn85U75gA1nVwgSdWMUuTDb4MMcGlQH2Z4+8FiVLAx8CUxaF2
	 Mlgaoc/7JfoRg==
Date: Wed, 1 Apr 2026 09:30:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Message-ID: <20260401-rich-placid-bat-896ab7@quoll>
References: <20260401024214.804237-1-chris.packham@alliedtelesis.co.nz>
 <20260401024214.804237-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401024214.804237-2-chris.packham@alliedtelesis.co.nz>

On Wed, Apr 01, 2026 at 03:42:11PM +1300, Chris Packham wrote:
> Add the compatible string for the sony,aps-379. This is a simple PMBus
> (I2C) device that requires no additional attributes.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

