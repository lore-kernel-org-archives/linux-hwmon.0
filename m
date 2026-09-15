Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C3217723;
	Tue, 15 Sep 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463077; cv=none; b=MP0haAhI24p2yx8cy8LsPcC/m/ZbtSQ06Hh0UrdK4WBGrCupyep2kNvaKx0Hl0IcFLN1Ub20zjuTLG0YnceMdEVoWpxasZFcbGxTmNxYD9UGgJuTOte251HTA88AK/HvhaKHMjELujNIL8WFGn8GwVmOFXqMWncrcGLGVsn42m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463077; c=relaxed/simple;
	bh=GG48I8OWLWCSwjZr3rcBebDHnJKLfxy+gd5eLuX2XAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqqE1TyF8qGhkt9shnPGb0C9atnewFu/W05dr96xmHihbEig97O/mb9Ns1Jr72ec7zInp9aK6mZVT+SO5cUVf/X5eBQOdUnrGxUaksVLCWc1TSf90HhlwSOldcayOOY1MK41Lj8Mtal5QHoQOVsjiyWqfB07n7dhHesD2yE+OZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtmCRRAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtmCRRAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CACD1F000FF;
	Tue, 15 Sep 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789463075;
	bh=zthCAJeSZpEWPywmDOQWxavC456glJ2WFVFFKTOL7DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtmCRRAb0iFKzgb5tVG5KbJPE3N6ACkkgtVipfBxrrxmkoMSm8j7V+eoz0JHfsAHE
	 pkSvL8oei6rjfNcYglnAMRlAq8oKUvWELGIyVYNB1k6G2wAXv8/TFiWLmSlgvdhT/k
	 9HGg3xxik7+XXJQIe7dX/88QUeOCBuEqsnSxJuSVw1frBVSdSRP9nL4EDQTDp/7xCs
	 48HS/twhh9xHhd1IpQVAtZnmREbtJNUJoXCVbk/TOEUnoL8Io4CvLdY6slPLXpcfcR
	 DfWUs8mkVwVFYIsVxevsOSQ+GYKrs8bXVRGzUUl41h0DZLd22nT6Q4CCPhoz657mlO
	 bs5UPlNikpRpA==
Date: Tue, 15 Sep 2026 09:04:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Message-ID: <20260915090433-GKA266329@kernel.org>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-5-522def70acb4@linux.dev>

Hi Troy,

On 16:18 Mon 14 Sep     , Troy Mitchell wrote:
> Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
> and 8. Use a 25 mA drive strength, which is supported for both K3 IO
> voltage domains, and leave board-specific IO voltage selection to board
> files.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> index 6482d24be1394..cb4f4f4e33aff 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -101,6 +101,17 @@ i2c2-1-pins {
>  		};
>  	};
>  
> +	/omit-if-no-ref/
> +	i2c6_1_cfg: i2c6-1-cfg {
> +		i2c6-1-pins {
> +			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
> +				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <25>;
> +		};
> +	};
> +
>  	/omit-if-no-ref/
>  	i2c8_cfg: i2c8-cfg {
>  		i2c8-pins {
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
