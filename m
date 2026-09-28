Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C2397321;
	Mon, 28 Sep 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620969; cv=none; b=KTNCkW+vwAXqxWSvSyMBTdE6bpf/IWCPEbQYMTdfxU8omPeV0MyKWGWScSOE5DqbgSPL3cuO9saLHWGx/KyQbWQYL7D/L4JEdQOXcyeO4Atca84F3NG5Cecx3Ty7IcM82hOS9KiMqUAEzyY89SIm8ikOC6ks8TolYtYKcu4bGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620969; c=relaxed/simple;
	bh=+U32bjokpxRL2kGUVS/EoRic9+wGfrWuuww9mmSzoic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+miGXfQhVzDA/uIlfqiH0/vLvg6wAeV9Bb2+9sPCmgPOUqK7MjYaTNBroQOEijT6luMIdSgbENePRjzm7f8cGY6tr7hw54YQNIrIwUellJVSCE+C/cdw/Rnrr4ZIx+QvM05MwT61qIgVtMRTvfqwowzPNR/h4qQevQSjdSwEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krKe7huT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krKe7huT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23751F000FF;
	Mon, 28 Sep 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790620967;
	bh=qlvWigsuFgA7fdqY9q8Q09QQZyy2YPxWQ+avuqJJx3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=krKe7huTl4LPd/WZSJlndGH0Kbb/apHnQfb/a8ocPs7clqRY/eoOPZw12WBI6y610
	 PSh0QltJVXWcPixWZUQ5rPvzEbXlcAzgj/IBk+OJgopNPLtFqfWnY9AVPLYomEuceF
	 yBSRTcAuBVde5b0zngXvd7JgbsQ2WgMZOIlR2h2owYgzDSRvMcW6ELQ4RFl1gutQc5
	 ZjuVX5e/4nr3gPq7EPW9o6K0Ywh1sUpsSYxNmjTZt6VRamnRArMiamwrCTuvky1WT/
	 OJzu+1J1tGZ1c3Usz6fmksgGmO+QfJlIQRK4Jd5IX2wHF0WIh838tZHuMzc5tU9xr2
	 vUKDpCboCamPA==
Date: Mon, 28 Sep 2026 13:42:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: hsyemail2@gmail.com
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Message-ID: <179062096550.254495.12819136930608378423.robh@kernel.org>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-2-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918084042.19541-2-syhuang3@nuvoton.com>


On Fri, 18 Sep 2026 16:40:40 +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.
> 
> The NCT7715 supports an ALERT output, so permit the optional
> interrupts property for this compatible.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
> v4:
> - Split the devicetree binding changes into a separate patch.
> - Allow interrupts for the Nuvoton NCT7715 compatible.
> 
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

