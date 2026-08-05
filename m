Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93640D590;
	Wed,  5 Aug 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937284; cv=none; b=Q7Dn8Ex5Hs9EjvemI1gnFlE0oK+d0weccdDNzOMiocAtXwHCWyoS/+W+z+qsClPIPrtrnoexqCGOl5i3HFOnlw/POCMpRqSam8BEVCE0MyndhlLGSBkiueZHCnm2LM1caonMew8TkiXyfbBEd2ITl1M1ALkPEaUcv6gR6SNC03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937284; c=relaxed/simple;
	bh=Dl60V5oJWGATr9UoU21EUcyRLhevl9KWng0zLTgeJ3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMa6byyAKc2osCJPn7aQvygZWmjnzoVLPhvIMY5D0GvwCoVs9P26diSZ/uJ9Zhf10oP3eMU4vmbjUG3NlYnyyw8yq067zNjX1AYo8sW3e9+dLgskRQi9FD5OOjT47Uf0qBGaYI9yBgPoSE6UD5w5ZCeNfisVVOd/LuyVRUTBqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myDkPRoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myDkPRoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F981F000E9;
	Wed,  5 Aug 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937283;
	bh=RYj/wJsPNPiCwZB0BrZVoozSYFvU01Oky1FUJmpEOEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=myDkPRoTj2iEmDN0EN80Dhd2MtCtolJTdeQ3rYzTWgEVxImBGxK21O/DJ/VN9BW4G
	 KGK3uYrSjc4UYtX6ufpH3cU7ZSmW5TTPFoASV1YT7w+ZA0rKTbx4G86AHM6DP4iARW
	 T0nNLDnApmF5gmZ4h8dnfzZKuAuTjmYxPzn+8ncGJthjZdSjRUkQfLDYpxbDN+uyav
	 7j0eqpcRzTMEvCFmY1tnIst6DnjHaiFcqyJ1f1Yo6cc6gbilYP4EhiO1cpElCRNdg5
	 nXmZHXgRcPoMdRQENZXcBFuN982usyC/ltA+I06QVnnukOJvwfHRu1YvHJ7GtjW9m5
	 vhfTthGpjDfog==
Date: Wed, 5 Aug 2026 13:41:19 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Message-ID: <20260805134119-GKJ77474@kernel.org>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>

hi Troy,

On 02:00 Wed 05 Aug     , Troy Mitchell wrote:
> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
> 
> Set the I2C6 pin power source in the board-level pinctrl node
> because the IO rail voltage is board-specific.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index a38d7b738258..95a60fbb411f 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -26,6 +26,25 @@ reg_5v_sys: regulator-5v-sys {
>  	};
>  };
>  
..
> +&pinctrl {
> +	i2c6-1-cfg {
I'd prefer to use the reference, keep it short & close to where it's used

 &i2c6_1_cfg

> +		i2c6-1-pins {
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_1_cfg>;
> +	status = "okay";
> +
> +	temperature-sensor@4c {
> +		compatible = "sensylink,ctf2301";
> +		reg = <0x4c>;
> +	};
> +};
> +
>  &i2c8 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c8_cfg>;
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
